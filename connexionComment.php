<?php
try {
    $dns = 'mysql:host=localhost;dbname=mysoupe';
    $pdo = new PDO($dns, 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
   $req = $pdo->prepare("select * from commentaire");
   $req->execute();
   $comments = $req->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo $e->getMessage();
}
try {
    $dns = 'mysql:host=localhost;dbname=user_test';
    $pdo = new PDO($dns, 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
   $req = $pdo->prepare("select * from usertest");
   $req->execute();
   $comment_users = $req->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo $e->getMessage();
}
?>