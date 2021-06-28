package com.simbirsoft.habbitica.api.repositories;

import com.simbirsoft.habbitica.impl.models.data.ConfirmUser;
import com.simbirsoft.habbitica.impl.models.data.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ConfirmUserRepository extends JpaRepository<ConfirmUser, Long> {

    Optional<User> findUserByToken(String token);

    Optional<ConfirmUser> findTokenByToken(String token);
}