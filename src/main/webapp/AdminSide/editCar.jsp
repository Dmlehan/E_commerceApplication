<%--<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Car</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('assets/images/background.jpg') no-repeat center center fixed;
            background-size: cover;
            padding: 20px;
        }
        .container {
            width: 50%;
            margin: auto;
            background: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            font-weight: bold;
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        input:focus {
            border-color: #28a745;
            outline: none;
        }
        .btn {
            background-color: #007bff;
            color: white;
            padding: 12px;
            border: none;
            cursor: pointer;
            width: 100%;
            font-size: 18px;
            border-radius: 5px;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
    <script>
        function validateForm() {
            let name = document.forms["editCarForm"]["name"].value;
            let price = document.forms["editCarForm"]["price"].value;
            if (name == "" || price == "") {
                alert("All fields must be filled out");
                return false;
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h2>Edit Car Details</h2>
    <form name="editCarForm" action="EditCarServlet" method="post" onsubmit="return validateForm()">
        <div class="form-group">
            <label for="carId">Car ID:</label>
            <input type="text" id="carId" name="carId" readonly value="<%= request.getParameter("carId") %>">
        </div>
        <div class="form-group">
            <label for="name">Car Name:</label>
            <input type="text" id="name" name="name" value="<%= request.getParameter("name") %>">
        </div>
        <div class="form-group">
            <label for="brand">Brand:</label>
            <input type="text" id="brand" name="brand" value="<%= request.getParameter("brand") %>">
        </div>
        <div class="form-group">
            <label for="price">Price:</label>
            <input type="number" id="price" name="price" value="<%= request.getParameter("price") %>">
        </div>
        <div class="form-group">
            <label for="category">Category:</label>
            <select id="category" name="category">
                <option value="SUV" <%= "SUV".equals(request.getParameter("category")) ? "selected" : "" %>>SUV</option>
                <option value="Sedan" <%= "Sedan".equals(request.getParameter("category")) ? "selected" : "" %>>Sedan</option>
                <option value="Truck" <%= "Truck".equals(request.getParameter("category")) ? "selected" : "" %>>Truck</option>
            </select>
        </div>
        <button type="submit" class="btn">Update Car</button>
    </form>
</div>
</body>
</html>
