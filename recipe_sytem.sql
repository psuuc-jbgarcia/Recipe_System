-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2024 at 05:41 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `websysendterm`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `accountid` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`accountid`, `username`, `email`, `password`, `firstname`, `lastname`, `sex`, `profile_picture`) VALUES
(104, 'try', 'admingarcia@gmail.com', '$2y$10$d1u4KljBVgXlZU0tVlWt/ubRGdyhvPegBJ4TJ1d5gb56bvx84dUTO', 'Jerico', 'Garcia', 'Male', 'uploads/howtouse.png'),
(109, 'jerico123', 'gjeric54321@gmail.com', '$2y$10$xlnG2Te0dCgymhBHeXKDFOcRp0sTb82yMasTS4vSqcyktOeA3DZGO', 'jerico', 'garcia', 'male', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `adminaccount`
--

CREATE TABLE `adminaccount` (
  `adminid` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adminaccount`
--

INSERT INTO `adminaccount` (`adminid`, `username`, `password`) VALUES
(1, 'adminjerico', 'admin123'),
(2, 'admin2', 'admin2');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `cid` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `comments` varchar(100) NOT NULL,
  `timecomment` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`cid`, `id`, `username`, `comments`, `timecomment`) VALUES
(8, 56, 'jerico', 'dadad', '2023-12-15 00:17:57'),
(9, 62, 'try', 'dasd', '2024-01-03 21:08:56'),
(10, 62, 'jerico1232', 'SDFSDF', '2024-01-05 18:51:49'),
(11, 64, 'try', 'ZSFSDSF', '2024-01-08 11:16:41'),
(12, 67, 'jerico123', 'GH', '2024-01-08 11:29:01');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `cid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`cid`, `name`, `email`, `message`) VALUES
(12, 'jerico', 'gjeric54321@gmail.com', 'nc website'),
(13, 'try', 'admingarcia@gmail.com', 'I LIKE YOUR WEBSITES');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `fid` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `timeshared` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`fid`, `id`, `username`, `timeshared`) VALUES
(32, 47, 'try', '2023-12-14 22:12:17'),
(34, 56, 'jerico', '2023-12-15 00:20:28'),
(35, 60, 'jerico123', '2023-12-15 01:39:42'),
(42, 58, 'try', '2024-01-05 19:19:43'),
(45, 66, 'try', '2024-01-08 11:19:57'),
(46, 67, 'jerico123', '2024-01-08 11:29:42'),
(48, 69, 'try', '2024-01-10 21:01:46');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `ratingid` int(11) NOT NULL,
  `recipeid` int(11) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `rating` decimal(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`ratingid`, `recipeid`, `username`, `rating`) VALUES
