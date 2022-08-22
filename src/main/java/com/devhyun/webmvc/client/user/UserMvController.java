package com.devhyun.webmvc.client.user;

import com.devhyun.webmvc.common.core.MvController;
import com.devhyun.webmvc.common.services.user.UserMapper;
import com.devhyun.webmvc.common.services.user.UserService;
import com.devhyun.webmvc.common.services.user.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@MvController
@RequestMapping("/user")
public class UserMvController {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})
    public String login() {
        return "client/user/login";
    }

    @GetMapping("/join")
    public String joinView(Model model) {
        return "client/user/join";
    }

    @PostMapping("/join")
    public String join(@ModelAttribute UserVO param, Model model) {
        userService.joinUser(param);
        model.addAttribute("user", param);
        return "client/user/welcome";
    }

    @GetMapping("/userModify")
    public String modifyView(UserVO param, Model model) {
        UserVO userVO = userMapper.selectByUsername(param.getUsername());
        model.addAttribute("userInfo", userVO);
        return "client/user/userModify";
    }

    @PostMapping("/userModify")
    public String modify(UserVO param, Model model) {
        userService.userModify(param);
        return "index";
    }
}
