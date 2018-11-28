<?php
session_start(); // Iniciando sesion
$error=''; // Variable para almacenar el mensaje de error
if (empty($_POST['username']) || empty($_POST['password'])) {
$error = "El correo electrónico o la contraseña es inválida.";
}
else
{
// Define $username y $password
$username=$_POST['username'];
$password=$_POST['password'];
// Estableciendo la conexion a la base de datos
include('model/phpConnect.php');
$db = dbConect();
mysqli_set_charset($db, "utf8");
// Para proteger de Inyecciones SQL 
$username    = mysqli_real_escape_string($db,(strip_tags($username,ENT_QUOTES)));
$password =  sha1($password);//Algoritmo de encriptacion de la contraseña http://php.net/manual/es/function.sha1.php
 
$sql = "SELECT email, password FROM login WHERE email = '" . $username . "' and password='".$password."';";
$query=mysqli_query($db,$sql);
$counter=mysqli_num_rows($query);
if ($counter==1){
		$_SESSION['login_user_sys']=$username; // Iniciando la sesion
		header("location: home.php"); // Redireccionando a la pagina home.php	
} else {
$error = "Message: El correo electrónico o la contraseña es inválida.";	
}
}
?>