package com.farm.controller;


import com.farm.domain.Farm;
import com.farm.service.ListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FarmController {
    @Autowired
    ListService listService;

    @GetMapping("/list")
    public String list(@RequestParam(value="page", defaultValue="1") int page , Model model) {
        listService.list(page, model, Farm.class);
        return "/list";
    }



}

