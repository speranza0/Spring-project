package com.devhyun.webmvc.common.security;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.FlashMapManager;
import org.springframework.web.servlet.support.SessionFlashMapManager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FailureHandler implements AuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException {
        String message = exception.getMessage();

        FlashMap flashMap = new FlashMap();
        FlashMapManager flashMapManager = new SessionFlashMapManager();

        flashMap.put("message", message);
        flashMapManager.saveOutputFlashMap(flashMap, request, response);

        response.sendRedirect(request.getHeader("referer"));

    }

}
