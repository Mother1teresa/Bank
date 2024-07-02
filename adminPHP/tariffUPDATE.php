<?php
header('Access-Control-Allow-Origin: *');

$link = mysqli_connect('localhost', 'root', '', 'admin')or die("Error");

// echo(file_get_contents('php://input'));
// print_r($_POST);
// echo(json_encode($_POST));

$id = (int)htmlspecialchars($_GET ["id"]); 
$title = $_GET ["title"];
$description = htmlspecialchars($_GET ["description"]);
$pestitle = htmlspecialchars($_GET ["pestitle"]);
$pedesc = htmlspecialchars($_GET ["pedesc"]);
$frtTitle = htmlspecialchars($_GET ["frtTitle"]);
$frDesc = htmlspecialchars($_GET ["frDesc"]);
$card = "UPDATE tariffs SET `title`='{$title}',`description`='{$description}',`pestitle`='{$pestitle}',`pedesc`='{$pedesc}',`frtTitle`='{$frtTitle}',`frDesc`='{$frDesc}' WHERE `id`={$id} ";

$sql = mysqli_query($link, $card);
// echo("UPDATE tariffs SET `title`='{$title}',`description`='{$description}',`pestitle`='{$pestitle}',`pedesc`='{$pedesc}',`frtTitle`='{$frtTitle}',`frDesc`='{$frDesc}' WHERE `id`={$id} ");

exit;

// echo($title." ");
// echo($description ." ");
// echo($pestitle ." ");
// echo($pedesc ." ");
// echo($frtTitle." ");
// echo($frDesc);
// print_r($_GET);
?>