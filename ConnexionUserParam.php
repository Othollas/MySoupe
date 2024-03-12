<?php 
@$sql = "INSERT INTO userTest(prenom, nom, pseudo, mot_de_passe, email)VALUES(:prenom, :nom, :pseudo, :password, :email)";
$query = $user->prepare($sql);
$query->bindValue(":prenom", $_POST["prenom"], pdo::PARAM_STR);
$query->bindValue(":nom", $_POST["nom"], pdo::PARAM_STR);
$query->bindValue(":pseudo", $_POST["pseudo"], pdo::PARAM_STR);
$query->bindValue(":password", $password, pdo::PARAM_STR);
$query->bindValue(":email", $_POST["email"], pdo::PARAM_STR);
$query->execute();
?>