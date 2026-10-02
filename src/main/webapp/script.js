let images = [
    "images/farm1.jpg",
    "images/farm2.jpg",
    "images/farm3.jpg",
    "images/farm4.jpg"
];

let current = 0;

setInterval(function() {
    let slider = document.getElementById("slider");
    if (slider) {
        current++;
        if (current >= images.length) {
            current = 0;
        }
        slider.src = images[current];
    }
}, 3500);

document.addEventListener("DOMContentLoaded", function() {
    let farm = document.getElementById("farm");
    if (farm) {
        farm.addEventListener("change", function() {
            let details = document.getElementById("farmDetails");
            if (!details) return;
            if (this.value == "Green Farm") {
                details.innerHTML = "🌱 Green Farm is famous for organic vegetables and fresh fruits.";
            } else if (this.value == "Nature Farm") {
                details.innerHTML = "🌿 Nature Farm offers beautiful landscapes and village experiences.";
            } else {
                details.innerHTML = "🥬 Organic Farm specializes in chemical-free farming and healthy products.";
            }
        });
    }
});

function imageHover() {
    let slider = document.getElementById("slider");
    if (slider) {
        slider.style.borderColor = "#d9911e";
        slider.style.transform = "scale(1.02)";
    }
}

function imageNormal() {
    let slider = document.getElementById("slider");
    if (slider) {
        slider.style.borderColor = "#ffffff";
        slider.style.transform = "scale(1)";
    }
}

function validateForm() {
    let nameElem = document.getElementById("name");
    let emailElem = document.getElementById("email");
    let farmElem = document.getElementById("farm");
    let descElem = document.getElementById("description");

    if (!nameElem || !emailElem || !farmElem) return true;

    let name = nameElem.value.trim();
    let email = emailElem.value.trim();
    let description = descElem ? descElem.value.trim() : "";

    if (name === "") {
        alert("Name is required");
        return false;
    }
    if (!/^[A-Za-z ]+$/.test(name)) {
        alert("Name should contain only letters");
        return false;
    }
    if (name.length < 3) {
        alert("Name should contain minimum 3 characters");
        return false;
    }
    if (email === "") {
        alert("Email is required");
        return false;
    }
    if (!email.includes("@")) {
        alert("Enter valid email");
        return false;
    }
    if (description.length > 0 && description.length < 5) {
        alert("Description should contain minimum 5 characters");
        return false;
    }

    return true;
}

function registerBooking() {
    let nameElem = document.getElementById("name");
    let emailElem = document.getElementById("email");
    let farmElem = document.getElementById("farm");
    let descElem = document.getElementById("description");

    let name = nameElem ? nameElem.value : "";
    let email = emailElem ? emailElem.value : "";
    let farm = farmElem ? farmElem.value : "";
    let description = descElem ? descElem.value : "";

    let regNo = "AGRO" + Math.floor(Math.random() * 10000);

    document.cookie = "username=" + encodeURIComponent(name) + "; path=/";
    document.cookie = "farm=" + encodeURIComponent(farm) + "; path=/";
    document.cookie = "regno=" + regNo + "; path=/";

    let bookingInfo = document.getElementById("bookingInfo");
    if (bookingInfo) {
        let booking = document.createElement("div");
        booking.className = "user-card";
        booking.innerHTML = `
            <h3>Booking Confirmed</h3>
            <p><b>Registration ID:</b> ${regNo}</p>
            <p><b>Name:</b> ${name}</p>
            <p><b>Email:</b> ${email}</p>
            <p><b>Farm:</b> ${farm}</p>
            <p><b>Description:</b> ${description}</p>
            <hr>
        `;
        bookingInfo.appendChild(booking);
    }

    return true;
}

function addUser() {
    let nameElem = document.getElementById("name");
    let phoneElem = document.getElementById("phone");
    let locElem = document.getElementById("location");

    let name = nameElem ? nameElem.value.trim() : "";
    let phone = phoneElem ? phoneElem.value.trim() : "";
    let location = locElem ? locElem.value.trim() : "";

    if (name === "" || phone === "" || location === "") {
        alert("All fields are required");
        return false;
    }
    if (name.length < 3) {
        alert("Name must be at least 3 characters");
        return false;
    }
    if (phone.length !== 10) {
        alert("Phone must be 10 digits");
        return false;
    }

    localStorage.setItem("agrotravel_currentUser", name);
    return true;
}
