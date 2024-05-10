<?php
session_start();

// Connexion à la base de données
$bdd = new PDO('mysql:host=localhost;dbname=myissat;', 'root', '');

if (isset($_POST['registerbtn'])) {
    $id = $_POST['id_utilisateur'];
    $mot_de_passe = $_POST['mot_de_passe'];
    $role = $_POST['role'];

    // Requête SQL pour vérifier les informations de connexion
    $query = $bdd->prepare("SELECT * FROM login WHERE  mot_de_passe = :mot_de_passe AND role = :role AND id = :id");
    $query->execute(array(
        'mot_de_passe' => $mot_de_passe,
        'role' => $role,
        'id' => $id
    ));
    $result = $query->fetch(PDO::FETCH_ASSOC);

    if ($result) {
        // Si les informations de connexion sont correctes, définissez les variables de session et redirigez l'utilisateur
        $_SESSION['role'] = $result['role'];
        $_SESSION['id'] = $result['id'];

        // Redirection en fonction du rôle de l'utilisateur
        if ($role == 'Admin') {
          header('Location: Admin_dash/index.php') ;        } 
        elseif ($role == 'Enseignant') {
          header('Location: Ensg_dash/indexE.php') ;                 }
    } else {
        // Si les informations de connexion sont incorrectes, affichez un message d'erreur
        echo "Identifiants incorrects.";
    }
}
?>
