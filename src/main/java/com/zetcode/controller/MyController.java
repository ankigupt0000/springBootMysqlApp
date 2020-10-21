package com.zetcode.controller;

import com.zetcode.model.Sale;
import com.zetcode.service.ISaleService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyController {

    @Autowired
    private ISaleService saleService;

    @GetMapping("/sales")
    public String findSales(Model model) {

        List<Sale> sales = (List<Sale>) saleService.findAll();

        model.addAttribute("sales", sales);

        return "showSales";
    }
}