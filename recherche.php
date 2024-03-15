<?php
session_start();
include 'template/header.php';



if (count($tab) == 0)
    header("location:./recherche.php");

if (@$afficher == "oui") { ?>

    <div id="recherche">
        <div id="pagination">
            <?php
            for ($i = 1; $i <= $nbr_de_page; $i++) {
                if ($page != $i) {
                    echo  "<a href='?page=$i&keywords=$keywords&valider=$valider'>$i</a>";
                } else {
                    echo "<a style=background-color:orange;color:white>$i</a>";
                }
            }
            ?>
        </div>
        <div id="resultats">
            <div id="nbr"><?= count($tab) . " " . (count($tab) > 1 ? "résultats trouvés" : "résultat trouvé") . " pour " . "\"$keywords\"" ?></div>
            <ul>
                <?php for ($i = 0; $i < count($tab2); $i++) { ?>
                    <li><a href='soupe.php?id=<?= $tab2[$i]['id'] ?>'><?= $tab2[$i]["name"] ?></a></li>
                <?php } ?>
            </ul>
        </div>
    <?php } ?>

    <!-- Resolution d'envois de transmition d'information dans l'url par le get en faisant transiter par le lien de la pagination -->

    <div id="pagination">
        <?php
        for ($i = 1; $i <= $nbr_de_page; $i++) {
            if ($page != $i) {
                echo  "<a href='?page=$i&keywords=$keywords&valider=$valider'>$i</a>";
            } else {
                echo "<a style=background-color:orange;color:white>$i</a>";
            }
        }
        ?>
    </div>

    <!-- Creation d'une div no page pour le cas ou il n'y a pas de resultat ou pas mot dans le  -->
    <?php if ($nbr_de_page == 0) { ?>
        <div id="noPage">
            <div class="border">
                <h1>!!! OUPS !!!</h1>
                <h1>Pas de resultat</h1>
            </div>
        </div>

    <?php } ?>

    <?php
    include 'template/footer.php';

    ?>