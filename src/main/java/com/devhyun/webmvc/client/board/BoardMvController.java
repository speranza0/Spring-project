package com.devhyun.webmvc.client.board;

import com.devhyun.webmvc.common.core.MvController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@MvController
@RequestMapping("/board")
public class BoardMvController {

    @GetMapping("/list")
    public String list(Model model) {
        return "client/board/list";
    }

    @GetMapping("/write")
    public String writeView(Model model) {
        return "client/board/write";
    }
}
