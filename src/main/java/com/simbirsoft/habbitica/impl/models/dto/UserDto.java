package com.simbirsoft.habbitica.impl.models.dto;

import com.simbirsoft.habbitica.impl.models.data.User;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.stream.Collectors;

@Builder
@Getter
@Setter
public class UserDto {

    private Long id;
    private String username;
    private String path;

    public static UserDto from(User user) {

        return UserDto.builder()
                .id(user.getId())
                .username(user.getUsername())
                .path(user.getPath())
                .build();
    }

    public static List<UserDto> from(List<User> users) {

        return users.stream().map(UserDto::from).collect(Collectors.toList());
    }
}
