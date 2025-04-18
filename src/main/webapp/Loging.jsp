
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: url(../webapp/assets/images/background.webp) no-repeat center center/cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-container {
            background: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px gray;
            width: 300px;
            text-align: center;
        }
        input, button, select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
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
            color: blue;
            text-decoration: none;
        }

        .signup-link:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>


<div class="form-container">
    <h2>Login</h2>
    <form action="loginServlet" method="post">
        <input type="email" name="email" placeholder="Email" required>
        <input type="password" name="password" placeholder="Password" required>

        <select name="userType" required>
            <option value="">Select Role</option>
            <option value="customer">Customer</option>
            <option value="admin">Admin</option>
        </select>
        <button type="submit">Login</button>
    </form>

    <a href="signup.jsp" class="signup-link">Don't have an account? Sign up here</a>

</div>
</body>
</html>





</body>
</html>
