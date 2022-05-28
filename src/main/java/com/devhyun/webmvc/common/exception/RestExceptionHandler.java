package com.devhyun.webmvc.common.exception;

import com.devhyun.webmvc.common.core.ResponseBuilder;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@Slf4j
@RestControllerAdvice(annotations = {RestController.class})
public class RestExceptionHandler {

    @ExceptionHandler(Exception.class)
    public ResponseEntity<?> handleException(Exception exception) {
        log.error("Internal Server Error", exception);
        return ResponseBuilder.error(500, exception.getMessage()).build();
    }

}
