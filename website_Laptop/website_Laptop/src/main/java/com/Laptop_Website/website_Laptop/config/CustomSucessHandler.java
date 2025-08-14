package com.Laptop_Website.website_Laptop.config;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.Laptop_Website.website_Laptop.domain.User;
import com.Laptop_Website.website_Laptop.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class CustomSucessHandler implements AuthenticationSuccessHandler {
    @Autowired
    private UserService userService1;

   
    
protected void clearAuthenticationAttributes(HttpServletRequest request, Authentication authentication) {
    HttpSession session = request.getSession(false);
    if (session == null) {
        return;
    }
    session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
    String email = authentication.getName();
    User user1= this.userService1.getUserByEmail(email);
    
    if(user1!=null)
    {
        session.setAttribute("fullName", user1.getFullName());
        session.setAttribute("avatar", user1.getAvatar());
        session.setAttribute("email", user1.getEmail());
        session.setAttribute("id", user1.getId());


        
        
       

    }
}

     protected String determineTargetUrl(final Authentication authentication) {

    Map<String, String> roleTargetUrlMap = new HashMap<>();
    roleTargetUrlMap.put("ROLE_user", "/");
    roleTargetUrlMap.put("ROLE_admin", "/admin");

    final Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
    for (final GrantedAuthority grantedAuthority : authorities) {
        String authorityName = grantedAuthority.getAuthority();
        if(roleTargetUrlMap.containsKey(authorityName)) {
            return roleTargetUrlMap.get(authorityName);
        }
    }

    throw new IllegalStateException();
}


    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
                String targetUrl = determineTargetUrl(authentication);

                if (response.isCommitted()) {
                   
                    return;
                }
            
                redirectStrategy.sendRedirect(request, response, targetUrl);
                clearAuthenticationAttributes(request, authentication);

    }
    
}