(1, 62, 'try', '1.00'),
(2, 62, 'try', '1.00'),
(3, 62, 'try', '1.00'),
(4, 62, 'try', '5.00'),
(5, 62, 'try', '5.00'),
(6, 62, 'try', '5.00'),
(7, 62, 'try', '1.00'),
(8, 62, 'try', '1.00'),
(9, 61, 'try', '5.00'),
(10, 61, 'try', '5.00'),
(11, 61, 'try', '4.00'),
(12, 61, 'try', '5.00'),
(13, 61, 'try', '5.00'),
(14, 61, 'try', '1.00'),
(15, 62, 'try', '5.00'),
(16, 62, 'try', '5.00'),
(17, 62, 'jerico1232', '5.00'),
(18, 62, 'try', '4.00'),
(19, 62, 'try', '1.00'),
(20, 59, 'try', '1.00'),
(21, 59, 'try', '5.00'),
(22, 59, 'try', '5.00'),
(23, 59, 'try', '1.00'),
(24, 59, 'try', '1.00'),
(25, 58, 'try', '1.00'),
(26, 57, 'try', '4.00'),
(27, 58, 'try', '5.00'),
(28, 56, 'try', '3.00'),
(29, 63, 'try', '5.00'),
(30, 64, 'try', '5.00'),
(31, 65, 'try', '4.00'),
(32, 64, 'try', '1.00'),
(33, 64, 'try', '5.00'),
(34, 67, 'jerico123', '4.00'),
(35, 66, 'jerico123', '5.00'),
(36, 65, 'try', '1.00'),
(37, 67, 'try', '1.00'),
(38, 67, 'try', '1.00'),
(39, 67, 'try', '5.00'),
(40, 68, 'try', '5.00'),
(41, 64, 'try', '1.00'),
(42, 69, 'try', '3.00'),
(43, 67, 'try', '4.00');

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `recipe_name` varchar(255) NOT NULL,
  `ingredients` text NOT NULL,
  `preparations` text NOT NULL,
  `cooking_instructions` text NOT NULL,
  `category` varchar(50) NOT NULL,
  `timeshared` datetime NOT NULL,
  `username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `image_path`, `recipe_name`, `ingredients`, `preparations`, `cooking_instructions`, `category`, `timeshared`, `username`) VALUES
(64, '215412-simple-deep-fried-turkey-vat-01-4x3-1-fc3078f38cd542a5a223d9c53ef25596.jpg', 'Simple Deep Fried Turkey', '3 ½ gallons peanut oil for frying\r\n\r\n1 (10 pound) whole turkey, neck and giblets removed\r\n\r\n1 tablespoon salt, or to taste\r\n\r\n1 tablespoon ground black pepper, or to taste', '1. Prep: Make sure your stockpot or fryer is located outdoors in a safe area. Heat the oil to 350 degrees F. Cut any neck skin away from the thawed bird and make sure the neck hole is at least 1-inch in diameter.\r\n2. Season: Use a paper towel to pat the turkey dry. Season liberally with salt and pepper on the inside and outside.\r\n3. Fry: Place the turkey, neck-side down, in a drain basket. Gently lower the turkey into the hot oil until it\'s completely covered.', 'Heat oil in a large stockpot or turkey fryer to 350 degrees F (175 degrees C). Make sure the fryer is located outdoors in a safe area, preferably on dirt or pavement, and far away from buildings, wooden decks, or other objects. Keep a fire extinguisher handy, just in case.\r\nEnsure that the turkey is completely thawed. Cut any extra skin away from the neck area and make sure neck hole is at least 1 inch in diameter.\r\nPat the bird completely dry with paper towels, then rub liberally with salt and pepper on both the outside and the inside.\r\nPlace turkey into a drain basket, neck-side first. Working slowly and carefully, gently lower the basket into the hot oil to completely cover the turkey.', 'Lunch', '2024-01-08 11:04:07', 'try'),
(65, '7501402crockpot-italian-chicken-recipe-fabeveryday4x3-223051c7188841cb8fd7189958c62f3d.jpg', 'Crockpot Italian Chicken', '1 (16 ounce) bottle Italian dressing (such as Olive Garden℠ Signature Italian Dressing)\r\n\r\n1/4 cup grated Parmesan cheese\r\n\r\n4 boneless skinless chicken breasts', 'Stir Italian dressing and Parmesan cheese together in a bowl.\r\n\r\nPlace chicken in a slow cooker, and pour dressing mixture over chicken. Cover and cook on Low until chicken is tender, no longer pink in the center, and the juices run clear, about 8 hours', 'Stir Italian dressing and Parmesan cheese together in a bowl.\r\n\r\nPlace chicken in a slow cooker, and pour dressing mixture over chicken. Cover and cook on Low until chicken is tender, no longer pink in the center, and the juices run clear, about 8 hours.', 'Breakfast', '2024-01-08 11:13:31', 'try'),
(67, '7501402crockpot-italian-chicken-recipe-fabeveryday4x3-223051c7188841cb8fd7189958c62f3d.jpg', 'FSFSF', 'SSFSFSF', 'SFSFS', 'SFSFSF', 'Breakfast', '2024-01-08 11:28:52', 'jerico123'),
(69, '16448-simple-bbq-ribs-DDMFS-4x3-6c6ec5c3ddda485fbc8c855520ae8fc9.jpg', 'Simple BBQ Ribs', '2 ½ pounds country-style pork ribs\r\n\r\n2 tablespoons kosher salt\r\n\r\n1 tablespoon garlic powder\r\n\r\n1 teaspoon ground black pepper\r\n\r\n1 cup barbeque sauce', 'Store BBQ ribs in an airtight container or zip-top bag for up to four days in the refrigerator. Reheat in the oven or microwave — you may want to add extra barbecue sauce to the ribs to keep them from drying out.\r\n', 'Gather all ingredients.\r\n\r\nPlace ribs in a large pot and cover with water. Stir in kosher salt, garlic powder, and pepper, and bring water to a boil over medium heat. Continue to boil until ribs are tender, 40 to 45 minutes.\r\n\r\nWhile the ribs are boiling, preheat the oven to 325 degrees F (165 degrees C).\r\n\r\nRemove ribs from the pot, and place them in a 9x13-inch baking dish. Pour barbeque sauce over ribs. Cover the baking dish with aluminum foil.\r\n\r\nBake in the preheated oven until the internal temperature of the pork has reached 160 degrees F (70 degrees C), 1 to 1 1/2 hours.\r\n\r\nServe hot and enjoy!', 'Lunch', '2024-01-08 14:43:10', 'try');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `rid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `report` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`rid`, `name`, `report`, `image`, `username`) VALUES
(18, 'jerico', 'ban this', 'Egg_baking-ingredients-e1584136402126.jpg', 'jerico');

-- --------------------------------------------------------

--
-- Table structure for table `userprofile`
--

CREATE TABLE `userprofile` (
  `picid` int(11) NOT NULL,
  `userimg` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`accountid`);

--
-- Indexes for table `adminaccount`
--
ALTER TABLE `adminaccount`
  ADD PRIMARY KEY (`adminid`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`ratingid`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `userprofile`
--
ALTER TABLE `userprofile`
  ADD PRIMARY KEY (`picid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `accountid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `adminaccount`
--
ALTER TABLE `adminaccount`
  MODIFY `adminid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `ratingid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `userprofile`
--
ALTER TABLE `userprofile`
  MODIFY `picid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
