<?php
try {
    $dns = 'mysql:host=localhost;dbname=img';
    $pdo = new PDO($dns, 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
} catch (PDOException $e) {
    echo $e->getMessage();
}
?>