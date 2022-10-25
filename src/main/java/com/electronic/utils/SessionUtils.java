package com.electronic.utils;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SessionUtils {
    private static SessionUtils sessionUtils = null;

    private SessionUtils() {
    }

    public static SessionUtils getInstance() {
        if (sessionUtils == null) {
            synchronized (SessionUtils.class) {
                if (sessionUtils == null) {
                    sessionUtils = new SessionUtils();
                }
            }
        }
        return sessionUtils;
    }

    public void putValue(HttpServletRequest request, String key, Object value) {
        request.getSession(true).setAttribute(key, value);
    }

    public Object getValue(HttpServletRequest request, String key) {
        return request.getSession(true).getAttribute(key);
    }

    public void removeValue(HttpServletRequest request, String key) {
        request.getSession(true).removeAttribute(key);
    }

    public void putValue(ServletRequest request, String key, Object value) {
        (((HttpServletRequest) request).getSession(true)).setAttribute(key, value);

    }

    public Object getValue(ServletRequest request, String key) {
        return (((HttpServletRequest) request).getSession(true)).getAttribute(key);

    }

    public void removeValue(ServletRequest request, String key) {
        (((HttpServletRequest) request).getSession(true)).removeAttribute(key);
    }
}
