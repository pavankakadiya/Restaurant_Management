package com.Restaurant_Management.Restaurant_Management.service;

import com.Restaurant_Management.Restaurant_Management.entity.Dish;
import com.Restaurant_Management.Restaurant_Management.repository.Dishrepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DishService {
    @Autowired
    private Dishrepo dishrepo;

    public List<Dish> findAll() {
        return dishrepo.findAll();
    }

}

