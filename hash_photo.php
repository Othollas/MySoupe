<?php 

        $errors = [];
        
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
        $fileDestPath = "./img/ingredient/{$newFileName}";

        $allowedTypes = array("image/jpeg", "image/png", "image/webp");
        if (in_array($fileType, $allowedTypes)) {
            // Le type de fichier est bien valide on peut donc ajouter le fichier à notre serveur
            move_uploaded_file($fileTmpPath, $fileDestPath);
        } else {
            // Le type de fichier est incorrect
            $error["picture"] = "Le type de fichier est incorrect (.jpg, .png ou  .webp requis)";
        }
    }


    

include("header/header.php");
?>
<h1>coucou</h1>

<form action="" method="post" enctype="multipart/form-data">


    <div>
        <label for="inputPicture">ajouter une photo</label>
        <input type="file" id="inputPicture" name="picture">
        <?php
        if (isset($errors["picture"])) {
        ?>
            <span class="info-error"><?= $errors["picture"] ?></span>
        <?php
        }
        ?>
    </div>


    <input type="submit" value="ajouter la soupe">
</form>

<?php
var_dump($_POST);
// var_dump($_FILES);

include("footer/footer.php");
?>
