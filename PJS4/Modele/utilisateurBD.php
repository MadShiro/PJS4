<?php

    /**
     * Met à jour les informations d'un compte
     */
    function updateInfos($dateN, $nom, $prenom, $description){
        require("./modele/connect.php");
        $sql="UPDATE personne SET DateNaissance = :dateN, Nom = :nom, prenom = :prenom, DescriptionPersonne = :description";
        try{
            $commande = $pdo->prepare($sql);
            $commande->bindParam(':dateN', $dateN);
            $commande->bindParam(':nom', $nom);
            $commande->bindParam(':prenom', $prenom);
            $commande->bindParam(':description', $description);
            $commande->execute();
        } catch (PDOException $e){
            echo utf8_encode("Erreur update personne : " . $e->getMessage() . "\n");
            die();
        }
    }

    /**
     * Renvoie les infos sur une personne
     */
    function getInfos($id){
        require("./modele/connect.php");
        $sql="SELECT PrenomPersonne, Pseudo, Genre, DateNaissance, DescriptionPersonne, PhotoPersonne FROM personne WHERE IdPersonne = :id";
        try{
            $commande = $pdo->prepare($sql);
            $commande->bindParam(':id', $id);
            $bool = $commande->execute();
            if($bool){
                $resultat = $commande->fetch(PDO::FETCH_ASSOC);
                return $resultat;
            }
        }catch(PDOException $e){
            echo utf8_encode("Erreur lors de la récupération des infos : " . $e->getMessage() . "\n");
            die();
        }
    }

    /**
     * Supprime le compte
     */
    function supprCompte($id){
        require("./modele/connect.php");
        $sql="DELETE FROM personne WHERE IdPersonne = :IdPersonne";
        try{
            $commande = $pdo->prepare($sql);
            $commande->execute();
        } catch (PDOException $e){
            echo utf8_encode("Erreur lors de la suppression du compte : " . $e->getMessage() . "\n");
            die();
        }
    }

    function getID($nom, $prenom){
        require("./modele/connect.php");
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
    }

    function getAmis($id){
        require("./modele/connect.php");
        $sql = "SELECT PersonneB FROM amis WHERE PersonneA=:id";
        try{
            $commande = $pdo->prepare($sql);
            $commande->bindParam(':id', $id);
            $bool = $commande->execute();
            if($bool){
                $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
                return $resultat;
            }
        } catch(PDOException $e){
            echo utf8_encode("Erreur lors de la récupération des amis");
        }
    }

    function getEvents($id){
        require("./modele/connect.php");
        $sql = "SELECT NomEvent, DateEvent, PhotoEvent, E.IdEvent FROM evenement E, participea P WHERE Participants = :id AND E.IdEvent = P.IdEvent";
        try{
            $commande = $pdo->prepare($sql);
            $commande->bindParam(':id', $id);
            $bool = $commande->execute();
            if($bool){
                $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
                return $resultat;
            }
        }catch(PDOException $e){
            echo utf8_encode("Erreur lors de la récupération des events");
        }
    }

    function getAmisPotentiels($nomAmi){
        require("./modele/connect.php");
        $sql = "SELECT Pseudo, PhotoPersonne FROM personne WHERE Pseudo LIKE '%" . $nomAmi . "%' OR PrenomPersonne LIKE '%" . $nomAmi . "%'";
        try{
            $commande = $pdo->prepare($sql);
            $commande->bindParam(':nomAmi', $nomAmi);
            $bool = $commande->execute();
            if($bool){
                $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
                return $resultat;
            }
        }catch(PDOException $e){
            echo utf8_encode("Erreur lors de la récupération des amis potentiels");
        }
    }
    
?>