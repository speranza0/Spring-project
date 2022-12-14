package com.devhyun.webmvc.common.services.user;

import com.devhyun.webmvc.common.services.role.RoleVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
@Data
public class UserVO implements UserDetails {

    private int id;

    private String username;

    private String realname;

    private String nickname;

    private String email;
    private String password;

    private String telephone;

    private String latestlogin;

    private String idyn;

    private String deleteyn;

    private String regdate;

    private boolean customCheck;
    private List<RoleVO> roles;

    public boolean isCustomCheck() {
        return customCheck;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return this.roles;
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return false;
    }

    @Override
    public boolean isAccountNonLocked() {
        return false;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return false;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

}
