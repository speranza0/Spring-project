package com.devhyun.webmvc.common.services.user;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserMapper {

    UserVO selectByUsername(@Param("username") String username);

}
