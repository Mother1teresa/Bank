<?php

header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');

$link = mysqli_connect('localhost', 'root', '', 'admin')or die("Error");
// $productsTitle = $_POST['productsTitle'];
// $productsImage = $_POST['productsImage'];
// $backgclass	= $_POST['backgclass'];

$product = [];
$sql = mysqli_query($link, "SELECT * FROM productsForbusiness");
if ($sql) {
    while($row = mysqli_fetch_array($sql, MYSQLI_ASSOC)){
        // echo $row['id'];
        $product[] = $row;
    }
    $product = json_encode($product);
    echo $product;
} else {
    echo '<p>Произошла ошибка: ' . mysqli_error($link) . '</p>'; 
}
// INSERT INTO `productsForbusiness` (`id`, `productsTitle`, `productsImage`, `backgclass`) VALUES (NULL, 'text', '', '');
// UPDATE `productsForbusiness` SET `productsTitle` = 'text55' WHERE `productsForbusiness`.`id` = 5;

?>