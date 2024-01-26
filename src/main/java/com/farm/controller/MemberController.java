package com.farm.controller;

import com.farm.domain.Member;
import com.farm.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

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

    @PostMapping("/memInsert")
    public String memInsert(Member member) {
        member.setPass(pEncoder.encode(member.getPass()));
        memberService.memInsert(member);
        return "redirect:/";
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
