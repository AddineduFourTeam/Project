package com.farm.repository;

import com.farm.domain.Board;
import com.farm.domain.Member;
import com.farm.domain.Story;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface StoryRepository extends JpaRepository<Story, Long> {

    Page<Story> findByStorySubjectContaining(String keyword, Pageable pageable);
    Page<Story> findByStoryContentContaining(String keyword, Pageable pageable);

    Page<Story> findByStoryMemNameContaining(String keyword, Pageable pageable);
}
