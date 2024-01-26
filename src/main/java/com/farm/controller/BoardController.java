package com.farm.controller;

import com.farm.domain.Board;
import com.farm.domain.Farm;
import com.farm.service.BoardService;
import com.farm.service.ListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardController {
    @Autowired
    BoardService boardService;

    @Autowired
    ListService listService;

    //private Member loginUser;

    @GetMapping("/board")
    public String list(@RequestParam(value="page", defaultValue="1") int page , Model model) {
        listService.list(page, model, Board.class);
        return "board";
    }

    @GetMapping("/search")
    public String search(@RequestParam(value="page", defaultValue="1") int page , @RequestParam(value="type") String type , @RequestParam(value="keyword") String keyword , Model model) {
        listService.Search(page ,type , keyword , model, Board.class);
        return "board";
    }

    @GetMapping("/boardDetail")
    public String detail(@RequestParam(value="bno") Long bno, Model model) {
        model.addAttribute("board", boardService.detail(bno).get());
        return "boardDetail";
    }
}
