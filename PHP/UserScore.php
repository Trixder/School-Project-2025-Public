<?php
$theme = isset($_GET['theme']) ? $_GET['theme'] : null;

if ($theme == null) exit;

//Get score of all users in specific theme
require "ServerInfo.php";

$conn = new mysqli($servername, $dbUsername, $dbPassword, $dbname);
$conn->set_charset("utf8mb4");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sqlSelect = "SELECT users.Username, score.Score FROM users JOIN score ON users.Id = score.userID WHERE score.theme = ?";
$stmtSelect = mysqli_prepare($conn, $sqlSelect);

mysqli_stmt_bind_param($stmtSelect, 's', $theme);

mysqli_stmt_execute($stmtSelect);

$users = [];
$result = mysqli_stmt_get_result($stmtSelect);

if ($result) {
    $rows = mysqli_fetch_all($result, MYSQLI_ASSOC);

    foreach ($rows as $row) {
        $user = [];
        foreach ($row as $key => $value) {
            $user[$key] = $value;
        }
        $users[] = $user;
    }
}

mysqli_stmt_close($stmtSelect);

header('Content-Type: application/json');

if ($result->num_rows > 0) {
    echo json_encode($users);
} else {
    echo "";
}

$conn->close();
?>