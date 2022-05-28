package com.devhyun.webmvc.common.core;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.util.HashMap;
import java.util.Map;

public class ResponseBuilder {

    private int status;

    private String message;

    Map<String, Object> dataMap = null;
    Object dataObject = null;

    public static ResponseBuilder success() {
        ResponseBuilder responseBuilder = new ResponseBuilder();
        responseBuilder.status = 200;
        return responseBuilder;
    }

    public static ResponseBuilder error(int status, String message) {
        ResponseBuilder responseBuilder = new ResponseBuilder();
        responseBuilder.status = status;
        responseBuilder.message = message;
        return responseBuilder;
    }

    public ResponseEntity<Map<String, Object>> build(){
        Object response = null;

        if( dataMap != null ){
            response = dataMap;
        }

        if(dataObject != null ){
            response = dataObject;
        }

        Map<String, Object> responseBody = new HashMap<>();
        responseBody.put("timestamp", System.currentTimeMillis());

        if(status != 200) {
            responseBody.put("error", HttpStatus.resolve(status).getReasonPhrase());
        }

        responseBody.put("status", status);
        responseBody.put("message", message);

        if(response != null) {
            responseBody.put("data", response);
        }

        return new ResponseEntity<>(responseBody, HttpStatus.resolve(status));
    }

    public ResponseBuilder putValue(String key, Object value) {
        if(dataMap == null){
            dataMap = new HashMap<>();
        }
        dataMap.put(key, value);
        return this;
    }

    public ResponseBuilder setValue(Object value) {
        dataObject = value;
        return this;
    }

}
