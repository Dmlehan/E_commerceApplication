package com.example.e_commerproject.Listner;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class Mylistner implements ServletContextListener {
    private static SessionFactory sessionFactory;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContextListener.super.contextInitialized(sce);
        try{
             System.out.println("Initialization Hibernate 1 in Listner");
            sessionFactory = new Configuration().configure().buildSessionFactory();
            sce.getServletContext().setAttribute("SessionFactory", sessionFactory);
            System.out.println("Hibernate initialized successfully");

        }catch(Throwable ex){
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);

        }
    }
}
