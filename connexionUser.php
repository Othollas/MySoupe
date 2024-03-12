<?php 
try {
    $dns = 'mysql:host=localhost;dbname=user_test';
    $user = new PDO($dns, 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
} catch (PDOException $e) {
    echo $e->getMessage();
}

?>
