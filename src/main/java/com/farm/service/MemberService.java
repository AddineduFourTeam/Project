package com.farm.service;

import com.farm.domain.Member;
import com.farm.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Optional;
import java.util.UUID;


@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

    /*프로필추가설정*/
    @Value("${upload.directory}")
    private String uploadDirectory;

    public void memInsert(Member member, MultipartFile file) throws Exception{
        /*MultipartFile file) throws Exception추가함*/

        memberRepository.save(member);
       /* try {

            *//*프로필사진추가*//*
           // uploadImage(file, member.getMemIdx());
        }catch(IOException | IllegalStateException e){
            throw new Exception("Faile to upload the file",e);
        }*/

    }

    public Member login(String id) {
            Optional<Member> loginUser = memberRepository.findByMemid(id);

            if(loginUser.isPresent()){
                return loginUser.get();
            }else{
                return null;
            }
    }

    public boolean idCheck(String memid) {
        return memberRepository.existsByMemid(memid);
    }

    public String uploadImage(MultipartFile file, Long memIdx) throws IOException {

        // 1. Null 또는 빈 파일 확인
        if (file.isEmpty()) {
            throw new IllegalArgumentException("파일이 비어 있습니다");
        }

        // 2. 파일 유형 확인 (이미지인지)
        if (!file.getContentType().startsWith("image/")) {
            throw new IllegalArgumentException("잘못된 파일 유형입니다. 이미지를 업로드하세요");
        }

        //프로필사진 추가
        String projectPath = System.getProperty("user.dir")
                + "\\src\\main\\resources\\static\\files";

        UUID uuid = UUID.randomUUID();

        // 3. 파일 이름 충돌 처리
        String fileName = uuid+"_"+file.getOriginalFilename();

        // 4. 파일을 저장할 디렉토리 생성
        File saveDirectory = new File(projectPath);
        if (!saveDirectory.exists()) {
            saveDirectory.mkdirs();
        }
        //Member member = new Member();
        //member.setMemImg("/files/"+fileName);
        File saveFile = new File(projectPath, fileName);
        file.transferTo(saveFile);

        return "/files/"+fileName;

    }

    
/*
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
   *//*     switch(idx) {
            case "name": members = memberRepository.findByName(input); break;
            //case "id": members = memberRepository.findById(Long.parseLong(input)); break;
            case "email": members = memberRepository.findByEmail(input); break;
        }*//*

        return members;
    }*/
}
