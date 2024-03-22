<!-- je veux ici mettre  le code pour les commentaires des soupes -->

<?php
// je commence une session et je verifier si il y a un utilisateur 
session_start();
if (isset($_SESSION["existUser"]) && !empty($_POST["text"])) {
    if (isset($_POST["text"])) {
        $_SESSION["comment"]["text"] = $_POST["text"];
        $userid =  $_SESSION["comment"]["id_user"];
        $soupeid =  $_SESSION["comment"]["id_soup"];
        $comment_text =  $_SESSION["comment"]["text"];

        $commentaire = array($userid, $soupeid, $comment_text);
        var_dump($commentaire);
        include "./connexionBDD.php";
        $insert = $pdo->prepare("insert into commentaire (id_user, id_soup, text_comment)VALUES(?,?,?)");
        $insert->execute($commentaire);
    }
} else {
    $_SESSION["erreur"] = "il faut mettre un message ou se connecter";
}

header("Location: ./soupe.php?id={$_SESSION["comment"]["id_soup"]}");
// si il y a un utilisateur je lui laisse la possibilité de mettre un commentaire

// je prend le commentaire et je le l'envoi dans la base de donnée avec identifiant du connecté et le commentire (voir la possibilité de modifier le commentaire une fois)

// J'affiche le commentaire avec une date le pseudo sur la recette choisi



?>