package com.farm.service;

import com.farm.domain.*;
import com.farm.dto.MemInfoDto;
import com.farm.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.Collections;
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
            List<MemInfoDto> arr = new ArrayList<>();

            model.addAttribute("Replylist", content);
            model.addAttribute("ReplySize", content.size());
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("pageNumber", pageNumber);
            model.addAttribute("startBlockPage", startBlockPage);
            model.addAttribute("endBlockPage", endBlockPage);
            for(int i = 0 ; i < content.size() ; i++) {
                StoryReply sr = (StoryReply) content.get(i);
                Member member = memberRepository.findById(sr.getSrMemIdx()).orElseGet(() -> null);
                MemInfoDto memInfoDto = new MemInfoDto(sr, member);
                arr.add(memInfoDto);
            }
            model.addAttribute("memInfoList", arr);

        }else {
            model.addAttribute("list", content);
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("pageNumber", pageNumber);
            model.addAttribute("startBlockPage", startBlockPage);
            model.addAttribute("endBlockPage", endBlockPage);
        }

    }
    //댓글,후기 저장
    public Object replySave(Object object) {
        String className = object.getClass().getSimpleName();
        if (className.equals("StoryReply")) {
            StoryReply sr = (StoryReply)object;
            Member member = memberRepository.findById(sr.getSrMemIdx()).orElseGet(() -> null);
            MemInfoDto memInfoDto = new MemInfoDto(sr,member);
            memInfoDto.setStoryReply(storyReplyRepository.save(sr));

            System.out.println(memInfoDto);
            return memInfoDto;
        }else {
            return null;
        }
    }

    //댓글,후기 리스트
    public void replyDetail(Long id,int page , Model model,Class<?> objClass) {
        int nPage = page - 1; // 시작페이지
        Sort sort = null;
        if(objClass.equals(StoryReply.class)) {
            sort = Sort.by(
                    Sort.Order.desc("srLike"),
                    Sort.Order.desc("srDate"),
                    Sort.Order.desc("srIdx")
            );
        }else {
            sort = Sort.by(Sort.Order.desc("srLike"));
        }
        Pageable pageable = PageRequest.ofSize(10).withPage(nPage).withSort(sort);
        Page<?> result = null;
        if(objClass.equals(StoryReply.class)) {
           result = storyReplyRepository.findBySrStoryIdx(id, pageable);

            listPage(model , result,objClass);
            /*Member member = memberRepository.findById(sr.getSrMemIdx()).orElseGet(() -> null);
            MemInfoDto memInfoDto = new MemInfoDto(sr, member);
            System.out.println("memInfoDto = " + memInfoDto); */

            /*List<?> content = result.getContent();
            int totalPages = result.getTotalPages(); // 전제 페이지 수
            int pageNumber = result.getNumber() + 1; // 현재페이지 0부터 시작

            int pageBlock = 5; //블럭의 수 1, 2, 3, 4, 5
            int startBlockPage = ((pageNumber-1)/pageBlock)*pageBlock +1 ; //현재 페이지가 7이라면 1*5+1=6
            int endBlockPage = startBlockPage+pageBlock-1; //6+5-1=10. 6,7,8,9,10해서 10.
            endBlockPage = totalPages<endBlockPage? totalPages:endBlockPage;

            model.addAttribute("Replylist", content);
            model.addAttribute("ReplySize", content.size());
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("pageNumber", pageNumber);
            model.addAttribute("startBlockPage", startBlockPage);
            model.addAttribute("endBlockPage", endBlockPage);*/


        }

    }

    public int likeUp(Long id) {
        StoryReply sr = storyReplyRepository.findById(id).get();
        int likeNum = sr.getSrLike();
        likeNum++;
        sr.setSrLike(likeNum);
        storyReplyRepository.save(sr);
        return likeNum;
    }
    public int likeDown(Long id) {
        StoryReply sr = storyReplyRepository.findById(id).get();
        int likeNum = sr.getSrLike();
        likeNum--;
        sr.setSrLike(likeNum);
        storyReplyRepository.save(sr);
        return likeNum;
    }

    public String replyUpdate(Long id,String txt) {
        StoryReply sr = storyReplyRepository.findById(id).get();
        sr.setSrContent(txt);
        storyReplyRepository.save(sr);
        return sr.getSrContent();
    }

    public List<StoryReply> storyReplyList(Long id,Long srIdx, Model model) {
        return storyReplyRepository.findBySrStoryIdxAndSrDepthAndSrReplyIdx(id, 2, srIdx);
        //return srList;
    }

    public void replyDelete(Long id) {
        storyReplyRepository.deleteById(id);
    }
}

