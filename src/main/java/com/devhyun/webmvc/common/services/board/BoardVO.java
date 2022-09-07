package com.devhyun.webmvc.common.services.board;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;
import org.springframework.web.multipart.MultipartFile;

@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
@Getter
@Setter
public class BoardVO extends PageVO{

    private int userId;

    private int idx;

    private String username;

    private String nickname;

    private String postTitle;

    private String postContent;

    private String postDate;

    private String OriginFileName;

    private String UploadPath;

    private String FileExt;

    private int FileSize;

    private String UUID;

    private String searchKeyword;

    private String qustr;

    private MultipartFile uploadFile;

//    public void setQustr() throws UnsupportedEncodingException {
//        String qs = "";
//        this.setQueryString();
//        qs += this.getQueryString();
//        this.qustr = qs;
//    }
}
