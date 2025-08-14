package com.Laptop_Website.website_Laptop.config;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.session.security.web.authentication.SpringSessionRememberMeServices;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.Laptop_Website.website_Laptop.service.CustomUserDetailsService;
import com.Laptop_Website.website_Laptop.service.UserService;

import jakarta.servlet.DispatcherType;

@Configuration
@EnableMethodSecurity(securedEnabled = true)
public class SecurityConfig    {
  

 
  

        @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }    

    @Bean
    public UserDetailsService userDetailsService(UserService userService)
    {
        return new CustomUserDetailsService(userService);
    }
    //  @Bean
    // public AuthenticationManager authenticationManager(HttpSecurity http, PasswordEncoder passwordEncoder1,  @Qualifier("userDetailsService") UserDetailsService userDetailsService1) throws Exception {
    //    AuthenticationManagerBuilder authenticationManagerBuilder= http.getSharedObject(AuthenticationManagerBuilder.class);
    //    authenticationManagerBuilder.userDetailsService(userDetailsService1).passwordEncoder(passwordEncoder1);
    //    return authenticationManagerBuilder.build();
     
    // }
    @Bean
public SpringSessionRememberMeServices rememberMeServices() {
	SpringSessionRememberMeServices rememberMeServices =
			new SpringSessionRememberMeServices();
	// optionally customize
	rememberMeServices.setAlwaysRemember(true);
	return rememberMeServices;
}
   

    @Bean
    public DaoAuthenticationProvider authenticationManager(PasswordEncoder passwordEncoder1,  @Qualifier("userDetailsService") UserDetailsService userDetailsService1)
    {
        DaoAuthenticationProvider authProvider= new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService1);
        authProvider.setPasswordEncoder(passwordEncoder1);
        authProvider.setHideUserNotFoundExceptions(false);
        return authProvider;
    }

    @Bean
public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
  

  http
  .csrf(csrf -> csrf.ignoringRequestMatchers("/ws/**"))
  .authorizeHttpRequests(authorize->authorize.dispatcherTypeMatchers(DispatcherType.FORWARD, DispatcherType.INCLUDE).permitAll() 
  .requestMatchers("/login", "/client/**", "/css/**","/js/**","/register","/images/**","/","/product/**","/ws/**").permitAll()

  .requestMatchers("/admin/**").hasRole("admin")
  .anyRequest().authenticated())
  .sessionManagement(sessionManagement -> sessionManagement
  // Luôn luôn tạo session mới khi người dùng đăng nhập
  .sessionCreationPolicy(SessionCreationPolicy.ALWAYS)
  .invalidSessionUrl("/login?expired")
  // Chỉ cho phép một phiên đăng nhập duy nhất cho mỗi user
  .maximumSessions(1)
  .maxSessionsPreventsLogin(false) // Nếu false, phiên cũ sẽ bị hủy khi người dùng đăng nhập ở thiết bị khác
  )
  .logout(logout -> logout
  .invalidateHttpSession(true)                // Hủy session khi logout
  .deleteCookies("JSESSIONID") // Xóa cookie khi logout
)
  .rememberMe((rememberMe) -> rememberMe
			.rememberMeServices(rememberMeServices())
		)
  .formLogin(formLogin->formLogin.loginPage("/login").successHandler(MyCustomSuccessHandler()).failureUrl("/login?error").permitAll())
  .exceptionHandling(ex->ex.accessDeniedPage("/access-denied"))
  ;       

      

    return http.build(); 
}
     


@Bean
public AuthenticationSuccessHandler MyCustomSuccessHandler()
{
    return new CustomSucessHandler();
}


 @Bean
    public WebMvcConfigurer corsConfigurer() {
        return new WebMvcConfigurer() {
            @Override
            public void addCorsMappings(CorsRegistry registry) {
                registry.addMapping("/**")
                        .allowedOriginPatterns("*") // Thay vì allowedOrigins("*")
                        .allowedMethods("GET", "POST", "PUT", "DELETE")
                        .allowCredentials(true);
            }
        };
    }
}





