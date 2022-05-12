<!doctype html>
<html lang="fr">

<head>
    <meta charset="utf-8">
    <title>identification</title>
    <link rel="stylesheet" href="./Vue/css/inscription.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <!-- Test -->
    <!-- <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Shrikhand&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="./Vue/js/JourNuit.js"></script> -->
    <!-- <link rel="stylesheet" href="./Vue/css/styles.css"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
    
</head>

<body>
    <!--<nav class="navbar navbar-expand-lg navbar-light" style="background-color: rgba(0,0,0,0.4)";>
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
        </nav> -->
    <div class="contenu">
        <div class="jumbotron text-center">
            <h3> Bienvenue ou bonjour ! </h3>
	        <h4> Inscription ou connexion </h4> 
        </div>
        <div class="espace">
            
        </div>
        <div class="container">
            <div class="row">
                <div class="formu">
                    <div class="connexion col-sm-6 col-md-6 col-gd-6">
                        <form action="index.php?controle=visiteur&action=connexion" method="post">
                            <input name="pseudo" type="text" placeholder="Pseudo" class="input"> </i> </br>
                            <input name="mdp" type="password" placeholder="Mot de passe" class="input"></i></br>
                            <button type="submit" class ="bouton"> Connexion</button>
                        </form>
                    </div>
                    <form action="index.php?controle=visiteur&action=inscription" method="post">
                        <div class="inscription col-sm-6 col-md-6 col-gd-6">
                                <input 	name="nom" type="text" placeholder="Nom" class="input"></i> <br/>
                                <input name="prenom" type="text" placeholder="Prénom" class="input"></i> <br/> 
                                <input name="pseudo" type="text" placeholder="Pseudo" class="input"> <br/> 
                                <input  name="tel"  type="text" placeholder="Numéro de téléphone" class="input"> <br/> 
                                <input  name="dateN"  type="date" placeholder="Date de naissance" class="input"> Date de naissance  <br/> 

                                <div id="genre">
                                    <p>Genre :</p>
                                    <input type="radio" id="homme" name="genre" value="H">
                                    <label for="homme">Homme</label><br>
                                    <input type="radio" id="femme" name="genre" value="F">
                                    <label for="femme">Femme</label><br>
                                    <input type="radio" id="autre" name="genre" value="A">
                                    <label for="autre">Autre</label><br/> 
                                </div>
        
        
                                <input name="mail" type="text" placeholder="Mail" class="input">  <br/> 
                                <input  name="mdp"  type="password" placeholder="Mot de passe" class="input"><br/>
                                <button type="submit" class ="bouton"> Valider </button>
                            </div>
                        </div>
                    </form>
                    <a href="index.php?controle=visiteur&action=accueil">Retour à l'accueil</a>
                </div>
            </div>
        </div>
        </div>
    </div>
 
</body>

</html>