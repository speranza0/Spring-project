package com.devhyun.webmvc.common.services.role;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RoleMapper {

    List<RoleVO> selectByUserId(int userId);

}
