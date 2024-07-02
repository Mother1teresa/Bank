<?php
header('Access-Control-Allow-Origin: *');
$link = mysqli_connect('localhost', 'root', '', 'admin') or die("Ошибка подключения к базе данных");

$id = (int)htmlspecialchars($_GET["id"]);  


$sql = mysqli_query($link, "DELETE FROM `productsForbusiness` WHERE `id` = {$id}");
    


?>