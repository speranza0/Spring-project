package com.devhyun.webmvc.common.services.user;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {

    int getIdCnt(UserVO userVO);

    UserVO selectByUsername(String username);

    UserVO memberIdSearch(UserVO userVO);

    int memberPwSearch(UserVO userVO);

    void joinUser(UserVO userVO);

    void updateLastLogin(UserVO userVO);

    void passwordUpdate(UserVO userVO);

    void userModify(UserVO userVO);

    void userPasswordModify(UserVO userVO);
}
