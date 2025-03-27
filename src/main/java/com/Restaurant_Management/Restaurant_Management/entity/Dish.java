//Dish
package com.Restaurant_Management.Restaurant_Management.entity;

import jakarta.persistence.*;

@Entity
@Table(name="dish")
public class Dish{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long dish_id;

    @Column(name = "dish_name")
    private String dishName;

    private Integer price;

    public Dish() {}

    public Dish(String dish_name, Integer price) {
        this.dishName = dish_name;
        this.price = price;
    }

    public Long getDish_id() {
        return dish_id;
    }
    public void setDish_id(Long dish_id) {
        this.dish_id = dish_id;
    }

    public String getDish_name() {
        return dishName;
    }
    public void setDish_name(String dish_name) {
        this.dishName = dish_name;
    }

    public Integer getPrice() {
        return price;
    }
    public void setPrice(Integer price) {
        this.price = price;
    }
}
