package com.devhyun.webmvc.common.services.board;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;


@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@SuperBuilder
public class PageVO {
    private Integer pageIndex = 1; // 현재 페이지
    private int pageUnit = 10; //페이지 갯수
    private int pageSize = 10; //페이지 사이즈
    private int firstIndex = 1; // 첫번째 인덱스
    private int recordCountPerPage = 10; // 한페이지당 게시되는 게시물 수
    private int totCnt = 0; //총 갯수
    private int startData = 0; //시작 데이터
    private int endData = 0; //종료 데이터
    private int realEnd = 0; //페이징 마지막 숫자
    private boolean prev, next; // 이전, 다음버튼

//    private String searchKeyword = ""; // 검색
//    private String queryString = ""; //쿼리스트링
//
//    public void setQueryString() throws UnsupportedEncodingException {
//        String qs = "";
//        qs += "&searchKeyword=" +URLEncoder.encode(this.searchKeyword, "UTF-8");
//        qs += "&pageIndex="+this.pageIndex;
//
//        this.queryString = qs;
//    }

}
