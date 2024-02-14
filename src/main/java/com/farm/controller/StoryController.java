package com.farm.controller;

import com.farm.domain.Farm;
import com.farm.domain.Member;
import com.farm.domain.Story;
import com.farm.domain.StoryReply;
import com.farm.service.BoardService;
import com.farm.service.CommonService;
import com.farm.service.ListService;
import com.farm.service.StoryService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.util.List;
@Slf4j
@Controller
public class StoryController {
    @Autowired
    StoryService storyService;

    @Autowired
    CommonService commonService;


    @GetMapping("/story")
    public String storyList(@RequestParam(value="page", defaultValue="1") int page , Model model) {
        commonService.listAll(page, model, Story.class);
        return "story";
    }


    @GetMapping("/storySearch")
    public String storySearch(@RequestParam(value="page", defaultValue="1") int page , @RequestParam(value="type") String type , @RequestParam(value="keyword") String keyword , Model model) {
        commonService.searchList(page ,type , keyword , model, Story.class);
        return "story";
    }

    @GetMapping("/storyDetail")
    public String storydetail(@RequestParam(value="id") Long id,@RequestParam(value="page", defaultValue="1") int page , Model model) {
        model.addAttribute("story", storyService.storydetail(id).get());
        commonService.replyDetail(id,page,model,StoryReply.class);
        return "storyDetail";
    }

    @GetMapping("/storyWrite")
    public String storywrite(Model model) {
        return "storyWrite";
    }
    @PostMapping("/storyForm")
    public String storyForm(Story story , HttpSession session , @RequestParam(value="file1" , required = false) MultipartFile file1 , @RequestParam(value="file2" , required = false) MultipartFile file2 , @RequestParam(value="file3" , required = false) MultipartFile file3) {
        //System.out.println("loginUser = " + loginUser);
        story.setStoryMemIdx(((Member)session.getAttribute("loginUser")).getMemIdx());
        story.setStoryMemName(((Member)session.getAttribute("loginUser")).getName());
        story.setStoryMemImg(((Member)session.getAttribute("loginUser")).getMemImg());
        story.setStoryMemId(((Member)session.getAttribute("loginUser")).getMemid());

        try {
            storyService.storyForm(story,file1,file2,file3);
        }catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/story";
    }

    /*@PostMapping("/storyReplySave")
    public String storyReplySave(StoryReply storyReply,@RequestParam("id") Long id) {
        storyReply.setSrStoryIdx(id);
        commonService.replySave(storyReply);
    }*/
}
