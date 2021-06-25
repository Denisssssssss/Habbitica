package com.simbirsoft.habbitica.impl.models.dto;

import com.simbirsoft.habbitica.impl.models.data.Task;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.stream.Collectors;

@Getter
@Setter
@Builder
public class TaskDTO {

    private Long id;
    private String title;
    private String description;
    private Long reward;

    public static TaskDTO from(Task task) {
        return TaskDTO.builder()
                .id(task.getId())
                .title(task.getTitle())
                .description(task.getDescription())
                .reward(task.getReward())
                .build();
    }

    public static List<TaskDTO> from(List<Task> tasks) {
        return tasks.stream().map(TaskDTO::from).collect(Collectors.toList());
    }
}