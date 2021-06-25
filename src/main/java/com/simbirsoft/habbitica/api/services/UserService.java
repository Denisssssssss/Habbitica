package com.simbirsoft.habbitica.api.services;

import com.simbirsoft.habbitica.impl.models.data.User;
import com.simbirsoft.habbitica.impl.models.dto.UserDto;
import com.simbirsoft.habbitica.impl.models.form.UserForm;

public interface UserService {

    UserDto save(UserForm userForm);

    void addReward(Long reward, User user);

    void takeTask(Long taskId, User user);

    void removeTask(Long taskId, User user);
}
