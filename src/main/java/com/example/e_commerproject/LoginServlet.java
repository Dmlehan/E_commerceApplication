package com.example.e_commerproject;
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
import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;

@WebServlet(name = "loginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private static final Logger logger = LoggerFactory.getLogger(LoginServlet.class);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        logger.info("User login attempt: {}", email);

        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            resp.sendRedirect("index.jsp?error=missing_fields");
            return;
        }

        ServletContext context = req.getServletContext();
        SessionFactory sessionFactory = (SessionFactory) context.getAttribute("SessionFactory");

        if (sessionFactory == null) {
            logger.error("SessionFactory is null. Check Hibernate configuration.");
            resp.sendRedirect("index.jsp?error=server_error");
            return;
        }

        try (Session session = sessionFactory.openSession()) {
            Query<User> query = session.createQuery("select  FROM User WHERE email = :email", User.class);
            query.setParameter("email", email);
            User user = query.uniqueResult();

            if (user != null && BCrypt.checkpw(password, user.getPassword())) {
                logger.info("User {} logged in successfully", email);

                HttpSession httpSession = req.getSession();
                httpSession.setAttribute("user", user);

                if ("admin".equalsIgnoreCase(user.getRole())) {
                    resp.sendRedirect("getAllProductForAdmin.jsp?userId=" + user.getUserId());
                } else {
                    resp.sendRedirect("getAllProductForCustomer.jsp?userId=" + user.getUserId());
                }
            } else {
                logger.warn("Invalid credentials for user: {}", email);
                resp.sendRedirect("index.jsp?error=invalid_credentials");
            }

        } catch (Exception e) {
            logger.error("Error during user login", e);
            resp.sendRedirect("index.jsp?error=server_error");
        }
    }
}
