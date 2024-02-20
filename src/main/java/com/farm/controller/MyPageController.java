package com.farm.controller;


import com.farm.domain.Member;
import com.farm.domain.Review;
import com.farm.domain.Story;
import com.farm.repository.ReservationRepository;
import com.farm.repository.ReviewRepository;
import com.farm.service.CommonService;
import com.farm.service.ListService;
import com.farm.service.MemberService;
import com.farm.service.StoryService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Controller
@SessionAttributes({"loginUser"})
public class MyPageController {
    @Autowired
    MemberService memberService;

    @Autowired
    StoryService storyService;

    @Autowired
    CommonService commonService;

    @Autowired
    PasswordEncoder pEncoder;
    @Autowired
    ListService listService;

    @Autowired
    ReservationRepository reservationRepository;

    @Autowired
    ReviewRepository reviewRepository;

    /*
     * 마이페이지
     * myPage : 로그인된 사용자의 memIdx값으로 마이페이지에 리스트 출력
     * updateMyInfo : 회원정보 변경을 위한 링크 이동
     * myPagePassCheck : 비밀번호 확인후 일치하는 경우 회원정보 변경 페이지로 이동
     * updateMyInfoForm : 정보변경 form에서 넘어온 값으로 회원정보 DB 변경
     */
    @GetMapping("/myPage")
    public String myInfoForm(HttpSession session, Model model){
        // System.out.println("로그인유저:"+session.getAttribute("loginUser"));
        Long idx = ((Member)session.getAttribute("loginUser")).getMemIdx();

        memberService.getMypgList(model,idx);

        return "myPage";
    }

    @GetMapping("/updateMyInfo")
    public String updateMyInfo(){
        return "updateMyInfo";
    }

    @PostMapping("/myPagePassCheck")
    @ResponseBody
    public Boolean myPagePassCheck(@RequestParam("pass") String checkPass,
                                   HttpSession session){
        System.out.println("checkPass:"+checkPass);
        Member loginUser = (Member) session.getAttribute("loginUser");

        if(loginUser != null && pEncoder.matches(checkPass,loginUser.getPass())){
            session.setAttribute("loginUser",loginUser);
            return true;
        }else{
            return false;
        }
    }

    @PostMapping("/updateMyInfoForm")
    public String updateMyInfoForm(@ModelAttribute("inputMyInfo") Member iMyInfo,
                                   HttpSession session, Model model,
                                   @RequestParam("file") MultipartFile file,
                                   @RequestParam("existingImage") String existingImage){

        Long memIdx = iMyInfo.getMemIdx();

        // 프로필 이미지가 존재할 때 추가 이미지를 입력하지 않은 경우 기존 이미지 유지
        if(!file.isEmpty() && file != null){
            try{
                String filename =  commonService.uploadImage(file, memIdx);
                iMyInfo.setMemImg(filename);
            }catch(IOException e){
                e.printStackTrace();
            }

        }else{
            iMyInfo.setMemImg(existingImage);
        }

        Member loginUser = (Member) session.getAttribute("loginUser");
        Member updatedMember = memberService.updateMyInfo(iMyInfo,loginUser.getMemid());
        model.addAttribute("loginUser",updatedMember);
        model.addAttribute("updateInfo",false);

        return "updateMyInfo";
    }

    /*
     * 비밀번호 변경(로그인된 상태)
     * updatePass(GET) : 비밀번호 변경 페이지(updatePassForm)로 이동
     * updatePass(POST) : 비밀번호 변경 값을 받아서 암호화 후 저장.
     *                    강제 로그아웃 후 재로그인 유도
     */
    @GetMapping("/updatePass")
    public String updatePass(){
        return "updatePassForm";
    }

    @PostMapping("/updatePass")
    public String updatePass(@RequestParam("memid") String memid,
                             @RequestParam("pass") String newPass,
                             HttpSession session,
                             SessionStatus status){
        Member loginUser = (Member)session.getAttribute("loginUser");
        String pass = pEncoder.encode(newPass);

        if(loginUser != null){
            memberService.updatePass(loginUser.getMemid(), pass);

            if(!status.isComplete()){
                status.setComplete();
            }
        }else{
            System.out.println("비밀번호변경실패");
        }

        return "redirect:/completePass"; // 비밀번호 변경완료 페이지
    }

    @GetMapping("/completePass")
    public String completePass(){
        return "completePass";
        // return "redirect:/completePass"됐을 때 받을 GetMapping
    }

    /*
     * 회원탈퇴
     * cancelAccount : 회원탈퇴 링크 이동
     * cancelAccountForm : 비밀번호 일치 확인 후 회원탈퇴, 로그아웃 진행
     */
    @GetMapping("/cancelAccount")
    public String deleteAccount(){
        return "cancelAccount";
    }

