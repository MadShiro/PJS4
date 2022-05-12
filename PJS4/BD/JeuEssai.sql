INSERT INTO `Personne` (`Pseudo`,`PhotoPersonne`,`NomPersonne`,`PrenomPersonne`,`DateNaissance`,`Genre`,`NumTel`,`Email`,`Mdp`,`DescriptionPersonne`) VALUES
    ('Erolf','flore.png', 'Flo', 'Flore', '2002-06-03', 'F', '06.01.02.03.04', 'bloubloup@gmail.com','767e13b4dde3dc2ecc67a1cd64eb18d813798e3d', 'woooaaaaaaaaa'),
    ('Izanagi', 'rayan.png', 'Ray', 'Rayan', '2001-03-15', 'M', '06.32.75.21.55', 'izanagi@gmail.com', 'ad0a83906d47799f725e9d8363a446099c1f5c26', 'coucou'),
    ('JenPeuxPiou','louise.png','Lou','Louise', '2001-09-09', 'F', '07.52.98.41.23', 'piou@gmail.com', 'b1c2c1be180c48a1033eb19ca28b17126d41a9fc', 'pioooou'),
    ('Kayou', 'valentin.png', 'Val','Valentin', '2001-08-02', 'M', '07.31.65.48.60', 'kayou@gmail.com', '54fa497493b2cd2b82284157a37e7503b91e75ff', 'bonjouuuur'),
    ('Popon', 'françois.png', 'Fra', 'François', '2002-05-26', 'M', '06.52.97.41.62', 'popon@gmail.com', 'aa857fb3ea22273f5e79354141f2c897d696e4b9', 'J aime le café'),
    ('Seraku', 'thomas.png', 'Tho', 'Thomas', '2002-04-18', 'M', '06.42.15.39.88', 'seraku@gmail.com', '7ce0359f12857f2a90c7de465f40a95f01cb5da9', 'saluuut');

INSERT INTO `Evenement`(`NomEvent`,`Adresse`,`DateEvent`,`HeureDebut`,`HeureFin`,`PhotoEvent`,`Createur`) VALUES
    ('SpiderMan No Way Home', 'La Défense', '2022-02-17', '16:45', '19:00', 'spiderMan.jpg', 4),
    ('Atelier Poterie', 'Paris (75011), la Papoterie', '2022-03-14', '15:00', '17:30', 'poterie.jpg', 3),
    ('Tournoi Smash Bros', 'Paris (75011), Meltdown Bar', '2022-04-05', '20:00', '00:00', 'smash.jpg', 2),
    ('Paris Manga', 'Paris', '2022-03-20', '9:00', '15:00', 'cosplay.jpg', 5);

INSERT INTO `participe_à` (`IdEvent`, `Participants`) VALUES
(9, 2),
(9, 3),
(9, 6),
(10, 4),
(10, 5),
(11, 1),
(11, 3),
(11, 6),
(12, 2);

INSERT INTO `Amis` (`PersonneA`, `PersonneB`) VALUES
    (1,3),
    (2,4),
    (5,6),
    (3,5),
    (4,1),
    (2,3);

INSERT INTO `Forum` (`Messages`,`IdPersonne1`, `IdPersonne2`) VALUES
    ('{"Personne1":"Eeeeeh t es où ?", "Personne2":"J suis devant le bar", "Personne2":"Et toi ?", "Personne1":"Je me suis trompée d adresse :scream:"}', 1, 3),
    ('{"Personne1":"Coucou ça va ?", "Personne2":"Vi et toi ?", "Personne1":"Tranquille", "Personne1":"J ai trop hâte pour la poterie."}', 4, 5),
    ('{"Personne1":"Je me suis perdu :sad:", "Personne2":"AH", "Personne2":"Rip..."}', 2, 6);