<?php 

include "./template/header.php";

if (isset($_POST["chiffre"]) && !empty($_POST["chiffre"])) {
    include "./connexionUser.php";
    // je prepare ma requete pour recuperer le code dans la base de donnée
    $req = $user->prepare("SELECT tmp_code FROM UserTest WHERE email = :email");
    $req->bindParam(":email", $_COOKIE["email"], PDO::PARAM_STR);
    $req->execute();
    $recup_code_email = $req->fetch();

    // comparaison du code envoyé par email et du code dans la base de donnée de l'email.
    if ($recup_code_email[0] == $_POST["chiffre"]) { 
            // si concordance alors on peut lancer le formulaire de changement de mot de passe.
        ?>



        <form action="" method="POST">
            <input type="password" name="changePassword" id="changePassword" placeholder="Entrez votre mot de passe">
            <input type="password" name="changePasswordCheck" id="changePasswordCheck" placeholder="Entrez votre mot de passe à nouveau">
            <input type="submit" value="accepter le changement">
        </form>

    <?php } else { ?>

        <form action="" method="POST">
            <input type="number" name="chiffre" id="chiffre" placeholder="entre le code envoyer par mail">
            <input type="submit" value="Envoyer le code.">
        </form>
<?php echo "Le mot de passe ne correspond pas"; ?>
<?php }
} 

if((isset($_POST["changePassword"]) && !empty($_POST["changePassword"])) && (isset($_POST["changePasswordCheck"]) && !empty($_POST["changePasswordCheck"]))){
    // verification du mot de passe entré est bine le meme 
    if($_POST["changePassword"] == $_POST["changePasswordCheck"]){
        //si le mot de passe est le meme alors on peut initialiser le changement dans la base de donnée
        include "./connexionUser.php";
        // je met le nouveau mot de passe dans la base de donnée (plus tard hasher le mot de passe)
    $setNewPass =  $user -> prepare("UPDATE userTest SET mot_de_passe = '$_POST[changePassword]' where email = :email ");
    $setNewPass -> bindParam(":email", $_COOKIE["email"], PDO::PARAM_STR);
    $setNewPass -> execute();
    $passwordChanged = $user->prepare("SELECT mot_de_passe from userTest where email = :email");
    $passwordChanged -> bindParam(":email", $_COOKIE["email"], PDO::PARAM_STR);
    $passwordChanged -> execute();
    $pass = $passwordChanged->fetch();
    var_dump($pass[0]);
    echo"$pass[0]";
        // j'affiche la reussite 
        echo "Changement de mot de passe reussi";
        if(isset($pass)){
        // je recupere le nouveau mot de passe  pour le comparer avec celui qui à été envoyer.
        // si il y a reussite j'initie la destruction des cookies et je remet le code à null dans la base de donnée
        sleep(2);
        $code_tmp_reset = $user->prepare("UPDATE userTest SET tmp_code = NULL where email = :email ");
        $code_tmp_reset -> bindParam(":email", $_COOKIE["email"], PDO::PARAM_STR);
        $code_tmp_reset -> execute();
        setcookie("email", $emailValide["email"], time() -10);
        header("Location: ./connexion.php");
      }
    }else{
        echo "Le mot de passe ne correspond pas";
        // si il n'y a pas de correspondance j'affiche un message  et je remet le formulaire.
         ?> 
<form action="" method="POST">
            <input type="password" name="changePassword" id="changePassword" placeholder="Entrez votre mot de passe">
            <input type="password" name="changePasswordCheck" id="changePasswordCheck" placeholder="Entrez votre mot de passe à nouveau">
            <input type="submit" value="accepter le changement">
        </form>
         <?php
    }
}


include "./template/footer.php"

?>