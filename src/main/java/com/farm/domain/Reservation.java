package com.farm.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@EntityListeners(AuditingEntityListener.class)
public class Reservation {
    @Id
    private int rvIdx; // 컨텐츠 번호
    private Long rvMemIdx; // 사용자 고유 식별자
    private Long rvFarmIdx; // 농장 고유 식별자
    private String rvDate; // 예약 날짜
    private String rvStartMonth; // 예약 시작 월
    private String rvEndMonth; // 예약 종료 월
    private int status; // 예약 상태(대기, 확정, 취소)
    private Number rvPrice; // 예약 가격
    private String rvOptionSeeding;
    private String rvOptionPlow;
    private String rvOptionWatering;
    private String rvOptionCompost;

}
