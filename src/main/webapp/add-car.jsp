<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New Car</title>
</head>
<body>

<h2>Add New Car</h2>

<form action="AddCarServlet" method="post" enctype="multipart/form-data">
    <label for="carName">Car Name:</label><br>
    <input type="text" id="carName" name="carName" required><br><br>

    <label for="price">Price:</label><br>
    <input type="number" id="price" name="price" required><br><br>

    <label for="image">Upload Car Image:</label><br>
    <input type="file" id="image" name="carImage" accept="image/*" required><br><br>

    <input type="submit" value="Add Car">
</form>

</body>
</html>
