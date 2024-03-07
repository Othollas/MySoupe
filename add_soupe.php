<?php
if (!empty($_POST)) {
    $nom = trim(strip_tags($_POST["nom"]));
    $saison = trim(strip_tags($_POST["saison"]));
    $continent = trim(strip_tags($_POST["continent"]));
    $difficulte = trim(strip_tags($_POST["difficulte"]));
    $preparation = trim(strip_tags($_POST["preparation"]));
    $erreur = [];

    if (empty($nom)) {
        $erreur["nom"] = "Le nom de la soupe est obligatoire";
    }

    if (empty($preparation)) {
        $erreur["preparation"] = "La durée de preparation de la soupe est obligatoire";
    }

    // Gestion de l'upload de la photo de notre recette
    if (isset($_FILES["picture"]) && $_FILES["picture"]["error"] === UPLOAD_ERR_OK) {
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
        if (in_array($fileType, $allowedTypes)) {
            // Le type de fichier est bien valide on peut donc ajouter le fichier à notre serveur
            move_uploaded_file($fileTmpPath, $fileDestPath);
        } else {
            // Le type de fichier est incorrect
            $error["picture"] = "Le type de fichier est incorrect (.jpg, .png ou  .webp requis)";
        }
    }


    // requete d'insertion de la soupe dans la BDD si il n'y a aucune erreur

    if (empty($erreur)) {
        $dns = 'mysql:host=localhost:3306;dbname=soupe';
        $bd = new PDO($dns, 'root', '');

        $requete = $bd->prepare("INSERT INTO test (nom,  continent, saison, difficulte, preparation) VALUES (:nom, :continent, :saison, :difficulte, :preparation)");
        $requete->bindParam(":nom", $nom);
        $query->bindParam(":picture", $newFileName);
        $requete->bindParam(":continent", $continent);
        $requete->bindParam(":saison", $saison);
        $requete->bindParam(":difficulte", $difficulte);
        $requete->bindParam(":preparation", $preparation, PDO::PARAM_INT);

        if ($requete->execute()) {
            header("Location:index.php");
        }
    }
}

include "template/header.php";
?>
<div id="ajout">
    <h1>Ajouter une soupe</h1>

    <form action="" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="inputNom">Nom de la soupe :</label>
            <input type="text" id="inputNom" name="nom" value="<?= isset($nom) ? $nom : "" ?>">
            <?php
            if (isset($erreur["nom"])) { ?>
                <span class="info-erreur"><?= $erreur["nom"] ?></span>
            <?php
            }
            ?>
        </div>

        <div class="form-group">
            <label for="seclectionSaison">Choisissez une saison :</label>
            <select name="saison" id="selectionSaison">
                <option value="printemps" <?= isset($saison) && $saison === "printemps" ? "selectionné" : "" ?>>Printemps</option>
                <option value="ete" <?= isset($saison) && $saison === "ete" ? "selectionné" : "" ?>>Été</option>
                <option value="automne" <?= isset($saison) && $saison === "automne" ? "selectionné" : "" ?>>Automne</option>
                <option value="hiver" <?= isset($saison) && $saison === "hiver" ? "selectionné" : "" ?>>Hiver</option>
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
            <label for="seclectionDifficulte">Choisissez une difficulté :</label>
            <select name="difficulte" id="selectionDifficulte">
                <option value="tresFacile" <?= isset($difficulte) && $difficulte === "tresFacile" ? "selectionné" : "tresFacile" ?>>Trés facile</option>
                <option value="facile" <?= isset($difficulte) && $difficulte === "facile" ? "selectionné" : "" ?>>facile</option>
                <option value="moyen" <?= isset($difficulte) && $difficulte === "moyen" ? "selectionné" : "" ?>>Moyen</option>
                <option value="difficile" <?= isset($difficulte) && $difficulte === "difficile" ? "selectionné" : "" ?>>Difficile</option>
            </select>
        </div>

        <div class="form-group">
            <label for="tempsPreparation">Preparation</label>
            <input type="number" name="preparation" min=1 max=120 id="tempsPreparation" value="<?= isset($preparation) ? $preparation : 0 ?>">
        </div>

        <input type="submit" value="Ajouter la soupe">
        <input type="button" value="Revenir" href="/index.php">

    </form>
</div>
<?php
include "template/footer.php";
?>