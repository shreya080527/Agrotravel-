package com.agrotravel;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class SessionListener implements HttpSessionListener {

    private static int activeUserCount = 0;

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        synchronized (SessionListener.class) {
            activeUserCount++;
            ServletContext context = se.getSession().getServletContext();
            context.setAttribute("activeUsers", activeUserCount);
        }
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        synchronized (SessionListener.class) {
            if (activeUserCount > 0) {
                activeUserCount--;
            }
            ServletContext context = se.getSession().getServletContext();
            context.setAttribute("activeUsers", activeUserCount);
        }
    }

    public static synchronized int getActiveUserCount() {
        return activeUserCount;
    }
}
