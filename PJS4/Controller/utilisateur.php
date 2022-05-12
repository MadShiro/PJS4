<?php

// TESTER LES AMIS DES QUE LA CONNEXION SERA FAITE

    function accueil(){
        $nom = isset($_GET['nom'])?($_GET['nom']):'';
        require("Vue/accueil.tpl");
    }

    function profil(){
        date_default_timezone_set("Europe/Paris");
        // Récuper photo, pseudo, nom,l'age, genre
        $id = $_SESSION['profil']['id_client'];
        require('./modele/utilisateurBD.php');
        $infos = getInfos($id['IdPersonne']);
        $pseudo = $infos['Pseudo'];
        $prenom = $infos['PrenomPersonne'];
        $dateN = $infos['DateNaissance'];
        $genre = $infos['Genre'];
        $description = $infos['DescriptionPersonne'];
        $photo = "Vue/images/" . $infos['PhotoPersonne'];
        $age = calculerAge($dateN);
        // Récupérer les Id des amis
        $amis = getAmis($id['IdPersonne']);
        $events = getEvents($id['IdPersonne']);

        // Faire un foreach sur tous les amis pour récupérer leurs infos
        $cpt = 0;
        $tabAmis = array();
        if($amis != false){
            foreach($amis as $val){
                $tabAmis[$cpt] = getInfos($val['PersonneB']);
                $cpt++;
            }
            $cpt = 0;
        }
        
        require("Vue/profil.tpl");
    }

    function rechercherAmi(){
        $nomAmi = isset($_POST['recherche'])?($_POST['recherche']):'';
        require('./modele/utilisateurBD.php');
        $tabAmis = getAmisPotentiels($nomAmi);
        require("Vue/rechercheAmi.tpl");
    }

    function deconnexion(){
        //$_SESSION['profil']['id_client'] = null;
        session_destroy();
        $url = "index.php?controle=visiteur&action=accueil";
        header("Location:" .$url);
    }

    function calculerAge($dateN){
        $date_naissance = explode('-', $dateN);
        $date_ajd = explode('/', date('Y/m/d'));
 
        if(($date_naissance[1] < $date_ajd[1]) || (($date_naissance[1] == $date_ajd[1]) && ($date_naissance[2] <= $date_ajd[2])))
            return $date_ajd[0] - $date_naissance[0];
        else
            return $date_ajd[0] - $date_naissance[0] - 1;
    }
?>