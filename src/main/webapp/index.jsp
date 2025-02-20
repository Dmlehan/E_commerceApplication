<%@ page import="com.example.e_commerproject.entity.Product" %>
<%@ page import="com.example.e_commerproject.dao.impl.Productdaoimpl" %>
<%@ page import="com.example.e_commerproject.dao.impl.Categorydaoimpl" %>
<%@ page import="com.example.e_commerproject.entity.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %><%
    Connection connection = null;
    javax.naming.Context ctx = new javax.naming.InitialContext();
    DataSource dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/pool");
    connection = dataSource.getConnection();
    Categorydaoimpl categorydaoimpl = new Categorydaoimpl();
    List<Category> categories = categorydaoimpl.getAllCategories(connection);
    connection = dataSource.getConnection();
    Productdaoimpl productdaoimpl = new Productdaoimpl();
    List<Product> products = productdaoimpl.getAllProducts(connection);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<
    </head>

<body>
</body>
</html>


