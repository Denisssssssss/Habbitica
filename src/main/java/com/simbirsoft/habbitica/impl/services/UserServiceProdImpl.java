package com.simbirsoft.habbitica.impl.services;

import com.simbirsoft.habbitica.api.repositories.*;
import com.simbirsoft.habbitica.api.services.MailService;
import com.simbirsoft.habbitica.api.services.UserService;
import com.simbirsoft.habbitica.impl.models.data.*;
import com.simbirsoft.habbitica.impl.models.dto.UserDto;
import com.simbirsoft.habbitica.impl.models.dto.UsersPage;
import com.simbirsoft.habbitica.impl.models.form.UserForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Profile;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.time.Instant;
import java.util.Date;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.stream.Collectors;

import static com.simbirsoft.habbitica.impl.models.dto.UserDto.from;

@Profile("prod")
@Service
public class UserServiceProdImpl implements UserService {

    private AchievementRepository achievementRepository;
    private UserRepository userRepository;
    private TaskRepository taskRepository;
    private ConfirmUserRepository confirmUserRepository;
    private TransactionRepository transactionRepository;
    private PasswordEncoder passwordEncoder;
    private ExecutorService executorService;
    private MailService mailService;

    @Value("${images.profile.path}")
    private String path;

    @Value("${images.profile.default}")
    private String defaultImage;

    @Autowired
    public UserServiceProdImpl(UserRepository userRepository,
                                TaskRepository taskRepository,
                                PasswordEncoder passwordEncoder,
                                AchievementRepository achievementRepository,
                                ConfirmUserRepository confirmUserRepository,
                                TransactionRepository transactionRepository,
                                ExecutorService executorService,
                                MailService mailService) {
        this.userRepository = userRepository;
        this.taskRepository = taskRepository;
        this.confirmUserRepository = confirmUserRepository;
        this.achievementRepository = achievementRepository;
        this.executorService = executorService;
        this.transactionRepository = transactionRepository;
        this.mailService = mailService;
        this.passwordEncoder = passwordEncoder;
    }

    public UserDto save(UserForm userForm) {

        userForm.setEmail(userForm.getEmail().toLowerCase());
        if (userForm.getPassword().length() < 6 || userForm.getPassword().length() > 20) {
            throw new IllegalStateException("Invalid password");
        }
        if (userRepository.findByEmail(userForm.getEmail()).isPresent()) {
            throw new IllegalArgumentException("User with specified email already exists");
        }

        User user = User.builder()
                .email(userForm.getEmail())
                .hashPassword(passwordEncoder.encode(userForm.getPassword()))
                .username(userForm.getUsername())
                .path(path + defaultImage)
                .build();

        System.out.println(user.getPath());

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
    public User getUserById(Long id) {
        return userRepository.findById(id)
                .orElseThrow(() -> new UsernameNotFoundException("User not found"));
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
            achievementRepository.save(achievement);
            user.increaseBalance(achievement.getReward());
            transactionRepository.save(Transaction.builder()
                    .date(Date.from(Instant.now()))
                    .userId(user.getId())
                    .value(achievement.getReward())
                    .title(achievement.getTitle())
                    .target(Transaction.Target.ДОСТИЖЕНИЕ)
                    .build()
            );
        }
        user.getTasks().removeIf(x -> x.getId().equals(taskId));
        task.getUsers().removeIf(x -> x.getId().equals(user.getId()));
        user.increaseBalance(task.getReward());
        transactionRepository.save(Transaction.builder()
                .date(Date.from(Instant.now()))
                .userId(user.getId())
                .value(task.getReward())
                .title(task.getTitle())
                .target(Transaction.Target.ЗАДАЧА)
                .build()
        );
        taskRepository.save(task);
        userRepository.save(user);
    }

    @Override
    public void changeData(User user, MultipartFile file, String newName) {

        if (!file.isEmpty()) {
            String fileName = UUID.randomUUID().toString() + ".jpg";
            String dir = "/home/developer/Habbitica" + path;
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

    @Override
    public UserDto getById(Long id) {
        return UserDto.from(userRepository.getById(id));
    }

    @Override
    public UsersPage search(Integer size, Integer page, String query, String sortParam, String directionParam) {

        Sort.Direction dir = Sort.Direction.ASC;
        Sort sort = Sort.by(dir, "id");

        if (sortParam != null) {
            dir = Sort.Direction.fromString(directionParam);
        }

        if (sortParam != null) {
            sort = Sort.by(dir, sortParam);
        }

        if (query == null) {
            query = "empty";
        }

        PageRequest pageRequest = PageRequest.of(page, size, sort);
        Page<User> usersPage = userRepository.search(query, pageRequest);

        return UsersPage.builder()
                .pagesCount(usersPage.getTotalPages())
                .users(UserDto.from(usersPage.getContent()))
                .build();
    }
}