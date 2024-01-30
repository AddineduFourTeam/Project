package com.farm.domain;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity(name="MEMBER")
@EntityListeners(AuditingEntityListener.class)
public class Member {
    @Id
    @GeneratedValue(generator="myBoardSEQ")
    private Long memIdx;
    private String memid;
    private String pass;
    private String name;
    private String birth;
    private String phone;
    private String email;
    private String memImg;

    @CreatedDate
    private LocalDateTime regdate;

    private LocalDateTime outdate;

    @Column(columnDefinition="varchar2(10) DEFAULT 'N'")
    private String isOut ="N";

}
