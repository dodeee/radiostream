<?php
date_default_timezone_set('Europe/Paris');
class Connexion{
	private $user = "root";
	private $pass = "";

	function __construct(){
		try {
		   $this->db = new PDO("mysql:host=localhost;dbname=radio", $this->user, $this->pass);
		   $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		}
		catch(PDOException $e){
		   echo "Connection failed: " . $e->getMessage();
		}
	}

	public function getCourant(){
		$stmt = $this->db->prepare("SELECT son, heuredebut FROM directlive;");
		$stmt->execute();
		return $stmt->fetch();
	}

	public function setDirect($son){
		$jour = date("z");
		$stmt = $this->db->prepare("DELETE FROM directlive;
									INSERT INTO directlive (son) VALUES (?);
									INSERT INTO passee_ajd (son, jour) VALUES (?,?);
									DELETE FROM passee_ajd WHERE jour != ?");
		$stmt->execute(array($son, $son, $jour, $jour));
	}
	public function getDejaPasse(){
		$jour = date("z");
		$stmt = $this->db->prepare("SELECT son FROM passee_ajd WHERE jour = ?;");
		$stmt->execute(array($jour));
		$data = array();
		while ($row = $stmt->fetch()) {
    		array_push($data, $row[0]);
   		}
   		return $data;
	}
	public function deletePasseeAjd(){
		$stmt = $this->db->prepare("DELETE FROM passee_ajd");
		$stmt->execute();
	}
}
$db = new Connexion();
?>