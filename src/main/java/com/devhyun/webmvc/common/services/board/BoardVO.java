package com.devhyun.webmvc.common.services.board;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.springframework.web.multipart.MultipartFile;

@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
@Data
public class BoardVO {

    private int idx;

    private String username;

    private String nickname;

    private String postTitle;

    private String postContent;

    private String postDate;

    private String fileName;

    private MultipartFile uploadFile;


    public BoardVO(String fileName) {
        this.fileName = fileName;
    }
}
