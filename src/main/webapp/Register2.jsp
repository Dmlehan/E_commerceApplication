<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 3/12/2025
  Time: 12:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background: url( assets/images/background.webp) no-repeat center center/cover;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .form-container {
        background: rgba(0, 0, 0, 0.8);
        padding: 20px;
        border-radius: 8px;
        text-align: center;
        color: white;
        width: 350px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
    }
    input, button {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    input, button, select {
        display: block;
        width: calc(100% - 20px); /* Adjust width to fit properly */
        padding: 10px;
        margin: 10px auto; /* Centering the elements */
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    button {
        background: blue;
        color: white;
        border: none;
        cursor: pointer;
    }
    button:hover {
        background: darkblue;
    }
    .signup-link {
        display: block;
        margin-top: 10px;
        color: white;
        text-decoration: none;
    }
    .signup-link:hover {
        text-decoration: underline;
        color: orange;
    }
</style>
</head>
    <body>
    <div class="form-container">
        <h2>Sign Up Customer</h2>
        <form action="Registration" method="post">
            <input type="name" name="name" placeholder="Name" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="password" name="confirm_password" placeholder="Confirm Password" required>
            <button type="submit"> <a href="Loging.jsp" class="signup-link">SignUp</a></button>
        </form>
        <a href="Testing2.html" class="signup-link">  Login here</a>
    </div>
<%--   --%>

    </body>
</html>
