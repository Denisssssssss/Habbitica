package com.simbirsoft.habbitica.impl.models.form;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

@Getter
@Setter
public class UserForm {

    @Email(message = "{errors.incorrect.email}")
    private String email;
    @NotBlank(message = "Invalid username")
    private String username;
    @NotBlank(message = "Invalid password")
    private String password;
}
