<?php 
session_start();

echo "$_COOKIE[token]";

include_once "./template/header.php";



?>

<h1>PROFIL DE : <?= $_SESSION["existUser"]["nom"] ?></h1>
<p>Email : <?= $_SESSION["existUser"]["email"]?></p>
<p></p>