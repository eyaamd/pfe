<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $matiere_id = $_POST['matiere_id'];

    // Connexion à la base de données
    $conn = new mysqli("localhost", "root", "", "myissat");

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    foreach ($_POST as $key => $value) {
        if (strpos($key, 'note_') !== false) {
            $etudiant_id = substr($key, 5);

            $note = $conn->real_escape_string($value);

            $sql_check = "SELECT * FROM note WHERE etudiant_id = '$etudiant_id' AND matiere_id = '$matiere_id'";
            $result_check = $conn->query($sql_check);

            if ($result_check->num_rows > 0) {
                $sql_update = "UPDATE note SET note = '$note' WHERE etudiant_id = '$etudiant_id' AND matiere_id = '$matiere_id'";
                $conn->query($sql_update);
            } else {
                $sql_insert = "INSERT INTO note (etudiant_id, matiere_id, note) VALUES ('$etudiant_id', '$matiere_id', '$note')";
                if ($conn->query($sql_insert) !== TRUE) {
                    echo "Erreur lors de l'enregistrement de la note pour l'étudiant avec l'ID: " . $etudiant_id;

                }
            }
        }
    }

    $conn->close();


}
?>