<?php
// Connexion à la base de données
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "myissat";

// Création de la connexion
$conn = new mysqli($servername, $username, $password, $dbname);

// Vérifie la connexion
if ($conn->connect_error) {
    die("La connexion a échoué : " . $conn->connect_error);
}

// Récupération des ID du niveau et du semestre sélectionnés depuis la requête AJAX
$niveauId = $_GET['niveau'];
$semestreId = $_GET['semestre'];

// Requête pour récupérer les matières en fonction du niveau et du semestre sélectionnés
$query_matieres = "SELECT `code_EE`, `libelle` FROM `matiere` where
 `id_semestre` = $semestreId AND `id_niveau` = $niveauId ";
$result_matieres = $conn->query($query_matieres);

// Construction des options de la liste déroulante des matières
$options = '<option value="">Sélectionnez une matière</option>';
while ($row_matiere = $result_matieres->fetch_assoc()) {
    $options .= '<option value="' . $row_matiere['code_EE'] . '">' . $row_matiere['libelle'] . '</option>';
}

// Fermeture de la connexion
$conn->close();

// Renvoi des options des matières
echo $options;
?>