package com.devhyun.webmvc.common.services.board;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Component
public class FileStore {

    @Value("${file.dir}")
    private String fileDir;

    public String getFullPath(String filename) {
        return fileDir + filename;
    }

    public BoardVO uploadFile(MultipartFile file) throws ServletException, IOException {
        if (file.isEmpty()) {
            return null;
        }
        String originFilename = file.getOriginalFilename();
        String storeFileName = createStoreFileName(originFilename);
        file.transferTo(new File(getFullPath(originFilename)));
        return new BoardVO(originFilename);
    }

    private String createStoreFileName(String originFilename) {
        String ext = extractExt(originFilename);
        String uuid = UUID.randomUUID().toString();
        return uuid + "." + ext;
    }

    private String extractExt(String originFilename) {
        int pos = originFilename.lastIndexOf(".");
        return originFilename.substring(pos + 1);
    }
}
