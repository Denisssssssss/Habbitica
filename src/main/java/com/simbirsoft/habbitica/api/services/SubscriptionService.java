package com.simbirsoft.habbitica.api.services;

import com.simbirsoft.habbitica.impl.models.data.User;
import com.simbirsoft.habbitica.impl.models.dto.UserDto;

import java.util.List;

public interface SubscriptionService {
    List<UserDto> getIncomingRequests(User user);

    List<UserDto> getPendingRequests(User user);

    UserDto addUserIntoSubscriptions(User mainUser, Long userIdToadd);

    List<UserDto> getFriends(User user);

    List<UserDto> getSuggestions(User user);

}
