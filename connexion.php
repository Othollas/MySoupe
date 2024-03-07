<?php include './template/header.php' ?>





<div id="form_connect">
    <form action="">
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
                    <label for="email">identifiant ou email </label><input type="email" id="email">
                    <label for="password">mot de passe</label><input type="password" id="password">
                </div>
                <div id="cookie">
                    <input type="checkbox" name="remember" id="remember">
                    <label for="remember">Se souvenir de moi</label>
                </div>
                <div class="button">
                    <input type="submit" value="Connexion">
                    <input type="submit" value="Inscription">
                </div>
            </div>
        </div>
    </form>
</div>








<?php include './template/footer.php' ?>