<?php
session_start();
if (!isset($_SESSION['username'])) {
  // header("Location: ../user_registration/login.php");
  // exit(); 
} else {
  $username = $_SESSION['username'];
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User Dashboard</title>

  <!-- Bootstrap CSS -->
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="userdash.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

  <style>
    body{
      background: rgb(254,203,108);
background: radial-gradient(circle, rgba(254,203,108,1) 0%, rgba(247,204,165,1) 100%);

    }
    #sec{
      background: rgb(254,203,108);
background: radial-gradient(circle, rgba(254,203,108,1) 0%, rgba(247,204,165,1) 100%);
    }
   
    #usercircle:hover{
  cursor: pointer;
}
.star-orange {
    color: orange;
}
  </style>
</head>

<body>
  <nav class="navbar navbar-expand-lg navbar-light sticky-top">
    <a class="navbar-brand" href="#">
      <span class="logo-text">FlavorFusion</span>
    </a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav mx-auto">
        <li class="nav-item">
          <a href="userdashboard.php" class="nav-link">Home</a>
        </li>
        <li class="nav-item">
          <a href="sharepage.php" class="nav-link">Share Recipe</a>
        </li>
        <li class="nav-item">
          <a href="favoritespage.php" class="nav-link">Favorites</a>
        </li>
        <li class="nav-item">
          <a href="searchrecipeworld.php" class="nav-link">Search Recipe WorldWide</a>
        </li>
      </ul>
      <hr>
      <ul class="navbar-nav ml-auto" id="usercircle">
        <li class="nav-item dropdown">
          <div style=" background: rgb(250,176,123);
background: radial-gradient(circle, rgba(250,176,123,1) 0%, rgba(249,215,185,1) 100%) !important; /* Set the background color */
        border-radius: 50%; /* Ensure it's a circle */
        width: 50px; /* Set the width of the user image */
        height: 50px; /* Set the height of the user image */
        padding: 10px; " class="user-circle" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
  
          <?php
    // Start the session

    // Check if the user is logged in
    if (isset($_SESSION['username'])) {
        // You can replace 'path/to/user-image.jpg' with the actual path to the user's image
        $userImage='';
        if (file_exists($userImage)) {
            echo '<img src="' . $userImage . '" alt="User Image" class="user-image">';
        } else {
            echo '<span class="user-details text-white small">' . $username . '</span>';
            echo '    </div>
            <div class="dropdown-menu" aria-labelledby="userDropdown">
            <a class="dropdown-item" href="mypost.php">My Post</a>
              <a class="dropdown-item" href="contactui.php">Contact us</a>
              <a class="dropdown-item" href="report.php">Reports a post</a>
              <a class="dropdown-item" href="profile.php">View Profile</a>
              <!-- Add this button in your navbar where you display the user circle -->
              <button class="btn btn-link text-dark ml-3" data-toggle="modal" data-target="#logoutModal">
             Logout
              </button>
                          </div>
          </li>
        </ul>';
        }
        
    } else {
        // If the user is not logged in, you can choose not to display the user circle
        // You can also redirect to the login page or show a login link
    }
?>

      <!-- Logout Modal -->


    </div>
  </nav>
  <div class="container mb-4 w-100 center" style="justify-content: center; padding: 2px;">
    <div class="row">
        <div class="col-md-10 justify-content-center">
            <input class="form-control mr-2 w-100" type="text" placeholder="Search" aria-label="Search" id="searchInput" oninput="searchByName()">
        </div>
        <div class="input-group-append">
            <button class="btn text-white" style="margin-right: 10px; width: 100%; text-decoration: white; background-color: #ff6600;" onclick="clearSearchInput()">Clear</button>
            <button id="start-btn" class="btn btn-danger btn-block"><i class="fas fa-microphone"></i></button>
        </div>
    </div>
</div>
<div class="form-check d-flex align-items-center justify-content-center">
    <a href="?filter=rating" class="nav-link">Filter by Rating</a>
