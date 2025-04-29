<?php
session_start();

session_unset();
session_destroy();

setcookie("user-token", "", time() - 2592000, "/");
setcookie("username", "", time() - 2592000, "/");

echo "logout";
?>