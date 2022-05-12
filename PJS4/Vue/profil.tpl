<!doctype html>
<html lang="fr">

<head>
    <meta charset="utf-8">
    <title>Profil</title>
    <link rel="stylesheet" href="./Vue/css/profil.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="./Vue/css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Shrikhand&display=swap" rel="stylesheet">
    <!--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="./Vue/js/JourNuit.js"></script>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: rgba(0,0,0,0.4)";>
        <div class="container-fluid">
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link titre" href="index.php?controle=visiteur&action=accueil">Coviends-19</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">Accueil</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" <?php if($_SESSION == null){echo("href='index.php?controle=visiteur&action=inscription'");}else{echo("href='index.php?controle=evenement&action=accueilAjout'");}?>>Evenement</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">Carte</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">Archives</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" <?php if($_SESSION == null){echo("href='index.php?controle=visiteur&action=inscription'");}else{echo("href='index.php?controle=utilisateur&action=profil'");}?>> <img src="./Vue/images/user.png" class="profil" alt="logoProfil"></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"> <img src="./Vue/images/light.png" onclick="changerTheme()" class="light"  alt="logoProfil"></a>
                    </li>
                </li>
              </ul>
            </div>
        </div>
    </nav>
    <div class="row">
        <div id="infos" class="col-sm-12 col-md-6 col-gd-6">
            <img src=<?php echo("'" . $photo . "'"); ?>>
            <ul id="infosTxt">
                <li> Pseudo : <?php echo($pseudo); ?> </li>
                <li> Prénom : <?php echo($prenom); ?> </li>
                <li> Né(e) le : <?php echo($dateN); ?></li>
                <li> Age : <?php echo($age); ?></li>
                <li> Genre : <?php echo($genre); ?></li>
            </ul>
        </div>
    
        <div id="description" class="col-sm-12 col-md-6 col-gd-6">
            <p> <?php echo($description); ?></p>
        </div>
    </div>
    
    <div class="row">
        <h2>Mes amis : </h2>
        <div id="amis" class="col-sm-12 col-md-6 col-gd-6">
            <?php
                if(count($tabAmis) == 0){
                    echo("Vous n'avez pas d'amis !");
                }else{
                    foreach($tabAmis as $value){ ?>
                        <div class="potes">
                            <img src=<?php echo("'Vue/images/" . $value["PhotoPersonne"] . "'"); ?>>
                            <p> <?php echo($value["Pseudo"]); ?></p>
                        </div>
                        <?php 
                    }
                }
            ?>
        </div>
    
        <div id="events" class="col-sm-12 col-md-6 col-gd-6">
            <?php
                if(count($events) == 0){
                    echo("Vous ne participez à aucun événement !");
                }else{
                    foreach($events as $value){ ?>
                        <div class="event">
                            <img src=<?php echo("'Vue/images/" . $value["PhotoEvent"] . "'"); ?>>
                            <p><a href= <?php echo('index.php?controle=evenement&action=EventPage&idE=' . $value["IdEvent"] . ''); ?>><?php echo ($value["NomEvent"]); ?></a></p>
                        </div>
                    
                        <?php
                    }
                }
            ?>
        </div>
    </div>
    <button type="submit" class="bouton"><a href="index.php?controle=utilisateur&action=deconnexion">Déconnexion</a></button>
    <button type="submit" class="bouton"><a href="index.php?controle=utilisateur&action=rechercherAmi">Trouver des amis !</a></button>

    
</body>

</html>