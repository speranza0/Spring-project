package com.devhyun.webmvc.common.services.user;

import com.devhyun.webmvc.common.services.role.RoleMapper;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang.StringUtils;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
@Service
public class UserService {

    private final PasswordEncoder passwordEncoder;
    private final UserMapper userMapper;

    private final RoleMapper roleMapper;


    public int getIdCnt(UserVO param) {
        return userMapper.getIdCnt(param);
    }

    public UserVO memberIdSearch(UserVO param) {
        return userMapper.memberIdSearch(param);
    }

    public int memberPwSearch(UserVO param) {
        return userMapper.memberPwSearch(param);
    }

    public void updateLastLogin(UserVO param) {
        userMapper.updateLastLogin(param);
    }

    public void passwordUpdate(UserVO param) {
        String password = passwordEncoder.encode(param.getPassword());
        param.setPassword(password);
        userMapper.passwordUpdate(param);
    }

    @Transactional
    public void joinUser(UserVO param) {
        String password = passwordEncoder.encode(param.getPassword());
        param.setPassword(password);
        userMapper.joinUser(param);

        roleMapper.insertUserRole(param.getId());
    }

    @Transactional
    public void userModify(UserVO param) {
        if(StringUtils.isNotEmpty(param.getPassword())) {
            String password = passwordEncoder.encode(param.getPassword());
            param.setPassword(password);
            userMapper.userPasswordModify(param);
        } else {
            userMapper.userModify(param);
        }
    }
}
