package com.example.e_commerproject.Controller;

//import com.example.e_commerproject.entity.User;
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
import org.hibernate.Transaction;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;

@WebServlet(name = "register", value = "/registerServlet")
public class Register extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve user input from the form

        String userName = req.getParameter("userName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String role = req.getParameter("role"); // Customer or Admin

        // Hash the password for security
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt(12));

        // Retrieve Hibernate session factory from servlet context
        ServletContext context = req.getServletContext();
        SessionFactory sessionFactory = (SessionFactory) context.getAttribute("SessionFactory");

        if (sessionFactory == null) {
            System.out.println(" SessionFactory is null. Check Hibernate initialization.");
            resp.sendRedirect("Register2.jsp?error=server");
            return;
        }

        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();

            // Create new user entity
            User newUser = new User();
            newUser.setUserName(userName);
            newUser.setEmail(email);
            newUser.setPassword(hashedPassword); // Store hashed password
            newUser.setRole(role);

            session.save(newUser);
            transaction.commit();

            System.out.println("✅ User Registered Successfully: " + email);

            // Set session attributes for logged-in user
            HttpSession httpSession = req.getSession();
            httpSession.setAttribute("user", newUser);

            // Redirect to dashboard.jsp after successful registration
            resp.sendRedirect("dashboard.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("Register2.jsp?error=failed");
        }
    }
}
