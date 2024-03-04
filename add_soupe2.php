<?php
if (!empty($_POST)) {
    $name = trim(strip_tags($_POST["name"]));
    $picture = trim(strip_tags($_POST["picture"]));
    $category = trim(strip_tags($_POST["category"]));
    $season = trim(strip_tags($_POST["season"]));
    $continent = trim(strip_tags($_POST["continent"]));
    $difficulty = trim(strip_tags($_POST["difficulty"]));
    $prepare_time = trim(strip_tags($_POST["prepare_time"]));
    $cook_time = trim(strip_tags($_POST["cook_time"]));
    $isHot = trim(strip_tags($_POST["isHot"]));
    $isCold = trim(strip_tags($_POST["isCold"]));
    $vegan = trim(strip_tags($_POST["vegan"]));
    $lactoseFree = trim(strip_tags($_POST["lactoseFree"]));
    $glutenFree = trim(strip_tags($_POST["glutenFree"]));
    $erreur = [];

    if (empty($nom)) {
        $erreur["name"] = "Le nom de la soupe est obligatoire";
    }

    if (empty($preparation)) {
        $erreur["prepare_time"] = "La durée de preparation de la soupe est obligatoire";
    }

    if (empty($preparation)) {
        $erreur["category"] = "La category de la soupe est obligatoire";
    }

    if (empty($preparation)) {
        $erreur["season"] = "La saison de la soupe est obligatoire";
    }

    if (empty($preparation)) {
        $erreur["continent"] = "La localisation de la soupe est obligatoire";
    }

    if (empty($preparation)) {
        $erreur["difficulty"] = "La difficulté de la soupe est obligatoire";
    }

    if (empty($preparation)) {
        $erreur["prepare_time"] = "La durée de preparation de la soupe est obligatoire";
    }

    if (empty($preparation)) {
        $erreur["cook_time"] = "La durée de cuisson de la soupe est obligatoire";
    }


    // Gestion de l'upload de la photo de notre recette
    if(isset($_FILES["picture"]) && $_FILES["picture"]["error"] === UPLOAD_ERR_OK) {
        //Le fichier avec l'attribut name qui vaut picture existe et il n'y a pas eu d'erreur pendant l'upload
        $fileTmpPath = $_FILES["picture"]["tmp_name"];
        $fileName = $_FILES["picture"]["name"];
        $fileType = $_FILES["picture"]["type"];

        // On génère un nouveau nom de fichier pour ne pas se préoccuper des espaces, caractères accentués mais aussi si des personnes upload plusieurs images ayant le même nom
        $fileNameArray = explode(".", $fileName);
        // La fonction end est trés pratique pour récupérer le dernier élément d'un tableau
        $fileExtension = end($fileNameArray);
        // l'ajout de time() permet d'etre sur d'avoir un hash unique 
        // la fonction md5 permet de générer un hash à partir d'une chaine donnée
        $newFileName = md5($fileName . time()) . "." . $fileExtension;

        // Attention à vérifier que le dossier de destination est bien crée au préalable
        $fileDestPath = ".img/recipes/{$newFileName}";

        $allowedTypes = array("image/jpeg", "image/png", "image/webp");
        if(in_array($fileType, $allowedTypes)) {
            // Le type de fichier est bien valide on peut donc ajouter le fichier à notre serveur
            move_uploaded_file($fileTmpPath, $fileDestPath);
        }else {
            // Le type de fichier est incorrect
            $error["picture"] = "Le type de fichier est incorrect (.jpg, .png ou  .webp requis)";
        }
    }


    // requete d'insertion de la soupe dans la BDD si il n'y a aucune erreur

    if (empty($erreur)) {
        $dns = 'mysql:host=localhost:3306;dbname=MySoupe';
        $bd = new PDO($dns, 'root', '');

        $requete = $bd->prepare("INSERT INTO soup (name, picture, continent, season, difficulty, prepare_time, cook_time, isHot, isCold, vegan, lactoseFree, glutenFree) VALUES (:name, :picture, :continent, :season, :difficulty, :prepare_time, :cook_time, :isHot, :isCold, :vegan, :lactoseFree, :glutenFree)");
        $requete->bindParam(":name", $name);
        $requete->bindParam(":picture", $newFileName);
        $requete->bindParam(":continent", $continent);$requete->bindParam(":season", $season);
        $requete->bindParam(":difficulte", $difficulte);
        $requete->bindParam(":prepare_time", $prepare_time, PDO::PARAM_INT);
        $requete->bindParam(":cook_time", $cook_time, PDO::PARAM_INT);
        $requete->bindParam(":isHot", $isHot);
        $requete->bindParam(":isCold", $isCold);
        $requete->bindParam(":vegan", $vegan);
        $requete->bindParam(":lactoseFree", $lactoseFree);
        $requete->bindParam(":glucoseFree", $glucoseFree);

        if ($requete->execute()) {
            header("Location:index.php");
        }
    }
}

