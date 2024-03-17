<?php 
include "./connexionBDD_img.php";
$req = $pdo->prepare("SELECT * FROM img_test WHERE id=? limit 1");
$req->setFetchMode(PDO::FETCH_ASSOC);
$req->execute(array($_GET["id"]));
$tab=$req->fetchAll();
echo $tab[0]["bin"];
?>