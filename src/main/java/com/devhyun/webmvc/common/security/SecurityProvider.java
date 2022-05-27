package com.devhyun.webmvc.common.security;

import com.devhyun.webmvc.common.exception.SecurityException;
import com.devhyun.webmvc.common.services.user.UserMapper;
import com.devhyun.webmvc.common.services.user.UserVO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.password.PasswordEncoder;

public class SecurityProvider implements AuthenticationProvider {

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    UserMapper userMapper;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {

        String username = authentication.getName();
        String password = (String)authentication.getCredentials();

        if(StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
            throw new SecurityException("아이디 비밀번호를 입력해주세요.");
        }

        UserVO user = userMapper.selectByUsername(username);

        if(user == null) {
            throw new SecurityException("아이디 또는 비밀번호를 확인해주세요.");
        }

        if(!passwordEncoder.matches(password, user.getPassword())) {
            throw new SecurityException("아이디 또는 비밀번호를 확인해주세요.");
        }

        return new UsernamePasswordAuthenticationToken(user, user.getPassword(), user.getAuthorities());
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return true;
    }
}
