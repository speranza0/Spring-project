package com.devhyun.webmvc.common.services.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.UriUtils;

import javax.servlet.ServletException;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.charset.StandardCharsets;
import java.util.UUID;

@Component
public class FileStore {

    @Autowired
    private BoardService boardService;

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
        file.transferTo(new File(getFullPath(storeFileName)));
        return new BoardVO(originFilename, storeFileName);
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

    public ResponseEntity<Resource> downloadAttach(@PathVariable BoardVO param) throws MalformedURLException {
        BoardVO vo = boardService.attachFileDown(param);
        String storeFileName = vo.getFileUUID();
        String uploadFileName = vo.getFileName();

        UrlResource resource = new UrlResource("file:" + getFullPath(storeFileName));
        String encodeUploadFileName = UriUtils.encode(uploadFileName, StandardCharsets.UTF_8);
        String contentDisposition = "attachment; filename=\"" + encodeUploadFileName + "\"";
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, contentDisposition).body(resource);
    }
}
