<?php

// on verifie si le formulaire à bien été posté.
if (!empty($_POST)) {
    // on verifie que les champs sont envoyé et qu'il ne sont pas vide
    if (isset($_POST["email"], $_POST["password"]) && !empty($_POST["email"]) && !empty($_POST["password"])) {
        //Je verifie que le l'email est valide
        if (!filter_var($_POST["email"], FILTER_VALIDATE_EMAIL)) {
            die("le format de l'email n'est pas valide");
        }
        // je me connecte à la base de donnée.
        include_once "./connexionUser.php";

        $sql = "SELECT * FROM userTest WHERE email = :email";
        $query = $user->prepare($sql);
        $query->bindParam(":email", $_POST["email"], PDO::PARAM_STR);
        $query->execute();
        $existUser = $query->fetchAll();

        if (!$existUser) {
            die("l'utilisateur n'existe pas <br> appui <a href='./connexion.php'>ici</a> pour retourner à la page inscription");
        }

        // ici on sait que l'on a un user existant, nous devons maintenant verifier le mot de passe

        if (!($_POST["password"] == $existUser[0]["mot_de_passe"])) {
            die("Le password et/ou le mot de passe n'existe pas <br> appui <a href='./connexion.php'>ici</a> pour retourner à la page inscription");
        }

        echo $existUser[0]["est_admin"];
    
        session_start();

        
        header("Location: profil.php");
    }
    $_SESSION["existUser"] = [
        "id" => $existUser[0]["id"],
        "prenom" => $existUser[0]["prenom"],
        "nom" => $existUser[0]["nom"],
        "email" => $existUser[0]["email"],
        "est_admin" => $existUser[0]["est_admin"]
    ];
}

if(isset($_SESSION)){echo $_SESSION["existUser"]["nom"];
    echo $_SESSION["existUser"]["prenom"];}




include './template/header.php'
?>

<div id="form_connect">
    <form method="post"  enctype="multipart/form-data" >
        <div id="connect_user_exist">
            <div id="gafam">
                <div id="facebook">
                    <a href=""><img src="./img/facebook.png" alt="">connectez vous avec Facebook </a>
                </div>
                <div id="google">
                    <a href=""><img src="https://e7.pngegg.com/pngimages/326/85/png-clipart-google-logo-google-text-trademark.png" alt="">connectez vous avec google </a>
                </div>
            </div>

            <div id="formConnect">
                <div class="label_input">
                    <label for="email">identifiant ou email </label><input type="email" name="email" id="email">
                    <label for="password">mot de passe</label><input type="password" name="password" id="password">
                </div>
                <div id="cookie">
                    <div>
                        <input type="checkbox" name="remember" id="remember">
                        <label for="remember">Se souvenir de moi</label>
                    </div>

                    <div>
                        <a href="">mot de passe oublié ? </a>
                    </div>

                </div>
                <div class="button">
                    <input type="submit" value="Connexion">
                </div>
            </div>
        </div>
    </form>
    <h2>OU</h2>
    <div class="inscription">
        <a href="./inscription.php">Créer un compte</a>
    </div>

</div>








<?php include './template/footer.php' ?>