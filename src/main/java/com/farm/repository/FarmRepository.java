package com.farm.repository;

import com.farm.domain.Farm;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FarmRepository extends JpaRepository<Farm, Long> {
   // boolean existsByFarmDate(String holidayDate); // 공휴일 중복 체크
}
