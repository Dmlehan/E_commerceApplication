<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 3/12/2025
  Time: 11:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header>
    <style>
        header {
            background: #333;
            color: white;
            padding: 15px;
            text-align: center;
        }

        nav ul {
            list-style: none;
            padding: 0;
        }

        nav ul li {
            display: inline;
            margin: 0 20px;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
            font-size: 18px;
        }

    </style>
    <h1>Car Sales</h1>
    <nav>
        <ul>
            <li><a href="dashboard.jsp">Home</a></li>
            <li><a href="cars.jsp">Cars</a></li>
            <li><a href="register.jsp">Register</a></li>
        </ul>
        <button class="btn">Buy Now</button>
    </nav>
</header>
