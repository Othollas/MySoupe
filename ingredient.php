<?php
$dns = 'mysql:host=localhost;dbname=mysoupe';
$bd = new PDO($dns, 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
$query = $bd->query('SELECT * FROM ingredient');
$ingredients = $query->fetchAll(PDO::FETCH_ASSOC);
include "./header/header.php";

foreach ($ingredients as $ingredient) { //var_dump($ingredient) 
?>
    <div class="container">
        <div class="ingredient">
            <div>
                <img src="./img/ingredient/<?= $ingredient["picture"] ?>" alt="">
            </div>
            <div>
                <p><?= $ingredient["name"] ?></p>
                <p><?= $ingredient["description"] ?></p>
            </div>
        </div>
    </div>
<?php };
include "./footer/footer.php"
?>