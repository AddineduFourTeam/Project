package com.farm.controller;

import com.farm.domain.Member;
import com.farm.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

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

    @GetMapping("/memInsertForm")
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
        /*Model model, MultipartFile file) throws Exception 추가함*/
        member.setPass(pEncoder.encode(member.getPass()));

        if(!file.isEmpty()){
            memberService.uploadImage(file, member.getMemIdx());
            member.setMemImg("/uploads/"+file.getOriginalFilename());
        }

        memberService.memInsert(member, file);/*file 추가*/
        return "redirect:/";
    }

    @GetMapping("/loginForm")
    public String loginForm(){
        return "login";
    }

    @PostMapping("/login")
    public String login(Member member, Model model){
        System.out.println("id : " + member.getMemid() );
        Member loginUser = memberService.login(member.getMemid());
      // System.out.println("id: " +loginUser.getMemid());
        if(loginUser != null && pEncoder.matches(member.getPass(),loginUser.getPass())){
                model.addAttribute("loginUser",loginUser);
        }

        return "redirect:/";
    }

    @GetMapping("/logout")
    public String logout(SessionStatus status){
        if(!status.isComplete()){
            status.setComplete();
        }
        return "redirect:/";
    }
}
