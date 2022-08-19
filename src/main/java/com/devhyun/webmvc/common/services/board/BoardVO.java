package com.devhyun.webmvc.common.services.board;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
@Data
public class BoardVO {

    private int idx;

    private String username;

    private String postTitle;

    private String postContent;

    private String postDate;

}
