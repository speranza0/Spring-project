package com.devhyun.webmvc.client.user;

import com.devhyun.webmvc.common.core.MvController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@MvController
@RequestMapping("/user")
public class UserMvController {

    @RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})
    public String login(Model model) {
        return "client/user/login";
    }

}
