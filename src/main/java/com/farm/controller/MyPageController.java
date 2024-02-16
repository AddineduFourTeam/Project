package com.farm.controller;


import com.farm.domain.Member;
<<<<<<< HEAD
import com.farm.domain.Story;
import com.farm.service.CommonService;
=======
>>>>>>> origin/esj
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

import javax.sql.CommonDataSource;
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

    @GetMapping("/myPage")
    public String myInfoForm(HttpSession session, Model model){
        System.out.println("로그인유저:"+session.getAttribute("loginUser"));
        Long idx = ((Member)session.getAttribute("loginUser")).getMemIdx();

        /*List<Board> recentBoards = boardService.getRecentBoards();
        model.addAttribute("boards",recentBoards);*/

        /*List<Reservation> recentResvs = reservationService.getRecentReservs();
        model.addAttribute("resvs",recentResvs);*/

        /*
        이건 나중에 if문 추가할것
        if(memid != null) {

            List<Story> recentStories = storyService.getRecentStories(memid);
            model.addAttribute("stories", recentStories);

            return "myPage";
        }else{
            return "myPage";
//            return "redirect:/login";
        }*/

        //String storyMemId = storyService.getStoryMemId(memid);
        //List<Story> recentStories = storyService.getRecentStories(storyMemId,memid);
        try {
            memberService.getMypgList(model,idx);
        }catch (Exception e) {
            System.out.println("idx값이 없습니다.");

        }

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

        if(!file.isEmpty() && file != null){
            try{
                String filename =  memberService.uploadImage(file, memIdx);
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

    @GetMapping("/mypageReservation")
    public String mypage_reservation(){
        return "mypageReservation";

    }

}