package com.farm.service;

import com.farm.repository.StoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StoryService {
    @Autowired
    StoryRepository storyRepository;
}
