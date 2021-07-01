package com.simbirsoft.habbitica.impl.controllers;

import com.simbirsoft.habbitica.api.services.UserService;
import com.simbirsoft.habbitica.impl.models.form.UserForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SignInController {

    private UserService userService;

    @Autowired
    public SignInController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/signIn")
    public String signIn(Model model) {

        model.addAttribute("userForm", new UserForm());

        return "html/auth/signin";
    }
}
