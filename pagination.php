<?php
include("connexionBDD.php");

// recuperer le nombre d'enregistrements
$count = $pdo->prepare("select count(id) as cpt from soup");
$count->setFetchMode(PDO::FETCH_ASSOC);
$count->execute();
$tcount = $count->fetchAll();

//Pagination
@$page=$_GET["page"];
if(empty($page)) $page=1;
$nbr_elements_par_page = 5;
$nbr_de_page = ceil($tcount[0]["cpt"] / $nbr_elements_par_page);
$debut=($page-1)*$nbr_elements_par_page;


// Réuperer les enregistrements eux-mêmes
$sel = $pdo->prepare("select name,id from soup order by name limit $debut,$nbr_elements_par_page ");
$sel->setFetchMode(PDO::FETCH_ASSOC);
$sel->execute();
$tab = $sel->fetchAll();
if(count($tab)==0) 
    header("location:./pagination.php")
?>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>pagination</title>
    <link rel="stylesheet" href="src/stylePage.css?ts<?= time() ?>">
</head>

<body>
    <header>
        <?php echo $tcount[0]["cpt"] ?> enregistrement au total
    </header>
    <div id="pagination">
    <?php
        for ($i = 1; $i <= $nbr_de_page; $i++) { 
            if($page!=$i){
                echo  "<a href='?page=$i'>$i</a>";
                
            }else{
                echo "<a style=background-color:orange;color:white>$i</a>";
            }
            ?>
            
              
            
        <?php }
        ?>
    </div>
    <section id="cont">
        <?php
        for ($i = 0; $i < count($tab); $i++) { ?>
            <a href="soupe.php?id=<?= $tab[$i]["id"] ?>">
                <?= $tab[$i]["name"] ?>
            </a>
        <?php }
        var_dump($tcount[0]["cpt"]);
        ?>


    </section>
</body>

</html>