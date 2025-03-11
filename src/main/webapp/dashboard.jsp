<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Sales Dashboard</title>
    <link rel="stylesheet" href="assets/css/dashboard.css">
</head>
<body>
<header>
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

<section class="hero">
    <h2>Find Your Dream Car</h2>
    <div class="filters">
        <select id="brandFilter">
            <option value="">Select Brand</option>
            <option value="Toyota">Toyota</option>
            <option value="Honda">Honda</option>
            <option value="BMW">BMW</option>
        </select>

        <select id="modelFilter">
            <option value="">Select Model</option>
            <option value="SUV">SUV</option>
            <option value="Sedan">Sedan</option>
            <option value="Truck">Truck</option>
        </select>
        <button class="btn" onclick="filterCars()">View Details</button>
    </div>
</section>

<section class="car-list" id="carList">
    <!-- Cars will be dynamically added here -->
<%--    <image src="src/main/webapp/assets/images/ajoy-joseph-KnbwsTb72U8-unsplash.jpg"></image>--%>
</section>

<script src="assets/js/dashboard.js"></script>
</body>
</html>
