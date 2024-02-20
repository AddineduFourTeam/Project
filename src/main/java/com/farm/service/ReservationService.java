package com.farm.service;

import com.farm.domain.Reservation;
import com.farm.repository.ReservationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
@Service
public class ReservationService {

    @Autowired
    private ReservationRepository reservationRepository;

   public Reservation detail(Long rvIdx){
       return reservationRepository.findById(rvIdx).get();
   }


}
