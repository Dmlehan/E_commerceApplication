<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 350px;
            text-align: center;
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
            background-color: blue;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: darkblue;
        }

        .error-message, .success-message {
            color: white;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
        }

        .error-message {
            background-color: red;
        }

        .success-message {
            background-color: green;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Register</h2>
    <%
        String errorMessage = request.getParameter("error");
        String successMessage = request.getParameter("success");

        if (errorMessage != null) {
            String message = "";
            if (errorMessage.equals("password_mismatch")) {
                message = "Passwords do not match!";
            } else if (errorMessage.equals("registration_failed")) {
                message = "Registration failed. Please try again.";
            }
    %>
    <div class="error-message"><%= message %></div>
    <%
        }

        if (successMessage != null && successMessage.equals("registration_successful")) {
    %>
    <div class="success-message">Registration successful! You can now <a href="index.jsp">Login</a> </div>
    <%
        }
    %>
    <form action="registerServlet" method="post">
        <input type="text" name="name" placeholder="Full Name" required>
        <input type="email" name="email" placeholder="Email" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="password" name="confirm_password" placeholder="Confirm Password" required>
        <button type="submit">Register</button>
    </form>
    <p>Already have an account? <a href="index.jsp">Login here</a></p>
</div>

</body>
</html>
