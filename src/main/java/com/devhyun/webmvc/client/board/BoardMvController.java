package com.devhyun.webmvc.client.board;

import com.devhyun.webmvc.common.core.AuthUser;
import com.devhyun.webmvc.common.core.Authentication;
import com.devhyun.webmvc.common.core.MvController;
import com.devhyun.webmvc.common.exception.NotFoundException;
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

    @RequestMapping (value = "/list")
    public String list(BoardVO param, Model model) {
        model.addAttribute("list", boardService.postList(param));
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
        return "redirect:/board/list";
    }

    @RequestMapping("/view")
    public String postView(BoardVO param, Model model) {
        BoardVO boardVO = boardService.postView(param);

        if(boardVO == null) {
            throw new NotFoundException("게시글을 찾을 수 없습니다.");
        }
        model.addAttribute("view", boardService.postView(param));
        return "client/board/view";
    }
    @GetMapping("/update")
    public String updateView(BoardVO param, Model model) {
        model.addAttribute("updateView", boardService.postView(param));
        return "client/board/update";
    }

    @PostMapping("/update")
    public String update(BoardVO param) {
        boardService.postUpdate(param);
        return "redirect:/board/list";
    }

    @RequestMapping("/delete")
    public String delete(BoardVO param) {
        boardService.postDelete(param);
        return "redirect:/board/list";
    }

    @GetMapping("/notice")
    public String noticeView(Model model) {
        return "client/board/notice";
    }
}
