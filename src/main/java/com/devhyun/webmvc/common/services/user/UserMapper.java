package com.devhyun.webmvc.common.services.user;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {

    UserVO selectByUsername(String username);
    void joinUser(UserVO userVO);
}
