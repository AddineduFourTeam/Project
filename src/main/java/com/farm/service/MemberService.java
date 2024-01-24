package com.farm.service;

import com.farm.domain.Member;
import com.farm.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

    public void insert(){
        Member member;
        for(int i = 1 ; i < 11 ; i++) {
            member = new Member("abc"+i+"@test.com","김이박"+i );
            memberRepository.save(member);
        }
    }

    public List<Member> selectAll() {
        List<Member> members = memberRepository.findAll();

        return members;
    }

    public List<Member> select(String idx,String input) {
        List<Member> members = memberRepository.findAll();
        //System.out.println(members);
        //System.out.println(idx + " : " + input);
        if(idx.equals("name")) {
            members = memberRepository.findByNameLike(input);
        }
        if(idx.equals("email")){
            members = memberRepository.findByEmailLike(input);
        }
        //System.out.println(members);
   /*     switch(idx) {
            case "name": members = memberRepository.findByName(input); break;
            //case "id": members = memberRepository.findById(Long.parseLong(input)); break;
            case "email": members = memberRepository.findByEmail(input); break;
        }*/

        return members;
    }
}
