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
    @GetMapping("/image/{id}/{num}")
    public ResponseEntity<byte[]> getImage(@PathVariable Long id , @PathVariable int num) {
        // 데이터베이스에서 이미지 BLOB 데이터를 찾는 로직
        byte[] imageData = storyService.getImg(id, num); // BLOB 데이터를 byte[]로 변환
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_JPEG); // 적절한 Content-Type 설정
        //System.out.println(new ResponseEntity<>(imageData, headers, HttpStatus.OK));
        return new ResponseEntity<>(imageData, headers, HttpStatus.OK);
    }

    @GetMapping("/storySearch")
    public String storySearch(@RequestParam(value="page", defaultValue="1") int page , @RequestParam(value="type") String type , @RequestParam(value="keyword") String keyword , Model model) {
        commonService.searchList(page ,type , keyword , model, Story.class);
        return "story";
    }

    @GetMapping("/storyDetail")
    public String storydetail(@RequestParam(value="id") Long sno, Model model) {
        model.addAttribute("story", storyService.storydetail(sno).get());
        return "storyDetail";
    }

    @GetMapping("/storyWrite")
    public String storywrite(Model model) {
        //model.addAttribute("board", storyService.storydetail(sno).get());
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

//    @PostMapping("/reply")
//    public String reply(@RequestParam("id") Long id) {
//        commonService.reply(id, StoryReply.class);
//        return "storyDetail";
//    }

}
