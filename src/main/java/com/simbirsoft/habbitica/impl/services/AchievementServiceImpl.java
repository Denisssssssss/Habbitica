package com.simbirsoft.habbitica.impl.services;

import com.simbirsoft.habbitica.api.repositories.AchievementRepository;
import com.simbirsoft.habbitica.api.repositories.TaskRepository;
import com.simbirsoft.habbitica.api.repositories.UserRepository;
import com.simbirsoft.habbitica.api.services.AchievementService;
import com.simbirsoft.habbitica.impl.models.data.Achievement;
import com.simbirsoft.habbitica.impl.models.dto.AchievementDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

import static com.simbirsoft.habbitica.impl.models.dto.AchievementDto.from;

@Service
public class AchievementServiceImpl implements AchievementService {

    private AchievementRepository achievementRepository;
    private TaskRepository taskRepository;
    private UserRepository userRepository;

    @Autowired
    public AchievementServiceImpl(AchievementRepository achievementRepository,
                                  TaskRepository taskRepository,
                                  UserRepository userRepository) {
        this.achievementRepository = achievementRepository;
        this.taskRepository = taskRepository;
        this.userRepository = userRepository;
    }

    @Override
    public Achievement save(Achievement achievement) {
        return achievementRepository.save(achievement);
    }

    @Override
    public List<AchievementDto> findAllSorted() {
        return findAll().stream().sorted().collect(Collectors.toList());
    }

    @Override
    public List<AchievementDto> findByCategory(String category) {
        return findAll().stream().filter(x -> x.getCategory().equals(category)).collect(Collectors.toList());
    }

    @Override
    public List<AchievementDto> findAll() {
        return from(achievementRepository.findAll());
    }

    @Override
    public AchievementDto findById(Long id) {
        return from(achievementRepository.findById(id)
                    .orElseThrow(() -> new UsernameNotFoundException("Achievement not found")));
    }

    @Override
    public Achievement findByTaskIdAndCount(Long id, int count) {
        return achievementRepository.findByTaskIdAndCount(id, count).orElse(null);
    }
}
