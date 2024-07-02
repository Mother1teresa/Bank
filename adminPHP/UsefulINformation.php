<?php
header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');



$link = mysqli_connect('localhost', 'root', '', 'admin')or die("Error");

$INfo = [];
$sql = mysqli_query($link, "SELECT * FROM UsefulINformation");

if($sql){
    while($row = mysqli_fetch_array($sql, MYSQLI_ASSOC)){
        $INfo[] = $row;
    }
    $INfo = json_encode($INfo);
    echo $INfo;
} else {
    echo '<p>Произошла ошибка: ' . mysqli_error($link) .'</p>'; 
}
?>