include "header/header.php";
?>

<h1>Ajouter une soupe</h1>

<form action="" method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label for="inputName">Nom de la soupe :</label>
        <input type="text" id="inputName" name="name" value="<?= isset($nom) ? $nom : "" ?>">
        <?php
        if (isset($erreur["name"])) { ?>
            <span class="info-erreur"><?= $erreur["name"] ?></span>
        <?php
        }
        ?>
    </div>

    <div class="form-group">
        <label for="seclectionSaison">Choisissez une saison :</label>
        <select name="season" id="selectionSeason">
            <option value="printemps" <?= isset($saison) && $season === "printemps" ? "selectionné" : "" ?>>Printemps</option>
            <option value="ete" <?= isset($season) && $season === "ete" ? "selectionné" : "" ?>>Été</option>
            <option value="automne" <?= isset($season) && $season === "automne" ? "selectionné" : "" ?>>Automne</option>
            <option value="hiver" <?= isset($season) && $season === "hiver" ? "selectionné" : "" ?>>Hiver</option>
        </select>
    </div>

    <div class="form-group">
        <label for="seclectionContinent">Choisissez un continent :</label>
        <select name="continent" id="selectionContinent">
            <option value="europe" <?= isset($continent) && $continent === "europe" ? "selectionné" : "" ?>>Europe</option>
            <option value="asie" <?= isset($continent) && $continent === "asie" ? "selectionné" : "" ?>>Asie</option>
            <option value="afrique" <?= isset($continent) && $continent === "afrique" ? "selectionné" : "" ?>>Afrique</option>
            <option value="oceanie" <?= isset($continent) && $continent === "oceanie" ? "selectionné" : "" ?>>Océanie</option>
        </select>
    </div>

    <div class="form-group">
        <label for="seclectionDifficulty">Choisissez une difficulté :</label>
        <select name="difficulty" id="selectionDifficulty">
            <option value="tresFacile" <?= isset($difficulty) && $difficulty === "tresFacile" ? "selectionné" : "tresFacile" ?>>Trés facile</option>
            <option value="facile" <?= isset($difficulty) && $difficulty === "facile" ? "selectionné" : "" ?>>facile</option>
            <option value="moyen" <?= isset($difficulty) && $difficulty === "moyen" ? "selectionné" : "" ?>>Moyen</option>
            <option value="difficile" <?= isset($difficulty) && $difficulty === "difficile" ? "selectionné" : "" ?>>Difficile</option>
        </select>
    </div>

    <div class="form-group">
        <label for="preparation_time">Preparation</label>
        <input type="number" name="prepare_time" min=1 max=120 id="preparation_time" value="<?= isset($prepare_time) ? $prepare_time : 0 ?>">
    </div>

    <input type="submit" value="Ajouter la soupe">
    <input type="submit" value="Revenir" href="index.php">

</form>

<?php
include "footer/footer.php";
?>