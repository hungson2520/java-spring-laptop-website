package com.Laptop_Website.website_Laptop.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
@EnableWebMvc
public class WebMVCConfig implements WebMvcConfigurer {

     @Bean
    public ViewResolver viewResolver() {
       final InternalResourceViewResolver resolver = new InternalResourceViewResolver();
       resolver.setViewClass(JstlView.class);
        resolver.setPrefix("/WEB-INF/view/");  // Đường dẫn đến thư mục chứa các file JSP
        resolver.setSuffix(".jsp");  // Định dạng của file view
        return resolver;
    }
     @Override
    public void configureViewResolvers(@SuppressWarnings("null") ViewResolverRegistry registry) {
        registry.viewResolver(viewResolver());  // Cấu hình cho JSP view resolver
    }

    @SuppressWarnings("null")
    @Override
    public void addResourceHandlers( ResourceHandlerRegistry registry) {
        // Cấu hình đường dẫn đến tài nguyên tĩnh như CSS, JavaScript, hình ảnh, v.v.
        registry.addResourceHandler("/css/**")
                .addResourceLocations("/resources/css/");  // Thư mục chứa tài nguyên tĩnh trong dự án
                registry.addResourceHandler("/js/**")
                .addResourceLocations("/resources/js/"); 
                registry.addResourceHandler("/webjars/**").addResourceLocations("/webjars/");


                registry.addResourceHandler("/images/**")
                .addResourceLocations("/resources/images/");
                registry.addResourceHandler("/client/**")
                .addResourceLocations("/resources/client/");
    }
    
    
    
}
