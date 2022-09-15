package com.devhyun.webmvc.common.services.user;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {

    int getIdCnt(UserVO userVO);

    UserVO selectByUsername(String username);
    void joinUser(UserVO userVO);

    void userModify(UserVO userVO);
}
