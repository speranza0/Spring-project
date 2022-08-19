package com.devhyun.webmvc.client.board;

import com.devhyun.webmvc.common.core.AuthUser;
import com.devhyun.webmvc.common.core.Authentication;
import com.devhyun.webmvc.common.core.MvController;
import com.devhyun.webmvc.common.services.board.BoardService;
import com.devhyun.webmvc.common.services.board.BoardVO;
import com.devhyun.webmvc.common.services.user.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@MvController
@RequestMapping("/board")
public class BoardMvController {

    @Autowired
    private BoardService boardService;

    @GetMapping("/list")
    public String list(Model model) {
        return "client/board/list";
    }

    @GetMapping("/write")
    @Authentication
    public String writeView(Model model) {
        return "client/board/write";
    }

    @PostMapping("/write")
    public String write(@AuthUser UserVO user, BoardVO param) {
        param.setUsername(user.getUsername());
        boardService.postWrite(param);
        return "client/board/list";
    }

    @GetMapping("/notice")
    public String noticeView(Model model) {
        return "client/board/notice";
    }
}
