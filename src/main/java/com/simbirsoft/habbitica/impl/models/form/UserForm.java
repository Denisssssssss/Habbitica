package com.simbirsoft.habbitica.impl.models.form;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

@Getter
@Setter
public class UserForm {

    @Email(message = "Неверный email")
    private String email;
    @NotBlank(message = "Неверный логин")
    private String username;
    @NotBlank(message = "Неверный пароль")
    private String password;
}
