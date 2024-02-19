package com.farm.repository;

import com.farm.domain.Review;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Long> {

    List<Review> findTop5ByReviewMemIdxOrderByReviewDateDesc(Long memIdx);

    Page<?> findByReviewMemIdxOrderByReviewDateDesc(Long idx, Pageable pageable);
}
