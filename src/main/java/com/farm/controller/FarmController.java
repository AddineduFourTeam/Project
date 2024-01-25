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

import java.util.List;

@Controller
public class FarmController {
    @Autowired
    ListService listService;

    @GetMapping("/list")
    public String list(@RequestParam(value="nowPage", defaultValue="1") int page , Model model) {
        //Sort sort = Sort.by(Sort.Order.desc("name"));
        int nPage = page - 1; // 시작페이지
        Pageable pageable = PageRequest.ofSize(10).withPage(nPage);
        Page<Farm> result = listService.listAll(pageable);
        List<Farm> content = result.getContent();

        long totalElements = result.getTotalElements();
        int totalPages = result.getTotalPages(); // 전제 페이지 수
        int size = result.getSize(); // 페이지당 페이지 수
        int pageNumber = result.getNumber() + 1; // 현재페이지 0부터 시작
        int numberOfElements = result.getNumberOfElements(); // 현재페이지의 content개수

        model.addAttribute("farm", content);
        model.addAttribute("totalElements", totalElements);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("size", size);
        model.addAttribute("pageNumber", pageNumber);
        model.addAttribute("numberOfElements", numberOfElements);

        return "/list";
    }

}

