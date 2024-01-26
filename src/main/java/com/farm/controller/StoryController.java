package com.farm.controller;

import com.farm.domain.Story;
import com.farm.service.ListService;
import com.farm.service.StoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class StoryController {
    @Autowired
    private StoryService storyService;

    @Autowired
    private ListService listService;

    @GetMapping("/story")
    public String story(@RequestParam(value="page", defaultValue="1") int page , Model model) {
        listService.list(page,model,Story.class);
        return "story";
    }
}
