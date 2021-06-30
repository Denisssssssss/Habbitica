package com.simbirsoft.habbitica.api.services;

import com.simbirsoft.habbitica.impl.models.data.Product;
import com.simbirsoft.habbitica.impl.models.data.User;

import java.util.List;

public interface ProductService {

    Product save(Product product);

    List<Product> findAll();

    void buyProduct(User user, Long productId);
}
