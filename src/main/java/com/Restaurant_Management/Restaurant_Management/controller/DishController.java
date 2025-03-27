//DishController
package com.Restaurant_Management.Restaurant_Management.controller;

import com.Restaurant_Management.Restaurant_Management.entity.Dish;
import com.Restaurant_Management.Restaurant_Management.repository.Dishrepo;
import com.Restaurant_Management.Restaurant_Management.service.DishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class DishController {

    @Autowired
    private DishService dishService;

    @GetMapping("/dish")
    public List<Dish> getDish() {
        return dishService.findAll();
    }

}
