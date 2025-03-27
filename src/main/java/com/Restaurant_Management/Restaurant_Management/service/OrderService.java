package com.Restaurant_Management.Restaurant_Management.service;

import com.Restaurant_Management.Restaurant_Management.entity.*;
import com.Restaurant_Management.Restaurant_Management.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrderService {

    @Autowired
    private TableRepo tableRepo;

    @Autowired
    private UserRepository userRepo;

    @Autowired
    private OrderRepo orderRepo;

    @Autowired
    private Orderitemrepo orderitemrepo;

    @Autowired
    private Dishrepo dishrepo;

    @Autowired
    private TableService tableService;


    public Order AddOrder(Long id, List<Orderitem> orderitems,Integer tablenumber) {


        tableService.BookTable(tablenumber);
        Order order = new Order();
        order.setWaiter(userRepo.findById(id).get());
        Order savedOrder = orderRepo.save(order);

        for (Orderitem item : orderitems) {
            Dish dish = dishrepo.findByDishName(item.getDishName());
            item.setOrder(savedOrder);
            item.setPrice(dish.getPrice());
            orderitemrepo.save(item);
        }
        savedOrder.setOrderItems(orderitemrepo.findByOrderOrderId(savedOrder.getOrderId()));
        return savedOrder;
    }

//    public BillResponse bill(Long orderId){
//        Order order = orderRepo.findById(orderId)
//                .orElseThrow(() -> new RuntimeException("Order not found"));
//        List<Orderitem> orderitem = orderitemrepo.findByOrderOrderId(orderId);
//        order.setWaiter(userRepo.findByUsername("nikhil"));
//        return new BillResponse(
//                order.getOrderId(),
//                orderitem,
//                1D,
//                order.getTotalAmount() != null ? order.getTotalAmount() : 0.0
//        );
//    }

    public List<Order> getOrders() {
        return orderRepo.findAll();
    }

    public Order GetOrderById(Long id) {return orderRepo.findById(id).get();}

    public List<Orderitem> getOrderitems() {
        return orderitemrepo.findAll();
    }

    public List<Orderitem> getOrderitemsbyid(Long id) {
        return orderitemrepo.findByOrderOrderId(id);
    }
}
