package com.Restaurant_Management.Restaurant_Management.repository;

import com.Restaurant_Management.Restaurant_Management.entity.Order;
import com.Restaurant_Management.Restaurant_Management.entity.Orderitem;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
//import java.lang.*;

public interface Orderitemrepo extends JpaRepository<Orderitem, Long> {
//    List<Orderitem> findByOrder(Order order);
//    List<Orderitem> findByOrderId(Long orderId);
    List<Orderitem> findByOrderOrderId(Long orderId);
}
