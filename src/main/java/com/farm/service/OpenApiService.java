package com.farm.service;

import com.farm.domain.Farm;
import com.farm.repository.FarmRepository;
import jakarta.transaction.Transactional;
import lombok.extern.slf4j.Slf4j;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

//import gson.JsonObject;

@Service
@Slf4j
public class OpenApiService {
    @Autowired
    private final OpenApiExplorer openApiExplorer;

    @Autowired
    private final FarmRepository farmRepository;

    public OpenApiService(OpenApiExplorer openApiExplorer, FarmRepository farmRepository) {
        this.openApiExplorer = openApiExplorer;
        this.farmRepository = farmRepository;
    }


    @Transactional

    public List<Farm> getFarmService() throws IOException { // 공휴일 가져오기
        log.info("api 구동시작");
        // 샘플코드를 활용해서 xml -> jsonObject로 변환
        List<Farm> farmList = new ArrayList<>();
        for (int cntntsNo = 233558 ; cntntsNo <= 235558; cntntsNo++) {
            System.out.println(cntntsNo);
            JSONObject jsonData = openApiExplorer.getFarmExplorer(String.valueOf(cntntsNo));
            JSONObject body;

            //System.out.println("jsonData = " + jsonData);
            try {
                JSONObject header = jsonData.getJSONObject("response").getJSONObject("header");
                body = jsonData.getJSONObject("response").getJSONObject("body");
                JSONObject requestParameter = header.getJSONObject("requestParameter");
                JSONObject item = body.getJSONObject("item");
                int wf_idx = requestParameter.getInt("cntntsNo");
                String wf_subject = item.getString("cntntsSj");
                String locplc = item.getString("locplc");
                String wf_theme = item.getString("thema");
                int wf_Year = item.getInt("appnYear");
                String wf_url = item.getString("url");
                String wf_tel = item.getString("telno");
                String wf_crtfcYearInfo = item.getString("crtfcYearInfo");
                String wf_content = item.getString("cn");
                String wf_imgUrl1 = item.getString("imgUrl1");
                String wf_imgUrl2 = item.getString("imgUrl2");
                String wf_imgUrl3 = item.getString("imgUrl3");
                Farm farm = Farm.builder()
                        .wfIdx(wf_idx)
                        .wfAddr(locplc)
                        .wfTheme(wf_theme)
                        .wfSubject(wf_subject)
                        .wfYear(wf_Year)
                        .wfUrl(wf_url)
                        .wfTel(wf_tel)
                        .wfCrtfcYearInfo(wf_crtfcYearInfo)
                        .wfContent(wf_content)
                        .wfImgUrl1(wf_imgUrl1)
                        .wfImgUrl2(wf_imgUrl2)
                        .wfImgUrl3(wf_imgUrl3)
                        .build();
                farmList.add(farm);

                //System.out.println("farmList = " + farmList);

            }catch(Exception wrongValueFormatException){
                //System.out.println("farmList = " + farmList);
                continue;
            }

        }
        log.info("api 구동완료");

        if (!farmList.isEmpty()) {
            farmRepository.saveAll(farmList);
            return farmList;
        } else {
            return farmList;
        }


    }
}

