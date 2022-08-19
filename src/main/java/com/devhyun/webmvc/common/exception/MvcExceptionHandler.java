package com.devhyun.webmvc.common.exception;

import com.devhyun.webmvc.common.core.MvController;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@Slf4j
@ControllerAdvice(annotations = {MvController.class})
public class MvcExceptionHandler {

    @ExceptionHandler(AccessDeniedException.class)
    public String handleAccessDeniedException(Exception exception, Model model) {
        log.error("AccessDeniedException", exception);
        return "error/401";
    }


    @ExceptionHandler(Exception.class)
    public String handleException(Exception exception, Model model) {
        log.error("Internal Server Error", exception);
        return "error/500";
    }

}
