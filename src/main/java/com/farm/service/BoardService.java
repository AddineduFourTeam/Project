package com.farm.service;

import com.farm.domain.Board;
import com.farm.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BoardService {
    @Autowired
    BoardRepository boardRepository;

    public Optional<Board> detail(Long bno) {
        return boardRepository.findById(bno);
    }
}
