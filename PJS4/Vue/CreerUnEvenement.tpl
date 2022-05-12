
<html lang="en">
    <head>
    <meta charset="utf-8">
    <title>Ajouter un évènement</title>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Shrikhand&display=swap" rel="stylesheet"> 
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <link href="./Vue/css/styleE.css" rel="stylesheet">    
    <link rel="stylesheet" href="./Vue/css/styles.css">
    <script src="./Vue/js/JourNuit.js"></script>
    
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
                        <a class="nav-link" href="index.php?controle=evenement&action=accueilAjout">Evenement</a>
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


    <h1>CREER UN EVENEMENT</h1>
    <div id="conteneur">
        <center>
        <form action="index.php?controle=evenement&action=ajoutE" method="post">
        <div class="element 1">
            <input type="text" name="NbPersonnes" placeholder="Nombre de personnes">
            <input type="text" name="NomEvent" placeholder="Nom de l'évènement"><br>
        </div>
        <div class="element 2">
            <input type="date" name="DateEvent" placeholder="Date de début">
            <input type="text" name="Adresse" placeholder="Adresse">
            
        </div>
        <div class="element 3">
            <label for="HeureDebut">Heure de début</label>
            <input type="time" name="HeureDebut" placeholder="Heure de début">
            <label for="HeureFin">Heure de fin</label>
            <input type="time" name="HeureFin" placeholder="Heure de fin">
        </div><br>
        <button type="submit">Envoyer</button>
        
        </center> 
        </form>
    </div>

    </head>
    <body>    
    
    
    
    </body>
    </html>
