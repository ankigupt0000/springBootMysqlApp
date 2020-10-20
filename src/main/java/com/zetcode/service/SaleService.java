package com.zetcode.service;

import com.zetcode.model.Sale;
import com.zetcode.repository.SaleRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SaleService implements ISaleService {

    @Autowired
    private SaleRepository repository;

    @Override
    public List<Sale> findAll() {

        return (List<Sale>) repository.findAll();
    }
}