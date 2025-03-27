package com.Restaurant_Management.Restaurant_Management.repository;

import com.Restaurant_Management.Restaurant_Management.entity.Dish;
import org.springframework.data.jpa.repository.JpaRepository;

public interface Dishrepo extends JpaRepository<Dish, Integer> {
    Dish findByDishName(String dish_name);
}
