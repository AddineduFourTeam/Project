package com.farm.controller;

import com.farm.domain.Board;
import com.farm.domain.Member;
import com.farm.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class BoardController {
    @Autowired
    BoardService boardService;

    //private Member loginUser;

    @GetMapping("/board")
    public String boardList(@RequestParam(value="nowPage", defaultValue="1") int page ,Model model) {
        Sort sort = Sort.by(Sort.Order.desc("name"));
        int pageSize = 5;
        int pageNumber = 4;

        int nPage = page - 1; // 시작페이지
        //Pageable pageable = PageRequest.ofSize(10).withPage(nPage); //ofsize(페이지당 게시물) , withPage(현재페이지)
        Pageable pageable = PageRequest.of(pageNumber, pageSize, sort);

        Page<Board> result = boardService.listAll(pageable);
        List<Board> content = result.getContent();


        long totalElements = result.getTotalElements();
        int totalPages = result.getTotalPages();
        int size = result.getSize(); // 페이지당 페이지 수
        //int pageNumber = result.getNumber() + 1; // 현재페이지
        int numberOfElements = result.getNumberOfElements(); // 현재페이지의 content개수
        System.out.println(content);

        model.addAttribute("board", content);
        model.addAttribute("totalElements", totalElements);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("size", size);
        model.addAttribute("pageNumber", pageNumber);
        model.addAttribute("numberOfElements", numberOfElements);

        return "/board";
    }

    @GetMapping("/boardSearch")
    public String board(@RequestParam("type") String type , @RequestParam("keyword") String keyword , @PageableDefault(size = 10) Pageable pageable , Model model) {
        System.out.println(type +"/"+ keyword);
        /*String name = "%"+type+"%";
        Sort sort = Sort.by(Sort.Order.desc("name"));

        int nPage = page-1; // 시작페이지
        Pageable pageable = PageRequest.ofSize(10).withPage(nPage).withSort(sort); //ofsize(페이지당 게시물) , withPage(현재페이지)
        Page<Board> result = boardService.listAll(pageable);
        if(type.equals("") || keyword.equals("") ) {
            result = boardService.listAll(pageable);
            //model.addAttribute("board",boardService.listAll());
        }else {
            result = boardService.list(name, keyword, pageable);
        }
        List<Board> content = result.getContent();
        long totalElements = result.getTotalElements();
        int totalPages = result.getTotalPages();
        int size = result.getSize(); // 페이지당 페이지 수
        int pageNumber = result.getNumber(); // 현재페이지
        int numberOfElements = result.getNumberOfElements(); // 현재페이지의 content개수

        model.addAttribute("board", content);
        model.addAttribute("totalElements", totalElements);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("size", size);
        model.addAttribute("pageNumber", pageNumber);
        model.addAttribute("numberOfElements", numberOfElements);*/
        Page<Board> boards = boardService.list(type,keyword,pageable);
        model.addAttribute("boards", boards);

        return "/board?type="+type+"&keyword="+keyword;
    }
}
