document.addEventListener("DOMContentLoaded", function () {
    loadCars();
});

function loadCars() {
    const carList = document.getElementById("carList");
    carList.innerHTML = "Loading cars...";

    fetch("GetCarsServlet") // Servlet that returns JSON array of cars
        .then(response => response.json())
        .then(cars => {
            carList.innerHTML = "";

            if (cars.length === 0) {
                carList.innerHTML = "<p>No cars found.</p>";
                return;
            }

            cars.forEach(car => {
                const carCard = document.createElement("div");
                carCard.classList.add("car-card");
                carCard.innerHTML = `
                    <img src="${car.img}" alt="${car.name}">
                    <h3>${car.name}</h3>
                    <p>Price: ${car.price}</p>
                    <button class="btn">Buy Now</button>
                `;
                carList.appendChild(carCard);
            });
        })
        .catch(error => {
            console.error("Error loading cars:", error);
            carList.innerHTML = "<p>Error loading cars.</p>";
        });
}

.0