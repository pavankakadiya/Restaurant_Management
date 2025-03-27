//Order
package com.Restaurant_Management.Restaurant_Management.entity;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "orders")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long orderId;

    @ManyToOne
    @JoinColumn(name = "waiter_id", nullable = false)
    private User waiter;

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<Orderitem> orderItems;

    public Order() {}

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public void setWaiter(User waiter) {
        this.waiter = waiter;
    }

    public String getWaiterName() {
        return waiter.getUsername();
    }

    public List<Orderitem> getOrderItems() {
        return orderItems;
    }
//
    public void setOrderItems(List<Orderitem> orderItems) {
        this.orderItems = orderItems;
    }

    // **Calculate total amount**
    public Double getTotalAmount() {
        if (orderItems == null || orderItems.isEmpty()) {
            return 0.0; // Return 0 if no order items exist
        }
        return orderItems.stream()
                .mapToDouble(item -> item.getPrice() * item.getQuantity())
                .sum();
    }
}
