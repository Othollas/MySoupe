<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;

session_start();
include "./template/header.php";

require_once "includes/phpmailler/Exception.php";
require_once "includes/phpmailler/PHPMailer.php";
require_once "includes/phpmailler/SMTP.php";

$mail = new PHPMailer(true);

try{
    //configuration
    $mail->SMTPDebug = SMTP::DEBUG_SERVER; // je veux des informations de debug

    // on configure le SMTP
    $mail->isSMTP();

    $mail->Host = "smtp.gmail.com";
    $mail->SMTPAuth = TRUE;
    $mail->SMTPSecure = 'tls';
    $mail->Username = "noreply.soupe@gmail.com";
    $mail->Password = "tnwm ptvo kfcz sdes";
    $mail->Port = 587;
    //charset
    $mail->CharSet = "utf-8";
    $mail->addAddress("othollaspro@hotmail.com");
    
    // expediteur 
    $mail->setFrom("noreply.soupe@gmail.com");
    $mail->Subject = "test de mail";
    $mail->Body = "Sujet de test de mail, le premier coup avec sendmail ne s'est pas bien passé, on va voir si c'est mieux maintenant";

    //on envoir
    $mail->send();

}catch(Exception){
    echo "Message non envoyé. Ereur: {$mail->ErrorInfo}";
}

?>
<form action="" methode="POST">
    <input type="submit" value="Envoyer l'email.">
</form>

<?php 
include "./template/footer.php"
?>