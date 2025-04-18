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
import org.hibernate.query.Query;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;

@WebServlet(name = "login", value = "/loginServlet")


public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        ServletContext context = req.getServletContext();
        SessionFactory sessionFactory = (SessionFactory) context.getAttribute("SessionFactory");

        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();

            String hql = "FROM User WHERE email = :email";
            Query<User> query = session.createQuery(hql, User.class);
            query.setParameter("email", email);
            User user = query.uniqueResult();

            session.getTransaction().commit();
            System.out.println("loginservlert");
            if (user != null && BCrypt.checkpw(password, user.getPassword())) {
                HttpSession httpSession = req.getSession();
                httpSession.setAttribute("userId", user.getUserId());
                httpSession.setAttribute("userRole", user.getRole());

                // Redirect based on role
                if ("Admin".equalsIgnoreCase(user.getRole())) {
                    resp.sendRedirect("Administrator_Features/AdminDashboard.jsp?userId=" + user.getUserId());
                } else {
                    resp.sendRedirect("Customer_Features/CustomerDashBoard.jsp?userId=" + user.getUserId());
                }
            } else {
                resp.sendRedirect("login.jsp?error=invalid");
            }

        } catch (Exception e) {
            resp.sendRedirect("login.jsp?error=serverError");
            e.printStackTrace();
        }
    }
}
