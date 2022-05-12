<?php

    function ajoutEvenementBD($nomEvent,$Adresse,$DateEvent,$HeureDebut,$HeureFin,$Createur){
        require("./modele/connect.php");
        /*$sql = "INSERT INTO Evenement (NomEvent, Adresse, DateEvent, PhotoEvent, Createur) 
        VALUES (:nom, :adresse, :dateE,  :photo, :createur);";*/
        $sql = "INSERT INTO Evenement (NomEvent, Adresse, DateEvent, Createur) 
        VALUES (:nom, :adresse, :dateE, :HeureD, :HeureF, :createur);";
        try{
            $commande = $pdo->prepare($sql);
            $commande->bindParam(':nom', $nomEvent, PDO::PARAM_STR);
            $commande->bindParam(':adresse', $Adresse, PDO::PARAM_STR);
            $commande->bindParam(':dateE', $DateEvent, PDO::PARAM_STR);
            $commande->bindParam(':heureD', $HeureDebut, PDO::PARAM_STR);
            $commande->bindParam(':heureF', $HeureFin, PDO::PARAM_STR);
            $commande->bindParam(':createur', $Createur, PDO::PARAM_STR);
            $bool = $commande->execute();
            
        }catch (PDOException $e) {
            echo utf8_encode("Echec de l'ajout d'un évènement : " . $e->getMessage() . "\n");
            die(); // On arrête tout.
        }
    }

    /*function getID($nom, $prenom){
        require("./Modele/connect.php");
        $sql="SELECT IdPersonne FROM personne WHERE :nom=nom AND :prenom:prenom";
        try{
            $commande = $pdo->prepare($sql);
            $commande->bindParam(':nom', $nom);
            $commande->bindParam(':prenom', $prenom);
            $bool = $commande->execute();
            if($bool){
                $resultat = $commande->fetch(PDO::FETCH_ASSOC); //tableau d'enregistrements
                return $resultat;
            }
        } catch(PDOException $e){
            echo utf8_encode("Erreur lors de la récupération de l'ID : " . $e->getMessage() . "\n");
        }
    }*/

    function getParticipants($ide){
        require("./modele/connect.php");
        $sql = 'SELECT IdPersonne, Pseudo,PhotoPersonne FROM Personne P, participea PA WHERE P.IdPersonne = PA.Participants AND :ide= IdEvent';
        try{
            $commande = $pdo->prepare($sql);
            $commande->bindParam(':ide', $ide);
            $bool = $commande->execute();
            if($bool){
                $resultat = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
                return $resultat;
            }
        } catch(PDOException $e){
            echo utf8_encode("Erreur lors de la récupération des participants : " . $e->getMessage() . "\n");
        }
    }

    function getEvent($ide){
        require("./modele/connect.php");
        $sql = "SELECT NomEvent, PhotoEvent, Adresse, HeureDebut, HeureFin, Createur, IdEvent FROM evenement WHERE IdEvent = :ide";
        try{
            $commande = $pdo->prepare($sql);
            $commande->bindParam(':ide', $ide);
            $bool = $commande->execute();
            if($bool){
                $resultat = $commande->fetch(PDO::FETCH_ASSOC); //tableau d'enregistrements
                return $resultat;
            }
        }catch(PDOException $e){
            echo utf8_encode("Erreur lors de la récupération des infos de l'event : " . $e->getMessage() . "\n");
        }
    }

    function ajoutParticipant($ide, $id){
        require("./modele/connect.php");
        $sql = "INSERT INTO participea (IdEvent, Participants) VALUES(:ide, :id)";
        try{
            $commande = $pdo->prepare($sql);
            $commande->bindParam(':ide', $ide);
            $commande->bindParam(':id', $id);
            $bool = $commande->execute();
        }catch (PDOException $e) {
            echo utf8_encode("Echec de l'inscription à un évenement' : " . $e->getMessage() . "\n");
            die(); // On arrête tout.
        }
    }

?>