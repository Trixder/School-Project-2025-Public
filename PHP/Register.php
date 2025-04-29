<?php
$username = '';
$email = '';
$password = '';
$confirmPassword = '';

//get data from form

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $confirmPassword = $_POST['confirm-password'];

    $username = htmlspecialchars($username);
    $email = filter_var($email, FILTER_SANITIZE_EMAIL);
} else {
    echo "Invalid request method.";
    return;
}

//validates user data

if ($password != $confirmPassword) {
    echo "Passwords dont match";
    return;
} else if (strlen($username) == 0) {
    echo "Missing username";
    return;
} else if (strlen($email) == 0) {
    echo "Missing email";
    return;
} else if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo "Invalid email format.";
    return;
}else if (strlen($password) == 0) {
    echo "Missing password";
    return;
}

//Starts the connection with the db
require "ServerInfo.php";

$conn = new mysqli($servername, $dbUsername, $dbPassword, $dbname);
$conn->set_charset("utf8mb4");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}


//Check if email exists in the db

$sqlSelect = "SELECT Email FROM users WHERE Email = ? OR Username = ? LIMIT 2";
$stmtSelect = mysqli_prepare($conn, $sqlSelect);

if ($stmtSelect === false) {
    die('MySQL prepare error: ' . mysqli_error($conn));
}

mysqli_stmt_bind_param($stmtSelect, 'ss', $email, $username);

mysqli_stmt_execute($stmtSelect);

mysqli_stmt_store_result($stmtSelect);

if (mysqli_stmt_num_rows($stmtSelect) > 0) {
    echo "Email or Username is already being used!";
    $conn->close();
    mysqli_stmt_close($stmtSelect);
    return;
}

mysqli_stmt_close($stmtSelect);

//Inserts new record into the db

$sqlInsert = "INSERT INTO users (Username, Email, Password) VALUES (?, ?, ?)";
$stmtInsert = mysqli_prepare($conn, $sqlInsert);

if ($stmtInsert === false) {
    die('MySQL prepare error: ' . mysqli_error($conn));
}

$password = password_hash($password, PASSWORD_DEFAULT);

//inserts data into the query
mysqli_stmt_bind_param($stmtInsert, 'sss', $username, $email, $password);

if (mysqli_stmt_execute($stmtInsert)) {
    header("Location: ../index.html");
    echo "Registration was successfully completed";
} else echo "Error: " . mysqli_error($conn);

mysqli_stmt_close($stmtInsert);

//closes conection to the db
$conn->close();
?>