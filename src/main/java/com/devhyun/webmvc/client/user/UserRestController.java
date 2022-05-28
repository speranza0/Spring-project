package com.devhyun.webmvc.client.user;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/user")
public class UserRestController {

    @GetMapping
    public String index() throws Exception {
        throw new Exception("에러");
    }

}
