package com.zetcode.service;

import com.zetcode.model.Sale;
import java.util.List;

public interface ISaleService {

    List<Sale> findAll();
}