package com.devhyun.webmvc.client.user;

import com.devhyun.webmvc.common.core.MvController;
import com.devhyun.webmvc.common.services.user.UserMapper;
import com.devhyun.webmvc.common.services.user.UserService;
import com.devhyun.webmvc.common.services.user.UserVO;
import net.sf.json.JSONObject;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

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

    //ajax컨트롤러
    @RequestMapping(value = "/getIdCnt", method = RequestMethod.POST)
    @ResponseBody
    public String loginCntReset(@RequestBody String filterJSON, HttpServletResponse response, ModelMap model) throws IOException {
        JSONObject resMap = new JSONObject();

        try {
            ObjectMapper mapper = new ObjectMapper();
            UserVO searchVO = mapper.readValue(filterJSON, new TypeReference<UserVO>() {});
            int idCnt = userService.getIdCnt(searchVO);
            resMap.put("res", "ok");
            resMap.put("idCnt", idCnt);
        } catch (Exception e) {
            resMap.put("res", "error");
        }
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resMap);

        return null;
    }

    @PostMapping("/join")
    public String join(@ModelAttribute("user") UserVO param, Model model) {
        try {
            SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
            Date time = new Date();
            String time1 = format1.format(time);
            param.setRegdate(time1);

            userService.joinUser(param);
            model.addAttribute("user", param);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
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
