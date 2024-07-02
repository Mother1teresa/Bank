<?php
header('Access-Control-Allow-Origin: *');
$link = mysqli_connect('localhost', 'root', '', 'regist')or die("Error");

$email = htmlspecialchars($_GET['email']);
$password = htmlspecialchars($_GET['password']);

if($email != "" && $password != ""){
    $create = "INSERT user SET `email`='{$email}',`password`='{$password}'";

    $sql=mysqli_query($link, $create);
    
    echo($create);
}





?>
<!-- @click="createUser" -->
<!-- <script>
import axios from "axios";

export default {
  methods:{
    createUser(event){
      
      let emailInput = event.target.parentNode.parentNode.getElementsByClassName("email")[0];
      let passwordInput = event.target.parentNode.parentNode.getElementsByClassName("password")[0];
      // let confirmPasswordInput = event.target.parentNode.getElementsByClassName("confirmPassword")[0];
      
      console.log(event.target.parentNode.parentNode);

      let get = 'http://adminphp/registr.php?email='+emailInput.value+'&password='+passwordInput.value;
     
      axios
      .get(get);
    },
    inputChange (event){
      console.log('event.target', event.target.value, event.target.id)
      
    },
  }
}
</script> -->