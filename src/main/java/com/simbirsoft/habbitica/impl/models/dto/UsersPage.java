package com.simbirsoft.habbitica.impl.models.dto;

import com.simbirsoft.habbitica.impl.models.dto.UserDto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UsersPage {

    private int pagesCount;
    private List<UserDto> users;
}