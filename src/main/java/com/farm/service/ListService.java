package com.farm.service;

import com.farm.domain.Board;
import com.farm.domain.Farm;
import com.farm.domain.Story;
import com.farm.repository.BoardRepository;
import com.farm.repository.FarmRepository;
import com.farm.repository.StoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

@Service
public class ListService {

    @Autowired
    FarmRepository farmRepository;

    @Autowired
    BoardRepository boardRepository;

    @Autowired
    StoryRepository storyRepository;

    //전체 값 리스트 출력
    public void list(int page , Model model , Class<?> objClass) {
        //Sort sort = Sort.by(Sort.Order.desc("name"));

        int nPage = page - 1; // 시작페이지
        Pageable pageable = PageRequest.ofSize(10).withPage(nPage);
        //Pageable pageable = PageRequest.of(pageNumber, pageSize);
        Page<?> result = null;
        if(objClass.equals(Farm.class)) {
            result = farmRepository.findAll(pageable);
        }
        if(objClass.equals(Board.class)) {
            result = boardRepository.findAll(pageable);
        }
        if(objClass.equals(Story.class)) {
            result = storyRepository.findAll(pageable);
        }

        List<?> content = result.getContent();

        int totalPages = result.getTotalPages(); // 전제 페이지 수
        int pageNumber = result.getNumber() + 1; // 현재페이지 0부터 시작

        int pageBlock = 5; //블럭의 수 1, 2, 3, 4, 5
        int startBlockPage = ((pageNumber-1)/pageBlock)*pageBlock +1 ; //현재 페이지가 7이라면 1*5+1=6
        int endBlockPage = startBlockPage+pageBlock-1; //6+5-1=10. 6,7,8,9,10해서 10.
        endBlockPage = totalPages<endBlockPage? totalPages:endBlockPage;

        model.addAttribute("list", content);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("pageNumber", pageNumber);
        model.addAttribute("startBlockPage", startBlockPage);
        model.addAttribute("endBlockPage", endBlockPage);

    }
    // 검색한 값 리스트 출력

    public void Search(int page, String type, String search, Model model, Class<?> objClass) {
        //Sort sort = Sort.by(Sort.Order.desc("name"));

        int nPage = page - 1; // 시작페이지
        Pageable pageable = PageRequest.ofSize(10).withPage(nPage);
        Page<?> result = null;
        
        //농장 리스트 검색
        if(objClass.equals(Farm.class)) {
            if(type.equals("location")) {
                result = farmRepository.findByWfAddrContaining(search, pageable);
            }
            if(type.equals("title")) {
                result = farmRepository.findByWfSubjectContaining(search, pageable);
            }
        }

        //공지사항 리스트 검색
        if(objClass.equals(Board.class)) {
            if(type.equals("title")) {
                result = boardRepository.findByBoardSubjectContaining(search, pageable);
            }
            if(type.equals("content")) {
                result = boardRepository.findByBoardContentContaining(search, pageable);
            }
        }

        List<?> content = result.getContent();

        int totalPages = result.getTotalPages(); // 전제 페이지 수
        int pageNumber = result.getNumber() + 1; // 현재페이지 0부터 시작

        int pageBlock = 5; //블럭의 수 1, 2, 3, 4, 5
        int startBlockPage = ((pageNumber-1)/pageBlock)*pageBlock +1 ; //현재 페이지가 7이라면 1*5+1=6
        int endBlockPage = startBlockPage+pageBlock-1; //6+5-1=10. 6,7,8,9,10해서 10.
        endBlockPage = totalPages<endBlockPage? totalPages:endBlockPage;

        model.addAttribute("list", content);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("pageNumber", pageNumber);
        model.addAttribute("startBlockPage", startBlockPage);
        model.addAttribute("endBlockPage", endBlockPage);
    }
}
