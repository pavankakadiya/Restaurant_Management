package com.Restaurant_Management.Restaurant_Management.service;

import com.Restaurant_Management.Restaurant_Management.entity.ResTable;
import com.Restaurant_Management.Restaurant_Management.repository.TableRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TableService {

    @Autowired
    TableRepo tableRepo;

    public List<ResTable> Alltables() {
        return tableRepo.findAll();
    }


}
