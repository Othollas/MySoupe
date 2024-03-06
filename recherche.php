<?php

include 'template/header.php';

if (@$afficher == "oui") { ?>

    <div id="resultats">
        <div id="nbr"><?= count($tab) . " " . (count($tab) > 1 ? "résultats trouvés" : "résultat trouvé") . " pour " . "\"$keywords\"" ?></div>
        <ul>
            <?php for ($i = 0; $i < count($tab); $i++) { ?>
                <li><a href='soupe.php?id=<?= $tab[$i]['id'] ?>'><?= $tab[$i]["name"] ?></a></li>
            <?php } ?>
        </ul>
    </div>
<?php }

include 'template/footer.php';

?>