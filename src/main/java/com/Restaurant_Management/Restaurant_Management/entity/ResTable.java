package com.Restaurant_Management.Restaurant_Management.entity;

import jakarta.persistence.*;

@Entity
@Table(name="tables")
public class ResTable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private Integer tablenumber;
    private Integer capacity;
    private Boolean status;

    public ResTable() {

    }
    public ResTable(Integer tableNumber, Integer capacity, Boolean status) {
        this.tablenumber = tableNumber;
        this.capacity = capacity;
        this.status = status;
    }

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTableNumber() {
        return tablenumber;
    }
    public void setTableNumber(Integer tableNumber) {
        this.tablenumber = tableNumber;
    }

    public Integer getCapacity() {
        return capacity;
    }
    public void setCapacity(Integer capacity) {
        this.capacity = capacity;
    }

    public Boolean getStatus() {
        return status;
    }
    public void setStatus(Boolean status) {
        this.status = status;
    }


}
