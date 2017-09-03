package com.filter.web;

import com.constants.ST;
import com.thread.content.ContentHolder;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by ASUS on 2017-09-03.
 */
public class UserContentFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) servletRequest;

        HttpSession session = req.getSession(true);

        Integer userId = (Integer) session.getAttribute(ST.SESSION_KEY);

        ContentHolder.setUserIdContent(userId);


        filterChain.doFilter(servletRequest,servletResponse);

    }

    @Override
    public void destroy() {

    }
}
