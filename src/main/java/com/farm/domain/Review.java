package com.farm.domain;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@EntityListeners(AuditingEntityListener.class)
public class Review {
    @Id
    @GeneratedValue(generator="myBoardSEQ")
    private Long reviewIdx;
    private String reviewSubject;
    private String reviewContent;
    private String reviewImg1;
    private String reviewImg2;
    private String reviewImg3;

    @Column(insertable=false, columnDefinition="NUMBER DEFAULT 0")
    private String reviewCount;

    @CreatedDate
    private String reviewDate;
    private Long reviewRvIdx;
    private int reviewWfIdx;
    private Long reviewMemIdx;

}
