package com.farm.service;

import com.farm.domain.Board;
import com.farm.domain.Farm;
import com.farm.domain.Story;
import com.farm.repository.BoardRepository;
import com.farm.repository.FarmRepository;
import com.farm.repository.StoryRepository;
import jakarta.persistence.Id;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.ObjectInputStream;
import java.nio.ByteBuffer;
import java.util.*;

import java.net.ContentHandler;
import java.util.List;

@Service
public class ListService {


    @Autowired
    FarmRepository farmRepository;

    public Page<Farm> findAll(Pageable pageable) {
        return farmRepository.findAll(pageable);
    }

    public Page<Farm> search(Pageable pageable, String keyword, String select) {
        if(select.equals("location")){
            return farmRepository.findByWfAddrContaining(keyword,pageable);
        }else if(select.equals("title")){
            return farmRepository.findByWfSubjectContaining(keyword, pageable);
        }else if(select.equals("theme")){
            return farmRepository.findByWfThemeContaining(keyword, pageable);
        }else{
            return null;
        }
    }
    public Map<String, Object> getPagingData(Page<Farm> page, int currentPage, int pagePerBlock){
        Map<String, Object> pagingData =  new HashMap<>();

        // 페이지네이션 관련 변수 계산
        int totalPages = page.getTotalPages(); // 전체 페이지 수
        int pageNumber = page.getNumber() + 1; // 현재 페이지 번호

        // 페이지네이션 시작 및 끝 페이지 계산
        int startPage = ((currentPage - 1) / pagePerBlock) * pagePerBlock + 1;
        int endPage = Math.min(startPage + pagePerBlock - 1, totalPages);

        // 뷰에 데이터 전달
        pagingData.put("nowPage", currentPage - 1);
        pagingData.put("totalPages", totalPages);
        pagingData.put("pageNumber", pageNumber);
        pagingData.put("startPage", startPage);
        pagingData.put("endPage", endPage);
        pagingData.put("farms", page.getContent());
        return pagingData;
    }

    public Object detail(Long id) {
        System.out.println(farmRepository.findById(id).get());
        return farmRepository.findById(id).get();
    }
}

