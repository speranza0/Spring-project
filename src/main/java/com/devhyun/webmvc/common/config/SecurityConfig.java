package com.devhyun.webmvc.common.config;

import com.devhyun.webmvc.common.security.SecurityProvider;
import com.devhyun.webmvc.common.security.FailureHandler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Bean
	public SecurityProvider authenticationProvider() {
		return new SecurityProvider();
	}

	@Bean
	public FailureHandler failureHandler() {
		return new FailureHandler();
	}

	@Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
	
	@Override
    public void configure(WebSecurity web) {
        web.ignoring().antMatchers("/css/**", "/js/**", "/images/**");
    }

	@Bean
    public SessionRegistry sessionRegistry() {
        return new SessionRegistryImpl();
    }

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.csrf()
				.disable()
			.formLogin()
				.loginPage("/user/login")
				.loginProcessingUrl("/api/user/login")
				.failureHandler(failureHandler())
				.and()
			.logout()
				.logoutUrl("/api/user/logout")
				.logoutSuccessUrl("/")
				.invalidateHttpSession(true)
			.and()
				.sessionManagement().maximumSessions(1).sessionRegistry(sessionRegistry()).expiredUrl("/");
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) {
		auth.authenticationProvider(authenticationProvider());
	}
	
}
