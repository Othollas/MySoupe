<?php
session_start();
if (!empty($_POST)) {

    if (empty($_POST["nom_ingredient"])) {
        die("il manque le nom de l'ingredient");
    }
    if (empty($_POST["description_ingredient"])) {
        die("il manque la description");
    }
    if (empty($_FILES["picture"])) {
        die("il manque la photo");
    }
    // j'inclue le code qui me permet de hasher la photo et lui donné un identifiant unique.
    include './hash_photo.php';

    // connexion à la base de donnée 
    include_once './connexionBDD.php';
    // je choisi le nom de mon ingredient et r
    $nom_ingredient = strip_tags(strtolower($_POST["nom_ingredient"]));
    // je choisi la description de mon element
    $description_ingredient = strip_tags($_POST["description_ingredient"]);
    // je choisi l'image de mon ingredient
    $ingredient = $pdo->prepare("SELECT * FROM ingredient");
    $ingredient->execute();
    $list_ingredient = $ingredient->fetchAll();

    foreach ($list_ingredient as $ingredient) {
        $lower = strtolower($ingredient["name"]);
        if ($lower == $nom_ingredient) {
            $ingredient_deja_existant = "<span>cet ingredient existe deja</span>";
        }
    }

    var_dump(empty($ingredient_deja_existant));
    var_dump(!empty($_POST["nom_ingredient"]));
    var_dump(!empty($_POST["description_ingredient"]));
    var_dump(!empty($_FILES["picture"]));

    if (empty($ingredient_deja_existant) && !empty($_POST["nom_ingredient"]) && !empty($_POST["description_ingredient"]) && !empty($_FILES["picture"])) {
        $insert = $pdo->prepare("INSERT INTO ingredient(name, description, picture)VALUES(:name, :description, :picture);");
        $insert->bindValue(":name", $_POST["nom_ingredient"], pdo::PARAM_STR);
        $insert->bindValue(":description", $_POST["description_ingredient"], pdo::PARAM_STR);
        $insert->bindValue(":picture", $newFileName, pdo::PARAM_STR);
        $insert->execute();

       echo "$_POST[nom_ingredient] à bien été ajouter à la base de donnée";
    }
}

include "./template/header.php";
?>
<!-- formulaire  -->

<form action="" method="POST" enctype="multipart/form-data">
    <h1>Upload d'ingredient dans la base de donnée</h1>
    <div class="contrainer">
        <div>
            <h1><?= @$ingredient_deja_existant ?></h1>
        </div>
        <input type="text" name="nom_ingredient" id="nom_ingredient">
        <div>
            <textarea name="description_ingredient" id="description_ingredient" cols="30" rows="10"></textarea>
        </div>
        <input type="file" name="picture" id="picture">
        <?php
        if (isset($errors["picture"])) {
        ?>
            <span class="info-error"><?= $errors["picture"] ?></span>
        <?php } ?>
    </div>
    <div>
        <button type="submit">envoyer</button>
    </div>
</form>

<?php 
include "./template/footer.php";
?>