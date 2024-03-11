<?php
include './connexionBDD.php';
// recuperation des enregistrement pour la page recettes.php
$res_recettes = $pdo->prepare("select id from soup");
$res_recettes->setFetchMode(PDO::FETCH_ASSOC);
$res_recettes->execute();
$nbr_recettes = $res_recettes->fetchAll();
$tcount_recettes = count($nbr_recettes);
$afficher = "oui";

//Pagination
@$page_recettes = $_GET["page"];
if (empty($page_recettes)) $page_recettes = 1;
$nbr_elements_par_page_recettes = 9;
$nbr_de_page_recettes = ceil($tcount_recettes / $nbr_elements_par_page_recettes);
$debut_recettes = ($page_recettes - 1) * $nbr_elements_par_page_recettes;


$res_recettes = $pdo->prepare("select * from soup limit $debut_recettes, $nbr_elements_par_page_recettes");
$res_recettes->setFetchMode(PDO::FETCH_ASSOC);
$res_recettes->execute();
$tab_recettes = $res_recettes->fetchAll();
$tcount_recettes = count($tab_recettes);

include './template/header.php' ?>



<?php echo count($nbr_recettes) ?> recettes au total

<div id="recettes">

    <div id="pagination">

        <?php
        for ($i = 1; $i <= $nbr_de_page_recettes; $i++) {
            if ($page_recettes != $i) {
                echo  "<a href='?page=$i'>$i</a>";
            } else {
                echo "<a style=background-color:orange;color:white>$i</a>";
            }
        ?>
        <?php } ?>
    </div>

    <section id="container_recettes">
        <?php
        for ($i = 0; $i < count($tab_recettes); $i++) { ?>

            <div class="container_recettes">
                <a href=" ./soupe.php?id=<?= $tab_recettes[$i]["id"] ?>">
                <p><?= $tab_recettes[$i]["name"] ?></p>
                <img src="./img/recipes/<?= $tab_recettes[$i]["picture"] ?>" alt="">
                <p><?= $tab_recettes[$i]["name"] ?></p>
                    
                </a>
            </div>
            
        <?php } ?>
    </section>

    <div id="pagination">
        <?php
        for ($i = 1; $i <= $nbr_de_page_recettes; $i++) {
            if ($page_recettes != $i) {
                echo  "<a href='?page=$i'>$i</a>";
            } else {
                echo "<a style=background-color:orange;color:white>$i</a>";
            }
        ?>
        <?php }
        ?>
    </div>
</div>

<?php include './template/footer.php' ?>