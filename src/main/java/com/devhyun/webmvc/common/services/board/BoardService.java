package com.devhyun.webmvc.common.services.board;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class BoardService {

    private final BoardMapper boardMapper;

    public void postWrite(BoardVO param) {
        boardMapper.postWrite(param);
    }
}
