package com.simbirsoft.habbitica.impl.services;

import com.simbirsoft.habbitica.api.repositories.ProductRepository;
import com.simbirsoft.habbitica.api.repositories.TransactionRepository;
import com.simbirsoft.habbitica.api.repositories.UserRepository;
import com.simbirsoft.habbitica.api.services.ProductService;
import com.simbirsoft.habbitica.impl.models.data.Product;
import com.simbirsoft.habbitica.impl.models.data.Transaction;
import com.simbirsoft.habbitica.impl.models.data.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.util.Date;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    private ProductRepository productRepository;
    private UserRepository userRepository;
    private TransactionRepository transactionRepository;

    @Autowired
    public ProductServiceImpl(ProductRepository productRepository,
                              UserRepository userRepository) {
        this.productRepository = productRepository;
        this.userRepository = userRepository;
    }

    @Override
    public Product save(Product product) {
        return productRepository.save(product);
    }

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public void buyProduct(User user, Long productId) {
        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new UsernameNotFoundException("Product not found"));
        if (user.getBalance() < product.getPrice()) {
            throw new IllegalStateException("Недостаточно средств");
        }
        user.increaseBalance((-1) * product.getPrice());
        transactionRepository.save(Transaction.builder()
                .userId(user.getId())
                .date(Date.from(Instant.now()))
                .value(product.getPrice())
                .target(Transaction.Target.ТОВАР)
                .build()
        );
        userRepository.save(user);
    }
}
