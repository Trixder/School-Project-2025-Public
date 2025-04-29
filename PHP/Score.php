<?php
session_start();
$json = file_get_contents("php://input");
$object = json_decode($json);

if ($object == null) {
    echo "Failed";
    exit;
}

$score = $object->score;
$theme = $object->theme;

//Starts the connection with the db
require "ServerInfo.php";

$conn = new mysqli($servername, $dbUsername, $dbPassword, $dbname);
$conn->set_charset("utf8mb4");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

//TODO 2: check if the theme exits

$sqlChecker = "SELECT Id FROM Themes WHERE Theme = ?";
$stmtChecker = mysqli_prepare($conn, $sqlChecker);

mysqli_stmt_bind_param($stmtChecker, 's', $theme);

mysqli_stmt_execute($stmtChecker);

$result = mysqli_stmt_get_result($stmtChecker);

mysqli_stmt_close($stmtChecker);

if ($result && mysqli_num_rows($result) == 0) {
    echo "Invalid theme";
    exit;
}

//checks if the user has score in this theme
$sqlSelect = "SELECT score.Score FROM users JOIN score ON users.Id = score.userID WHERE score.theme = ?";
$stmtSelect = mysqli_prepare($conn, $sqlSelect);

mysqli_stmt_bind_param($stmtSelect, 's', $theme);

mysqli_stmt_execute($stmtSelect);

$result = mysqli_stmt_get_result($stmtSelect);

mysqli_stmt_close($stmtSelect);

if ($result && mysqli_num_rows($result) > 0) {
    $sqlUpdate = "UPDATE score JOIN users ON users.Id = score.userID SET score.Score = ? WHERE users.Token = ? AND users.Username = ? AND score.Theme = ? LIMIT 1";
    $stmtUpdate = mysqli_prepare($conn, $sqlUpdate);

    mysqli_stmt_bind_param($stmtUpdate, 'ssss', $score, $_SESSION['user-token'], $_SESSION['username'], $theme);

    if (!mysqli_stmt_execute($stmtUpdate)) {
        echo "Error: " . mysqli_error($conn);
        mysqli_stmt_close($stmtUpdate);
        $conn->close();
        return;
    }

    mysqli_stmt_close($stmtUpdate);
} else {
    $sqlUpdate = "INSERT INTO score (userID, score, theme) VALUES ((SELECT Id FROM users WHERE Token = ? LIMIT 1), ?, ?)";
    $stmtUpdate = mysqli_prepare($conn, $sqlUpdate);

    mysqli_stmt_bind_param($stmtUpdate, 'sss', $_SESSION['user-token'],$score, $theme);

    if (!mysqli_stmt_execute($stmtUpdate)) {
        echo "Error: " . mysqli_error($conn);
        mysqli_stmt_close($stmtUpdate);
        $conn->close();
        return;
    }
    mysqli_stmt_close($stmtUpdate);
}
//closes conection to the db
$conn->close();
?>  