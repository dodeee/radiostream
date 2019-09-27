<?php  
include 'bd.php';
$courant = $db->getCourant();
//verification des entree post
if(isset($_POST["son"]) and $_POST["son"] != 'undefined'){ $son_precedent = htmlspecialchars($_POST["son"]);}
else{ $son_precedent = -1;}
//SI il y a un son courant enregistré dans la base et (si celui-ci n'est pas déjà en train d'être joue ou alors qu'il n'y avait pas de son precedent), on l'envoi au client
if($courant and ($courant[0] != $son_precedent or $son_precedent == -1)){
	$courant[1] = strtotime($courant[1]);  
	$datenow = time();
// différence entre le moment actuel et le début de la musique pour la mettre au bon endroit
	$temps = abs($datenow - $courant[1]);
	echo $courant[0] .','. $temps;
}

//sinon on doit aller chercher un nouveau son au hasard dans le repertoire des sons
else {
	$directory = 'son/';
	if (!is_dir($directory)) {
	    exit('Invalid diretory path');
	}

	$files = array();
	foreach (scandir($directory) as $file) {
	    if ($file !== '.' && $file !== '..') {
	        $files[] = $file;
	    }
	}
	//permet de ne pas prendre les sons passés le jour même
	$files_nonpasse = array_values(array_diff($files, $db->getDejaPasse()));
	//si on a plus de musique à jouer on reprend tout
	if(count($files_nonpasse) == 0){
		$files_nonpasse = $files;
		$db->deletePasseeAjd();
	}
	$son_number = rand(0, count($files_nonpasse)-1);
	$son = $files_nonpasse[$son_number];
	$db->setDirect($son);
	echo $son . ",0";
}
?>