package com.farm.controller;

import com.farm.domain.Farm;
import com.farm.service.ListService;
import org.hibernate.cache.spi.support.AbstractReadWriteAccess;
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
    @Autowired
    ListService listService;

    @GetMapping("/list")
    public String list(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
        // 페이지 관련 처리
        int nowPage = page - 1; // 현재 페이지 번호를 0 기반 인덱스로 변환
        int pageSize = 10;
        int pagePerBlock = 5;
        Pageable pageable = PageRequest.of(nowPage, pageSize);
        Page<Farm> result = listService.findAll(pageable);

        // 페이지네이션 관련 변수 계산
        int totalPages = result.getTotalPages(); // 전체 페이지 수
        int pageNumber = result.getNumber() + 1; // 현재 페이지 번호

        // 페이지네이션 시작 및 끝 페이지 계산
        int startPage = ((page - 1) / pagePerBlock) * pagePerBlock + 1;
        int endPage = Math.min(startPage + pagePerBlock - 1, totalPages);

        // 뷰에 데이터 전달
        model.addAttribute("nowPage", nowPage);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("pageNumber", pageNumber);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("farms", result.getContent());
        return "list";
    }

    @GetMapping("/search")
    public String search(@RequestParam("keyword") String keyword, @RequestParam("select") String select, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {
        // 페이지 관련 처리
        int nowPage = page - 1; // 현재 페이지 번호를 0 기반 인덱스로 변환
        int pageSize = 10;
        int pagePerBlock = 5;
        Pageable pageable = PageRequest.of(nowPage, pageSize);
        Page<Farm> result = listService.search(pageable, keyword, select);

        // 페이지네이션 관련 변수 계산
        int totalPages = result.getTotalPages(); // 전체 페이지 수
        int pageNumber = result.getNumber() + 1; // 현재 페이지 번호

        // 페이지네이션 시작 및 끝 페이지 계산
        int startPage = ((page - 1) / pagePerBlock) * pagePerBlock + 1;
        int endPage = Math.min(startPage + pagePerBlock - 1, totalPages);

        // 뷰에 데이터 전달
        model.addAttribute("nowPage", nowPage);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("pageNumber", pageNumber);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("farms", result.getContent());
        return "list";
    }
}

