package com.farm.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.Id;
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
public class Reservation {
    @Id
    private Long rvIdx; // 컨텐츠 번호
    private Long rvMemIdx; // 사용자 고유 식별자
    private Long rvFarmIdx; // 농장 고유 식별자
    private String rvUseDate; // 예약 기간
    private char status; // 예약 상태(확정 y, 취소 n)
    private Integer rvPrice; // 예약 가격
    private Integer rvFeet; // 평 수
    private String rvOptionSeeding; // 모종 제공
    private String rvOptionPlow; // 밭갈기
    private String rvOptionWatering; // 물주기
    private String rvOptionCompost; // 퇴비뿌리기

    @CreatedDate
    private String rvDate; // 예약 날짜


}
