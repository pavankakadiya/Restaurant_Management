package com.Restaurant_Management.Restaurant_Management.controller;

import com.Restaurant_Management.Restaurant_Management.entity.ResTable;
import com.Restaurant_Management.Restaurant_Management.repository.TableRepo;
import com.Restaurant_Management.Restaurant_Management.service.TableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class TableController {

    @Autowired
    TableService tableService;

    @GetMapping("/tables")
    public List<ResTable> tables() {
        return tableService.Alltables();
    }
}
