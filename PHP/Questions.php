<?php
$theme = isset($_GET['theme']) ? $_GET['theme'] : null;

if ($theme == null) exit;

require "ServerInfo.php";

$conn = new mysqli($servername, $dbUsername, $dbPassword, $dbname);
$conn->set_charset("utf8mb4");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}


$sqlSelect = "SELECT * FROM questions WHERE theme = ?";
$stmtSelect = mysqli_prepare($conn, $sqlSelect);

mysqli_stmt_bind_param($stmtSelect, 's', $theme);

mysqli_stmt_execute($stmtSelect);

$questions = [];
$result = mysqli_stmt_get_result($stmtSelect);

if ($result) {
    $rows = mysqli_fetch_all($result, MYSQLI_ASSOC);

    foreach ($rows as $row) {
        $question = [];
        foreach ($row as $key => $value) {
            if ($key == "answers") {
                $question[$key] = json_decode($value, JSON_UNESCAPED_UNICODE);
            }
            else $question[$key] = $value;
        }
        $questions[] = $question;
    }
}

mysqli_stmt_close($stmtSelect);

header('Content-Type: application/json');


if ($questions > 0) {
    echo json_encode($questions);
}

$conn->close();
?>