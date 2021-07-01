package com.simbirsoft.habbitica.impl.controllers;

import com.simbirsoft.habbitica.api.services.UserService;
import com.simbirsoft.habbitica.impl.models.form.UserForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.Objects;

@Controller
public class SignUpController {

    private UserService userService;

    @Autowired
    public SignUpController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/signUp")
    public String getSignUpPage(Model model,
                                @RequestParam(required = false) String f,
                                @RequestParam(required = false) String p) {

        model.addAttribute("userForm", new UserForm());
        model.addAttribute("first_footer");
        if (f != null && f.equals("true")) {
            model.addAttribute("invalid_email", 0);
        }
        if (p != null && p.equals("true")) {
            model.addAttribute("invalid_password", 0);
        }

        return "html/auth/registration";
    }

    @PostMapping("/signUp")
    public String signUp(@Valid UserForm form,
                         BindingResult bindingResult,
                         Model model) {

        if (bindingResult.hasErrors()) {
            bindingResult.getAllErrors().stream().anyMatch(error -> {
                if (Objects.requireNonNull(error.getCodes())[0].equals("userForm.ValidNames")) {
                    model.addAttribute("namesErrorMessage", error.getDefaultMessage());
                }
                return true;
            });
            model.addAttribute("userForm", form);
        } else {
            try {
                userService.save(form);
            } catch (IllegalArgumentException e) {
                return "redirect:/signUp?f=true";
            } catch (IllegalStateException e) {
                return "redirect:/signUp?p=true";
            }
        }

        return "redirect:/signIn";
    }
}
