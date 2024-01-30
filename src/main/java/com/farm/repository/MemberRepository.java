package com.farm.repository;

import com.farm.domain.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface MemberRepository extends JpaRepository<Member, Long> {
    Optional<Member> findByMemid(String id);

    boolean existsByMemid(String memid);
    //List<Member> select(String idx, String input);
    /*List<Member> findByNameLike(String name);*/
    /*List<Member> findByEmailLike(String email);*/
    //Optional<Member> findById(Long id); //
}
