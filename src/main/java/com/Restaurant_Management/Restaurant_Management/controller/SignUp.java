package com.Restaurant_Management.Restaurant_Management.controller;

import com.Restaurant_Management.Restaurant_Management.entity.User;
import com.Restaurant_Management.Restaurant_Management.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SignUp {

    @Autowired
    UserService userService;
    @PostMapping(value="/SignUp",consumes = "multipart/form-data")
    public String SignUp(@RequestParam("username") String username,@RequestParam("email") String email, @RequestParam("password") String password) {

        User user = new User(username, email, password);

        userService.addUser(user);
        return "Success";
    }

}
