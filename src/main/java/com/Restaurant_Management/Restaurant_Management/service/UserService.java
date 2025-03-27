package com.Restaurant_Management.Restaurant_Management.service;

import com.Restaurant_Management.Restaurant_Management.entity.User;
import com.Restaurant_Management.Restaurant_Management.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public boolean authenticate(String username, String password) {
        User user = userRepository.findByUsername(username);
        return user != null && user.getPassword().equals(password);
    }

    public List<User> allusers(){
        return userRepository.findAll();
    }

    public User getUserByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public void addUser(User user) {
        userRepository.save(user);
    }

    public void deleteUserByUsername(String username) {
        userRepository.delete(userRepository.findByUsername(username));
    }

    public String updateUser(String username, String password, String newpassword) {

        Boolean isValidUser = authenticate(username,password);
        User user = userRepository.findByUsername(username);
        if (isValidUser) {
            user.setPassword(newpassword); // Secure hashing
            userRepository.save(user);  // Saves the updated entity
            return "Password updated successfully!";
        }
        return "User not found!";

    }
}
