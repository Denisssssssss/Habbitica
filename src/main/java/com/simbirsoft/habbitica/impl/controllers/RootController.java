package com.simbirsoft.habbitica.impl.controllers;

import com.simbirsoft.habbitica.impl.security.details.UserDetailsImpl;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RootController {

    @GetMapping("/")
    public String root(@AuthenticationPrincipal UserDetailsImpl userDetails, Model model) {

        model.addAttribute("first_footer", 1);
        model.addAttribute("user", userDetails.getUser());
        return "index";
    }
}
