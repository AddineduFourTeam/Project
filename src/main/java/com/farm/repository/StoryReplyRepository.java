package com.farm.repository;

import com.farm.domain.Story;
import com.farm.domain.StoryReply;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface StoryReplyRepository extends JpaRepository<StoryReply, Long> {

    Page<StoryReply> findBySrReplyIdx(Long id,Pageable pageable);
}
