<?php include "./template/header.php" ?>
<div id="inscription">
    <h1>Inscription</h1>

    <form action="">


        <div class="name">
            <div class="forme">
                <label for="fname">Nom</label>
                <input type="text" name="fname" id="fname">
            </div>
            <div class="forme">
                <label for="lname">Prenom</label>
                <input type="text" name="lname" id="lname">
            </div>
        </div>

        <div class="pseudo_email">
            <div class="forme">
                <label for="nickname">Pseudo</label>
                <input type="text" name="nickname" id="nickname">
            </div>
            <div class="forme">
                <label for="email">Email</label>
                <input type="email" name="email" id="email">
            </div>
        </div>



        <div class="mot_de_passe">
            <div class="forme">
                <label for="fname">Mot de passe</label>
                <input type="password" name="fname" id="fname">
            </div>
            <div class="forme">
                <label for="lname">Verification du mot de passe</label>
                <input type="password" name="lname" id="lname">
            </div>
        </div>

        <p>
            <input type="checkbox" name="" id="" required>
            <label for="">
                J’accepte les <a href="">Conditions Générales d'Utilisation</a> et reconnais avoir été informé que mes données personnelles seront utilisées tel que décrit ci-dessous et détaillé dans la <a href="">Politique de protection des données personnelles</a> *</label>

        </p>
<div class="btn_submit">
        <input type="submit" value="Envoyer">
</div>
    </form>
</div>

<?php include "./template/footer.php" ?>