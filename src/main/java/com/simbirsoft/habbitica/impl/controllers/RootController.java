package com.simbirsoft.habbitica.impl.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RootController {

    @GetMapping("/")
    public String root(Model model) {

        model.addAttribute("first_footer", 1);

        return "index";
    }
}
