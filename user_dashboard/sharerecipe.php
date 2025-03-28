<?php 
session_start();
if (!isset($_SESSION['username'])) {
    // Redirect to the login page
    header("Location: ../user_registration/login.php");
    exit(); // Make sure to exit after sending the header to prevent further execution
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Share Recipe</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>

<body>
<?php

if (!isset($_SESSION['username'])) {
    // Redirect to the login page
    header("Location: ../user_registration/login.php");
    exit(); // Make sure to exit after sending the header to prevent further execution
}

require '../connection.php';

if (isset($_POST['share'])) {
    $username = $_SESSION['username'];
    $imgName = $_FILES['img']['name'];
    $imgType = $_FILES['img']['type'];
    $imgSize = $_FILES['img']['size'];
    $imgTmpName = $_FILES['img']['tmp_name'];

    $recipeName = $_POST['rname'];
    $ingredients = $_POST['ingredients'];
    $preparations = $_POST['prepare'];
    $cookingInstructions = $_POST['instruct'];
    $category = $_POST['cat'];

    if ($recipeName == "" || $ingredients == "" || $preparations == "" || $cookingInstructions == "" || empty($imgName) || $imgSize == 0) {
        echo "<script>
        Swal.fire({
            title: 'Error',
            text: 'Please fill in all fields',
            icon: 'error'
        });
        </script>";
        header("Refresh:1;url=sharepage.php");
    } else {
        if (move_uploaded_file($imgTmpName, "../recipeimage/" . $imgName)) {
            // Use prepared statement to avoid SQL injection
            $stmt = $conn->prepare("INSERT INTO recipes (image_path, recipe_name, ingredients, preparations, cooking_instructions, category, timeshared, username) VALUES (?, ?, ?, ?, ?, ?, NOW(), ?)");
            $stmt->bind_param("sssssss", $imgName, $recipeName, $ingredients, $preparations, $cookingInstructions, $category, $username);

            if ($stmt->execute()) {
                echo " <script>
                Swal.fire({
                    title:'Shared',
                    text: 'Your recipe has been successfully posted',
                    icon: 'success'
                });
                </script>";
                header("Refresh:2;url=userdashboard.php");
            } else {
                echo " <script>
                Swal.fire({
                    title:'Error',
                    text: 'An error occurred while sharing your recipe',
                    icon: 'error'
                });
                </script>";
                header("Refresh:2;url=sharepage.php");
            }

            $stmt->close();
        } else {
            echo " <script>
            Swal.fire({
                title:'Error',
                text: 'Failed to move uploaded file',
                icon: 'error'
            });
            </script>";
            header("Refresh:2;url=sharepage.php");
        }
    }
}
?>

</body>

</html>