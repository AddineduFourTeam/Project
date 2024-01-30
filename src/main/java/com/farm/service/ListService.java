package com.farm.service;

import com.farm.domain.Farm;
import com.farm.repository.FarmRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.net.ContentHandler;
import java.util.List;

@Service
public class ListService {

    @Autowired
    FarmRepository farmRepository;

    /*public Page<Farm> listAll(Pageable pageable) {
        Page<Farm> farm = farmRepository.findAll(pageable);
        return farm;
    }*/

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
}

