<?php


session_start();


include "./template/header.php";


if (isset($_POST["email"]) && !empty($_POST["email"])) {
    include "./connexionUser.php";
    // je prepare ma requete pour verifier si l'email existe dans la base de donnée
    $req = $user->prepare("SELECT email FROM Usertest WHERE email = :email");
    $req->bindParam(":email", $_POST["email"], PDO::PARAM_STR);
    $req->execute();
    $emailValide = $req->fetch(PDO::FETCH_ASSOC);
    // je verifie qu'il y ai bien une correspondance 
    if (!empty($emailValide)) {
        // si il y a une correspondance je crée un code aleatoire à 6 chiffres
        $code_recup = rand(100000, 999999);
        // je met en place un cookie pour faire transiter le mot de passe (posibilité de recuperer directement le mail par la base de donnée)
        setcookie("email", $emailValide["email"], time() + 300);
        // j'insert le code temporaire dans la base de donnée
        $insert = $user->prepare("UPDATE userTest SET tmp_code  = '$code_recup' where email = :email");
        $insert->bindParam(":email", $_POST["email"], PDO::PARAM_STR);
        $insert->execute();
        $code_tmp_mail = $insert->fetch();

        //envois du code aleatoire à l'email de l'utilisateur.
        include "./send_mail.php";

        // je place maintenant le formulaire pour la validation du code
?>
<!-- je rentre le code reçu par email et je le traite sur la page change_password  -->
        <form action="./change_password.php" method="POST">
            <input type="number" name="chiffre" id="chiffre" placeholder="entre le code envoyer par mail">
            <input type="submit" value="Envoyer le code.">
        </form>

    <?php
    } else {
        echo "<h2 style=color:red;>cet email n'existe pas</h2>";
        // je declare la variable $continue pour remettre le formulaire d'envois d'email au cas où
        $continue = true;
    }
}

?>


  

<?php if ((empty($_POST["email"]) && empty($_POST["chiffre"])) || isset($continue) ){  ?>

    <form action="" method="POST">
        <input type="email" name="email" id="email" placeholder="Entrez l'email du compte à recuperer">
        <input type="submit" value="Envoyer l'email.">
    </form>

<?php } ?>