<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

<?php
session_start();
require '../connection.php';

if (isset($_POST['addrating'])) {
    $recipeID = $_POST['recipeID'];
    $rating = $_POST['rating'];
    $username = $_SESSION['username'];

    // Insert a new rating
    $insertStmt = $conn->prepare("INSERT INTO ratings (recipeid, username, rating) VALUES (?, ?, ?)");
    $insertStmt->bind_param("isd", $recipeID, $username, $rating);
    $insertStmt->execute();

    // SweetAlert for success
    echo "<script>
            Swal.fire({
                title: 'Success!',
                text: 'Rating added successfully.',
                icon: 'success',
                showConfirmButton: false,
                timer: 1500
            }).then(() => {
                window.location.href = 'viewdetails.php?recipeID=$recipeID';
            });
          </script>";
}
?>
</body>
</html>
