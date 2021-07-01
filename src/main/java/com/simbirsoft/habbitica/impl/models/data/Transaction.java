package com.simbirsoft.habbitica.impl.models.data;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Entity
public class Transaction {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Long userId;
    private Date date;
    private Long value;
    private String title;

    @Enumerated(value = EnumType.STRING)
    private Target target;

    public enum Target {
        ЗАДАЧА, ДОСТИЖЕНИЕ, ТОВАР
    }
}
