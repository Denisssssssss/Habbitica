package com.simbirsoft.habbitica.api.services;

import com.simbirsoft.habbitica.impl.models.data.Achievement;
import com.simbirsoft.habbitica.impl.models.dto.AchievementDto;

import java.util.List;

public interface AchievementService {

    Achievement save(Achievement achievement);

    List<AchievementDto> findAllSorted();

    List<AchievementDto> findByCategory(String category);

    List<AchievementDto> findAll();

    AchievementDto findById(Long id);

    Achievement findByTaskIdAndCount(Long id, int count);
}
