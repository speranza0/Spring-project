package com.devhyun.webmvc.common.services.user;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class UserService {

    private final UserMapper userMapper;

}
