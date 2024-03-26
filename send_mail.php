<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;

require_once "includes/phpmailler/Exception.php";
require_once "includes/phpmailler/PHPMailer.php";
require_once "includes/phpmailler/SMTP.php";

$mail = new PHPMailer(true);
        if (isset($_POST) && !empty($_POST["email"])) {

            try {
                //configuration
                // $mail->SMTPDebug = SMTP::DEBUG_SERVER; // je veux des informations de debug

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
                $mail->addAddress($_POST["email"]);

                // expediteur 
                $mail->setFrom("noreply.soupe@gmail.com");


                //contenue
                $mail->isHTML(true);
                $mail->Subject = "Récupération du mots de passe";
                $corps = '<h1 style="color:red; transform:rotate(90deg)">Votre code est : '. $code_recup. '<h1>';
                $mail->Body = $corps;

                //on envois
                $mail->send();
            } catch (Exception) {
                echo "Message non envoyé. Ereur: {$mail->ErrorInfo}";
            }
        }
        ?>