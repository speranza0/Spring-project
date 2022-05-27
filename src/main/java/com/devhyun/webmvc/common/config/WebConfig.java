package com.devhyun.webmvc.common.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.resource.PathResourceResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@EnableWebMvc
@Configuration
public class WebConfig implements WebMvcConfigurer {

	@Bean
    public ViewResolver jspViewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/src/main/webapp/WEB-INF/view/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry
        .addResourceHandler("/**")
        .addResourceLocations(new String[] {"classpath:/WEB-INF/static/"})
        .setCachePeriod(3600)
        .resourceChain(true)
        .addResolver(new PathResourceResolver());
    }
}
