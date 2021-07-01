package com.simbirsoft.habbitica.impl.controllers;

import com.simbirsoft.habbitica.api.services.SubscriptionService;
import com.simbirsoft.habbitica.api.services.UserService;
import com.simbirsoft.habbitica.impl.models.dto.UsersPage;
import com.simbirsoft.habbitica.impl.security.details.UserDetailsImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class FriendsController {

    private UserService userService;
    private SubscriptionService subscriptionService;

    @Autowired
    public FriendsController(UserService userService, SubscriptionService subscriptionService) {
        this.userService = userService;
        this.subscriptionService = subscriptionService;
    }

    @GetMapping("/friends")
    public String getFriends(@AuthenticationPrincipal UserDetailsImpl userDetails,
                             Model model) {
        System.out.println(subscriptionService.getFriends(userDetails.getUser()));
        model.addAttribute("friends", subscriptionService.getFriends(userDetails.getUser()));
        model.addAttribute("suggestions", subscriptionService.getSuggestions(userDetails.getUser()));
        return "html/main/friends";
    }

    @GetMapping("/friends/add/{user-id}")
    public String addFriends(@AuthenticationPrincipal UserDetailsImpl userDetails,
                             @PathVariable("user-id") Long id,
                             Model model) {
        subscriptionService.addUserIntoSubscriptions(userDetails.getUser(), id);
        return "redirect:/friends";
    }

    @GetMapping("/friends/incoming")
    public String getIncomingRequests(@AuthenticationPrincipal UserDetailsImpl userDetails,
                             Model model) {
        model.addAttribute("requests", subscriptionService.getIncomingRequests(userDetails.getUser()));
        return "incoming_requests_page";
    }

    @GetMapping("/friends/sent")
    public String getPendingRequests(@AuthenticationPrincipal UserDetailsImpl userDetails,
                                      Model model) {
        model.addAttribute("requests", subscriptionService.getPendingRequests(userDetails.getUser()));
        return "sent_requests_page";
    }

    @ResponseBody
    @PostMapping("friends/search")
    public ResponseEntity<UsersPage> search(@RequestParam("size") Integer size,
                                            @RequestParam("page") Integer page,
                                            @RequestParam(value = "q", required = false) String query,
                                            @RequestParam(value = "sort", required = false) String sort,
                                            @RequestParam(value = "dir", required = false) String direction) {
        System.out.println(userService.search(size, page, query, sort, direction));
        return ResponseEntity.ok(userService.search(size, page, query, sort, direction));
    }
}