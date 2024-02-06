package com.farm.controller;

import com.farm.domain.Farm;
import com.farm.domain.Member;
import com.farm.domain.Story;
import com.farm.service.BoardService;
import com.farm.service.ListService;
import com.farm.service.StoryService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
@RestController
public class FarmListController {
    @Autowired
    StoryService storyService;

    @Autowired
    ListService listService;

    @Autowired
    BoardService boardService;




    @PostMapping("/storyLocal")
    public ResponseEntity<?> storyLocal(@RequestParam(value="local") String local) {
        //List<Farm> localList = listService.localList(local);
        return ResponseEntity.ok(listService.localList(local));
    }
}
