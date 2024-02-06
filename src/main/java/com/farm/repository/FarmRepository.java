package com.farm.repository;

import com.farm.domain.Farm;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FarmRepository extends JpaRepository<Farm, Long> {

    Page<Farm> findByWfAddrContaining(String keyword, Pageable pageable);

    Page<Farm> findByWfSubjectContaining(String keyword, Pageable pageable);

    Page<Farm> findByWfThemeContaining(String keyword, Pageable pageable);

    List<Farm> findByWfAddrLike(String local);

    List<Farm> findByWfAddrContainingOrWfAddrContaining(String 충청남도, String 세종);
}