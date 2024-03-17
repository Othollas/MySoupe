<?php
if(isset($_POST["valider"])){
    $dns = 'mysql:host=localhost;dbname=img';
    $pdo = new PDO($dns, 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
    $req = $pdo->prepare("INSERT INTO img_recipe(id_soup,nom, taille, type, bin)VALUES(?,?,?,?,?)");
    $id_soup = $_POST["id_soup"];
    $req->execute($requete = array($id_soup, $_FILES["image"]["name"],$_FILES["image"]["size"],$_FILES["image"]["type"],file_get_contents($_FILES["image"]["tmp_name"])));

    
    
    // echo "<pre>";
    // var_dump($requete);
    // echo "</pre>";
}


include "./template/header.php";
?>




<form action="" method="post">
    <select name="database" id="data">
        <option value="">--- choisissez une base de donnée</option>
        <option value="recipe">recette de soupe</option>
        <option value="ingredient">ingredient</option>
    </select>
    <input type="submit" name="envoyer" value="envoyer">
</form>






<?php
if ($_POST["database"] == "recipe") { ?>
    <h1>Veuillez mettre l'image de la recette</h1>
    <form action="" method="post" enctype="multipart/form-data">
        <div>
    <input type="number" name="id_soup" id="id_soup">
    </div>
        <div>
    <input type="file" name="image" id="image">
        </div>
        <div>
    <input type="submit" value="valider" name="valider">
</div>
    </form>

<?php
}
?>

<?php
if ($_POST["database"] == "ingredient") { ?>
    <h1>Veuillez mettre l'image de l'ingredient</h1>
    <form action="" method="post" enctype="multipart/form-data">
        <div>
    <input type="number" name="id_ingredient" id="id_ingredient">
    </div>
        <div>
    <input type="file" name="image" id="image">
        </div>
        <div>
    <input type="submit" value="valider" name="valider">
</div>
    </form>
    <?=  ($_POST["database"] != "ingredient" && "recipe") ?>
<?php
}
?>
  
<?php
if (($_POST["database"] != "ingredient") && ($_POST["database"] != "recipe")) { ?>
    
    
    <h1>Veuillez choisir une categorie !!!</h1>

  

<?php
}
?>

<?php
include "./template/footer.php"
?>