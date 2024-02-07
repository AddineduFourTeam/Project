package com.farm.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity(name="MEMBER")
@EntityListeners(AuditingEntityListener.class)
public class Member {

    @Id
    @GeneratedValue(generator = "myBoardSEQ")
    @Column(name = "MEM_IDX")
    private Long memIdx;

    @NotBlank(message = "아이디는 필수 입력값 입니다")
    private String memid;

    //@NonNull
    private String pass;
    //@NonNull
    private String name;

    private String birth;
    //@NonNull
    private String phone;

    private String email;
    private String memImg;

    @CreatedDate
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDateTime regdate;

    private LocalDateTime outdate;

    @Column(columnDefinition="varchar2(10) DEFAULT 'N'")
    private String isOut ="N";

   /* @OneToMany(mappedBy = "member", cascade = CascadeType.ALL)
    private List<Story> stories = new ArrayList<>();*/

}
