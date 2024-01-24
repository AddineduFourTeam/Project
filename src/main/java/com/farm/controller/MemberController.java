package com.farm.controller;

import com.farm.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MemberController {
    @Autowired
    MemberService memberService;

    @RequestMapping("/")
    public String root() throws Exception {
        return "index";
    }

    @GetMapping("/insert")
    public String insert( Model model) {
        memberService.insert();
        return "insert";
    }

    @GetMapping("/select")
    public String select(@RequestParam("idx") String idx , @RequestParam("input") String keyword ,Model model) {
        String input = "%"+keyword+"%";
        //System.out.println(input);
        model.addAttribute("members", memberService.select(idx,input));
        //System.out.println(memberService.select(idx,input));
        return "select";
    }
}
