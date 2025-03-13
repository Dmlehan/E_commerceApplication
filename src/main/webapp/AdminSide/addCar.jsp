<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Car</title>
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
            background-color: #28a745;
            color: white;
            padding: 12px;
            border: none;
            cursor: pointer;
            width: 100%;
            font-size: 18px;
            border-radius: 5px;
        }
        .btn:hover {
            background-color: #218838;
        }
    </style>
    <script>
        function validateForm() {
            let name = document.forms["carForm"]["name"].value;
            let price = document.forms["carForm"]["price"].value;
            if (name == "" || price == "") {
                alert("All fields must be filled out");
                return false;
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h2>Add New Car</h2>
    <form name="carForm" action="AddCarServlet" method="post" onsubmit="return validateForm()">
        <div class="form-group">
            <label for="name">Car Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter car name">
        </div>
        <div class="form-group">
            <label for="brand">Brand:</label>
            <input type="text" id="brand" name="brand" placeholder="Enter brand name">
        </div>
        <div class="form-group">
            <label for="price">Price:</label>
            <input type="number" id="price" name="price" placeholder="Enter price">
        </div>
        <div class="form-group">
            <label for="category">Category:</label>
            <select id="category" name="category">
                <option value="SUV">SUV</option>
                <option value="Sedan">Sedan</option>
                <option value="Truck">Truck</option>
            </select>
        </div>
        <button type="submit" class="btn">Add Car</button>
    </form>
</div>
</body>
</html>
