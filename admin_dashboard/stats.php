<?php
require '../connection.php';

// Get the total number of shared recipes
$sqlRecipeCount = "SELECT COUNT(*) as totalRecipes FROM recipes";
$recipeCountResult = $conn->query($sqlRecipeCount);
$totalRecipes = $recipeCountResult->fetch_assoc()['totalRecipes'];

// Get the total number of users
$sqlUserCount = "SELECT COUNT(*) as totalUsers FROM account";
$userCountResult = $conn->query($sqlUserCount);
$totalUsers = $userCountResult->fetch_assoc()['totalUsers'];

// Get the total number of reports
$sqlReportCount = "SELECT COUNT(*) as totalReports FROM reports";
$reportCountResult = $conn->query($sqlReportCount);
$totalReports = $reportCountResult->fetch_assoc()['totalReports'];

// Get the total number of messages
$sqlMessageCount = "SELECT COUNT(*) as totalMessages FROM contact";
$messageCountResult = $conn->query($sqlMessageCount);
$totalMessages = $messageCountResult->fetch_assoc()['totalMessages'];
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .stats-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            padding: 20px;
        }

        .stats-box {
            flex: 0 0 45%; /* Adjust the width as needed */
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin: 10px;
            border-radius: 5px;
            text-align: center;
            transition: transform 0.3s ease-in-out;
        }

        .users-box {
            background-color: #4CAF50; /* Green */
            color: #fff;
        }

        .recipes-box {
            background-color: #2196F3; /* Blue */
            color: #fff;
        }

        .reports-box {
            background-color: #FF5722; /* Orange */
            color: #fff;
        }

        .messages-box {
            background-color: #FFC107; /* Yellow */
            color: #fff;
        }

        .stats-box:hover {
            transform: scale(1.05);
        }

        h2 {
            color: #333;
        }

        p {
            margin: 0;
            color: #666;
            font-size: 1.2em;
        }
    </style>
</head>

<body>
    <div class="stats-container">
        <div class="stats-box users-box">
            <h2>Total Users</h2>
            <p><?php echo $totalUsers; ?></p>
        </div>
        <div class="stats-box recipes-box">
            <h2>Total Shared Recipes</h2>
            <p><?php echo $totalRecipes; ?></p>
        </div>
        <div class="stats-box reports-box">
            <h2>Total Reports</h2>
            <p><?php echo $totalReports; ?></p>
        </div>
        <div class="stats-box messages-box">
            <h2>Total Messages</h2>
            <p><?php echo $totalMessages; ?></p>
        </div>
    </div>
</body>

</html>
