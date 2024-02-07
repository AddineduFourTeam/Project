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

    @RequestMapping("/")
    public String root() throws Exception {
        return "index";
    }

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
    public String memInsert(Member member, Model model, @RequestParam("file") MultipartFile file) throws Exception {

        member.setPass(pEncoder.encode(member.getPass()));

        if(!file.isEmpty()){
          String filename =  memberService.uploadImage(file, member.getMemIdx());
          member.setMemImg(filename);
        }

        memberService.memInsert(member, file);
        return "redirect:/";
    }
    /* 실패
    @PostMapping("/memInsert")
    public String memInsert(@Valid Member member, BindingResult bindingResult, Errors errors, Model model, @RequestParam("file") MultipartFile file) throws Exception {
        if(errors.hasErrors()){
            //회원가입 실패시 입력 데이터 값 유지
            model.addAttribute("member",member);

            // 유효성 통과 못한 필드와 메시지를 핸들링
            Map<String, String> validatorResult = memberService.validateHandling(errors);
            for(String key : validatorResult.keySet()){
                model.addAttribute(key,validatorResult.get(key));
            }
            // 회원가입 페이지로 다시 리턴
            return "/join";
        }

        member.setPass(pEncoder.encode(member.getPass()));

        if(!file.isEmpty()){
            String filename =  memberService.uploadImage(file, member.getMemIdx());
            member.setMemImg(filename);
        }

        memberService.memInsert(member, file);

        return "redirect:/";
    }
    */

    @GetMapping("/login")
    public String loginForm(){
        return "login_2";
    }

    @PostMapping("/loginForm")
    public String login(Member member, Model model, HttpSession session){
        //System.out.println("id : " + member.getMemid() );
        Member loginUser = memberService.login(member.getMemid());
        //System.out.println("loginUser = " + loginUser);
        if(loginUser != null && pEncoder.matches(member.getPass(),loginUser.getPass())){
            model.addAttribute("loginUser",loginUser);
            session.setAttribute("loginUser",loginUser);

            return "redirect:/";
        }else{
            model.addAttribute("loginFail", true); // 로그인 실패를 했으니 "loginfail"에 참 넣기
            return "login_2";
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

    /* 원본 - 없음ajax
    @PostMapping("/forgotPassCheck")
    public String forgotPassCheck(@ModelAttribute("infoCheck") Member infoCheck,Model model){

        Optional<Member> opMember = memberService.getMemberById(infoCheck.getMemid());

        if(opMember.isPresent()){
            Member dbMember = opMember.get();
            if(infoCheck.getMemid().equals(dbMember.getMemid()) &&
                    infoCheck.getEmail().equals(dbMember.getEmail()) &&
                    infoCheck.getPhone().equals(dbMember.getPhone())){
                model.addAttribute("ChangePass",true);
                return "forgotPassForm";

            }else{
                model.addAttribute("ChangePass",false);

            }
        }else{
            model.addAttribute("ChangePass",false);

        }
        return "forgotPassForm";

    }*/
    @PostMapping("/forgotPassCheck")
    @ResponseBody
    public Map<String, Object> forgotPassCheck(@ModelAttribute("infoCheck") Member infoCheck, Model model) {
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

    @PostMapping("/updatePass")
    public String updatePass(@RequestParam("memid") String memid,
                          @RequestParam("pass") String newPass){
        String pass = pEncoder.encode(newPass);
        memberService.updatePass(memid,pass);

        return "redirect:/"; // 비밀번호 변경완료 페이지
    }

    @GetMapping("/myPage")
    public String myInfoForm(){
        //model.addAttribute("memid",memid);
        return "myPage";
    }

    @PostMapping("/updateMyInfo")
    public String updateMyInfo(){

        return "";
    }
}
