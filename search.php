<!-- realisé avec https://www.youtube.com/watch?v=ldmS0N7cIrk -->

<?php
    @$keywords=$_GET["keywords"];
    @$valider=$_GET["valider"];
    if(isset($valider) && !empty(trim($keywords))){
        $words=explode(" ", trim($keywords));
        
         for($i=0; $i<count($words); $i++){
            $kw[$i]="name like '%" .$words[$i]. "%'";
         }
        include("connexion.php");
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
    <title>Barre de recherche</title>
    <link rel="stylesheet" href="style.css">
    <link href="src/styleSearch.css" rel="stylesheet"></link>
</head>
<body>
    <form id="formSearch" name="fo" method="get" action="" >
        <input class="textSearch" type="text" name="keywords" placeholder="Mots-clés"/>
        <input class="btnSubmit" type="submit" name="valider" value="Rechercher" />
    </form>

</body>
</html>


<!-- ici nous avons donc crée une recherche avec un pour objectif de trouver des nom de recette selon lla recherche

pour ça j'ai crée un input avec un name keyword afin de recuperer la recherche, le @placer avant sert à ne pas initialiser la variable keyword et la variable submit.

puis j'ai declarer avec un isset si ma variable submit etait declaré et si elle n'etait pas nul alors, je pouvais à ce moment me connecter à la base de donnée.

j'ai utilisé la methode trim afin de supprimer les espaces pour eviter les injections sql. 

pour eviter l'injection sql j'ai aussi fait ma recherche hors de ma requete.

je prepare ma requete et la place dnas ma variable de resultat

j'execute le resultat.

je met les resultats dans une liste ordonnée, je genere aussi le lien. 
 -->
