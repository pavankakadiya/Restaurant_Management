//LoginController
package com.Restaurant_Management.Restaurant_Management.controller;

import com.Restaurant_Management.Restaurant_Management.entity.User;
import com.Restaurant_Management.Restaurant_Management.repository.UserRepository;
import com.Restaurant_Management.Restaurant_Management.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping()
public class LoginController {

    @Autowired
    private UserService userService;
    @Autowired
    private UserRepository userRepository;

    @GetMapping("users")
    public List<User> Users(){
        return userService.allusers();
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

    @DeleteMapping("deleteuser")
    public String deleteUser(@RequestParam String username) {
        userService.deleteUserByUsername(username);
        return "User deleted";
    }

    @PatchMapping("updateuser")
    public String updateUser(@RequestParam String username, @RequestParam String password,@RequestParam String newpassword) {
        userService.updateUser(username,password,newpassword);
        return "password changed";
    }
}

