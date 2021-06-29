package com.simbirsoft.habbitica.impl.controllers;

import com.simbirsoft.habbitica.api.services.TaskService;
import com.simbirsoft.habbitica.api.services.UserService;
import com.simbirsoft.habbitica.impl.models.data.Task;
import com.simbirsoft.habbitica.impl.models.data.User;
import com.simbirsoft.habbitica.impl.models.dto.TaskDTO;
import com.simbirsoft.habbitica.impl.models.form.TaskForm;
import com.simbirsoft.habbitica.impl.security.details.UserDetailsImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.util.List;

@Controller
public class TasksController {

    private TaskService taskService;
    private UserDetailsService userDetailsService;
    private UserService userService;

    @Autowired
    public TasksController(TaskService taskService,
                           UserService userService,
                           @Qualifier("customUserDetailsService") UserDetailsService userDetailsService) {
        this.taskService = taskService;
        this.userService = userService;
        this.userDetailsService = userDetailsService;
    }

    @GetMapping("/tasks")
    public String getTasksPage(@AuthenticationPrincipal UserDetailsImpl usr, Model model) {

        List<TaskDTO> tasks = taskService.findAll();
        User user = usr.getUser();
        //0 - admin, 1 - user
        model.addAttribute("authority", user.getRole().equals(User.Role.ADMIN) ? 0 : 1);
        model.addAttribute("tasks", tasks);

        return "tasks_page";
    }

    @GetMapping("/tasks/add")
    public String getTasksUploadPage(Model model) {

        model.addAttribute("taskForm", new TaskForm());

        return "tasks_upload_page";
    }

    @PostMapping("/tasks/add")
    public String addTask(@Valid TaskForm form) {

        Task task = Task.builder()
                .title(form.getTitle())
                .description(form.getDescription())
                .reward(form.getReward())
                .build();

        taskService.save(task);

        return "redirect:/tasks/add";
    }

    @PostMapping("/tasks/{task-id}")
    public String takeTask(@AuthenticationPrincipal UserDetailsImpl userDetails,
                           @PathVariable("task-id") Long id){

        userDetails = (UserDetailsImpl) userDetailsService.loadUserByUsername(userDetails.getUsername());
        User user = userDetails.getUser();
        userService.takeTask(id, user);

        return "redirect:/tasks";
    }
}