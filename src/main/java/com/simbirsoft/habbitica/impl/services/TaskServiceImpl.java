package com.simbirsoft.habbitica.impl.services;

import com.simbirsoft.habbitica.api.repositories.AchievementRepository;
import com.simbirsoft.habbitica.api.repositories.TaskRepository;
import com.simbirsoft.habbitica.api.repositories.UserRepository;
import com.simbirsoft.habbitica.api.services.TaskService;
import com.simbirsoft.habbitica.impl.models.data.Task;
import com.simbirsoft.habbitica.impl.models.dto.TaskDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

import static com.simbirsoft.habbitica.impl.models.dto.TaskDTO.from;

@Service
public class TaskServiceImpl implements TaskService {

    private AchievementRepository achievementRepository;
    private TaskRepository taskRepository;
    private UserRepository userRepository;

    @Autowired
    public TaskServiceImpl(AchievementRepository achievementRepository,
                           TaskRepository taskRepository,
                           UserRepository userRepository) {
        this.achievementRepository = achievementRepository;
        this.taskRepository = taskRepository;
        this.userRepository = userRepository;
    }

    @Override
    public Task save(Task task) {
        return taskRepository.save(task);
    }

    @Override
    public List<TaskDTO> findAll() {
        return from(taskRepository.findAll());
    }

    @Override
    public TaskDTO findById(Long id) {

        return from(taskRepository.findById(id)
                .orElseThrow(() -> new UsernameNotFoundException("Task not found")));
    }

    @Override
    public List<TaskDTO> findByCategory(String category) {

        return findAll().stream().filter(x -> x.getCategory().equals(category)).collect(Collectors.toList());
    }

    @Override
    public List<TaskDTO> findAllSorted() {

        return findAll().stream().sorted().collect(Collectors.toList());
    }
}