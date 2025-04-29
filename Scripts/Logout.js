function Logout() {
    fetch('/PHP/Logout.php')
        .then(response => response.text())
        .then(data => {
            console.log(data);
            if (data == "logout") window.location.replace("login.html");
        })
        .catch(error => {
            console.error("Error:", error);
        });
};