package com.Restaurant_Management.Restaurant_Management.repository;

import com.Restaurant_Management.Restaurant_Management.entity.ResTable;
import com.Restaurant_Management.Restaurant_Management.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TableRepo extends JpaRepository<ResTable, Integer> {
    ResTable findByTablenumber(int tablenumber);
}
