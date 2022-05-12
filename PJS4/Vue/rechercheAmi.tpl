<!DOCTYPE HTML>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="./Vue/css/styles.css">
        <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Shrikhand&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
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

        <div class="jumbotron text-center">
            <h3> Rechercher des amis </h3> 
        </div>   
        <form action="index.php?controle=utilisateur&action=rechercherAmi" method="post">
            <input name="recherche" type="text" placeholder="Rechercher un ami...">
            <button type="submit">Valider</button>
        </form>     

        <div id="listeAmis">
            <?php
                if(count($tabAmis) == 0){ ?>
                    <h2>Nous ne trouvons pas de correspondance</h2>
                <?php 
                } else{
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
    </body>
</html>