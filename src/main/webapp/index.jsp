<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Sales</title>

    <!-- Internal CSS -->

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
            padding-bottom: 60px;
        }


        .btn {
            background-color: blue;
            color: white;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        /* Background Video */
        .video-container
        {

            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100vh;
            overflow: hidden;
            z-index: -1;
        }

        .hero {
            text-align: center;
            background: rgba(0, 0, 0, 0.6);
            color: white;
            padding: 50px 0;
            position: relative;
            top: 0;
            width: 100%;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.7);
        }
        .filters {
            margin-top: 15px;
        }
        select, .btn {
            padding: 10px;
            margin: 5px;
        }
        .car-list {
            margin: 20px auto;
            padding: 20px;
            max-width: 800px;
            background: white;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .car-item {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        .car-item:last-child {
            border-bottom: none;
        }
        /* Footer */
        .video {
            position: absolute;
            width: 100%;
            height: auto;
            bottom: 0;
            z-index: -1;
        }
        #welcome {
            z-index: 100;
            color: white;
            position: relative; /* Required for z-index to work */
            text-align: center;
            margin-top: 150px;
            font-size: 2em;
            padding: 20px;
            border: white 5px;
        }

    </style>
</head>
<body>

<%@include file="includes/nav.jsp"%>

<video autoplay=""muted=""loop="" class="video">
    <source src="https://digitalassets.tesla.com/tesla-contents/video/upload/f_auto,q_auto/Homepage-Test_Drive-NA-Desktop.mp4"/>
</video>

<h1 id="welcome">Welcome to Car Sales </h1>


<%@include file="includes/footer.jsp"%>

<%--<!-- Internal JavaScript -->--%>
<%--<script>--%>
<%--    function filterCars() {--%>
<%--        let brand = document.getElementById("brandFilter").value;--%>
<%--        let model = document.getElementById("modelFilter").value;--%>
<%--        let carList = document.getElementById("carList");--%>

<%--        carList.innerHTML = "<p>Loading...</p>"; // Show loading message--%>

<%--        fetch("GetCarsServlet?brand=" + brand + "&model=" + model)--%>
<%--            .then(response => response.json())--%>
<%--            .then(data => {--%>
<%--                carList.innerHTML = ""; // Clear previous data--%>
<%--                if (data.length === 0) {--%>
<%--                    carList.innerHTML = "<p>No cars found.</p>";--%>
<%--                } else {--%>
<%--                    data.forEach(car => {--%>
<%--                        carList.innerHTML += `<div class="car-item">--%>
<%--                            <h3>${car.name}</h3>--%>
<%--                            <p>Brand: ${car.brand}</p>--%>
<%--                            <p>Model: ${car.model}</p>--%>
<%--                        </div>`;--%>
<%--                    });--%>
<%--                }--%>
<%--            })--%>
<%--            .catch(error => {--%>
<%--                console.error("Error loading cars:", error);--%>
<%--                carList.innerHTML = "<p>Error loading cars.</p>";--%>
<%--            });--%>
<%--    }--%>
<%--</script>--%>

</body>
</html>
