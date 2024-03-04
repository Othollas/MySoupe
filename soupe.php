<?php

$find = false;
$data = array("nom" => "Soupe introuvable");
if (isset($_GET['id'])) {
    $dns = 'mysql:host=localhost;dbname=mysoupe';
    $bd = new PDO($dns, 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));

    $query = $bd->prepare('SELECT * FROM soup WHERE id = :id');
    $query->bindParam(":id", $_GET["id"], PDO::PARAM_INT);
    $query->execute();
    $soupe = $query->fetch();
    if ($soupe) {
        $find = true;
        $data = $soupe;
    }
}



include 'header/header.php'
?>


    <h1><?= $data['name'] ?></h1>
    
    <p><?= $data['continent'] ?></p>
    <p><?= $data['season'] ?></p>
    <p><?= $data['difficulty'] ?></p>
    <p><?= $data['prepare_time'] . " + " . $data['cook_time'] . ' = ' . $data['prepare_time'] +
$data['cook_time']  ?> Mn</p>
    <img src="./img/recipes/<?= $data["picture"] ?>" alt="">
    <a href="index.php">retour</a>
</main>

<?php include 'footer/footer.php' ?>