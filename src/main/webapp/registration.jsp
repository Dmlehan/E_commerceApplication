<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2/20/2025
  Time: 9:21 PM
  To change this template use File | Settings | File Templates.
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<!-- signup.jsp -->
<!--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Sale - Signup</title>

    <style>
        /* Reset styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: url(../webapp/assets/images/background.webp) no-repeat center center/cover;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background: rgba(0, 0, 0, 0.8);
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            color: white;
            width: 350px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
        }

        h2 {
            margin-bottom: 20px;
            font-size: 24px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #ff9800;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
            transition: 0.3s;
        }

        button:hover {
            background-color: #e68900;
        }

        p {
            margin-top: 15px;
        }

        a {
            color: #ff9800;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2>Sign Up</h2>
    <form id="signupForm" action="RegisterServlet" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <button type="submit">Register</button>
    </form>
    <p>Already have an account? <a href="testing.html">Login here</a></p>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const form = document.getElementById("signupForm");

        form.addEventListener("submit", function (event) {
            const username = document.getElementById("username").value.trim();
            const email = document.getElementById("email").value.trim();
            const password = document.getElementById("password").value;

            if (username === "" || email === "" || password === "") {
                alert("All fields are required.");
                event.preventDefault();
                return;
            }

            // Validate email format
            const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!emailPattern.test(email)) {
                alert("Please enter a valid email.");
                event.preventDefault();
                return;
            }

            // Validate password (minimum 6 characters, 1 number, 1 special character)
            const passwordPattern = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,}$/;
            if (!passwordPattern.test(password)) {
                alert("Password must be at least 6 characters long and include at least 1 number and 1 special character.");
                event.preventDefault();
                return;
            }
        });
    });
</script>

</body>
</html>
