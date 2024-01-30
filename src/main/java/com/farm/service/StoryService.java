package com.farm.service;

import com.farm.domain.Board;
import com.farm.domain.Story;
import com.farm.repository.BoardRepository;
import com.farm.repository.StoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.Dictionary;
import java.util.Optional;

@Service
public class StoryService {
    @Autowired
    StoryRepository storyRepository;

    public Optional<Story> storydetail(Long sno) {
        return storyRepository.findById(sno);
    }

    public void storyForm(Story story, MultipartFile file) throws Exception {
        story.setStoryImg1(file.getBytes());
        storyRepository.save(story);
    }

    public byte[] getImg(Long id) {
        return storyRepository.findById(id).get().getStoryImg1();
    }
}
