package com.devhyun.webmvc.client.board;

import com.devhyun.webmvc.common.core.AuthUser;
import com.devhyun.webmvc.common.core.Authentication;
import com.devhyun.webmvc.common.core.MvController;
import com.devhyun.webmvc.common.exception.NotFoundException;
import com.devhyun.webmvc.common.services.board.BoardService;
import com.devhyun.webmvc.common.services.board.BoardVO;
import com.devhyun.webmvc.common.services.board.FileStore;
import com.devhyun.webmvc.common.services.board.Pagination;
import com.devhyun.webmvc.common.services.user.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;

@MvController
@RequestMapping("/board")
public class BoardMvController {

    @Autowired
    private BoardService boardService;
    @Autowired
    private FileStore fileStore;

    @RequestMapping (value = "/list")
    public String list(@ModelAttribute("searchVO") BoardVO param, Model model) throws UnsupportedEncodingException {
        //페이징 처리
        Pagination pagination = new Pagination();
        pagination.setCurrentPageNo(param.getPageIndex());
        pagination.setRecordCountPerPage(param.getPageUnit());
        pagination.setPageSize(param.getPageSize());

        param.setFirstIndex(pagination.getFirstRecordIndex());
        param.setRecordCountPerPage(pagination.getRecordCountPerPage());

        int totCnt = boardService.getListCnt(param);

        pagination.setTotalRecordCount(totCnt);

        param.setEndData(pagination.getLastPageNoOnPageList());
        param.setStartData(pagination.getFirstPageNoOnPageList());
        param.setPrev(pagination.getXprev());
        param.setNext(pagination.getXnext());

        model.addAttribute("list", boardService.postList(param));
        model.addAttribute("totCnt", totCnt);
        model.addAttribute("totalPageCnt", (int)Math.ceil(totCnt / (double)param.getPageUnit()));
        model.addAttribute("pagination", pagination);

        param.setQustr();
        return "client/board/list";
    }

    @GetMapping("/write")
    @Authentication
    public String writeView(Model model) {
        return "client/board/write";
    }

    @PostMapping("/write")
    public String write(@AuthUser UserVO user, BoardVO param) throws ServletException, IOException {
        param.setUsername(user.getUsername());
        BoardVO vo = fileStore.uploadFile(param.getUploadFile());
        param.setFileName(vo.getFileName());
        param.setFileUUID(vo.getFileUUID());
        boardService.postWrite(param);
        return "redirect:/board/list";
    }


    @RequestMapping("/view")
    public String postView(@ModelAttribute("searchVO") BoardVO param, Model model) throws MalformedURLException, UnsupportedEncodingException {
        BoardVO boardVO = boardService.postView(param);

        if(boardVO == null) {
            throw new NotFoundException("게시글을 찾을 수 없습니다.");
        }
        model.addAttribute("view", boardVO);
        param.setQustr();
        return "client/board/view";
    }

    @GetMapping("/attachFile")
    public ResponseEntity<Resource> attachFile(BoardVO param) throws MalformedURLException {
        return fileStore.downloadAttach(param);
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
