package com.farm.service;

import com.farm.domain.Board;
import com.farm.domain.Farm;
import com.farm.domain.Story;
import com.farm.domain.StoryReply;
import com.farm.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Optional;

@Service
public class CommonService {

    @Autowired
    FarmRepository farmRepository;
    @Autowired
    BoardRepository boardRepository;
    @Autowired
    StoryRepository storyRepository;
    @Autowired
    MemberRepository memberRepository;
    @Autowired
    StoryReplyRepository storyReplyRepository;
    //전체 값 리스트 출력

    //list 뿌리기
    public void listAll(int page , Model model , Class<?> objClass) {
        int nPage = page - 1; // 시작페이지
        Pageable pageable = PageRequest.ofSize(10).withPage(nPage);
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

        listPage(model , result,objClass);

    }


    // 검색한 값 리스트 출력
    public void searchList(int page, String type, String search, Model model, Class<?> objClass) {
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
        //내 스토리 리스트 검색
        if(objClass.equals(Story.class)) {
            if(type.equals("title")) {
                result = storyRepository.findByStorySubjectContaining(search, pageable);
            }
            if(type.equals("content")) {
                result = storyRepository.findByStoryContentContaining(search, pageable);
            }
            if(type.equals("user")) {
                //System.out.println("user");
                result = storyRepository.findByStoryMemNameContaining(search, pageable);
            }
        }


        listPage(model , result, objClass);
    }


    //model에 result값 담기
    private void listPage(Model model , Page<?> result, Class<?> objClass) {
        List<?> content = result.getContent();

        int totalPages = result.getTotalPages(); // 전제 페이지 수
        int pageNumber = result.getNumber() + 1; // 현재페이지 0부터 시작

        int pageBlock = 5; //블럭의 수 1, 2, 3, 4, 5
        int startBlockPage = ((pageNumber-1)/pageBlock)*pageBlock +1 ; //현재 페이지가 7이라면 1*5+1=6
        int endBlockPage = startBlockPage+pageBlock-1; //6+5-1=10. 6,7,8,9,10해서 10.
        endBlockPage = totalPages<endBlockPage? totalPages:endBlockPage;

        if(objClass.equals(StoryReply.class)) {
            model.addAttribute("Replylist", content);
            model.addAttribute("ReplyTotalPages", totalPages);
            model.addAttribute("ReplyPageNumber", pageNumber);
            model.addAttribute("ReplyStartBlockPage", startBlockPage);
            model.addAttribute("ReplyEndBlockPage", endBlockPage);
        }else {
            model.addAttribute("list", content);
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("pageNumber", pageNumber);
            model.addAttribute("startBlockPage", startBlockPage);
            model.addAttribute("endBlockPage", endBlockPage);
        }

    }

    //댓글,후기 저장
    public void replySave(Object object) {
        if(object.getClass().equals(StoryReply.class)) {
            storyReplyRepository.save((StoryReply)object);
        }
    }

    //댓글,후기 리스트
    public void replyDetail(Long id,int page , Model model,Class<?> objClass) {
        int nPage = page - 1; // 시작페이지
        Pageable pageable = PageRequest.ofSize(20).withPage(nPage);
        Page<?> result = null;
        if(objClass.equals(StoryReply.class)) {
            result = storyReplyRepository.findBySrReplyIdx(id,pageable);
        }

        listPage(model , result, objClass);
    }
}

