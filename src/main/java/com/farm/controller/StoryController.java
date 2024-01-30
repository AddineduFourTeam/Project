package com.farm.controller;

import com.farm.domain.Member;
import com.farm.domain.Story;
import com.farm.service.ListService;
import com.farm.service.StoryService;
import jakarta.persistence.EntityManager;
import jakarta.servlet.http.HttpSession;
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

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Blob;

@Controller
public class StoryController {
    @Autowired
    StoryService storyService;

    @Autowired
    ListService listService;

    private Member loginUser;


    @GetMapping("/story")
    public String storyList(@RequestParam(value="page", defaultValue="1") int page , Model model) {
        listService.list(page, model, Story.class);
        return "story";
    }
    @GetMapping("/image/{id}")
    public ResponseEntity<byte[]> getImage(@PathVariable Long id) {
        // 데이터베이스에서 이미지 BLOB 데이터를 찾는 로직
        byte[] imageData = storyService.getImg(id); // BLOB 데이터를 byte[]로 변환

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_JPEG); // 적절한 Content-Type 설정

        return new ResponseEntity<>(imageData, headers, HttpStatus.OK);
    }



    @GetMapping("/storySearch")
    public String storySearch(@RequestParam(value="page", defaultValue="1") int page , @RequestParam(value="type") String type , @RequestParam(value="keyword") String keyword , Model model) {
        listService.Search(page ,type , keyword , model, Story.class);
        return "story";
    }

    @GetMapping("/storyDetail")
    public String storydetail(@RequestParam(value="sno") Long sno, Model model) {
        model.addAttribute("board", storyService.storydetail(sno).get());
        return "storyDetail";
    }

    @GetMapping("/storyWrite")
    public String storywrite() {
        //model.addAttribute("board", storyService.storydetail(sno).get());
        return "storyWrite";
    }
    @PostMapping("/storyForm")
    public String storyForm(Story story , HttpSession session , @RequestParam("file") MultipartFile file) {
        //story.setMember((String)session.getAttribute("id"));
        story.setStoryMemIdx(((Member)session.getAttribute("loginUser")).getMemIdx());
        story.setStoryMemName(((Member)session.getAttribute("loginUser")).getName());
        //story.setStoryImg1(story.getStoryImg1());
        try {
            storyService.storyForm(story,file);
        }catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/story";
    }
}
