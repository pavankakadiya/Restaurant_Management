//BillResponse
package com.Restaurant_Management.Restaurant_Management.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
@Entity
@Table(name = "order_items")
public class BillResponse {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long itemId;

    @ManyToOne
    @JoinColumn(name = "order_id", nullable = false)
    @JsonIgnore
    private Order order;  // Order entity linked by the foreign key


    private String dishName;
    private int quantity;
    private int price;

    // Constructors
    public BillResponse() {}

    public BillResponse(Order order, String dishName, int quantity, int price) {
        this.order = order;
        this.dishName = dishName;
        this.quantity = quantity;
//        this.dish = dish;
        this.price = price;
    }

    // Getters and Setters
    public Long getItemId() {
        return itemId;
    }

    public void setItemId(Long itemId) {
        this.itemId = itemId;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public String getDishName() {
        return dishName;
    }

    public void setDishName(String dishName) {
        this.dishName = dishName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return this.price;
    }
    public void setPrice(int price) {
        this.price = price;
    }

}
