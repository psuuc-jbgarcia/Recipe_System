<?php
session_start();

// Check if the user is logged in
if (!isset($_SESSION['username'])) {
    header("Location: ../user_registration/login.php");
    exit();
} else {
    $username = $_SESSION['username'];

    // Retrieve user information from the database based on the username
    require '../connection.php';

    $stmt = $conn->prepare("SELECT * FROM account WHERE username = ?");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();
    } else {
        // Handle the case where user information is not found
        echo "User not found.";
        exit();
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="userdash.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>

<body>
    <!-- Navigation Bar (You can reuse the navigation bar code from userdashboard.php) -->
    <!-- ... -->

    <!-- Profile Section -->
    <section class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <!-- Add a Back button with an icon to redirect to userdashboard.php -->
                    <a href="userdashboard.php" class="btn btn-secondary mt-3 ml-3">
                        <i class="fas fa-arrow-left"></i> Back
                    </a>
<br>
                    <!-- Display profile picture at the top -->
                    <img src="<?php echo !empty($user['profile_picture']) ? $user['profile_picture'] : 'default_profile_picture.jpg'; ?>" alt="Profile Picture" class="card-img-top">
                    
                    <div class="card-body">
                        <h4 class="card-title text-center">Your Profile</h4>
                        <p><strong>Username:</strong> <?php echo $user['username']; ?></p>
                        <p><strong>First Name:</strong> <?php echo $user['firstname']; ?></p>
                        <p><strong>Last Name:</strong> <?php echo $user['lastname']; ?></p>
                        <p><strong>Email:</strong> <?php echo $user['email']; ?></p>
                        <p><strong>Sex:</strong> <?php echo $user['sex']; ?></p>
                        <!-- Add more profile information as needed -->

                        <!-- Add an Edit Profile button or link to allow users to edit their profile -->
                        <a href="editprofile.php" class="btn btn-primary mt-3">Edit Profile</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>