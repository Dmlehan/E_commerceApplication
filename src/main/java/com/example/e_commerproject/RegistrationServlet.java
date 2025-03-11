package com.example.e_commerproject;

import com.example.e_commerproject.entity.User;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;

@WebServlet(name = "registrationServlet", value = "/registration")
public class RegistrationServlet extends HttpServlet {
    private static final Logger logger = LoggerFactory.getLogger(RegistrationServlet.class);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirm_password");

        logger.info("User registration attempt: {}", email);

        if (name == null || email == null || password == null || confirmPassword == null) {
            resp.sendRedirect("index.jsp?error=missing_fields");
            return;
        }

        if (!password.equals(confirmPassword)) {
            resp.sendRedirect("index.jsp?errorpassword=failed");
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
            session.beginTransaction();

            // Hashing the password before storing it
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

            User user = new User();
            user.setUserName(name);
            user.setEmail(email);
            user.setPassword(hashedPassword);
            user.setRole("customer");

            session.save(user);
            session.getTransaction().commit();

            logger.info("User {} registered successfully", email);
            resp.sendRedirect("getAllProductForCustomer.jsp?userId=" + user.getUserId());

        } catch (Exception e) {
            logger.error("Error during user registration", e);
            resp.sendRedirect("index.jsp?error=server_error");
        }
    }
}
