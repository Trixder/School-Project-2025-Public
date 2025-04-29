function TokenValidation() {
    fetch('/PHP/Validation.php')
    .then(response => response.text())
    .then(data => {
        if (data == "expired") window.location.replace("../HTML/login.html");
    })
    .catch(error => {
        console.error("Error:", error);
    });
};