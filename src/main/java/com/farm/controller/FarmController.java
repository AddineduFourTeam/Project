package com.farm.controller;

import com.farm.domain.Farm;
import com.farm.service.ListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FarmController {
    private static final int PAGE_SIZE = 10;
    private static final int PAGE_PER_BLOCK = 5;

    @Autowired
    ListService listService;

    private Pageable createPageable(int page){
        return PageRequest.of(page -1, PAGE_SIZE);
    }

    @GetMapping("/list")
    public String list(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
        // 페이지 관련 처리
        Pageable pageable = createPageable(page);
        Page<Farm> result = listService.findAll(pageable);
        model.addAllAttributes(listService.getPagingData(result, page,PAGE_PER_BLOCK));
        return "list";
    }

//    @GetMapping("/listDetail")
//    public String listDetail(@RequestParam(value = "id") Long id, Model model){
//        model.addAllAttributes("listDetail", ListService.detail.get(id));
//        return "listDetail";
//    }

    @GetMapping("/ListDetail")
    public String ListDetail(@RequestParam("id") Long id) {
        return "redirect:/listDetail?id=" + id;
    }

    @GetMapping("/search")
    public String search(@RequestParam(value ="keyword") String keyword, @RequestParam("select") String select, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {
        // 페이지 관련 처리
        Pageable pageable = createPageable(page);
        Page<Farm> result = listService.search(pageable, keyword, select);
        model.addAllAttributes(listService.getPagingData(result, page,PAGE_PER_BLOCK));
        return "list";
    }
}