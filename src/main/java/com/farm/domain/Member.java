package com.farm.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity(name="MEMBERJPA02")
@Builder
public class Member {
    @Id
    @GeneratedValue(generator="myBoardSEQ")
    private Long id;
    private String name;
    private String email;

    public Member(String email, String name) {
        this.name = name;
        this.email = email;
    }

}
