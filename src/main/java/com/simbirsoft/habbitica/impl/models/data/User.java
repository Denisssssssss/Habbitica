package com.simbirsoft.habbitica.impl.models.data;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import java.util.*;


@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
@Table(name = "account")
public class User implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String email;
    private String username;
    private String hashPassword;
    @Builder.Default
    private Long balance = 0L;

    private String path;

    @Builder.Default
    @ManyToMany(mappedBy = "users")
    private Set<Task> tasks = new HashSet<>();

    @Column
    @ElementCollection(targetClass=Integer.class)
    private Map<Long, Integer> tasksDoneCount = new HashMap<>();

    @Builder.Default
    @ManyToMany(mappedBy = "users")
    private List<Achievement> achievements = new ArrayList<>();

    public enum Role {
        ADMIN, USER
    }

    @Builder.Default
    @Enumerated(value = EnumType.STRING)
    private Role role = Role.USER;

    public enum State {
        NOT_CONFIRMED, ACTIVE, BANNED
    }

    @Builder.Default
    @Enumerated(value = EnumType.STRING)
    private State state = State.NOT_CONFIRMED;

    @Override
    public int hashCode() {
        return super.hashCode();
    }

    @Override
    public boolean equals(Object obj) {
        return super.equals(obj);
    }

    @Override
    public String toString() {
        return super.toString();
    }

    public void increaseBalance(Long value) {
        balance += value;
    }

    public boolean isActive() {
        return this.state == State.ACTIVE;
    }

    public boolean isBanned() {
        return this.state == State.BANNED;
    }

    public boolean isConfirmed() {
        return this.state == State.NOT_CONFIRMED;
    }
}
