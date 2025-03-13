package com.example.e_commerproject.Controller;
import com.example.e_commerproject.Util.PasswordUtil;
import com.example.e_commerproject.entity.User;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import java.io.IOException;

@WebServlet(name = "Register", value = "/Registration")
public class Register extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirm_password");

        if (!password.equals(confirmPassword)) {
            resp.sendRedirect("index.jsp?errorpassword=failed");
            return;
        }

        // Hash the password before storing
        String hashedPassword = PasswordUtil.hashPassword(password);

        ServletContext context = req.getServletContext();
        SessionFactory sessionFactory = (SessionFactory) context.getAttribute("SessionFactory");

        if (sessionFactory == null) {
            throw new ServletException("Hibernate SessionFactory is not initialized.");
        }

        Session session = sessionFactory.openSession();
        session.beginTransaction();

        User user = new User();
        user.setUserName(name);
        user.setEmail(email);
        user.setPassword(hashedPassword);  // Store hashed password
        user.setRole("customer");

        session.save(user);
        session.getTransaction().commit();
        session.close();

        resp.sendRedirect("getAllProductForCustomer.jsp?userId=" + user.getUserId());
    }
}