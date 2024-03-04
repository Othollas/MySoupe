<?php

@$keywords = $_GET["keywords"];
@$valider = $_GET["valider"];
if (isset($valider) && !empty(trim($keywords))) {
    $words = explode(" ", trim($keywords));

    for ($i = 0; $i < count($words); $i++) {
        $kw[$i] = "name like '%" . $words[$i] . "%'";
    }
    include("./connexion.php");
    $res = $pdo->prepare("select name,id from soup where " . implode(" and ", $kw));
    $res->setFetchMode(PDO::FETCH_ASSOC);
    $res->execute();
    $tab = $res->fetchAll();
    $afficher = "oui";
}

?>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css?ts<?= time() ?>">
    <title>MySoupe</title>
</head>

<body>
    <header>
        <section id="titleConnect">
            <div class="logoTitle">
            <img src="./src/logo_soup.png" alt="">
            <h1><a href="index.php">MySoupe</a></h1>
            <a href="" class="connect">Connexion</a>
        </div>

            <!-- ici mettre un javascript pour afficher la connexion une fois cliquer -->

            <form action="./" method="POST" class="hiddenConnect">
                <input type="email" name="" id="" placeholder="email">
                <input type="password" name="" id="" placeholder="mot de passe">
                <input type="submit" value="envoyer">
            </form>
        </section>

        <section id="search">
            <form id="formSearch" name="fo" method="get" action="../MySoupe/recherche.php">
                <input class="textSearch" type="text" name="keywords" placeholder="Mots-clés" />
                <input class="btnSubmit" type="submit" name="valider" value="Rechercher" />
            </form>

            <ul>
                <li><a href="add_soupe.php">Ajouter une recette </a></li>
                <li><a href="ingredient.php">Ingredient</a></li>
                <li><a href="">Contact</a></li>
            </ul>
        </section>
    </header>
    <main>