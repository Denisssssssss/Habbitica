package com.simbirsoft.habbitica.impl.models.form;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
public class TaskForm {

    @NotBlank
    private String title;
    @NotBlank
    private String description;
    @NotBlank
    private String category;

    private Long reward;
}
