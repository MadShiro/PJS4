<?php
 /**
 * Inscription
 */

function accueilAjout(){
    require("./Vue/CreerUnEvenement.tpl");
}

function AjoutOK(){
    require("./Vue/Evenement.tpl");
}

function BidouilleHeure($heure){
    return $heure . ":00";
}

function ajoutE(){
    $NomEvent = isset($_POST['NomEvent'])?($_POST['NomEvent']):'';
    $Adresse = isset($_POST['Adresse'])?($_POST['Adresse']):'';
    $NbPersonnes = isset($_POST['NbPersonnes'])?($_POST['NbPersonnes']):'';
    $DateEvent = isset($_POST['DateEvent'])?($_POST['DateEvent']):''; 
    $HeureDebut = isset($_POST['HeureDebut'])?($_POST['HeureDebut']):'';
    $HeureFin = isset($_POST['HeureFin'])?($_POST['HeureFin']):'';
    $PhotoEvent = isset($_POST['PhotoEvent'])?($_POST['PhotoEvent']):'';
    $Createur = $_SESSION['profil']['id_client']['IdPersonne'];
    //$Createur = 2; //à changer

    include_once('./modele/evenementBD.php');
    if ($NomEvent == '' || $Adresse == '' || $DateEvent == ''){
        require ("./Vue/CreerUnEvenementErreur.tpl"); //à changer
    }
    else {
        var_dump($NomEvent);
        ajoutEvenementBD($NomEvent,$Adresse,$NbPersonnes,$DateEvent,BidouilleHeure($HeureDebut),BidouilleHeure($HeureFin),$PhotoEvent,$Createur);
        $url = "index.php?controle=visiteur&action=accueil";
        header("Location:" .$url);
    }
}

function EventPage(){
    $ide = $_GET['idE'];
    include_once('./modele/evenementBD.php');
    include_once('./modele/utilisateurBD.php');
    $Event = getEvent($ide);
    $createur = getInfos($Event['Createur']);
    $Participants = getParticipants($ide);
    require("./Vue/Evenement.tpl");
}

function inscription(){
    include_once('./modele/evenementBD.php');
    ajoutParticipant($_GET['idE'], $_SESSION['profil']['id_client']['IdPersonne']);
    EventPage();
}
?>