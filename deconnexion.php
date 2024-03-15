<?php 
session_start();

unset($_SESSION["existUser"]);

header("Location: index.php")
?>