<?php
$dns = 'mysql:host=localhost;dbname=mysoupe';
$bd = new PDO($dns, 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
$query = $bd->query('SELECT * FROM soup');
$soupes = $query->fetchAll(PDO::FETCH_ASSOC);
include 'header/header.php';
// var_dump($soupes);
/*foreach($soupes as $soupe){ ?>
   <p><a href='soupe.php?id=<?= $soupe['id'] ?>'><?= $soupe['name'] ?> </a><p><?php }; */

?>



<section id="presentation">
   <div id="imgSlide">
      <img style="width:40%; height:20%; padding:50px 0; border-radius:10px;" src="https://media.istockphoto.com/id/1197494143/fr/photo/hommes-mangeant-la-soupe-cr%C3%A9meuse-de-citrouille-r%C3%B4tie-v%C3%A9g%C3%A9talienne.jpg?s=1024x1024&w=is&k=20&c=kyKvNUbT_LruWtkaHAwWP90EvSs47rKjvz4-ctgmojY=" alt="">
   </div>
   <div id="presentation">
      <h1>RECETTE DE SOUPE</h1>
      <h2>Pour tout les goûts en toutes saisons </h2>
      <p>Quelques phrases pour expliquer le site <br>
         "Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem eligendi, qui veniam provident repellendus dolore molestiae! Sint cupiditate molestiae sequi."</p>
   </div>
</section>

<section style="margin:50px;" id="recette">
   <div id="recettesSaisons">
      <h2>Les recettes du moment</h2>
      <a href="">Voir les recettes</a>
   </div>
   <div id="randomRecette">
      <a href=""><img src="" alt=""></a>
      <a href=""><img src="" alt=""></a>
      <a href=""><img src="" alt=""></a>
   </div>
</section>

<section style="margin:50px;" id="top4">
   <div id="top4">
      <h2>Retrouvez les soupes les plus populaires du moment</h2>
   </div>

   <div id="imgTop4">
      <a href=""><img src="" alt=""></a>
      <a href=""><img src="" alt=""></a>
      <a href=""><img src="" alt=""></a>
      <a href=""><img src="" alt=""></a>
   </div>
</section>

<?php include 'footer/footer.php' ?>