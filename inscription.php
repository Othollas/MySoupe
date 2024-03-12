<?php
// je verifie si le formulaire a été envoyé 
if (!empty($_POST)) {
    if (isset($_POST["nom"], $_POST["prenom"], $_POST["pseudo"], $_POST["email"], $_POST["password"], $_POST["verifPassword"]) && !empty($_POST["prenom"]) && !empty($_POST["nom"]) && !empty($_POST["pseudo"]) && !empty($_POST["email"]) && !empty($_POST["password"]) && ($_POST["condition"] == true)) {
        // on récupere les données en les protégeant.

        $nom = strip_tags($_POST["nom"]);
        $prenom = strip_tags($_POST["prenom"]);
        $pseudo = strip_tags($_POST["pseudo"]);
        if (filter_var($_POST["email"], FILTER_VALIDATE_EMAIL)) {
            $email = $_POST["email"];
        } else {
            die("Format email incorrect");
        }

        if ($_POST["password"] === $_POST["verifPassword"]) {
            $password = $_POST["password"];
        } else {
            die("Le mot de passe ne correspond pas");
        }

        echo "$nom, $prenom, $pseudo, $email, $password";

        include_once "./connexionUser.php";

        include_once "./ConnexionUserParam.php";

        // je decide ce que je fais 
    }
}
include "./template/header.php"
?>

<div id="inscription">
    <h1>Inscription</h1>

    <form method="post">


        <div class="name">
            <div class="forme">
                <label for="nom">Nom</label>
                <input type="text" name="nom" id="nom">
            </div>
            <div class="forme">
                <label for="prenom">Prenom</label>
                <input type="text" name="prenom" id="prenom">
            </div>
        </div>

        <div class="pseudo_email">
            <div class="forme">
                <label for="pseudo">Pseudo</label>
                <input type="text" name="pseudo" id="pseudo">
            </div>
            <div class="forme">
                <label for="email">Email</label>
                <input type="email" name="email" id="email">
            </div>
        </div>



        <div class="mot_de_passe">
            <div class="forme">
                <label for="password">Mot de passe</label>
                <input type="password" name="password" id="password">
            </div>
            <div class="forme">
                <label for="verifPassword">Verification du mot de passe</label>
                <input type="password" name="verifPassword" id="verifPassword">
            </div>
        </div>

        <p>
            <input type="checkbox" name="condition" id="condition">
            <label for="condition">
                J’accepte les <a href="">Conditions Générales d'Utilisation</a> et reconnais avoir été informé que mes données personnelles seront utilisées tel que décrit ci-dessous et détaillé dans la <a href="">Politique de protection des données personnelles</a> *</label>

        </p>
        <div class="btn_submit">
            <input type="submit" value="Envoyer">
        </div>
    </form>
</div>

<?php include "./template/footer.php" ?>