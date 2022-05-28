package com.devhyun.webmvc.common.services.role;

import org.springframework.security.core.GrantedAuthority;

public class RoleVO implements GrantedAuthority {

    private String id;

    private String namekey;

    private String name;

    @Override
    public String getAuthority() {
        return namekey;
    }
}
