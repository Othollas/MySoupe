<?php
session_start();

include './connexionBDD.php';

$req = $pdo->prepare("select id from ingredient ");
$req->setFetchMode(PDO::FETCH_ASSOC);
$req->execute();
$resultReq = $req->fetchAll();
$count = count($resultReq);

@$page_ingredient = $_GET["page"];
if (empty($page_ingredient)) $page_ingredient = 1;
$nbr_elements_par_page_ingredient = 20;
$nbr_de_pages_ingredient = ceil($count / $nbr_elements_par_page_ingredient);
$debut_page_ingredient = ($page_ingredient - 1) * $nbr_elements_par_page_ingredient;


$query = $pdo->query("SELECT * FROM ingredient limit $debut_page_ingredient, $nbr_elements_par_page_ingredient");
$ingredients = $query->fetchAll(PDO::FETCH_ASSOC);
if (count($ingredients) == 0)
    header("location:./ingredient.php");

include "./template/header.php";
?>

<div id="ingredients">

    <div id="pagination">

        <?php

        for ($i = 1; $i <= $nbr_de_pages_ingredient; $i++) {
            if ($page_ingredient != $i) {
                echo "<a href='?page=$i'>$i</a>";
            } else {
                echo "<a style=background-color:orange;color:white>$i</a>";
            }
        }

        ?>
    </div>


    <div class="container">
        <?php
        foreach ($ingredients as $ingredient) {
        ?>
            <div class="border">
                <div>
                    <img src="./img/ingredient/<?= $ingredient["picture"] ?>" alt="">
                </div>
                <div class="description">
                    <p><?= $ingredient["name"] ?></p>
                    <p><?= $ingredient["description"] ?></p>
                </div>
            </div>

        <?php }; ?>
    </div>

    <div id="pagination">

        <?php

        for ($i = 1; $i <= $nbr_de_pages_ingredient; $i++) {
            if ($page_ingredient != $i) {
                echo "<a href='?page=$i'>$i</a>";
            } else {
                echo "<a style=background-color:orange;color:white>$i</a>";
            }
        }

        ?>
    </div>
</div>

<?php
include "./template/footer.php"
?>