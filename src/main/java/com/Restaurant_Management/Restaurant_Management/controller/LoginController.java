package com.Restaurant_Management.Restaurant_Management.controller;

import com.Restaurant_Management.Restaurant_Management.entity.User;
import com.Restaurant_Management.Restaurant_Management.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class LoginController {

    @Autowired
    private UserService userService;

    @GetMapping("users")
    public User Users() {
        return userService.getUserByUsername("John Doe");
    }

    @PostMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password) {
        boolean authenticated = userService.authenticate(username, password);
        if (authenticated) {
            User user = userService.getUserByUsername(username);
            return "Login successful. Welcome, " + user.getUsername() + " (ID: " + user.getId() + ")";
        } else {
            return "Invalid username or password";
        }
    }
}

