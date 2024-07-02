<?php
header('Access-Control-Allow-Origin: *');
$link = mysqli_connect('localhost', 'root', '', 'admin')or die("Error");


$id = (int)htmlspecialchars($_GET ["id"]); 
$createTitle = htmlspecialchars($_GET ["title"]);
$createBackground = htmlspecialchars($_GET ["backgclass"]);
$createimage = htmlspecialchars($_GET ["image"]);

$create = "INSERT productsForbusiness SET `productsTitle`='{$createTitle}',`productsImage`='{$createimage}',`backgclass`='{$createBackground}'";
// $create = "INSERT productsForbusiness SET `productsTitle`='tit',`productsImage`='img',`backgclass`='gary'";


$sql = mysqli_query($link, $create);
echo($create);
print_r($_GET);
?>