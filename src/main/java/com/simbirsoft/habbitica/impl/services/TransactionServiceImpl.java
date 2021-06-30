package com.simbirsoft.habbitica.impl.services;

import com.simbirsoft.habbitica.api.repositories.TransactionRepository;
import com.simbirsoft.habbitica.api.services.TransactionService;
import com.simbirsoft.habbitica.impl.models.data.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class TransactionServiceImpl implements TransactionService {

    private TransactionRepository transactionRepository;

    @Autowired
    public TransactionServiceImpl(TransactionRepository transactionRepository) {
        this.transactionRepository = transactionRepository;
    }

    @Override
    public Transaction save(Transaction transaction) {
        return transactionRepository.save(transaction);
    }

    @Override
    public List<Transaction> findAllByUserId(Long userId) {
        List<Transaction> list = transactionRepository.findAll();
        return list.stream().filter(x -> x.getUserId().equals(userId)).collect(Collectors.toList());
    }
}