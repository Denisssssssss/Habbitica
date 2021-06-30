package com.simbirsoft.habbitica.impl.models.data;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Value;

import javax.persistence.*;
import java.util.Set;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Achievement {

    @Transient
    @Value("${images.achievements.default}")
    private static String defaultImg;

    @Transient
    @Value("${images.achievements.path")
    private static String dir;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToMany
    @JoinTable(joinColumns = @JoinColumn(name = "task_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "account_id", referencedColumnName = "id"))
    private Set<User> users;

    @Builder.Default
    private String path = dir + defaultImg;

    private String title;
    private String description;
    private Long taskId;
    private String category;
    private Long reward;
    private int count;
}