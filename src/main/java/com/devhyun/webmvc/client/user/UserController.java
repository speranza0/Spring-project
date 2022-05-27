package com.devhyun.webmvc.client.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user")
public class UserController {

    @RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})
    public String login(Model model) {
        return "client/user/login";
    }

}
