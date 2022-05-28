package com.devhyun.webmvc.common.exception;

import com.devhyun.webmvc.common.core.MvController;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@Slf4j
@ControllerAdvice(annotations = {MvController.class})
public class MvcExceptionHandler {

    @ExceptionHandler(Exception.class)
    public String handleException(Exception exception, Model model) {
        log.error("Internal Server Error", exception);
        return "error/500";
    }

}
