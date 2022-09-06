package com.devhyun.webmvc.common.services.board;

import lombok.*;
import lombok.experimental.SuperBuilder;
import org.springframework.web.multipart.MultipartFile;

import java.io.UnsupportedEncodingException;

@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
@Getter
@Setter
public class BoardVO extends PageVO{

    private int idx;

    private String username;

    private String nickname;

    private String postTitle;

    private String postContent;

    private String postDate;

    private String searchKeyword;

    private String qustr;

    private String fileName;

    private String fileUUID;

    private MultipartFile uploadFile;

    public void setQustr() throws UnsupportedEncodingException {
        String qs = "";
        this.setQueryString();
        qs += this.getQueryString();
        this.qustr = qs;
    }
}
