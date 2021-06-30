package com.simbirsoft.habbitica.impl.controllers;

import com.simbirsoft.habbitica.api.services.ProductService;
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
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductController {

    private ProductService productService;
    private UserDetailsService userDetailsService;

    @Autowired
    public ProductController(ProductService productService,
                             @Qualifier("customUserDetailsService") UserDetailsService userDetailsService) {
        this.productService = productService;
        this.userDetailsService = userDetailsService;
    }

    @GetMapping("/shop")
    public String getShopPage(@AuthenticationPrincipal UserDetailsImpl userDetails,
                              Model model,
                              @RequestParam(required = false) Long id) {
        model.addAttribute("user", userDetails.getUser());
        model.addAttribute("products", productService.findAll());
        if (id != null) {
            model.addAttribute("forbidden_prod_id", id);
        }

        return "shop_page";
    }

    @PostMapping("/shop/{product-id}")
    public String buyProduct(@AuthenticationPrincipal UserDetailsImpl userDetails,
                             @PathVariable("product-id") Long id) {

        userDetails = (UserDetailsImpl) userDetailsService
                .loadUserByUsername(userDetails.getUsername());
        try {
            productService.buyProduct(userDetails.getUser(), id);
        } catch (IllegalStateException e) {
            return "redirect:/shop?id=" + id;
        }

        return "redirect:/shop";
    }
}
