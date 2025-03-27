package com.Restaurant_Management.Restaurant_Management.repository;

import com.Restaurant_Management.Restaurant_Management.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepo extends JpaRepository<Order, Long> {
}
