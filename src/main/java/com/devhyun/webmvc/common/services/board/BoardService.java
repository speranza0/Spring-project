package com.devhyun.webmvc.common.services.board;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@RequiredArgsConstructor
@Service
public class BoardService {

    private final BoardMapper boardMapper;

    public void postWrite(BoardVO param) {
        boardMapper.postWrite(param);
    }

    public void postWrite_attach(BoardVO param) {
        boardMapper.postWrite_attach(param);
    }

    public ArrayList<BoardVO> postList(BoardVO param) {
        return boardMapper.postList(param);
    }

    public ArrayList<BoardVO> noticeList(BoardVO param) {
        return boardMapper.noticeList(param);
    }

    public int getListCnt(BoardVO param) {
        return boardMapper.getListCnt(param);
    }

    public int getNoticeListCnt(BoardVO param) {
        return boardMapper.getNoticeListCnt(param);
    }

    public BoardVO postView(BoardVO param) {
        return boardMapper.postView(param);
    }

    public BoardVO attachFileDown(BoardVO param) {
        return boardMapper.attachFileDown(param);
    }

    public BoardVO updateView(BoardVO param) {
        return boardMapper.postView(param);
    }

    public void postUpdate(BoardVO param) {
        boardMapper.postUpdate(param);
    }

    public void postDelete(BoardVO param) {
        boardMapper.fileDelete(param);
        boardMapper.postDelete(param);
    }

    public void fileDelete(BoardVO param) {
        boardMapper.fileDelete(param);
    }
}
