package com.farm.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Story {
    @Id
    @GeneratedValue(generator="myBoardSEQ")
    private Long storyIdx;
    private Long storyMemIdx;
    private Long storyWfIdx;
    private String storySubject;
    private String storyContent;
    private int storyCount;
    private String storyDate;
    private String storyImg1;
    private String storyImg2;
    private String storyImg3;
}
