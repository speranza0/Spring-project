package com.devhyun.webmvc.common.services.board;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardMapper {

    void postWrite(BoardVO boardVO);
}
