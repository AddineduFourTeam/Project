package com.farm.dto;

import com.farm.domain.Farm;
import com.farm.domain.Reservation;
import com.farm.domain.Review;
import lombok.Data;

@Data
public class ReservationReviewDto {
     private Reservation reservation;
     private Review review;

     private int wfIdx;
     private String wfSubject;
     private String wfImgUrl1;
     private String wfAddr;


     public ReservationReviewDto(Reservation reservation, Review review, Farm farm) {
          this.reservation = reservation;
          this.review = review;

          this.wfIdx = farm.getWfIdx();
          this.wfSubject = farm.getWfSubject();
          this.wfImgUrl1 = farm.getWfImgUrl1();
          this.wfAddr = farm.getWfAddr();
     }
}
