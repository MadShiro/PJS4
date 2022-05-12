<?php

    function verifLogin($pseudo, $mdp){
        require("./modele/connect.php");
        $mdp = sha1($mdp);
        $sql = "SELECT * FROM personne WHERE :pseudo=pseudo AND :mdp=mdp";
        $resultat = array();
        try{
            $commande = $pdo->prepare($sql);
            $commande->bindParam(':pseudo', $pseudo);
            $commande->bindParam(':mdp', $mdp);
            $bool = $commande->execute();

            if ($bool){
                $resultat = $commande->fetch(PDO::FETCH_ASSOC); //tableau d'enregistrements
                return $resultat;
            }


        } catch (PDOException $e) {
            echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
            die(); // On arrête tout.
        }
    }

    function ajoutUser($prenom,$nom,$tel,$dateN,$pseudo,$mdp,$mail,$genre){
        require("./modele/connect.php");
        $mdp = sha1($mdp);
        $sql = "INSERT INTO Personne (Pseudo,NomPersonne,PrenomPersonne,DateNaissance,
        Genre,NumTel,Email,Mdp, PhotoPersonne) VALUES (:pseudo, :nom, :prenom, :dateN, :genre,
        :tel, :mail, :mdp, 'anonymous.jpg');";
        try{
            $commande = $pdo->prepare($sql);
            $commande->bindParam(':pseudo', $pseudo);
            $commande->bindParam(':nom', $nom);
            $commande->bindParam(':prenom', $prenom);
            $commande->bindParam(':dateN', $dateN);
            $commande->bindParam(':genre', $genre);
            $commande->bindParam(':tel', $tel);
            $commande->bindParam(':mail', $mail);
            $commande->bindParam(':mdp', $mdp);
            $bool = $commande->execute();
            
        }catch (PDOException $e) {
            echo utf8_encode("Echec de l'ajout d'un utilisateur : " . $e->getMessage() . "\n");
            die(); // On arrête tout.
        }
    }

    function getId($nom, $mdp){
        require("./modele/connect.php");
        var_dump($nom);
        var_dump($mdp);
        $mdp = sha1($mdp);
        $sql = "SELECT IdPersonne FROM personne WHERE :nom=NomPersonne AND :mdp=Mdp";
        try{
            $commande = $pdo-> prepare($sql);
            $commande->bindParam(':nom', $nom);
            $commande->bindParam(':mdp', $mdp);
            $bool = $commande->execute();
            if ($bool){
                $resultat = $commande->fetch(PDO::FETCH_ASSOC); //tableau d'enregistrements
                return $resultat;
            }else{
                echo utf8_encode("Ah bah rip...");
            }
        }catch (PDOException $e) {
            echo utf8_encode("Echec lors de la récupération de l'id : " . $e->getMessage() . "\n");
            die(); // On arrête tout.
        }
    }

    function getIdPseudo($pseudo, $mdp){
        require("./modele/connect.php");
        $mdp = sha1($mdp);
        $sql = "SELECT IdPersonne FROM personne WHERE Pseudo = :pseudo AND Mdp = :mdp";
        try{
            $commande = $pdo->prepare($sql);
            $commande->bindParam(':pseudo', $pseudo);
            $commande->bindParam(':mdp', $mdp);
            $bool = $commande->execute();
            if($bool){
                return $commande->fetch(PDO::FETCH_ASSOC);
            }
        } catch(PDOException $e){
            echo utf8_encode("Echec lors de la récupération de l'ID avec le pseudo");
        }
    }

    /**
     * Avant l'ajout d'un utilisateur, on vérifie qu'il ne soit pas déjà présent
     */
    function verifUserBD($prenom,$nom,$mdp){
        require("./modele/connect.php");
        $resultat = array();
        $mdp = sha1($mdp);
        $sql = "SELECT * FROM personne WHERE :prenom=prenom AND :nom=nom AND :mdp=mdp";
        try{
            $commande = $pdo->prepare($sql);
            $commande->bindParam(':nom', $nom);
            $commande->bindParam(':prenom', $prenom);
            $commande->bindParam(':mdp', $mdp);
            $bool = $commande->execute();

            if ($bool){
                $resultat = $commande->fetch(PDO::FETCH_ASSOC); //tableau d'enregistrements
                if($resultat.count()==0){
                    echo utf8_encode("La base de données n'a aucun pb, étrange....");
                    die();
                    return true;
                }else{
                    return false;
                }
            }

        }catch (PDOException $e) {
            echo utf8_encode("Erreur lors de la vérification de la présence d'un utilisateur dans la BD : " . $e->getMessage() . "\n");
            die(); // On arrête tout.
        }
    }

    function getEvents(){
        require("./modele/connect.php");
        $sql = "SELECT * FROM evenement";
        try{
            $commande = $pdo->prepare($sql);
            $bool = $commande->execute();
            if($bool){
                $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
                return $resultat;
            }
        }catch(PDOException $e){
            echo utf8_encode("Erreur lors de la récupération de tous les évenements : ". $e->getMessage() . "\n");
        }
    }

?>