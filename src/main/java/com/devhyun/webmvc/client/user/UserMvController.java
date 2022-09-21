package com.devhyun.webmvc.client.user;

import com.devhyun.webmvc.common.core.MvController;
import com.devhyun.webmvc.common.services.user.UserMapper;
import com.devhyun.webmvc.common.services.user.UserService;
import com.devhyun.webmvc.common.services.user.UserVO;
import net.sf.json.JSONObject;
import org.apache.commons.lang.RandomStringUtils;
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

    @GetMapping("/search_id")
    public String searchId() {
        return "client/user/search_id";
    }

    @PostMapping("/search_result_id")
    public String searchResultId(UserVO param, Model model) {
        UserVO memberSearch = userService.memberIdSearch(param);
        model.addAttribute("searchVO", memberSearch);
        return "client/user/search_result_id";
    }

    @GetMapping("/search_pw")
    public String searchPw() {
        return "client/user/search_pw";
    }

    @PostMapping("/search_result_pw")
    public String searchResultPw(UserVO param, Model model) {
        int memberSearch = userService.memberPwSearch(param);
        if(memberSearch == 0) {
            model.addAttribute("msg", "올바르지 않은 정보입니다. 다시 입력해주세요.");
            return "client/user/search_pw";
        }
        String newPw = RandomStringUtils.randomAlphabetic(10);
        param.setPassword(newPw);
        userService.passwordUpdate(param);
        model.addAttribute("newPw", newPw);
        return "client/user/search_result_pw";
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
        return "redirect:/user/userModify?username=" + param.getUsername();
    }
}
