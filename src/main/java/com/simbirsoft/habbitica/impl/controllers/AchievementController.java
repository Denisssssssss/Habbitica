package com.simbirsoft.habbitica.impl.controllers;

import com.simbirsoft.habbitica.api.services.AchievementService;
import com.simbirsoft.habbitica.api.services.TaskService;
import com.simbirsoft.habbitica.api.services.UserService;
import com.simbirsoft.habbitica.impl.models.dto.AchievementDto;
import com.simbirsoft.habbitica.impl.security.details.UserDetailsImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;
import java.util.stream.Collectors;

@Controller
public class AchievementController {

    private AchievementService achievementService;
    private UserService userService;
    private TaskService taskService;

    @Autowired
    public AchievementController(AchievementService achievementService, UserService userService, TaskService taskService) {
        this.achievementService = achievementService;
        this.userService = userService;
        this.taskService = taskService;
    }

    @GetMapping("/achievements")
    public String getAchievements(@AuthenticationPrincipal UserDetailsImpl userDetails, Model model) {

        List<AchievementDto> achievements = achievementService.findAll();
        List<?> list = achievements.stream().map(AchievementDto::getCategory).distinct().collect(Collectors.toList());

        model.addAttribute("achievements", achievements);
        model.addAttribute("size", list.size());
        model.addAttribute("categories", list);
        model.addAttribute("user", userDetails.getUser());

        return "html/main/goals";
    }

    @GetMapping("/achievements/{category-name}")
    public String getAchievementsByCategory(@PathVariable("category-name") String name,
                                            @AuthenticationPrincipal UserDetailsImpl userDetails,
                                            Model model) {

        List<AchievementDto> achievements = achievementService.findAll();
        List<?> list = achievements.stream().map(AchievementDto::getCategory).distinct().collect(Collectors.toList());
        achievements = achievements.stream().filter(x -> x.getCategory().equals(name)).collect(Collectors.toList());

        model.addAttribute("achievements", achievements);
        model.addAttribute("size", list.size());
        model.addAttribute("categories", list);
        model.addAttribute("user", userDetails.getUser());


        return "html/main/goals";
    }
}
