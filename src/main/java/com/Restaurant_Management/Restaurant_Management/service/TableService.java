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

    public ResTable BookTable(int tablenumber) {
        ResTable table =  tableRepo.findByTablenumber(tablenumber);
        if (table != null) {
            if (table.getStatus()) {
                throw new RuntimeException("table already Booked");
            }
            table.setStatus(true);
            tableRepo.save(table);
            return table;
        }
        throw new RuntimeException("table not found");
    }
    public ResTable FreeTable(int tablenumber) {
        ResTable table =  tableRepo.findByTablenumber(tablenumber);
        if (table != null) {
            if (!table.getStatus()) {
                throw new RuntimeException("table is already free");
            }
            table.setStatus(false);
            tableRepo.save(table);
            return table;
        }
        throw new RuntimeException("table not found");
    }



}