    @PostMapping("/cancelAccountForm")
    public String cancelAccountForm(HttpSession session,
                                    @RequestParam("cancelPass") String cancelPass,
                                    SessionStatus status,
                                    Model model){
        Member loginUser = (Member)session.getAttribute("loginUser");


        if(!status.isComplete() && pEncoder.matches(cancelPass,loginUser.getPass())){
            memberService.cancelAccount(loginUser.getMemid());
            status.setComplete();
           session.invalidate();

            return "redirect:/cancelComplete";

        }else if(!pEncoder.matches(cancelPass,loginUser.getPass())){
            model.addAttribute("isOutUser",false);
            return "cancelAccount";

        }else{
            model.addAttribute("isOutFail",false);
            return "cancelAccount";
        }
    }

    @GetMapping("/cancelComplete")
    public String cancelComplete(){
        return "cancelComplete";
        // cancelComplete 리다이렉트용
    }


    @GetMapping("/mypgStory")
    public String mypgStory(HttpSession session, Model model, @RequestParam(value="page" , defaultValue = "1") int page) {
        Long idx = ((Member) session.getAttribute("loginUser")).getMemIdx();
        commonService.myList(idx, page, Story.class, model);
        return "mypgStory";
    }

    @GetMapping("/mypgReview")
    public String mypgReview(HttpSession session, Model model, @RequestParam(value="page" , defaultValue = "1") int page) {
        Long idx = ((Member) session.getAttribute("loginUser")).getMemIdx();
        commonService.myList(idx, page, Review.class, model);
        return "mypgReview";
    }
    @GetMapping("/mypgReviewWrite")
    public String mypgReviewWrite(Model model,@RequestParam(value="id", defaultValue="1") Long id) {
        //System.out.println("id : "+id);
        memberService.reviewWrite(id,model);
        return "mypgReviewWrite";
    }

    @PostMapping("/reviewForm")
    public String reviewForm(
            @RequestParam("reviewRvIdx") Long rno,
            Review review ,
            HttpSession session ,
            @RequestParam(value="file1",required = false) MultipartFile file1,
            @RequestParam(value="file2",required = false) MultipartFile file2,
            @RequestParam(value="file3",required = false) MultipartFile file3) {
        //System.out.println("file1 = " + file1 + ", file2 = " + file2 + ", file3 = " + file3);
        Long memIdx = ((Member)session.getAttribute("loginUser")).getMemIdx();

        try{
            if(file1 != null && !file1.isEmpty()) {
                System.out.println("file1");
                String filename1 =  commonService.uploadImage(file1, memIdx);
                review.setReviewImg1(filename1);
            }
            if(file2 != null && !file2.isEmpty()) {
                System.out.println("file1");
                String filename2 =  commonService.uploadImage(file2, memIdx);
                review.setReviewImg1(filename2);
            }
            if(file3 != null && !file3.isEmpty()) {
                System.out.println("file1");
                String filename3 =  commonService.uploadImage(file3, memIdx);
                review.setReviewImg1(filename3);
            }

        }catch(IOException e){
            e.printStackTrace();
        }
        review.setReviewMemIdx(memIdx);
        review.setReviewRvIdx(rno);
        Review savedReview = memberService.reviewForm(review,rno);
        return "redirect:/mypgReviewDetail?id="+savedReview.getReviewIdx();
    }

    @GetMapping("/mypgReviewDetail")
    public String mypgReviewDetail(Model model,@RequestParam(value="id",required = false) Long id) {
        model.addAttribute("review", reviewRepository.findById(id).get());
        return "mypgReviewDetail";
    }


    @PostMapping("/reviewDelete")
    @ResponseBody
    public String reviewDelete(@RequestParam("id") Long id,HttpSession session) {
        commonService.replyDelete(id,Story.class,session);
        return "storyDetail";
    }


    @GetMapping("/mypageReservation")
    public String mypageReservation( HttpSession session, Model model) {
        Long id = ((Member)session.getAttribute("loginUser")).getMemIdx();
        model.addAttribute("reservations", listService.mypageReservation(id));
        model.addAttribute("wfSubjects",listService.reservationFarm(id));
        try {
            memberService.getMypgList(model,id);
        }catch (Exception e) {
            System.out.println("idx값이 없습니다.");

        }
//        model.addAttribute("reviews",reviewRepository.findTop5ByReviewMemIdxOrderByReviewDateDesc(memIdx));

//        model.addAttribute("wfSubjects",reservationRepository.findWfSubjectByMemIdx(id));
//        System.out.println("listService = " + listService.mypageReservation(id));
//        model.addAttribute("farm", listService.getWfSubject(rvFarmIdx));
//        List<String> farm = new ArrayList();
//        for(Reservation reservation : listService.mypageReservation(id)){
//            farm.add(listService.farm(reservation.getRvFarmIdx()).getWfSubject());
//        }
//        model.addAttribute("farm", farm);
        return "mypageReservation";
    }
}