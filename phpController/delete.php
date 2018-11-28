<?php 

require('../model/phpConnect.php');
//Generamos la consulta
if(isset($_GET['id'])){
	$db = dbConect();
	mysqli_set_charset($db, "utf8");
	$db = dbConect();
	mysqli_set_charset($db, "utf8");
	//Generamos la consulta
	$sql = "DELETE FROM libro WHERE id=".$_GET['id'];
	$result = mysqli_query($db, $sql);
	dbClose($db);
	echo "Se ha eliminado el documento!";
}else{
	echo "Lo sentimos ha ocurrido un error al eliminar el documento!";
}

?>