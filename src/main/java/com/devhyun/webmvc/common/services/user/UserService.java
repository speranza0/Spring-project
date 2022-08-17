package com.devhyun.webmvc.common.services.user;

import com.devhyun.webmvc.common.services.role.RoleMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
@Service
public class UserService {

    private final PasswordEncoder passwordEncoder;
    private final UserMapper userMapper;

    private final RoleMapper roleMapper;

    @Transactional
    public void joinUser(UserVO param) {
        String password = passwordEncoder.encode(param.getPassword());
        param.setPassword(password);
        userMapper.joinUser(param);

        roleMapper.insertUserRole(param.getId());
    }
}
