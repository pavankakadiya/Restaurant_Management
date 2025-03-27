//OrderController
package com.Restaurant_Management.Restaurant_Management.controller;

import com.Restaurant_Management.Restaurant_Management.entity.BillResponse;
import com.Restaurant_Management.Restaurant_Management.entity.Order;
import com.Restaurant_Management.Restaurant_Management.entity.Orderitem;
import com.Restaurant_Management.Restaurant_Management.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class OrderController {
    @Autowired
    OrderService orderService;

    @PostMapping(value="/order",consumes = "application/json")
    public Order placeOrder(@RequestParam Long userId,
                            @RequestParam Integer tablenumber,
                            @RequestBody List<Orderitem> orderItems) {
        if (orderItems.size() != 0 && userId != null) {

        return orderService.AddOrder(userId, orderItems,tablenumber);
        }
        return null;
    }

//    @GetMapping("/bill")
//    public BillResponse getBill() {
//        return orderService.bill(1L);
//    }
    @GetMapping("/orders")
    public List<Order> getOrders() {
        return orderService.getOrders();
    }

    @GetMapping("/orders/{id}")
    public Order getOrderById(@PathVariable Long id) {
        return orderService.GetOrderById(id);
    }

    @GetMapping("/orderitems")
    public List<Orderitem> getOrderitems() {
        return orderService.getOrderitems();
    }
    @GetMapping("/orderitems/{orderid}")
    public List<Orderitem> getOrderitems(@PathVariable Long orderid) {
        return orderService.getOrderitemsbyid(orderid);
    }
}
