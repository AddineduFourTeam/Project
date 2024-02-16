package com.farm.service;

import com.farm.domain.Member;
import com.farm.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;


@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    StoryRepository storyRepository;

    @Autowired
    ReservationRepository reservationRepository;

    @Autowired
    ReviewRepository reviewRepository;

    @Autowired
    FarmRepository farmRepository;

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

    /* 회원가입시 유효성 체크 */
    /* 안됨
    @Transactional(readOnly = true)
    public Map<String, String> validateHandling(Errors errors) {
        Map<String,String> validatorResult = new HashMap<>();

        *//* 유효성 검사에 실패한 필드 목록을 받음 *//*
        for(FieldError error : errors.getFieldErrors()){
            String validKeyName = String.format("valid_%s", error.getField());
            validatorResult.put(validKeyName,error.getDefaultMessage());
        }
        return validatorResult;
    }*/

    public Optional<Member> getMemberById(String memid) {
        Optional<Member> opMember = memberRepository.findByMemid(memid);
        return opMember;
    }

    public void updatePass(String memid, String pass) {
        Optional<Member> opMember = memberRepository.findByMemid(memid);
        opMember.ifPresent(member -> {
            member.setPass(pass);
            memberRepository.save(member);
        });
    }

    public void cancelAccount(String memid) {
        Optional<Member> opMember = memberRepository.findByMemid(memid);
        opMember.ifPresent(
                member->{
                    member.setIsOut("Y");
                    member.setOutdate(LocalDateTime.now());
                    member.setMemImg(null);
                    memberRepository.save(member);
                }
        );
    }

    /*public Member updateMyInfo(Member iMyInfo, String memid) {
        Optional<Member> opMember = memberRepository.findByMemid(memid);
        opMember.ifPresent(
                member->{
                    member.setName(iMyInfo.getName());
                    member.setBirth(iMyInfo.getBirth());
                    member.setPhone(iMyInfo.getPhone());
                    //member.setEmail(iMyInfo.getEmail());
                    //member.setMemImg(iMyInfo.getMemImg());

                    memberRepository.save(member);
                }
        );
        return iMyInfo;
    }*/

    public Member updateMyInfo(Member iMyInfo, String memid) {
        Optional<Member> opMember = memberRepository.findByMemid(memid);
        Member updatedMember = null;
        if(opMember.isPresent()){
            Member member = opMember.get();
            member.setName(iMyInfo.getName());
            member.setBirth(iMyInfo.getBirth());
            member.setPhone(iMyInfo.getPhone());
            member.setEmail(iMyInfo.getEmail());
            member.setMemImg(iMyInfo.getMemImg());

            updatedMember = memberRepository.save(member);
        }
        return updatedMember;
    }

    public Member getLoginUser(String memid) {
        return memberRepository.findByMemid(memid).orElse(null);
    }

    public Member findByMemid(String memid) {
        return memberRepository.findByMemid(memid).orElse(null);
    }

    public void getMypgList(Model model, Long memIdx) {
        model.addAttribute("stories",storyRepository.findTop3ByStoryMemIdxOrderByStoryDateDesc(memIdx));
        model.addAttribute("reservations",reservationRepository.findTop5ByRvMemIdxOrderByRvDateDesc(memIdx));
        model.addAttribute("reviews",reviewRepository.findTop5ByReviewMemIdxOrderByReviewDateDesc(memIdx));

        /*List<String> wfSubjects = reservationRepository.findFarmWfSubjectByRvMemIdx(memIdx);
        model.addAttribute("wfSubjects",wfSubjects);*/
        /*model.addAttribute("farmSubject",reservationRepository.findFarmSubjectsByRvMemIdx(memIdx));*/

        /*model.addAttribute("wfSubject",reservationRepository.findWfSubjectByMemIdx(memIdx));
        System.out.println("wfSubject = " + reservationRepository.findWfSubjectByMemIdx(memIdx));*/
        model.addAttribute("wfSubjectlist",reservationRepository.findWfSubjectByMemIdx(memIdx));
        //System.out.println("wfSubjectlist = " + reservationRepository.findWfSubjectByMemIdx(memIdx));

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
