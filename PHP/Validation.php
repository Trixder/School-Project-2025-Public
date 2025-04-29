<?php
session_start();

if (isset($_COOKIE['user-token'])) {
    $userToken = $_COOKIE['user-token'];

    //Starts the connection with the db
    require "ServerInfo.php";

    $conn = new mysqli($servername, $dbUsername, $dbPassword, $dbname);
    $conn->set_charset("utf8mb4");

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $sqlSelect = "SELECT TokenCreation FROM users WHERE Username = ? AND Token = ? LIMIT 1";
    $stmtSelect = mysqli_prepare($conn, $sqlSelect);

    if ($stmtSelect === false) {
        die('MySQL prepare error: ' . mysqli_error($conn));
    }

    mysqli_stmt_bind_param($stmtSelect, 'ss', $_SESSION['username'], $_SESSION['user-token']);

    mysqli_stmt_execute($stmtSelect);

    mysqli_stmt_store_result($stmtSelect);

    $tokenCreationResult = "";

    if (mysqli_stmt_num_rows($stmtSelect) > 0) {
        mysqli_stmt_bind_result($stmtSelect, $tokenCreationResult);
        
        //checks if the token is still valid
        while (mysqli_stmt_fetch($stmtSelect)) {
            $current_timestamp = time();
            $past_timestamp = strtotime($tokenCreationResult);

            $time_diff = $current_timestamp - $past_timestamp;

            if ($time_diff > 2592000) {
                session_unset();
                session_destroy();
        
                setcookie("user-token", "", time() - 2592000, "/");
                setcookie("username", "", time() - 2592000, "/");
        
                echo "expired";
            } else {
                echo "ok";
            }
        }
    } else {
        session_unset();
        session_destroy();

        setcookie("user-token", "", time() - 2592000, "/");
        setcookie("username", "", time() - 2592000, "/");

        echo "expired";
    }

    mysqli_stmt_close($stmtSelect);

    //closes conection to the db
    $conn->close();
} else {
    echo "expired";
}
?>
