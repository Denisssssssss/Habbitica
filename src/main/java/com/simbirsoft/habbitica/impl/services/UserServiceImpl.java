package com.simbirsoft.habbitica.impl.services;

import com.simbirsoft.habbitica.api.repositories.TaskRepository;
import com.simbirsoft.habbitica.api.repositories.UserRepository;
import com.simbirsoft.habbitica.api.services.UserService;
import com.simbirsoft.habbitica.impl.models.data.Task;
import com.simbirsoft.habbitica.impl.models.data.User;
import com.simbirsoft.habbitica.impl.models.dto.UserDto;
import com.simbirsoft.habbitica.impl.models.form.UserForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import static com.simbirsoft.habbitica.impl.models.dto.UserDto.from;

@Service
public class UserServiceImpl implements UserService {

    private UserRepository userRepository;
    private TaskRepository taskRepository;
    private PasswordEncoder passwordEncoder;

    @Autowired
    public UserServiceImpl(UserRepository userRepository,
                           TaskRepository taskRepository,
                           PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.taskRepository = taskRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public UserDto save(UserForm userForm) {

        User user = User.builder()
                .email(userForm.getEmail())
                .hashPassword(passwordEncoder.encode(userForm.getPassword()))
                .username(userForm.getUsername())
                .build();

        userRepository.save(user);

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
        user.getTasks().add(task);
        userRepository.save(user);
    }

    @Override
    public void removeTask(Long taskId, User user) {

        Task task = taskRepository.findById(taskId)
                .orElseThrow(() -> new UsernameNotFoundException("Task not found"));
        user.getTasks().removeIf(x -> x.getId().equals(taskId));
        user.increaseBalance(task.getReward());
        userRepository.save(user);
    }
}
