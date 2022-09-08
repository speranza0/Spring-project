package com.devhyun.webmvc.common.services.board;

import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface BoardMapper {

    ArrayList<BoardVO> postList(BoardVO boardVO);

    BoardVO postView(BoardVO boardVO);

    int getListCnt(BoardVO boardVO);

    BoardVO attachFileDown(BoardVO boardVO);

    void postWrite(BoardVO boardVO);

    void postWrite_attach(BoardVO boardVO);

    void postUpdate(BoardVO boardVO);

    void postDelete(BoardVO boardVO);

    void fileDelete(BoardVO boardVO);
}
