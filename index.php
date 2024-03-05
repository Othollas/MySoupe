<?php
$dns = 'mysql:host=localhost;dbname=mysoupe';
$bd = new PDO($dns, 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
$query = $bd->query('SELECT * FROM soup');
$soupes = $query->fetchAll(PDO::FETCH_ASSOC);
include 'template/header.php';

/*foreach($soupes as $soupe){ ?>
   <p><a href='soupe.php?id=<?= $soupe['id'] ?>'><?= $soupe['name'] ?> </a><p><?php }; */


function imgRand()
{
   $dns = 'mysql:host=localhost;dbname=mysoupe';
   $bd = new PDO($dns, 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
   $query = $bd->query('SELECT id, picture FROM soup');
   $soupes = $query->fetchAll(PDO::FETCH_ASSOC);
   $random = rand(min: 1,  max: count($soupes));
   foreach ($soupes as $soup) {
      if ($random == $soup["id"]) {
         return $soup["picture"];
      }
   }
}


// echo $random;

?>



<section id="presentation">
   <div id="imgSlide">
      <img src="https://media.istockphoto.com/id/1197494143/fr/photo/hommes-mangeant-la-soupe-cr%C3%A9meuse-de-citrouille-r%C3%B4tie-v%C3%A9g%C3%A9talienne.jpg?s=1024x1024&w=is&k=20&c=kyKvNUbT_LruWtkaHAwWP90EvSs47rKjvz4-ctgmojY=" alt="">
   </div>
   <div class="presentation">
      <h1>RECETTE DE SOUPE</h1>
      <h2>Pour tout les goûts en toutes saisons </h2>
      <p>Quelques phrases pour expliquer le site <br>
         "Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem eligendi, qui veniam provident repellendus dolore molestiae! Sint cupiditate molestiae sequi."</p>
   </div>
</section>

<section style="margin:50px;" id="recette">
   <div class="recettesSaisons">
      <h2>Les recettes du moment</h2>
      <a href="">Voir les recettes</a>
   </div>
   <div class="randomRecette">
      <a href=""><img src="./img/recipes/<?= imgRand() ?>" alt=""></a>
      <a href=""><img src="./img/recipes/<?= imgRand() ?>" alt=""></a>
      <a href=""><img src="./img/recipes/<?= imgRand() ?>" alt=""></a>
   </div>
</section>

<section style="margin:50px;" id="top4">
   <div id="top4">
      <h2>Retrouvez les soupes les plus recentes</h2>
   </div>

   <div id="imgTop4">
      <a href=""><img src="./img/recipes/<?= imgRand() ?>" alt=""></a>
      <a href=""><img src="./img/recipes/<?= imgRand() ?>" alt=""></a>
      <a href=""><img src="./img/recipes/<?= imgRand() ?>" alt=""></a>
      <a href=""><img src="./img/recipes/<?= imgRand() ?>" alt=""></a>
   </div>
</section>

<?php include 'template/footer.php' ?>