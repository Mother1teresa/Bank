<?php
header('Access-Control-Allow-Origin: *');
$link = mysqli_connect('localhost', 'root', '', 'admin')or die("Error");



$id = (int)htmlspecialchars($_GET ["id"]); 
$title = htmlspecialchars($_GET ["title"]); 
$sql = mysqli_query($link, "UPDATE productsForbusiness SET productsTitle = '{$title}' WHERE id = {$id}");

echo($title);

?>