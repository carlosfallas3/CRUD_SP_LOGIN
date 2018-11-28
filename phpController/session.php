<?php
include('model/phpConnect.php');
$db = dbConect();
mysqli_set_charset($db, "utf8");
session_start();// Iniciando Sesion
// Guardando la sesion
$user_check=$_SESSION['login_user_sys'];
// SQL Query para completar la informacion del usuario
$ses_sql=mysqli_query($db, "select email from login where email='$user_check'");
$row = mysqli_fetch_assoc($ses_sql);
$login_session =$row['email'];
if(!isset($login_session)){
dbClose($db);// Cerrando la conexion
header('Location: index.php'); // Redirecciona a la pagina de inicio
}
?>