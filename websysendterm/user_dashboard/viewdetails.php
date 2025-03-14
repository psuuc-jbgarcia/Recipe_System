<?php
session_start();
require '../connection.php';

if (!isset($_SESSION['username'])) {
    // Redirect to the login page
    header("Location: ../user_registration/login.php");
    exit(); // Make sure to exit after sending the header to prevent further execution
} else {
    $username = $_SESSION['username'];
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recipe Display</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: rgb(254, 217, 149);
            background: radial-gradient(circle, rgba(254, 217, 149, 1) 0%, rgba(247, 204, 165, 1) 100%);
        }

        .container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            padding: 20px;
        }

        .recipe {
            display: flex;
            margin-bottom: 20px;
            overflow: hidden;
            border: 1px solid #ddd;
            border-radius: 8px;
        }

        .recipe img {
            max-width: 50%;
            height: auto;
            border-radius: 8px 0 0 8px;
        }

        .recipe-details {
            padding: 20px;
            flex-grow: 1;
        }

        .recipe h2 {
            margin-bottom: 10px;
            color: #ff9800;
        }

        .recipe p {
            margin: 0;
            color: #555;
        }

        .category {
            background-color: #ff9800;
            color: white;
            padding: 5px 10px;
            border-radius: 4px;
            display: inline-block;
        }

        .comments-section {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #ddd;
        }

        .comment {
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
        }

        .comment p {
            margin-bottom: 5px;
            color: #333;
        }

        .comment small {
            color: #888;
        }

        .comment-form {
            margin-top: 20px;
        }

        .btn-primary {
            background-color: #ff9800;
            border: none;
        }

        .btn-primary:hover {
            background-color: #f57c00;
        }

        i {
            color: #ff9800;
        }

        .rating-form-section {
            margin-top: 20px;
        }
    </style>
</head>


<body>
    <div class="container">
        <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
            <div class="col-md-3 mb-2 mb-md-0">
                <div>
                    <a class="navbar-brand d-inline-flex link-body-emphasis text-decoration-none" href="../user_dashboard/userdashboard.php"><i class="bi bi-arrow-left">Back</i></a>
                </div>
            </div>
            <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                <h2 style="color: #ff9800;">Recipe Display</h2>
            </ul>
            <div class="col-md-3 text-end">

            </div>
        </header>
    </div>

    <div class="container mb-3">
        <?php
        if (isset($_GET['recipeID'])) {
            $recipeID = $_GET['recipeID'];
            $stmt = "SELECT * FROM recipes WHERE id = $recipeID";
            $result = $conn->query($stmt);

            if ($result->num_rows > 0) {
                while ($data = $result->fetch_assoc()) {
                    ?>
                    <div class="recipe">
                        <img src="../recipeimage/<?php echo $data['image_path']; ?>" alt="Recipe Image">
                        <div class="recipe-details">
                            <h2><?php echo $data['recipe_name']; ?></h2>
                            <p><strong>Ingredients:</strong></p>
                            <ul>
                                <?php
                                // Split the ingredients into an array based on a delimiter (assuming ingredients are separated by a line break)
                                $ingredientsArray = explode("\n", $data['ingredients']);

                                // Display each ingredient as a list item
                                foreach ($ingredientsArray as $ingredient) {
                                    echo '<li>' . trim($ingredient) . '</li>';
                                }
                                ?>
                            </ul>
                            <p><strong>Preparations:</strong> <?php echo $data['preparations']; ?></p>
                            <p><strong>Cooking Instructions:</strong> <?php echo $data['cooking_instructions']; ?></p>
                            <p><strong>Category:</strong> <span class="category"><?php echo $data['category']; ?></span></p>
                            <p><strong>Time Shared:</strong> <?php echo $data['timeshared']; ?></p>
                        </div>
                    </div>

                    <!-- Display Average Rating -->
                    <?php
                    $averageRatingStmt = $conn->prepare("SELECT AVG(rating) AS averageRating FROM ratings WHERE recipeid = ?");
                    $averageRatingStmt->bind_param("i", $recipeID);
                    $averageRatingStmt->execute();
                    $averageRatingResult = $averageRatingStmt->get_result();
                    $averageRatingData = $averageRatingResult->fetch_assoc();
                    $averageRating = $averageRatingData['averageRating'];

                    if (!empty($averageRating)) {
                        echo "<p><strong>Average Rating:</strong> ";
                        echo "<span class='average-rating'>";
                        echo str_repeat('<i class="fas fa-star"></i>', round($averageRating)); // Display full stars
                        echo str_repeat('<i class="far fa-star"></i>', 5 - round($averageRating)); // Display empty stars
                        echo "</span></p>";
                    } else {
                        echo "<p><strong>Average Rating:</strong> No ratings yet.</p>";
                    }
                    ?>
                    <!-- End Display Average Rating -->

                    <!-- Comments section -->
                    <div class="comments-section">
                        <?php
                        $stmt = "SELECT * FROM comment INNER JOIN account ON comment.username = account.username WHERE comment.id = $recipeID";
                        $container = $conn->query($stmt);
                        while ($data = $container->fetch_assoc()) {
                            ?>
                            <div class="comment">
                                <p><strong><?php echo $data['username']; ?>:</strong> <?php echo $data['comments']; ?></p>
                                <small><?php echo $data['timecomment']; ?></small>
                            </div>
                        <?php } ?>

                        <!-- Form to add a new comment -->
                        <form class="comment-form" method="post" action="addcomment.php">
                            <input type="hidden" name="recipeID" value="<?php echo $recipeID; ?>">
                            <div class="form-group">
                                <label for="comment">Add a comment:</label>
                                <textarea class="form-control" id="comment" name="comment" rows="3" required></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary" name="addc">Submit Comment</button>
                        </form>
                    </div>

                    <!-- Rating form -->
                    <div class="rating-form-section mt-4">
                        <form class="rating-form" method="post" action="addrating.php">
                            <input type="hidden" name="recipeID" value="<?php echo $recipeID; ?>">
                            <div class="form-group">
                                <label for="rating">Rate this recipe:</label>
                                <select class="form-control" id="rating" name="rating" required>
                                    <option value="1">1 star</option>
                                    <option value="2">2 star</option>
                                    <option value="3">3 star</option>
                                    <option value="4">4 star</option>
                                    <option value="5">5 star</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary" name="addrating">Submit Rating</button>
                        </form>
                    </div>
        <?php
                }
            } else {
                echo "<p>No recipe found.</p>";
            }
        }
        ?>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>

</html>
