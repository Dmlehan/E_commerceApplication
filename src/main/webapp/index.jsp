<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Car Sales - Home</title>
  <link rel="stylesheet" href="assets/css/General.css.css">
</head>
<body>

<!-- Header & Navigation -->
<header>
  <h1>Car Sales</h1>
  <nav>
    <ul>
      <li><a href="index.jsp">Home</a></li>
      <li><a href="dashboard.jsp">Dashboard</a></li>
      <li><a href="cars.jsp">Cars</a></li>
      <li><a href="Registration">Register</a></li>
        <li><a href="add-car.jsp">Add new car </a></li>
      <li><a href="login.jsp">Login</a></li>
        <li><a href="login1.jsp">Login1</a></li>
        <li><a href="Register2.jsp">Register2</a></li>
    </ul>
  </nav>
</header>

<!-- Hero Section -->
<section class="hero">
  <h2>Find Your Dream Car</h2>
  <p>Best Deals on Brand New and Used Cars</p>
  <a href="cars.jsp" class="btn">Browse Cars</a>
</section>

<!-- Featured Cars Section -->
<section class="featured">
  <h2>Featured Cars</h2>
  <div class="car-list">
    <div class="car-card">
<%--      <img src="assets/images/car1.jpg" alt="Car 1">--%>
      <h3>Toyota Corolla</h3>
      <p>Price: $20,000</p>
      <a href="car-details.jsp?id=1" class="btn">View Details</a>
    </div>
    <div class="car-card">
      <img src="assets/images/car2.jpg" alt="Car 2">
      <h3>Honda Civic</h3>
      <p>Price: $22,000</p>
      <a href="car-details.jsp?id=2" class="btn">View Details</a>
    </div>
    <div class="car-card">
      <img src="assets/images/car3.jpg" alt="Car 3">
      <h3>BMW 3 Series</h3>
      <p>Price: $35,000</p>
<%--      <a href="car-details.jsp?id=3" class="btn">View Details</a>--%>
    </div>
  </div>
</section>

<!-- Footer -->
<footer>
  <p>&copy; 2025 Car Sales. All rights reserved.</p>
</footer>

</body>
</html>
