package com.farm.domain;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
public class Review {
    @Id
    @GeneratedValue(generator="myBoardSEQ")
    private Long reviewIdx;
    private String reviewSubject;
    private String reviewContent;
    private String reviewImg_1;
    private String reviewImg_2;
    @Column(insertable=false, columnDefinition="NUMBER DEFAULT 0")
    private String reviewCount;
    private String reviewDate;
    private Long ReviewWfIdx;
    private Long ReviewMemIdx;

}
