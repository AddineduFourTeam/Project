package com.farm.controller;

import com.farm.domain.Member;
import com.farm.domain.Story;
import com.farm.service.BoardService;
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

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@Controller
@SessionAttributes({"loginUser"})
public class HomeController {
    @Autowired
    StoryService storyService;

    @Autowired
    PasswordEncoder pEncoder;

    @RequestMapping("/")
    public String root(Model model) throws Exception {
        storyService.listAll(model);
        return "index";
    }

}
