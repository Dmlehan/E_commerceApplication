<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 3/12/2025
  Time: 11:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<style>
header {
    background-image: linear-gradient(to left,#000000 0%,#1c1c3ef9 50%,#111111);
    color: white;
    padding: 15px;
    text-align: center;
    position: relative;
    z-index: 2;
}
nav ul {
    list-style: none;
    padding: 0;
    text-align: center;
}
nav ul li {
    display: inline;
    margin: 0 15px;
}
nav ul li a {
    color: white;
    text-decoration: none;
    font-size: 18px;
}

</style>
<header>
    <h1>Car Sales</h1>
    <nav>
        <ul>
            <li><a href="dashboard.jsp">Home</a></li>
            <li><a href="index.jsp">Cars</a></li>
            <li><a href="Registration.jsp">Register</a></li>
            <li><a href="Loging.jsp">login</a></li>

        </ul>
        <%--        <button class="btn">Buy Now</button>--%>
    </nav>
</header>