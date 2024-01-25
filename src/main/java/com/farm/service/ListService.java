package com.farm.service;

import com.farm.domain.Farm;
import com.farm.repository.FarmRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class ListService {

    @Autowired
    FarmRepository farmRepository;

    public Page<Farm> listAll(Pageable pageable) {
        Page<Farm> farm = farmRepository.findAll(pageable);
        return farm;
    }
}
