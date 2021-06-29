package com.simbirsoft.habbitica.impl.services;

import com.simbirsoft.habbitica.api.repositories.AchievementRepository;
import com.simbirsoft.habbitica.api.repositories.ConfirmUserRepository;
import com.simbirsoft.habbitica.api.repositories.TaskRepository;
import com.simbirsoft.habbitica.api.repositories.UserRepository;
import com.simbirsoft.habbitica.api.services.MailService;
import com.simbirsoft.habbitica.api.services.UserService;
import com.simbirsoft.habbitica.impl.models.data.Achievement;
import com.simbirsoft.habbitica.impl.models.data.ConfirmUser;
import com.simbirsoft.habbitica.impl.models.data.Task;
import com.simbirsoft.habbitica.impl.models.data.User;
import com.simbirsoft.habbitica.impl.models.dto.UserDto;
import com.simbirsoft.habbitica.impl.models.form.UserForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.stream.Collectors;

import static com.simbirsoft.habbitica.impl.models.dto.UserDto.from;

@Service
public class UserServiceImpl implements UserService {

    private AchievementRepository achievementRepository;
    private UserRepository userRepository;
    private TaskRepository taskRepository;
    private ConfirmUserRepository confirmUserRepository;
    private PasswordEncoder passwordEncoder;
    private ExecutorService executorService;
    private MailService mailService;
    
    @Value("${images.path}")
    private String path;

    @Value("${images.default}")
    private String defaultImage;

    @Autowired
    public UserServiceImpl(AchievementRepository achievementRepository,
                           UserRepository userRepository,
                           TaskRepository taskRepository,
                           ConfirmUserRepository confirmUserRepository,
                           ExecutorService executorService,
                           MailService mailService,
                           PasswordEncoder passwordEncoder) {
        this.achievementRepository = achievementRepository;
        this.userRepository = userRepository;
        this.taskRepository = taskRepository;
        this.confirmUserRepository = confirmUserRepository;
        this.executorService = executorService;
        this.mailService = mailService;
        this.passwordEncoder = passwordEncoder;
    }

    public UserDto save(UserForm userForm) {

        User user = User.builder()
                .email(userForm.getEmail())
                .hashPassword(passwordEncoder.encode(userForm.getPassword()))
                .username(userForm.getUsername())
                .path(path + defaultImage)
                .build();

        userRepository.save(user);
        String code = UUID.randomUUID().toString();

        confirmUserRepository.save(ConfirmUser
                .builder()
                .token(code)
                .user(user)
                .build());

        executorService.submit(() -> mailService.sendEmail(user.getEmail(), code));

        return from(user);
    }

    @Override
    public void addReward(Long reward, User user) {

        user.increaseBalance(reward);
        userRepository.save(user);
    }

    @Override
    public void takeTask(Long taskId, User user) {

        Task task = taskRepository.findById(taskId)
                .orElseThrow(() -> new UsernameNotFoundException("Task not found"));
        Set<Long> userSet = task.getUsers().stream().map(User::getId).collect(Collectors.toSet());
        Set<Long> taskSet = user.getTasks().stream().map(Task::getId).collect(Collectors.toSet());

        if (!userSet.contains(user.getId())) {
            task.getUsers().add(user);
            taskRepository.save(task);
        }

        if (!taskSet.contains(taskId)) {
            user.getTasks().add(task);
            if (!user.getTasksDoneCount().containsKey(taskId)) {
                user.getTasksDoneCount().put(taskId, 0);
            }
            userRepository.save(user);
        }
    }

    @Override
    public void removeTask(Long taskId, User user) {

        Task task = taskRepository.findById(taskId)
                .orElseThrow(() -> new UsernameNotFoundException("Task not found"));
        int tasksDone = user.getTasksDoneCount().get(taskId);
        tasksDone++;
        user.getTasksDoneCount().put(taskId, tasksDone);
        Achievement achievement = achievementRepository.findByTaskIdAndCount(taskId, tasksDone)
                .orElse(null);
        if (achievement != null) {
            user.getAchievements().add(achievement);
            achievement.getUsers().add(user);
        }
        user.getTasks().removeIf(x -> x.getId().equals(taskId));
        task.getUsers().removeIf(x -> x.getId().equals(user.getId()));
        user.increaseBalance(task.getReward());
        taskRepository.save(task);
        userRepository.save(user);
    }
    
    @Override
    public void changeData(User user, MultipartFile file, String newName) {

        if (!file.isEmpty()) {
            String fileName = UUID.randomUUID().toString() + ".jpg";
            String dir = System.getProperty("user.dir") + path;
            File imageFile = new File(dir + fileName);
            try {
                OutputStream os = new FileOutputStream(imageFile);
                os.write(file.getBytes());
            } catch (IOException e) {
                throw new IllegalStateException(e);
            }
            user.setPath(path + fileName);
        }

        if (newName.length() < 1) {
            newName = user.getUsername();
        }

        if (!user.getUsername().equals(newName)) {
            user.setUsername(newName);
        }

        userRepository.save(user);
    }
}
