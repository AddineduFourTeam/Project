package com.farm.repository;

import com.farm.domain.Reservation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ReservationRepository extends JpaRepository<Reservation, Long> {
    List<Reservation> findTop5ByRvMemIdxOrderByRvDateDesc(Long memIdx);
}