</div>


<script>
    function clearSearchInput() {
        document.getElementById('searchInput').value = '';
    }
</script>



  <section class="container-fluid w-100" id="sec">
    <!-- Inside the #home-tab div -->
    <!-- Search bar -->
    <!-- No results message -->
    <p style="display: none;" id="noResultsMessage" class="text-muted mt-3 text-center justify-content-center text-white">No matching recipes found.</p>
    <!-- Recipe cards container -->
    <div class="row" id="recipeContainer">
   

   




    <?php
      require '../connection.php';

      $orderBy = "timeshared DESC"; // Default order by time shared

      // Check if the 'filter' parameter is set and it's set to 'rating'
      if (isset($_GET['filter']) && $_GET['filter'] === 'rating') {
        // If filter by rating is selected, order by average rating descending
        $orderBy = "averageRating DESC";
      }

      // SQL query to fetch recipes along with their average rating
      $stmt = "SELECT recipes.*, IFNULL(AVG(ratings.rating), 0) AS averageRating
               FROM recipes
               LEFT JOIN ratings ON recipes.id = ratings.recipeid
               GROUP BY recipes.id
               ORDER BY $orderBy";

      // Execute the query
      $container = $conn->query($stmt);

      // Function to check if a recipe is a favorite
      function isRecipeFavorite($recipeID, $username, $conn) {
        $stmt = $conn->prepare("SELECT * FROM favorites WHERE id = ? AND username = ?");
        $stmt->bind_param("ss", $recipeID, $username);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->num_rows > 0;
      }

      // Loop through each recipe in the result set
      while ($row = $container->fetch_assoc()) {
        // Check if the user is logged in
        if (isset($_SESSION['username'])) {
          // Check if the current recipe is a favorite for the logged-in user
          $isFavorite = isRecipeFavorite($row['id'], $_SESSION['username'], $conn);
        }

        // Calculate Average Rating for the current recipe
        $averageRatingStmt = $conn->prepare("SELECT AVG(rating) AS averageRating FROM ratings WHERE recipeid = ?");
        $averageRatingStmt->bind_param("i", $row['id']);
        $averageRatingStmt->execute();
        $averageRatingResult = $averageRatingStmt->get_result();
        $averageRatingData = $averageRatingResult->fetch_assoc();
        $averageRating = $averageRatingData['averageRating'];

        // Display recipe details
        echo '<div class="col-md-4 mb-4">';
        echo '<div class="card h-100 position-relative">';
        echo '<div style="position: relative;">';
        echo '<img src="../recipeimage/' . $row['image_path'] . '" class="card-img-top" alt="Recipe Image" style="object-fit: cover; height: 200px;">';

        // Display Heart Icon for Favorites
        if (isset($_SESSION['username'])) {
          $heartColor = $isFavorite ? 'red' : 'orange';
          echo '<a style="position: absolute; top: 10px; right: 10px; font-size: 24px; color: ' . $heartColor . '; text-decoration: none; z-index: 1;" href="addfavorites.php?idofrecipe=' . $row['id'] . '" class="favorite-button">';
        } else {
          echo '<a style="position: absolute; top: 10px; right: 10px; font-size: 24px; color: orange; text-decoration: none; z-index: 1;" href="addfavorites.php?idofrecipe=' . $row['id'] . '" class="favorite-button">';
        }
        echo '<i class="fas fa-heart heart-icon"></i>';
        echo '</a>';
        // End Display Heart Icon

        echo '</div>'; // Close the relatively positioned container

        echo '<div class="card-body">';
        echo '<h5 class="card-title recipe-name-' . $row['id'] . ' font-weight-bold">' . $row['recipe_name'] . '</h5>';
        echo '<p class="card-text">';
        echo '<span class="font-weight-bold">Category:</span> ' . $row['category'];
        echo '<br>';
        echo '<span class="font-weight-bold">Shared by:</span> ' . $row['username'];
        echo '</p>';

        // Display Star Rating
        echo '<div class="star-rating">';
        $filledStars = round($averageRating, 0, PHP_ROUND_HALF_UP);
        for ($i = 1; $i <= 5; $i++) {
          $starClass = ($i <= $filledStars) ? 'fas star-orange' : 'far star-orange';
          echo '<i class="' . $starClass . ' fa-star" id="star"></i>';
        }
        echo '<span>' . number_format($averageRating, 1) . '</span>';

        echo '</div>';
        // End Display Star Rating

        echo '<a href="#" onclick="viewDetails(' . $row['id'] . '); return false;" class="btn btn-primary">View Details</a>';
        echo '</div>';
        echo '</div>';
        echo '</div>';
      }
      ?>
 


    </div>
  </section>
  <section id="category">

        <div class="container mt-3">
        <h1 class="text-center font-weight-bold" style="color: #FFFFFF; ">C A T E G O R Y</h1>
        <hr width=30% class="mb-4">
            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <img src="../image/breakfast.jpg" class="card-img-top" alt="..." style="height: 240px">
                        <div class="card-body">
                            <h5 class="card-title text-center"><strong>Breakfast Recipes</strong></h5>
                            <a href="viewBreakfast.php" class="btn btn-dark btn-block">View List</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4">
                    <div class="card">
                        <img src="../image/lunch.jpg" class="card-img-top" alt="..." style="height: 240px">
                        <div class="card-body">
                            <h5 class="card-title text-center"><strong>Lunch Recipes</strong></h5>
                            <a href="viewLunch.php" class="btn btn-dark btn-block">View List</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4">
                    <div class="card">
                        <img src="../image/dinner.jpg" class="card-img-top" alt="..." style="height: 240px">
                        <div class="card-body">
                            <h5 class="card-title text-center"><strong>Dinner Recipes</strong></h5>
                            <a href="viewDinner.php" class="btn btn-dark btn-block">View List</a>
                        </div>
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
  <script src="userdash.js"></script>
  <script src="../assets/script.js"></script>

  <script>
         var speechRecognition = window.webkitSpeechRecognition;
