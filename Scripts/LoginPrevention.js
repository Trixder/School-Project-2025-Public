function LoginPrevention() {
    fetch('/PHP/Validation.php')
    .then(response => response.text())
    .then(data => {
        if (data == "ok") window.location.replace("../index.html");;
    })
    .catch(error => {
        console.error("Error:", error);
    });
};