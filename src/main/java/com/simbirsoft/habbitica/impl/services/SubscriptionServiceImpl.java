package com.simbirsoft.habbitica.impl.services;

import com.simbirsoft.habbitica.api.repositories.SubscriptionRepository;
import com.simbirsoft.habbitica.api.repositories.UserRepository;
import com.simbirsoft.habbitica.api.services.SubscriptionService;
import com.simbirsoft.habbitica.impl.models.data.Subscription;
import com.simbirsoft.habbitica.impl.models.data.User;
import com.simbirsoft.habbitica.impl.models.dto.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class SubscriptionServiceImpl implements SubscriptionService {

    private SubscriptionRepository subscriptionRepository;
    private UserRepository userRepository;

    @Autowired
    public SubscriptionServiceImpl(SubscriptionRepository subscriptionRepository,
                                   UserRepository userRepository) {
        this.subscriptionRepository = subscriptionRepository;
        this.userRepository = userRepository;
    }

    @Override
    public List<UserDto> getIncomingRequests(User user) {
        List<User> subscriptions = subscriptionRepository.getSubscriptionsBySubscriber(user)
                .stream()
                .map(Subscription::getSubscribed)
                .collect(Collectors.toList());
        List<User> subscribers = subscriptionRepository.getSubscriptionsBySubscribed(user)
                .stream()
                .map(Subscription::getSubscriber)
                .collect(Collectors.toList());
        subscribers.removeAll(subscriptions);

        return UserDto.from(subscribers);
    }

    @Override
    public List<UserDto> getPendingRequests(User user) {
        List<User> subscriptions = subscriptionRepository.getSubscriptionsBySubscriber(user)
                .stream()
                .map(Subscription::getSubscribed)
                .collect(Collectors.toList());
        List<User> subscribers = subscriptionRepository.getSubscriptionsBySubscribed(user)
                .stream()
                .map(Subscription::getSubscriber)
                .collect(Collectors.toList());

        subscriptions.removeAll(subscribers);

        return UserDto.from(subscriptions);
    }

    @Override
    public List<UserDto> getFriends(User user) {

        List<User> subscriptions = subscriptionRepository.getSubscriptionsBySubscriber(user)
                .stream()
                .map(Subscription::getSubscribed)
                .collect(Collectors.toList());
        List<User> subscribers = subscriptionRepository.getSubscriptionsBySubscribed(user)
                .stream()
                .map(Subscription::getSubscriber)
                .collect(Collectors.toList());
        subscriptions.retainAll(subscribers);

        return UserDto.from(subscriptions);
    }

    @Override
    public UserDto addUserIntoSubscriptions(User mainUser, Long userIdToAdd) {

        Set<Long> subscriptionsId = subscriptionRepository
                .getSubscriptionsBySubscriber(mainUser)
                .stream()
                .map(Subscription::getSubscribed)
                .map(User::getId)
                .collect(Collectors.toSet());

        if (subscriptionsId.contains(userIdToAdd)) {
            return null;
        }
        User userToAdd = userRepository.getById(userIdToAdd);

        Subscription sub = Subscription.builder()
                .subscriber(mainUser)
                .subscribed(userToAdd)
                .build();

        subscriptionRepository.save(sub);
        return UserDto.from(mainUser);
    }

    @Override
    public List<UserDto> getSuggestions(User user) {
        List<User> list = userRepository.getSuggestions();
        List<User> banList = new ArrayList<>();
        banList.add(user);

        List<User> friends = subscriptionRepository.getSubscriptionsBySubscriber(user)
                .stream()
                .map(Subscription::getSubscribed)
                .collect(Collectors.toList());
        List<User> subscribers = subscriptionRepository.getSubscriptionsBySubscribed(user)
                .stream()
                .map(Subscription::getSubscriber)
                .collect(Collectors.toList());
        friends.retainAll(subscribers);

        banList.addAll(new ArrayList<>(friends));
        list.removeAll(banList);
        return UserDto.from(list);
    }
}