var recognition = new speechRecognition();
var searchInput = $("#searchInput");
var content = '';
var isRecognitionStarted = false; // Flag to track the recognition state

recognition.continuous = true;
recognition.interimResults = false; // Set to false for faster onspeechend

recognition.onstart = function () {
    isRecognitionStarted = true;
};

recognition.onspeechend = function () {
    isRecognitionStarted = false;
    content += ''; // Add a space when recognition stops
    searchInput.val(content);
};

recognition.onerror = function () {
    isRecognitionStarted = false;
};

recognition.onresult = function (event) {
    var current = event.resultIndex;
    var transcript = event.results[current][0].transcript;

    content += transcript;

    searchInput.val(content);
};

$("#start-btn").click(function (event) {
    if (isRecognitionStarted) {
        recognition.stop();
    } else {
        recognition.start();
    }
});

searchInput.on('input', function () {
    content = $(this).val();
});

  </script>


<script>
  function viewDetails(recipeID) {
    // Get the current URL
    var currentURL = window.location.href;

    // Check if the filter parameter exists in the URL
    var filterIndex = currentURL.indexOf('?filter=rating');

    // If filter parameter is not present, add it to the URL
    if (filterIndex === -1) {
      currentURL += '?filter=rating';
    }

    // Build the new URL with both recipeID and filter parameters
    var newURL = 'viewdetails.php?recipeID=' + recipeID + '&filter=rating';

    // Update the URL without triggering a full page reload
    history.pushState(null, null, currentURL);

    // Redirect to the new URL
    window.location.href = newURL;
  }
</script>





<!-- Logout Modal -->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="logoutModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="logoutModalLabel">Logout Confirmation</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Are you sure you want to logout?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
        <a href="logout.php" class="btn btn-primary">Logout</a>
      </div>
    </div>
  </div>
</div>



</body>

</html>
