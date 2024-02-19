package com.farm.controller;

import com.farm.domain.Member;
import com.farm.service.MemberService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@Controller
@SessionAttributes({"loginUser"})
public class MemberController {
    @Autowired
    MemberService memberService;

    @Autowired
    PasswordEncoder pEncoder;


    @GetMapping("/join")
    public String memInsertForm(){
        return "/join";
    }

    @GetMapping("/idCheck")
    @ResponseBody
    public boolean checkId(@RequestParam("id") String memid){

        return memberService.idCheck(memid);
    }

    @PostMapping("/memInsert")
    public String memInsert(Member member, Model model,
                            @RequestParam("file") MultipartFile file,
                            RedirectAttributes redirectAttributes) throws Exception {

        member.setPass(pEncoder.encode(member.getPass()));

        Long memIdx = member.getMemIdx();
        if(!file.isEmpty()){
          String filename =  memberService.uploadImage(file, memIdx);
          member.setMemImg(filename);
        }

        memberService.memInsert(member, file);

        redirectAttributes.addFlashAttribute("insertComplete", true);

        return "redirect:/login";
    }

    @GetMapping("/login")
    public String loginForm(){
        return "login";
    }

    @PostMapping("/loginForm")
    public String login(Member member, Model model, HttpSession session){
        //System.out.println("id : " + member.getMemid() );
        Member loginUser = memberService.login(member.getMemid());
        //System.out.println("loginUser = " + loginUser);

        if(loginUser != null){
            // 탈퇴한 사용자 체크
            if(loginUser.getIsOut().equals("Y")){
                model.addAttribute("isOutUser",true);
                return "login";

            // 탈퇴하지 않은 사용자 비밀번호 일치 확인    
            }else if(pEncoder.matches(member.getPass(),loginUser.getPass())){
                model.addAttribute("loginUser",loginUser);
                session.setAttribute("loginUser",loginUser);
                return "redirect:/";
                
            // 탈퇴하지 않은 사용자 비밀번호 일치하지 않는 경우    
            }else{
                model.addAttribute("loginFail", true);
                return "login";

            }
        }else{
            // 사용자 정보가 없는 경우
            model.addAttribute("loginFail", true);
            return "login";
        }
    }

    @GetMapping("/logout")
    public String logout(SessionStatus status){
        if(!status.isComplete()){
            status.setComplete();
        }
        return "redirect:/";
    }

    @GetMapping("/forgotPass")
    public String forgotPass(){
        return "forgotPassForm";
    }

    @PostMapping("/forgotPassCheck")
    @ResponseBody
    public Map<String, Object> forgotPassCheck(@ModelAttribute("infoCheck") Member infoCheck) {
        Map<String, Object> response = new HashMap<>();

        Optional<Member> opMember = memberService.getMemberById(infoCheck.getMemid());

        if (opMember.isPresent()) {
            Member dbMember = opMember.get();
            if (infoCheck.getMemid().equals(dbMember.getMemid()) &&
                    infoCheck.getEmail().equals(dbMember.getEmail()) &&
                    infoCheck.getPhone().equals(dbMember.getPhone())) {
                response.put("ChangePass", true);
            } else {
                response.put("ChangePass", false);
            }
        } else {
            response.put("ChangePass", false);
        }

        return response;
    }

    @PostMapping("/forgotPass")
    public String forgotPass(@RequestParam("memid") String memid,
                             @RequestParam("pass") String newPass){
        String pass = pEncoder.encode(newPass);
        memberService.updatePass(memid,pass);

        return "completePass"; // 비밀번호 변경완료 페이지
    }

}
