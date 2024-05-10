<?php
// Vérifie si le formulaire a été soumis
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Connexion à la base de données
    $conn = new mysqli("localhost", "root", "", "myissat");

    // Vérifie la connexion
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Récupérer les données du formulaire
    $id = $_POST['id'];
    $nom = $_POST['nom'];
    $email = $_POST['email'];
    $mot_de_passe = $_POST['mot_de_passe'];
    $sexe = $_POST['sexe'];
    $grade = $_POST['grade'];
    $role = $_POST['role'];
    // Préparer la requête SQL pour insérer les données dans la table enseignant
    $sql = "INSERT INTO `utlisateur`(`id`, `nom`, `email`, `mot_de_passe`, `sexe`, `grade`, `role`)  VALUES ('$id', '$nom', '$email', '$mot_de_passe', '$sexe', '$grade','$role')";

    // Exécuter la requête et vérifier si elle s'est bien déroulée
    if ($conn->query($sql) === TRUE) {
        echo "Nouvel enregistrement créé avec succès";
    } else {
        echo "Erreur: " . $sql . "<br>" . $conn->error;
    }


    if ($role == "enseignant") {
        // Préparer la requête SQL pour insérer les données dans la table enseignant
        $sql_enseignant = "INSERT INTO enseignant (id, nom, email, mot_de_passe, sexe, grade) 
                           VALUES ('$id', '$nom', '$email', '$mot_de_passe', '$sexe', '$grade')";
        
        // Exécuter la requête pour insérer dans la table enseignant
        if ($conn->query($sql_enseignant) === TRUE) {
            echo "Enseignant enregistré avec succès";
        } else {
            echo "Erreur lors de l'ajout de l'enseignant: " . $conn->error;
        }
    }

    // Fermer la connexion à la base de données
    $conn->close();
}
?>