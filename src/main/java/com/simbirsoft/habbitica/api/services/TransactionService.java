package com.simbirsoft.habbitica.api.services;

import com.simbirsoft.habbitica.impl.models.data.Transaction;

import java.util.List;

public interface TransactionService {

    Transaction save(Transaction transaction);

    List<Transaction> findAllByUserId(Long userId);
}
