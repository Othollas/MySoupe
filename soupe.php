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



include 'template/header.php';

if($find == true){ ?>
<h1 style="font-size:40px; text-align:center; margin:50px 0"><?= $data['name'] ?></h1>
<div id="soupe">

<div id="soupePresentation">
    

    <img src="./img/recipes/<?= $data["picture"] ?>" alt="">


    <div class="data">
        <p><img src="./src/globe.png" alt=""><?= $data['continent'] ?></p>
        <p><img src="./src/difficulty.png" alt=""><?= $data['difficulty'] ?></p>
        <p><img src="./src/seasons.png" alt=""><?= $data['season'] ?></p>
    </div>
</div>


<div id="prepare_ingredient">

    <div class="preparation">
        
        <p>
         <img src="./src/sablier.png" alt=""><?= $data['prepare_time'] +
                $data['cook_time'] . " Mn : "  ?>   <img src="./src/ingredient.png" alt=""> <?= $data['prepare_time'] . " + " ?> <img src="./src/cuisson.png" alt=""> <?= $data['cook_time'] ?> 
        </p>
    </div>

    <div class="ingredient">
        <h2>Ingredient</h2>
        <div>
            <ul>
                <li>ingredient</li>
                <li>ingredient</li>
                <li>ingredient</li>
                <li>ingredient</li>
                <li>ingredient</li>
                <li>ingredient</li>
                <li>ingredient</li>
                <li>ingredient</li>
                <li>ingredient</li>
                <li>ingredient</li>
                <li>ingredient</li>
            </ul>
        </div>
    </div>


</div>
</div>
    <?php } else { ?>
    <div id="introuvable">
        <h1>Soupe introuvable</h1>
    </div>
    <?php }


?>


<a href="index.php">retour</a>



<?php include 'template/footer.php' ?>