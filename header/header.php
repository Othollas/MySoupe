<?php 

@$keywords=$_GET["keywords"];
@$valider=$_GET["valider"];
if(isset($valider) && !empty(trim($keywords))){
    $words=explode(" ", trim($keywords));
    
     for($i=0; $i<count($words); $i++){
        $kw[$i]="name like '%" .$words[$i]. "%'";
     }
    include("./connexion.php");
    $res=$pdo->prepare("select name,id from soup where ".implode(" and ", $kw ));
    $res->setFetchMode(PDO::FETCH_ASSOC);
    $res->execute();
    $tab=$res->fetchAll();
    $afficher="oui";
}

?>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>MySoupe</title>
</head>

<body>
    <header>
        <section>
            <h1><a href="index.php">MySoupe</a></h1>

           

            <form action="./" method="POST">
                <input type="email" name="" id="" placeholder="email">
                <input type="password" name="" id="" placeholder="mot de passe">
                <input type="submit" value="envoyer">
            </form>
        </section>

        <section id="search">
            <form id="formSearch" name="fo" method="get" action="../MySoupe/recherche.php" >
        <input class="textSearch" type="text" name="keywords" placeholder="Mots-clés"/>
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