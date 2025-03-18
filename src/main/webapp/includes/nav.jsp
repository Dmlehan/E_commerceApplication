<style>
    header {
        background-image: linear-gradient(to left, #000000 0%, #1c1c3ef9 50%, #111111);
        color: white;
        padding: 15px;
        text-align: center;
        position: fixed; /* Fixed at the top */
        top: 0;
        left: 0;
        width: 100%;
        z-index: 1000; /* Ensures it stays above other content */
    }

    nav ul {
        list-style: none;
        padding: 0;
        text-align: center;
        margin: 0;
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

    /* Add padding to the body to prevent content from being hidden behind the fixed header */
    body {
        padding-top: 70px; /* Adjust based on header height */
    }
</style>

<header>
    <h1>Car Sales</h1>
    <nav>
        <ul>
            <li><a href="dashboard.jsp">Home</a></li>
            <li><a href="Customer_Features/CustomerDashBoard.jsp">Cars</a></li>
            <li><a href="Register2.jsp">Register</a></li>
            <li><a href="Loging.jsp">Login</a></li>
        </ul>
    </nav>
</header>