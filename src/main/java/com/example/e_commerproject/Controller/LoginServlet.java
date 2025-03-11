package com.example.e_commerproject.Controller;

import com.example.e_commerproject.entity.User;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import java.io.IOException;

//@WebServlet(name="login",value="/loginServelet")

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("loginServlet");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
//        ServletContext context=request.getServletContext();

        ServletContext context=req.getServletContext();
        SessionFactory sessionFactory = (SessionFactory) context.getAttribute("SessionFactory");
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();

            String hql = "FROM User WHERE email = :email AND password = :password";
            Query<User> query = session.createQuery(hql, User.class);
            query.setParameter("email", email);
            query.setParameter("password", password);

            User user = query.uniqueResult();

            session.getTransaction().commit();

            if (user != null) {
                HttpSession httpSession = req.getSession();
                String uid = String.valueOf(user.getUserId());
                httpSession.setAttribute("userId", uid); // Store the userId in session
                httpSession.setAttribute("userRole", user.getRole());
                if (user.getRole().equals("Admin")){
                    resp.sendRedirect("admin_dashboard.jsp?userId=" + user.getUserId());
                }else {
                    resp.sendRedirect("getAllProductForCustomer?userId=" + user.getUserId());
                }
            } else {
                resp.sendRedirect("getAllProductForCustomer?loginError=failed");
            }

        } catch (Exception e) {
            resp.sendRedirect("getAllProduct?loginError=failed");
            e.printStackTrace();
        }
    }
}
