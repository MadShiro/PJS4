<?php

    function verifSyntaxe($prenom, $nom, $tel, $dateN, $mdp, $mail){
        // Plein de regex moches
        if(!preg_match('`^[A-Z]?[- a-zA-Z]( [a-zA-Z])*$`', $prenom) || !preg_match('`^[A-Z]?[- a-zA-Z]( [a-zA-Z])*$`', $nom)){
            return false;
            throw new Exception("Le prénom ou le nom n'est pas valide");
        }
        if(!preg_match('`^([0-9]{2}\.){4}[0-9]{2}$`', $tel)){
            return false;
            throw new Exception("Le numéro de téléphone n'est pas valide");
        }
        if(!preg_match('`^([0-9]{2}\\){2}[0-9]{4}$`', $dateN)){
            return false;
            throw new Exception("La date de naissance n'est pas valide");
        }
        if(!preg_match('`^*[[:alpha]]*[[:digit]]*$`', $mdp)){
            return false;
            throw new Exception("Le mot de passe n'est pas assez sécurisé");
        }
        if(!preg_match('`^(.+)@(.+)\.(.+)$`', $mail)){
            return false;
            throw new Exception("Le mail n'est pas valide");
        }
        return true;
    }

    function lanceInscription(){
        require("./vue/inscription.tpl");
    }

 /**
 * Inscription
 */
function inscription(){
    // Inscription 
    $nom = isset($_POST['nom'])?($_POST['nom']):'';
    $mdp = isset($_POST['mdp'])?($_POST['mdp']):'';
    $mail = isset($_POST['mail'])?($_POST['mail']):'';
    $prenom = isset($_POST['prenom'])?($_POST['prenom']):''; 
    $pseudo = isset($_POST['pseudo'])?($_POST['pseudo']):'';
    $tel = isset($_POST['tel'])?($_POST['tel']):'';
    $dateN = isset($_POST['dateN'])?($_POST['dateN']):'';
    $genre = isset($_POST['genre'])?($_POST['genre']):'';

    require('./modele/visiteurBD.php');

    if ($nom == '' || $mdp == '' || $mail == '' || $pseudo == '' || verifSyntaxe($prenom, $nom, $tel, $dateN, $mdp, $mail)){
        require ("./vue/inscription.tpl");
    }
    else {
        ajoutUser($prenom,$nom,$tel,$dateN,$pseudo,$mdp,$mail,$genre);
        $_SESSION['profil']= array();
        $_SESSION['profil']['nom']= $nom;
        $_SESSION['profil']['id_client'] = getId($nom, $mdp);
        $url = "index.php?controle=utilisateur&action=profil";
        header("Location:" .$url);
    }
}

function connexion(){
    $pseudo=  isset($_POST['pseudo'])?($_POST['pseudo']):'';
	$mdp=  isset($_POST['mdp'])?($_POST['mdp']):'';
	$msg='';
    require('./modele/visiteurBD.php');
	if  (count($_POST)==0) {
        require ("./Vue/inscription.tpl") ;
	}

    else {
        $verif = verifLogin($pseudo,$mdp);
	    if(!$verif) {
	        $_SESSION['profil']= array();
			
			$msg ="Vous n'êtes surement pas encore inscrit, veuillez le faire S'IL VOUS PLAIIIIIT !!!!!";
	        require ("./Vue/inscription.tpl");
		}
	    else {
            $_SESSION['profil']['id_client'] = getIdPseudo($pseudo, $mdp);
			$url = "index.php?controle=utilisateur&action=profil";
            header("Location:" .$url);
		}
    }	
}

function accueil(){
    require('./modele/visiteurBD.php');
    $tabEvents = getEvents();
    require("./Vue/index.html");
}

?>