<?php

include("./connexionBDD.php");

$tab = array(null);
    $nbr_de_page=0;

@$keywords = $_GET["keywords"];
@$valider = $_GET["valider"];
if (isset($valider) && !empty(trim($keywords))) {
    $words = explode(" ", trim($keywords));

    for ($i = 0; $i < count($words); $i++) {
        $kw[$i] = "name like '%" . $words[$i] . "%'";
    }

    // appel au resultat de la rescherche pour recuperer les nombres de page des resultats afin de definir la pagination
    include("./connexionBDD.php");
    $res = $pdo->prepare("select id from soup where " . implode(" and ", $kw));
    $res->setFetchMode(PDO::FETCH_ASSOC);
    $res->execute();
    $tab = $res->fetchAll();
    $afficher = "oui";
    $tcount = count($tab);

    //Pagination
    @$page = $_GET["page"];
    if (empty($page)) $page = 1;
    $nbr_elements_par_page = 6;
    $nbr_de_page = ceil($tcount / $nbr_elements_par_page);
    $debut = ($page - 1) * $nbr_elements_par_page;


    // Réuperer les enregistrements eux-mêmes et transimition avec les limits
    $res2 = $pdo->prepare("select name,id from soup where " . implode(" and ", $kw) . " order by name limit $debut,$nbr_elements_par_page");
    $res2->setFetchMode(PDO::FETCH_ASSOC);
    $res2->execute();
    $tab2 = $res2->fetchAll();

}?>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/style.css?ts<?= time() ?>">
    <title>MySoupe</title>
</head>

<body>
    <header>
        <section id="titleConnect">
            <div class="logoTitle">
                <a href=""><img src="./src/logo_soup.png" alt=""></a>
                <h1><a href="index.php">MySoupe</a></h1>
            </div>
            
            <?php if(isset($_SESSION["existUser"])){?>
                <div class="existUser">
                    <p>Bienvenue : <b><?=  $_SESSION["existUser"]["prenom"] . " " .  $_SESSION["existUser"]["nom"] ?></b> <a class="connect" href="./deconnexion.php">deconnexion</a></p>
                </div>
                <?php }else{?>
                <div class="connect">
                <a href="./connexion.php">Connexion</a>
            </div>
            <?php } ?>
            

            <!-- ici mettre un javascript pour afficher la connexion une fois cliquer -->

            <form action="./" method="POST" class="hiddenConnect">
                <input type="email" name="email" id="" placeholder="email">
                <input type="password" name="email" id="" placeholder="mot de passe">
                <input type="submit" value="envoyer">
            </form>
        </section>

        <section id="search">
            <form id="formSearch" name="fo" method="get" action="../MySoupe/recherche.php">
                <input class="textSearch" type="text" name="keywords" placeholder="Mots-clés" />
                <input class="btnSubmit" type="submit" name="valider" value="Recherche" />
            </form>
<div id="liste">
            <ul>
               <?php if(isset($_SESSION["existUser"]) && ($_SESSION["existUser"]["est_admin"] == true)){?>
                    <li><a href="add_soupe.php">Ajouter une recette </a></li>
                    <li><a href="addIngredient.php">Ajouter un ingredient </a></li>
                <?php } ?>
                
                <li><a href="ingredient.php">Ingredients</a></li>
                <li><a href="">Contact</a></li>
                <li><a href="">news</a></li>
            </ul>
            </div>
            <div id="icons"></div>
        </section>
    </header>
    <main>