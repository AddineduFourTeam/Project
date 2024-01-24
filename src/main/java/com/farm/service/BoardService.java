package com.farm.service;

import com.farm.domain.Board;
import com.farm.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {
    @Autowired
    BoardRepository boardRepository;

    public Page<Board> list(String name, String keyword, Pageable page) {
        Page<Board> board = boardRepository.findByBoardSubjectLike(keyword, page);
        if(name.equals("board_subject")) {
            //board = boardRepository.findByBoardSubjectLike(keyword , page);
        }
        if(name.equals("board_content")){
            //board = boardRepository.findByBoardContentLike(keyword , page);
        }
        //Page<Board> members = boardRepository.findByNameLike(name, page);

        return board;
    }

    public Page<Board> listAll(Pageable page) {
        Page<Board> board = boardRepository.findAll(page);
        return board;
    }
}
