package com.farm.service;

import com.farm.domain.Farm;
import com.farm.domain.OpenApiExplorer;
import com.farm.repository.FarmRepository;
import jakarta.transaction.Transactional;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.farm.other.CDataExtractor;

import com.google.gson.Gson;

//import gson.JsonObject;

@Service
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
        // 샘플코드를 활용해서 xml -> jsonObject로 변환
        List<Farm> farmList = new ArrayList<>();
        for (int cntntsNo = 229873; cntntsNo <= 244558; cntntsNo++) {
            System.out.println(cntntsNo);
            JSONObject jsonData = openApiExplorer.getFarmExplorer(String.valueOf(cntntsNo));
            JSONObject body;
            try {
                JSONObject header = jsonData.getJSONObject("response").getJSONObject("header");
                body = jsonData.getJSONObject("response").getJSONObject("body");
                JSONObject requestParameter = header.getJSONObject("requestParameter");
                JSONObject item = body.getJSONObject("item");
                int wf_idx = requestParameter.getInt("cntntsNo");
                String wf_subject = item.getString("cntntsSj");
                String locplc = item.getString("locplc");
                String wf_thema = item.getString("thema");
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
                        .wfThema(wf_thema)
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

            }catch(Exception wrongValueFormatException){
                continue;
            }

        }
        // 올해
        /*String solYear = String.valueOf(LocalDate.now().getYear());

        for (int solMonth = 1; solMonth <= 12; solMonth++) {
            // 숫자 2자리 맞춤
            String strMonth = String.valueOf(solMonth);
            while (strMonth.length() < 2) {
                strMonth = "0" + strMonth;
            }

            JSONObject jsonData = openApiExplorer.getFarmExplorer(solYear, strMonth);
            JSONObject body = jsonData.getJSONObject("response").getJSONObject("body");

            if (body.getInt("totalCount") != 0) {
                // 공휴일 값이 하나일 때는 item이 jsonObject로 받아지기 때문에 조건문 사용
                if (body.getInt("totalCount") == 1) {
                    JSONObject item = body.getJSONObject("items").getJSONObject("item");
                    if (item.getString("isFarm").equals("Y")) { // 공휴일이 맞을 경우
                        String farmDate = String.valueOf(item.getInt("locdate"));
                        if (!farmRepository.existsByFarmDate(farmDate)) { // 중복 방지
                            String farmName = item.getString("dateName");
                            Farm farm = com.farm.domain.Farm
                                    .farmDate(farmDate)
                                    .farmName(farmName)
                                    .build();
                            farmList.add(farm);
                        }
                    }
                } else {
                    JSONArray items = body.getJSONObject("items").getJSONArray("item");
                    for (Object item : items) { // 해당 월 공휴일 갯수
                        JSONObject map = new JSONObject(new Gson().toJson(item)).getJSONObject("map");
                        if (map.getString("isFarm").equals("Y")) { // 공휴일이 맞을 경우
                            String farmDate = String.valueOf(map.getInt("locdate"));
                            if (!farmRepository.existsByFarmDate(farmDate)) { // 중복 방지
                                String farmName = map.getString("dateName");
                                Farm farm = com.farm.domain.Farm
                                        .farmDate(farmDate)
                                        .farmName(farmName)
                                        .build();
                                farmList.add(farm);
                            }
                        }
                    }
                }
            }
            if (solYear.equals(String.valueOf(LocalDate.now().getYear())) && solMonth == 12) {
                // 내년까지 저장
                solYear = String.valueOf(LocalDate.now().plusYears(1).getYear());
                solMonth = 1;
            }
        }*/
        if (!farmList.isEmpty()) {
            farmRepository.saveAll(farmList);
            return farmList;
        } else {
            return farmList;
        }
    }
}

