<!doctype html>
<html><head>
  <meta charset="utf-8">
  <title>Evenement</title>
  <link rel="stylesheet" href="./Vue/css/styles.css">
  <script src="./Vue/js/JourNuit.js"></script>
  <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Shrikhand&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body style="background-color:lightblue">
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

	<div id ="main">   
		<?php 
		echo ("<h1> Informations sur l'event " .$Event['NomEvent'].": </h1>");
		/*if (isset ($Event)) {
			echo ('<table style="background-color: black;">');
			echo ('<tr> <th class="loca"> ID </th> <th class="loca"> NOM </th> <th class="loca"> Nb </th> </tr>'); 	
			foreach ($Event as $e) {
				echo "<tr class='voiture'>";
				//echo ("<td  class='test'><img src='./images/" . utf8_encode($v['photo']) . "' height='130' width='195'></td>");
				echo ("<td  class='test' >" . utf8_encode($e['IdEvent']) . "</td>"); 
				echo ("<td  class='test'>" . utf8_encode($e['NomEvent']) . "</td>");
				echo ("<td  class='test'>" . utf8_encode($e['NbPersonnes']) . "</td>"); 
				echo "</tr>\n";
			}
			echo ('</table>');
		}
		else 
			echo ('Aucun participant actuellement');*/	
		?>
		<h3> Cet événement a été crée par <?php echo($createur['Pseudo']); ?></h3>
		<h3> Voici la liste des participants : </h3>  
		<?php 
		
		if (isset ($Participants)) {
			echo ('<table>');
			echo ('<tr> <th class="loca" > </th> <th class="loca"></th> </tr>'); 	
			foreach ($Participants as $p) {
				echo "<tr class='voiture'>";
				//echo ("<td  class='test'><img src='./images/' . utf8_encode($v['photo']) . "' height='130' width='195'></td>");
				//echo ("<td  class='test' >" .  "<img src= 'Vue/images/'" . $p['PhotoPersonne'] . ">"); 
				echo ("<td  class='test'>" . utf8_encode($p['Pseudo']) . "</td>");
				//echo ("<td  class='test'>" . utf8_encode($p['caract']) . "</td>"); 
				//echo ("<td>" . utf8_encode($c['role']) . "</td>"); 
				echo "</tr>\n";
			}
			echo ('</table>');
		}
		else 
			echo ('Aucun participant actuellement');	
		?>
		<a href=<?php echo('index.php?controle=evenement&action=inscription&idE=' . $Event["IdEvent"] . '');
		 ?>> S'inscrire </a>
	</div>

</body></html>
