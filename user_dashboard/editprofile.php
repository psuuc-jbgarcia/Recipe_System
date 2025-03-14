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

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Handle the form submission and update the user's profile information in the database

    $firstname = $_POST['firstname'];
    $lastname = $_POST['lastname'];
    $email = $_POST['email'];
    $sex = $_POST['sex'];

    // Validate and sanitize user input as needed

    // Check if a file is uploaded
    if ($_FILES['profile_picture']['error'] == 0) {
        $targetDir = "uploads/"; // Specify your target directory
        $targetFile = $targetDir . basename($_FILES['profile_picture']['name']);
        $imageFileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));

        // Check if the file is an image
        $validExtensions = array("jpg", "jpeg", "png", "gif");
        if (in_array($imageFileType, $validExtensions)) {
            // Upload the file
            move_uploaded_file($_FILES['profile_picture']['tmp_name'], $targetFile);

            // Update the user's profile picture in the database
            $updateStmt = $conn->prepare("UPDATE account SET firstname = ?, lastname = ?, email = ?, sex = ?, profile_picture = ? WHERE username = ?");
            $updateStmt->bind_param("ssssss", $firstname, $lastname, $email, $sex, $targetFile, $username);

            if ($updateStmt->execute()) {
                // Profile update successful
                header("Location: profile.php");
                exit();
            } else {
                // Profile update failed
                $error_message = "Error updating profile. Please try again.";
            }
        } else {
            $error_message = "Invalid file type. Only JPG, JPEG, PNG, and GIF files are allowed.";
        }
    } else {
        // Update the user's profile information without changing the profile picture
        $updateStmt = $conn->prepare("UPDATE account SET firstname = ?, lastname = ?, email = ?, sex = ? WHERE username = ?");
        $updateStmt->bind_param("sssss", $firstname, $lastname, $email, $sex, $username);

        if ($updateStmt->execute()) {
            // Profile update successful
            header("Location: profile.php");
            exit();
        } else {
            // Profile update failed
            $error_message = "Error updating profile. Please try again.";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="userdash.css">
</head>

<body>
    <!-- Navigation Bar (You can reuse the navigation bar code from userdashboard.php) -->
    <!-- ... -->

    <!-- Edit Profile Section -->
    <section class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h4 class="text-center">Edit Your Profile</h4>
                    </div>
                    <div class="card-body">
                        <!-- Display any error messages here -->
                        <?php if (isset($error_message)) : ?>
                            <div class="alert alert-danger" role="alert">
                                <?php echo $error_message; ?>
                            </div>
                        <?php endif; ?>

                        <!-- Edit Profile Form -->
                        <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" enctype="multipart/form-data">
                            <!-- Original form inputs -->
                            <div class="form-group">
                                <label for="firstname">First Name:</label>
                                <input type="text" class="form-control" id="firstname" name="firstname" value="<?php echo $user['firstname']; ?>" required>
                            </div>
                            <div class="form-group">
                                <label for="lastname">Last Name:</label>
                                <input type="text" class="form-control" id="lastname" name="lastname" value="<?php echo $user['lastname']; ?>" required>
                            </div>
                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="email" class="form-control" id="email" name="email" value="<?php echo $user['email']; ?>" required>
                            </div>
                            <div class="form-group">
                                <label for="sex">Sex:</label>
                                <select class="form-control" id="sex" name="sex" required>
                                    <option value="Male" <?php echo ($user['sex'] == 'Male') ? 'selected' : ''; ?>>Male</option>
                                    <option value="Female" <?php echo ($user['sex'] == 'Female') ? 'selected' : ''; ?>>Female</option>
                                    <option value="Other" <?php echo ($user['sex'] == 'Other') ? 'selected' : ''; ?>>Other</option>
                                    <!-- Add more options as needed -->
                                </select>
                            </div>

                            <!-- New input for profile picture -->
                            <div class="form-group">
                                <label for="profile_picture">Profile Picture:</label>
                                <input type="file" class="form-control-file" id="profile_picture" name="profile_picture">
                                <?php if (!empty($user['profile_picture'])) : ?>
                                    <img src="<?php echo $user['profile_picture']; ?>" alt="Current Profile Picture" class="mt-2" style="max-width: 100px;">
                                <?php endif; ?>
                            </div>

                            <button type="submit" class="btn btn-primary">Save Changes</button>
                        </form>
                        <!-- End Edit Profile Form -->
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