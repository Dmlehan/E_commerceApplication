<%@ page import="com.example.e_commerproject.entity.Product" %>
<%@ page import="com.example.e_commerproject.dao.impl.Productdaoimpl" %>
<%@ page import="com.example.e_commerproject.dao.impl.Categorydaoimpl" %>
<%@ page import="com.example.e_commerproject.entity.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%Connection connection = null;
    try {
        javax.naming.Context ctx = new javax.naming.InitialContext();
        DataSource dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/pool");

        connection = dataSource.getConnection(); // Single connection for both DAO calls

        Categorydaoimpl categorydaoimpl = new Categorydaoimpl();
        List<Category> categories = categorydaoimpl.getAllCategories(connection);

        Productdaoimpl productdaoimpl = new Productdaoimpl();
        List<Product> products = productdaoimpl.getAllProducts(connection);

    } catch (Exception e) {
        e.printStackTrace(); // Handle exception properly in production
    } finally {
        if (connection != null) {
            try {
                connection.close(); // Always close the connection
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }%>

    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    </head>

<body>
<h1>Hi</h1>

<div class="row">
    <% if (!products.isEmpty()) { %>
    <% for (Product product : products) { %>
    <div class="col-md-3 my-3">
        <div class="card h-100">
            <img class="card-img-top" src="product-images/<%= product.getImage() %>" alt="<%= product.getName() %>">
            <div class="card-body product-info">
                <h5 class="card-title"><%= product.getName() %></h5>
                <p class="price">Price: $<%= product.getPrice() %></p>
                <p class="category">Category: <%= product.getCategory() %></p>
                <div class="d-flex justify-content-between">
                    <a href="registration.jsp"
                       class="btn btn-dark">Add to Cart</a>
                </div>
            </div>
        </div>
    </div>
    <% }
    }
    %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>


