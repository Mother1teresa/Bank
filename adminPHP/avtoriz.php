<?php
header('Access-Control-Allow-Origin: *');
$link = mysqli_connect('localhost', 'root', '', 'regist')or die("Error");

$email = htmlspecialchars($_GET['email']);
$password = htmlspecialchars($_GET['password']);



$create = "SELECT * FROM `user` `email`='{$email}',`password`='{$password}'";

$sql=mysqli_query($link, $create);



?>
<!-- @click="avtoriz" -->

<!-- <script>
  import axios from "axios";

  export default {
    methods:{
        avtoriz(event){
            let emailInput = event.target.parentNode.parentNode.getElementsByClassName("email")[0];
      let passwordInput = event.target.parentNode.parentNode.getElementsByClassName("password")[0];
      // let confirmPasswordInput = event.target.parentNode.getElementsByClassName("confirmPassword")[0];
      
      console.log(event.target.parentNode.parentNode);

      let get = 'http://adminphp/registr.php?email='+emailInput.value+'&password='+passwordInput.value;
     
      axios
      .get(get);
    },
    }
  }
  </script> -->