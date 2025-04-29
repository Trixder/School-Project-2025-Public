<?php
$email = '';
$password = '';

//get data from form

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];
} else {
    echo "Invalid request method.";
    return;
}

//Starts the connection with the db
require "ServerInfo.php";

$conn = new mysqli($servername, $dbUsername, $dbPassword, $dbname);
$conn->set_charset("utf8mb4");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

//Prepairs query to update token
$sqlUpdate = "UPDATE users SET Token = ?, TokenCreation = ? WHERE Email = ? LIMIT 1";
$stmtUpdate = mysqli_prepare($conn, $sqlUpdate);

//Check if email exists in the db and grabs some info
$sqlSelect = "SELECT Username, Password FROM users WHERE Email = ? LIMIT 1";
$stmtSelect = mysqli_prepare($conn, $sqlSelect);

if ($stmtSelect === false) {
    die('MySQL prepare error: ' . mysqli_error($conn));
}

mysqli_stmt_bind_param($stmtSelect, 's', $email);

mysqli_stmt_execute($stmtSelect);

mysqli_stmt_store_result($stmtSelect);

//Checks password
$resultUsername = "";
$resultPassword = "";

if (mysqli_stmt_num_rows($stmtSelect) > 0) {
    mysqli_stmt_bind_result($stmtSelect, $resultUsername, $resultPassword);
    
    //verifies the password
    while (mysqli_stmt_fetch($stmtSelect)) {
        if (!password_verify($password, $resultPassword)) {
            echo "Incorect email or password";
        } else {
            session_start();

            //should store the data
            $_SESSION['user-token'] = bin2hex(random_bytes(32));
            $_SESSION['username'] = $resultUsername;

            //Stores token in db
            $currentTime = date('Y-m-d H:i:s');
            mysqli_stmt_bind_param($stmtUpdate, 'sss', $_SESSION['user-token'], $currentTime, $email);

            if (!mysqli_stmt_execute($stmtUpdate)) {
                echo "Error: " . mysqli_error($conn);
                mysqli_stmt_close($stmtUpdate);
                $conn->close();
                return;
            }

            mysqli_stmt_close($stmtUpdate);

            setcookie("user-token", $_SESSION['user-token'], time() + 2592000, "/");
            setcookie("username", $resultUsername, time() + 2592000, "/");
            
            header("Location: ../index.html");
            echo "Login successfull";
        }
    }
}

mysqli_stmt_close($stmtSelect);

//closes conection to the db
$conn->close();
?>