<?php
session_start();

$find = false;
$data = array("nom" => "Soupe introuvable");
if (isset($_GET['id'])) {
    $dns = 'mysql:host=localhost;dbname=mysoupe';
    $bd = new PDO($dns, 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));

    $query = $bd->prepare('SELECT * FROM soup WHERE id = :id');
    $query->bindParam(":id", $_GET["id"], PDO::PARAM_INT);
    $query->execute();
    $soupe = $query->fetch();
    if ($soupe) {
        $find = true;
        $data = $soupe;
    }

    if (isset($_GET['id'])) {
        $ingredient = new PDO($dns, 'root', '', array(PDO::ATTR_ERRMODE));
        $query = $ingredient->prepare('SELECT id_ingredient, mesure FROM soup_ingredient WHERE id_soup = :id');
        $query->bindParam(":id", $_GET["id"], PDO::PARAM_INT);
        $query->execute();
        $soup_ingredient = $query->fetchAll(PDO::FETCH_ASSOC);
    }


    if (isset($_GET['id'])) {
        $db_ingredient = new PDO($dns, 'root', '', array(PDO::ATTR_ERRMODE));
        $query_ingredient = $db_ingredient->prepare('SELECT id,name,picture,unit FROM ingredient');
        $query_ingredient->execute();
        $soup_ingredients = $query_ingredient->fetchAll(PDO::FETCH_ASSOC);
    }
}

if (isset($_GET['id'])) {
    $db_etape = new PDO($dns, 'root', '', array(PDO::ATTR_ERRMODE));
    $query_etape = $db_etape->prepare('SELECT id_soup,n_etape,etape FROM soup_etape WHERE id_soup = :id');
    $query_etape->bindParam(":id", $_GET["id"], PDO::PARAM_INT);
    $query_etape->execute();
    $etapes = $query_etape->fetchAll(PDO::FETCH_ASSOC);
}





// for($i = 0; $i < count($soup_ingredient); $i++){
//     echo "<li>$soup_ingredient[$i][$id_ingredient]</li>";
// }

include 'template/header.php';

if ($find == true) { ?>
    <h1 style="font-size:40px; text-align:center; margin:50px 0"><?= $data['name'] ?></h1>
    <div id="soupe">
        <div id="soupePresentation">


            <img src="test_img.php?id=<?= $_GET["id"] ?>" alt="">


            <div class="data">
                <p><img src="./src/globe.png" alt=""><?= $data['continent'] ?></p>
                <p><img src="./src/difficulty.png" alt=""><?= $data['difficulty'] ?></p>
                <p><img src="./src/seasons.png" alt=""><?= $data['season'] ?></p>
            </div>
        </div>



        <div id="prepare_ingredient">
            <div id="text">
                <p><?= $data["texte"] ?></p>
            </div>
            <div class="preparation">

                <p>
                    <img src="./src/sablier.png" alt=""><?= $data['prepare_time'] + $data['cook_time'] . " Mn : "  ?> <img src="./src/ingredient.png" alt=""> <?= $data['prepare_time'] . " + " ?> <img src="./src/cuisson.png" alt=""> <?= $data['cook_time'] ?>
                </p>
            </div>

            <div class="ingredient">
                <h2>Ingredient</h2>
                <ul>
                    <div class="flex_ingredient">

                        <?php foreach ($soup_ingredient as $ingredient) {
                            foreach ($soup_ingredients as $ingredients) {

                                if ($ingredient["id_ingredient"] == $ingredients["id"]) {
                                    echo  "<li>" . $ingredient["mesure"] . " " .  ($ingredients["unit"] >= "1" && ($ingredients["unit"] == "gr" || $ingredients["unit"] == "pièce") ? $ingredients["unit"] . "s" : $ingredients["unit"]) . " : " . $ingredients["name"] . "</li>";
                                };
                            }
                        } ?>
                    </div>
                </ul>
            </div>

            <div id="etape">
                <?php foreach ($etapes as $etape) { ?>
                    <p><?= $etape["n_etape"] . "." . $etape["etape"]; ?></p>
                    <hr>
                <?php } ?>
            </div>


        </div>
    </div>
<?php } else { ?>
    <div id="introuvable">
        <h1>Soupe introuvable</h1>
    </div>
<?php } ?>
<?php if ($find == true) { ?>
    <div>
        <h2>laisser un commentaire</h2>
        <hr>
        <form action="./commentaire.php" method="post">
            <?php
            if (isset($_SESSION["existUser"])) {
                $_SESSION["comment"]["id_soup"] = $_GET["id"];
                $_SESSION["comment"]["id_user"] = $_SESSION["existUser"]["id"];
            }
            ?>
            <div class="textarea">
                <textarea name="text" id="textComment" cols="30" rows="10"></textarea>
                <?php if (isset($_SESSION["erreur"])) {
                    echo $_SESSION["erreur"];
                    unset($_SESSION["erreur"]);
                } ?>
            </div>
            <input type="submit" value="envoyer">
        </form>
    </div>
    <?php

    ?>

    <section id="comment">
                <h2>super commentaire de personnes super genial</h2>
        <?php
        include "./connexionComment.php";
        foreach ($comment_users as $user) {
            foreach ($comments as $comment) {
                if ($comment["id_soup"] == $_GET["id"]) {
                    if ($comment["id_user"] == $user["id"]) { ?>
                        <div class="commentaire">
                            <div class="identity_time">
                                <p><?= $user["nom"] . " " . $user["prenom"]  ?></p>
                                <p><?= $comment["date_comment"] ?></p>
                            </div>
                            <hr>
                            <p class="comment"><?= $comment["text_comment"] ?></p>
                        </div>

        <?php }
                }
            }
        }
        ?>
    </section>

<?php }  ?>
<a href="index.php">retour</a>


<?php
$chaine = "Dans une cocotte ou un faitout, faites suer dans l’huile les rondelles de poireau et l’oignon émincé. Ajoutez les pommes de terre, 75 cl d’eau de cuisson du haddock avec le laurier et le lait, et portez à ébullition. Faites cuire à frémissement pendant 20 minutes : les pommes de terre doivent être très tendres. Pendant ce temps, ôtez la peau et les arêtes du haddock et effeuillez-le.";
echo strlen($chaine);

?>

<?php include 'template/footer.php' ?>