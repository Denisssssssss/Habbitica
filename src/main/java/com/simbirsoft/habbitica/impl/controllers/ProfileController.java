package com.simbirsoft.habbitica.impl.controllers;

import com.simbirsoft.habbitica.api.services.TaskService;
import com.simbirsoft.habbitica.api.services.UserService;
import com.simbirsoft.habbitica.impl.models.data.User;
import com.simbirsoft.habbitica.impl.security.details.UserDetailsImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ProfileController {

    private UserService userService;
    private TaskService taskService;

    @Autowired
    public ProfileController(UserService userService, TaskService taskService) {
        this.userService = userService;
        this.taskService = taskService;
    }

    @GetMapping("/profile")
    public String getProfilePage(@AuthenticationPrincipal UserDetailsImpl userDetails,
                                 Model model) {

        model.addAttribute("user", userDetails.getUser());

        return "profile_page";
    }

    @GetMapping("/profile/tasks")
    public String getUserTasksPage(@AuthenticationPrincipal UserDetailsImpl userDetails,
                                   Model model) {

        model.addAttribute("tasks", userDetails.getUser().getTasks());

        return "user_tasks_page";
    }

    @PostMapping("/profile/tasks/{task-id}")
    public String completeTask(@PathVariable("task-id") Long id,
                               @AuthenticationPrincipal UserDetailsImpl userDetails) {

        User user = userDetails.getUser();
        userService.removeTask(id, user);

        return "redirect:/profile/tasks";
    }
}