<?php
header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');

$link = mysqli_connect('localhost', 'root', '', 'admin') or die('Error');

$data = [];
$sql = mysqli_query($link, "SELECT * FROM tariffs");

if($sql){
    while($row = mysqli_fetch_array($sql, MYSQLI_ASSOC)){
        $data[] = $row;
    }
    $data = json_encode($data);
    echo $data;
} else {
    echo '<p>Произошла ошибка: ' . mysqli_error($link).'</p>';
}
?>