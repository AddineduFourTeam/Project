package com.farm.repository;

import com.farm.domain.Board;
import com.farm.domain.Farm;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FarmRepository extends JpaRepository<Farm, Long> {

    Page<Farm> findByWfAddrContaining(String keyword, Pageable pageable);
    Page<Farm> findByWfSubjectContaining(String keyword, Pageable pageable);

}