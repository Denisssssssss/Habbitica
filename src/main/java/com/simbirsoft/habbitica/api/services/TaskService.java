package com.simbirsoft.habbitica.api.services;

import com.simbirsoft.habbitica.impl.models.data.Task;
import com.simbirsoft.habbitica.impl.models.dto.TaskDTO;

import java.util.List;

public interface TaskService {

    Task save(Task task);

    List<TaskDTO> findAll();

    TaskDTO findById(Long id);
}
