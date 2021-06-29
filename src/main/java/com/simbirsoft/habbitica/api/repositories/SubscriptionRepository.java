package com.simbirsoft.habbitica.api.repositories;

import com.simbirsoft.habbitica.impl.models.data.Subscription;
import com.simbirsoft.habbitica.impl.models.data.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SubscriptionRepository extends JpaRepository<Subscription, Long> {
    List<Subscription> getSubscriptionsBySubscriber(User user);
    List<Subscription> getSubscriptionsBySubscribed(User user);
}
