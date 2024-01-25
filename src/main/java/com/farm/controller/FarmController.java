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
import java.util.stream.Collectors;
import java.util.stream.IntStream;

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
        // 기본페이지 정보
        int totalPages = result.getTotalPages();
        int pageNumber = result.getNumber() + 1; // 현재페이지 0부터 시작

        // 페이지네이션 범위 계산
        int startPage = Math.max(1, pageNumber -2); // 현재 페이지를 중심으로 2개 이전 페이지부터 시작
        int endPage = Math.min(totalPages, pageNumber + 4); // startPage부터 5개의 페이지를 보장
        startPage = Math.max(1, endPage - 4); // endPage를 기준으로 5개 페이지를 보장

        // 페이지 번호 목록 생성
        List<Integer> pageNumbers = IntStream.rangeClosed(startPage, endPage)
                .boxed()
                .collect(Collectors.toList());

        int size = result.getSize(); // 페이지당 페이지 수
        int numberOfElements = result.getNumberOfElements(); // 현재페이지의 content개수

        model.addAttribute("farm", content);
        model.addAttribute("totalElements", totalElements);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("size", size);
        model.addAttribute("pageNumber", pageNumber);
        model.addAttribute("pageNumbers", pageNumbers); // 페이지 번호 목록 추가
        model.addAttribute("numberOfElements", numberOfElements);

        return "/list";
    }

}

