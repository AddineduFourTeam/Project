package com.farm.service;

import com.farm.domain.Member;
import com.farm.domain.Story;
import com.farm.repository.StoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

@Service
public class StoryService {
    @Autowired
    StoryRepository storyRepository;

    @Autowired
    CommonService commonService;

    @Autowired
    MemberService memberService;

    //story detail 불러오기


    public Optional<Story> storydetail(Long sno) {
        return storyRepository.findById(sno);
    }

    public void storyForm(Story story, MultipartFile file1 , MultipartFile file2 , MultipartFile file3) throws Exception {
        story.setStoryImg1(file1.getBytes());
        story.setStoryImg2(file2.getBytes());
        story.setStoryImg3(file3.getBytes());
        storyRepository.save(story);
    }

    public byte[] getImg(Long id , int imgNum) {
        if(imgNum == 1) {
            return storyRepository.findById(id).get().getStoryImg1();
        }
        else if(imgNum == 2) {
            return storyRepository.findById(id).get().getStoryImg2();
        }
        else if(imgNum == 3) {
            return storyRepository.findById(id).get().getStoryImg3();
        }else {
            return null;
        }

    }
    public void listAll(Model model) {
        List<Story> content = storyRepository.findStory();
        model.addAttribute("list", content);
    }

    /* 마이페이지 story 가져오기 */
    public String getStoryMemId(String memid) {
        Member member = memberService.findByMemid(memid);
        return member.getMemid();
    }

    public void storyDelete(Long id) {
        storyRepository.deleteById(id);
    }




   /* public List<byte[]> getImg(Long id) {
        List<byte[]> imgList = storyRepository.findById(id).stream()
                .flatMap(story -> Stream.of(story.getStoryImg1(), story.getStoryImg2(), story.getStoryImg3()))
                .filter(Objects::nonNull)  // 필요에 따라 null 체크를 추가할 수 있습니다.
                .toList();

        //System.out.println("imgList = " + imgList);
        //return storyRepository.findById(id).get().getStoryImg1();
        return imgList;
    }*/
}
