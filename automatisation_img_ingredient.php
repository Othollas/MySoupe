<?php

//on a recupere un tableau en plusieurs dimension, maintenant je peux prendre les noms et les comparer entre eux avec des boucles afin de recuperer et de trier les fichier afin de crée un upload plus facile.

include_once "./connexionBDD.php";
// echo "<pre>";
// var_dump($_FILES) . "<br>";
// echo "</pre>";
// Si j'ai des données dans l'envois des fichier j'execute mon programme
if (isset($_POST["valider"])) {
    // je prepare l'id et le le nom de la photo de l'ingredient pour comparaison
    $req = $pdo->prepare("Select id,picture from ingredient");
    $req->execute();
    $ingredients = $req->fetchAll(PDO::FETCH_ASSOC);
    // je boucle dans les images recuperer et je prend le nom pour comparaison
    foreach ($_FILES["images"]["name"] as $coucou) {
        //je boucle dans l'ingredient pour avoir le nom de l'ingredient et  son id pour comparaison
        foreach ($ingredients as $ingredient) {
            //je teste pour savoir si il y a un match entre la photo et un des fichier uploader
            if ($coucou == $ingredient["picture"]) {
                // je stocke l'id de l'ingredient
                $id = $ingredient["id"];
                //je teste pour savoir quel est l'index de la photo voulu
                for ($i = 0; $i < count($_FILES["images"]["name"]); $i++) {
                    if ($_FILES["images"]["name"][$i] == $ingredient["picture"]) {
                        // je stocke les information que je veux envoyer dans la base de donnée
                        $nom = $_FILES["images"]["name"][$i];
                        $size = $_FILES["images"]["size"][$i];
                        $type = $_FILES["images"]["type"][$i];
                        $bin = file_get_contents($_FILES["images"]["tmp_name"][$i]);
                        $tableau = array($id, $nom, $size, $type, $bin);
                        // echo $id . "     " . $nom . "" . $size . "" . $type  . "<br>";
                        //je me connecte à la base de donnée des images stockés
                        $dns = 'mysql:host=localhost;dbname=img';
                        $pdo_img = new PDO($dns, 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
                        $req_id = $pdo_img->prepare("Select id from img_test_ingredient");
                        // $req_id->setFetchMode(PDO::FETCH_ASSOC);
                        $req_id->execute();
                        //je recupere l'id de la base de donnée avec un fetch 
                        $id_all_in_base = $req_id->fetchAll();
                        // echo "<pre>";
                        // var_dump($id_all_in_base);
                        // echo "</pre>";
                        $exist = true;
                        for ($i = 0; $i < count($id_all_in_base); $i++) {
                            $comparaison = json_encode($id_all_in_base[$i]["id"]);
                            echo "je compare le n° $comparaison avec $id <br>";
                            //je verifie que l'id de la soupe n'existe pas dans la base de donnée de l'image
                            if ($comparaison == $id) {
                                $exist = false;
                            }
                        }
                        if ($exist) {
                            //je prepare la requete avec les informations de la recette qui matche 
                            $req_finale = $pdo_img->prepare("INSERT INTO img_test_ingredient(id, nom, taille, type, bin)VALUES(?, ?, ?, ?, ?)");
                            // j'envois les information de la photo upbloader dans la base de donnée avec l'identifiant de 
                            $req_finale->execute($tableau);
                            var_dump($req_finale);
                            if (isset($req_finale)) {
                                echo "l'image : $id, à bien été envoyer dans la base de donnée <br>";
                            }
                        }
                    }
                }
            }
        }
    }
}







?>


<!-- /on recupere les fichier uploader en multiple avec le champs multiple, on le recuere dans un tableau directement dans le name -->
<form action="" method="post" enctype="multipart/form-data">
    <input type="file" name="images[]" id="images" multiple>
    <input type="submit" value="Valider" name="valider">