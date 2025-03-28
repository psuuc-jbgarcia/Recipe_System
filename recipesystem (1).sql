-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 01, 2023 at 08:01 AM
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
-- Database: `recipesystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `mealplaninfo`
--

CREATE TABLE `mealplaninfo` (
  `MEALID` int(11) NOT NULL,
  `Day` varchar(100) NOT NULL,
  `BREAKFAST` varchar(100) NOT NULL,
  `LUNCH` varchar(100) NOT NULL,
  `DINNER` varchar(100) NOT NULL,
  `USERID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mealplaninfo`
--

INSERT INTO `mealplaninfo` (`MEALID`, `Day`, `BREAKFAST`, `LUNCH`, `DINNER`, `USERID`) VALUES
(65, 'Monday', 'Egg', 'Pork', 'Chicken', 15),
(66, 'Tuesday', 'Egg', 'Pansit', 'Noodles', 15);

-- --------------------------------------------------------

--
-- Table structure for table `recipestorage`
--

CREATE TABLE `recipestorage` (
  `RECIPEID` int(11) NOT NULL,
  `RECIPENAME` varchar(200) NOT NULL,
  `INGREDIENTS` varchar(200) NOT NULL,
  `CALORIES` varchar(200) NOT NULL,
  `TYPE` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipestorage`
--

INSERT INTO `recipestorage` (`RECIPEID`, `RECIPENAME`, `INGREDIENTS`, `CALORIES`, `TYPE`) VALUES
(1, 'Sinangag', 'Cooked rice (preferably day-old rice)\nGarlic\nVegetable oil\nSalt', ' 200 calories', 'Breakfast'),
(2, 'Egg White Omelette', '3-4 egg whites\r\nSalt and pepper\r\n', '17 calories.', 'Breakfast'),
(4, 'Arroz Caldo', 'Chicken\r\nRice: 1/2 cup\r\nGinger\r\nGarlic\r\nHard-boiled eggs: 1 or 2\r\n', '400-500 calories', 'Breakfast'),
(5, 'Champorado', 'Glutinous rice\r\nCocoa powder: 2 tablespoons\r\nSugar: 2-3 tablespoons\r\nMilk: 1 cup', '300-400 calories', 'Breakfast'),
(6, 'Pinakbet Omelette', 'Egg whites or whole eggs\r\nMixed vegetables (ampalaya, eggplant, squash, okra, tomatoes)\r\nFish sauce (patis)\r\nPepper', '200-250 calories', 'Breakfast'),
(7, 'Pinakbet', 'Bitter gourd\r\nEggplant\r\nSquash\r\nOkra\r\nOnion\r\nGarlic\r\nGinger\r\nCooking oil\r\nWater or vegetable broth', '150-200 calories per serving', 'Lunch'),
(8, 'Chicken Tinola', 'Chicken pieces (bone-in or boneless)\r\nGinger\r\nGarlic\r\nOnion\r\nGreen papaya or chayote\r\nWater or chicken broth\r\nFish sauce (patis)\r\nSalt and pepper', '200-250 calories per serving', 'Lunch'),
(9, 'Shrimp Sinigang', 'Shrimp\r\nTamarind soup base \r\nTamarind paste\r\nWater\r\nTomatoes\r\nOnion\r\nRadishes\r\nString beans\r\nSalt', ' 200-250 calories per serving', 'Lunch'),
(10, 'Vegetable Kare-Kare', 'Eggplant\r\nString beans\r\nBok choy\r\nBanana blossom (puso ng saging)\r\nPeanut butter\r\nGarlic\r\nOnion\r\nAnnatto powder (achuete)\r\nVegetable broth\r\nFish sauce (patis)\r\nCooking oil\r\nSalt and pepper', '250-300 calories per serving', 'Lunch'),
(11, 'Paksiw na Isda', 'Fish fillets (such as bangus/milkfish, tilapia, or mackerel)\r\nVinegar\r\nWater\r\nGarlic\r\nGinger\r\nOnion\r\nLong green chili peppers (siling pansigang) \r\nSalt and pepper\r\nCooking oil', '200-250 calories per serving', 'Lunch'),
(13, 'Adobong Kangkong', 'Kangkong (water spinach): 2 bunches, leaves separated and stems trimmed\r\nGarlic\r\nOnion\r\nSoy sauce\r\nVinegar\r\nWater\r\nCooking oil\r\nSalt and pepper', '100-150 calories per serving', 'Dinner'),
(14, 'Adobong Manok', 'Chicken\r\nSoy sauce\r\nVinegar\r\nGarlic\r\nBay leaves\r\nBlack peppercorns\r\nWaterCooking oil', '250-300 calories per serving', 'Dinner'),
(15, 'Chopsuey', 'Broccoli\r\nCarrots\r\nBell peppers\r\nSnow peas\r\nCabbage\r\nGarlic\r\nOnion\r\nCooking oil\r\nSoy sauce\r\nOyster sauce\r\nSalt and pepper', '100-150 calories per serving', 'Dinner'),
(16, 'Ginataang Gulay', 'Assorted vegetables (such as squash, green beans, eggplant, and leafy greens)\r\nCoconut milk\r\nGarlic\r\nOnion\r\nGinger\r\nRed chili pepper (optional)\r\nSalt', '200-250 calories per serving', 'Dinner'),
(17, 'Laing', 'Taro leaves\r\nCoconut milk\r\nGarlic\r\nOnion\r\nGinger\r\nRed chili pepper (optional)\r\nDried taro stems (optional)\r\nShrimp paste (bagoong)\r\nSalt', '200-250 calories per serving', 'Dinner');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `USERID` int(11) NOT NULL,
  `USERNAME` varchar(100) NOT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  `PHONENUMBER` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`USERID`, `USERNAME`, `PASSWORD`, `PHONENUMBER`) VALUES
(15, 'admin', '$2a$12$uhnCxIg5.Gjd7X3rWr5dWuKF7pfMDRIMIcjbWFk2Om7ciH7AZCUK.', '09519071316'),
(16, 'fherry', '$2a$12$UGevN9GdMEwZtibziuof9OLsI4Dw4S/3rpNxaf5BNkNOYf9qvZP2K', '09519071318');

-- --------------------------------------------------------

--
-- Table structure for table `userimage`
--

CREATE TABLE `userimage` (
  `IMAGENAME` text NOT NULL,
  `IMAGEPATH` text NOT NULL,
  `IMAGEFILE` longblob NOT NULL,
  `USERID` int(11) NOT NULL,
  `IMAGEID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userimage`
--

INSERT INTO `userimage` (`IMAGENAME`, `IMAGEPATH`, `IMAGEFILE`, `USERID`, `IMAGEID`) VALUES
('aboutme.jpg', 'C:\\Users\\Jerico\\Documents\\webDevActivities\\images\\aboutme.jpg', 0xffd8ffe000104a46494600010100000100010000ffed008450686f746f73686f7020332e30003842494d04040000000000681c0228006246424d443061303030613666303130303030653730333030303036383037303030306531303730303030353530383030303063363061303030306163306530303030356130663030303066303066303030303739313030303030613731363030303000ffdb00430006040506050406060506070706080a100a0a09090a140e0f0c1017141818171416161a1d251f1a1b231c1616202c20232627292a29191f2d302d283025282928ffdb0043010707070a080a130a0a13281a161a2828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828ffc200110800ce00cb03012200021101031101ffc4001c0000010501010100000000000000000000000102030506040708ffc4001801010101010100000000000000000000000001020304ffda000c03010002100310000001d11b20c69b20c69b20c69b20c69b2a4313839f9454110545249443d12cbcbfd916acd90634d90635bb460f00000000021f0df4df1c18d454457f7677c2eb7e4960644dd61d67c3159f464b86dca80031ec1e00000008a0613cb3d83c7915f1dae7a4bd76bd9c3d3cfc7a192b0155e8b99b8ce366e7ede7db7af7867b9d8000c7b0780000000018af24f66f2ccd99da5afe3e9ac86ee0b3aef71f7d8e9dfc5534f72fa3b5abede7d47b5e3367bc00031ec1e00000000065703e8d84e5dadfa21b1e3e8cbb759cc70ceb36758c7e92af78e2e5b8d775f3ea1e1d7900031ec1e0000000007162fd06831bc7f5d62f9bd96104dcab65d58d34d1f652f4e5d5adc7efbbf96403af100063d83c0000000002bec3192e765e2b0f37b2aac5f633557c7ada7b391b15c3377a763fd3e400b00018f60f00000068e228926f3ed9d7af98dcd4cbe7f5ddf1bfb73d3857ab9eceedf79e6dfb792d08a5de00000063d83c22248395127622a2c6f4192c72d9e695fbfc2f9fdb048d33d5cbc9b4e9c34b33d3b7945459659b89a591c5d6ae63d82d649ce9322a23dcc781534aba47e73a97499bd2f26758be5d5a79bd745ae87a3d1e5926cda74e7a54adb386b5cd07b10b3646f5a97b24b97b559123e378ae6b94a1be0c8688e36919d2bc3b755777f5f7f3b5451150446b9808ad1fdd55d2bcaf8449d8212be2915cad51c228c1d11cbd1338918ad404551101637468f8a4884068d873d11ac33086b25c948baa5caa9aa5ca06b23cc06a532c1ae4ca06a8ca06a132e8689332d4d6c19c69a932ef3fffc4002b1000010401010802030003010000000000010002030411051012131516202130063114324123243435ffda0008010100010502e9ca4ba7292e9ca4ba7292e9ca4ba7292e9ca4ba7292e9ca4ba7692d4f4fd36930819c058d984d602a31107d2d274cb9174ed25d394974e525d394974e525d394974ed2f56ad75b4ab5895d2c9d80a6b82706aad626af2693a832fc1da7d32bf871ea36df66c766104305784569d6dd4ed4523658fb0fa7e4565d0527ed032a3627c29d1223051c617c5ad712b761f4fca81fc644260ca8e0cb238bcc6011354214b0e43822767c59f8d47b0fa7e4fff009887931c7e62dd018d1911047ea58d5a870a46e105a23f87aa761f4fcabfe02aad6213d9217f0664279e234ef179dfca2e52b039588b1b3e3d5ccfa8761f4fc908e5d5e2df980c0967e128eeb54ef64aa166ebb788166c90bf2664e99e8fedf18abc1a7d87d3f2166fd3a2df2d4e8b79b3558898a93570db9980dcb0c2c30d8870fe1cea869eeb5a831a18cec3e9d64660acddc2c51a701990a1f720f05b90fabbee6d26b4e87006771f4da878d1ddaaeac5af4255fe49531c37da46642d5bdb8ec84f2b4f6eed6ed3ead61b9ab8414722b15b8c4896bb9d71ca0719630ec288195ec6eeb3b4faafe3f11bf6e6f8771d927fb0d524a536568424053968d061bdc7d5add9c26bb29a7c3ca86790afc86956843232181b136956362563435bdc7d2f7606bf0e218dc4289f958c82f2c22c928795047c696089b0c7de7bb216fa322272b518b8b41a3c34eea8e60b881cb7635348d8c40c7ba0aaf77043c1ef3b49c23222f276ff0057db2ec3c29f3b0121191ca9c46d5c646041fc5f48488381ec3b1eedd4493db8d83eb518388c9232c7229cb44afb90b7ebf83b1af21039d8538e0176f3bb0271c236226aab604cf78c89eb8cbe915f872a82900e8dbbace346c7023b9a70514f7eff0060d97a42d1bb239082450bdd51e1c1edb0cf1b2bb328bc35b389267b21982ae2463bb62390545b4a1dba846ede8e47b0d69b8cd78c380c9738451461f2cc3d0c76eb937eff00a8a1dbfc7411e6584c6b784ad8879e1f109f43be8a0ff03f6feec1dce4d5245b8e863f051ee3b1c8a6fd7f5a7c9f41d99f117ea7bb3b73e7f8dfd4ace1f95943bffbfc8fefb9e86d3f4dfd4eb35d3f57809e715d738ae86b35d73baeb9dd65ceeb2e775973bacb9e565ceeb23add6c0d6eb05cf2b2e795973cacb9e565ceeb2e775d1d66bae7302e755d0d66ba3acd7c0d6abe3fffc40020110002020203000301000000000000000000010211103003122122404151ffda0008010301013f01fa6a36742b5463624962501aad091d7c147f8c51252a26ef441798eab0d3fc391688cbf0458f1ccf4213c5b1ca86ede84fd1624c9bbd5c6ed14723a5a5228e3975659cb2b65695e63bfc76d8be9fffc4001f1100010500030003000000000000000000010002101130031221405051ffda0008010201013f01f864aecaf27156603903812bb15dbf51280b4dc1d172cc1c204f18c0a23d9ab280ac291968ac9e28c30636ad7236c4718f2f4e9efd0fffc400321000010202080504010305000000000000010002031110122130313291d1202241439213405161420462b15052717281ffda0008010100063f02ef792ef792ef792ef792ef792ef792ef792ef792ef792ef792c6298bd1b5d59c43d404b7e0192af09d17ec57c177bcd77bc977bc977bc977bc977bc977bcee8bbf3394273de664f1cc141f05c410a7844199b7ee79e89cf79e3b5634362b3fe8f909af65ad7098be9331799714c2b29fba1d01d8c3c3fc5f4270c01e0054d4a4ab3345303825fdcc37c7fd851240705aa614c53fa73fba57cd1f2fa2b1562980562500ee022887f0ce637d23897095390ae62d0ba516ae5562e6457aa7344fe2f9bf4e44d36c291fa425582c158a7225749fdab2c2bd2fc5a798fd20d6d805f01f69dc18d320b9a189fca9da1478bd5ce95fc9024cc1a6c320883d28b0ab696fddbec27f0782b34d572e7c17285388254068ea83474f61127f1458a4072ab584c84d5588cb7e08595a15947aaeeb87b110c61d69b172cbec29be1da8d5655760ac9afd831400c07b16c51f36a9f0cca0c9c820d661eca237aca7c1d160283125626d6c6f2ce377c706280380b4aa805885162b6e2db89f50ade0aeec5c8dd4ee334d38346141042e52b042b5a5482aae748a98b93c41ac9d62ad0e2b215cedb1ca6d330a74cd5aa7e995635cb9c1b6e0dcd7fc54da64a4ecca548898345d9ba9d50bd484abf5eaa7f0ab3f0e83dc5666538842787f3743faa1a02c91740b2c5d02cb1741bac91740b245d06eb245d06eb246d06eb246d06eb246d06eb246d06eb246d06eb246d06eb246d06eb246d06eb246d06eb246d06eb246d06eb246d06eb246d06eb245d06eb245d06eb2c5d02c91741bac91741bac91741bac91741bafffc4002510000201030402030101010000000000000001112131411051617120f0308191a1c1b1ffda0008010100013f21e5f5e8e5f5e8e5f5e8e5f5e8e5f5e8e5f5e8e5f5e8e5f5e8e5f5e8e7f5e879535d0ee865903c12408424e4c81bc5e92fd2b81cb57f073fa7472faf472faf472faf472faf472faf4396fe9d7c52815be4dc6a17e5b65c9271a3110e1aa7fd16aa8365b9657288c629f6b9ebcaef856b1296610e74eb09612d864c68a5a134584fa19501ac593dc669c53b455f12a7ec21c740338f1bbe142a555d90d2f48a8d616d544a4a4245370f0c986a33e44948d6acfd9e3779bd1f415299671fa2b62743b0cc890d0a12ba31fbb1761d311a9daa8a542f52a7c0ff007c6ef86502579189565928d9212d168374418f46244026a9ed131aa99268f4278b3fe941785df0bb8d30892c12258dd07038ff00a8547009a6f91df24143b726f64aa8dc63739d78ddf0a6d6102933548b2a925551cb43f4ed4b12e0d5865142a38a116ba3381b69a4e9a8be5f15df0fdc0fe1ce8511693ecac2dc15e6876122914d13328eb290ac12e14815d1018095f6d05cd0e12f1bbe1fbbc3917972545347a021590af436e40986cec0b0b2f0c9d167385e577c29ad878624e23823202afd9924e1b454c9961321c0c1898a57c108bbe2a77785412fa312172ddc59149337832854fd8e9398443892e1ed02ad448f2bbe2991686881204a23926853b8aa856811525b29407d4e8220e6336e831eaad1d7ceef8ab852ff0042abc9307c2612cbba8862afd0d8c445a45a29ca0e0429b4ddb2050d5c884e110979ddf0c9bc8ed934200292246f48b198ad8ad81f1575db131427f7e0bbc9aaec6b8a8eb2a0e7964775a0ed6898f2b4d0ea98cc904f7f12c936317711bf81c43267caed509516ac93805aba8644898f552adcad0d496962083de6eb03a2896890934c2e26da46c8b23f0bb45a723596d1782059365940129b90340cc63970e9fa14324595d1e9c821492b4b84bd8748c431697544a4b6976c5d59b81915259962617d0dcd909b76b91cd10fd1ec4525144875bc29ad861489add0df1a3d6da265c582c8cad19668fd12a38d8973d9a6336fcc8eaf26f045632a4905d68caa73689d215d902a5250a85827dc1108994c8c7aa289945c589c8ee85a2dd214cc29df56561308a6094b61386afd25c40a592a1b40e82c29121086607ab217663be9dd9a316f8b52c99904355242ab5b0d2a51289b0a4cf60a1505f5625282b68c43d686d2f8d0a186e91bd2dd16926343e09a560ff6370257b69b0c783d08ae1b96b1a91d27c12d63084fc2492a42a31d41950b0318d31a48d12264c6aad172d0398836924e9810d40741436cc7a3b18d24931e0c0aec52fa4617a1fa22b5ec7224a3153d0fd1310bc140489129044046f09640910f520408f5081223143c23d63fd14021410f404268867fffda000c0301000200030000001030c30c21c941e6430c23cf3cf2afdabdfc5cf28f3cf288f47b8a6d43ca3cf3ca2281095dab4f28f3cf2c763fea52d73ca3cf3cf2e88376b17cf28f3cf3c86c39af1df3ca3cf3cdd27fcc07e3cf28f361ea3e2179aaa6b4a1e4c3863807f8579618cf175dace05cbeff007e241aedee71e555da4eb6be393db91418de1211920bffc4001e11010101000105010100000000000000000111002110203031415140ffda0008010301013f10fe36c5194785d65c07192e04a6b3c0ae0f0c2b30c7bde8cc0a9e0b170718a50cf199ce48af8184f8ca182603ce3937243c06bac644298fa1a5e7359efba41c2170ddc3aaf7dd7b7e3ac0ebd57ad0ba7e6787eeb9925f9a304e9676cdc94ca3be8fbd7a7aea3d4ec549e11e3fffc4001e11000300020203010000000000000000000001112130102031404151ffda0008010201013f10f4d284123d29914360aa26f2534411665fc0bb83f508d61e878dae1b4f3c28d647f2b425aa379321285c9f6d0d112e090b11104ef0748962c3165c42d34ae011467cd18086484c8d0bd5f47920ea44a29b266eda3edfffc40027100100020202010402030101010000000001001121314151612030718110b191a1d1c1e1f0ffda0008010100013f10f65a69a69a69a69a4e50843e8fdb8098e793b8be0addb282f2f53266e233a7ccd9d7bbb8e005dc078a3042a2832fe93f687ab869a69a6834f682d004bb37d9e09ccc2bcb32bfc85f03f337a31b4de2318a6b705502d90859ae3926f6beab3a39087eb92ce574ed7ab6fb2d7117b1ae22251a36c5a1e231f9866a732d0a2c8710d72c6e560dcc83b467409d70f706e7ad535f7d45684f66e394af8576cfd9e4943764e5167a76faee713244cb9d19af9d41714df11c672328f708e30ee5ecf26f89875a66a5bae3c735165ddc14bf3c90d009f06cf3f11956865c99b2f2dafa7f7e9dbec388bc159e0b3114b156e511cd140cbfe42d06d008366e9ea26f5ec21cb6764c93fc87d45eb572133e47f640a22aff00af1029da5db6a7e4aff887a36fb0331892d1c05ccc0c1d731f395411778a16bd40436e10e21dc57134e272452a9ae6a2f00ba8df9f985705aa87f7150e12c4e668372f0a5ca745ff00a9a7a1e7ec106a6000e01962819744b093574c70a2c007100eb02eed356cee0e5be0c4b82d4ba0554442cd50ee3922c2bc83c44a479a8c31b9f1b43ed486bd1b7d8607e3e0072aff00101c89b6150b438233242f08fd4a7b068b7f92c4b8b962a05bc47f89795aee644c99c6e2cd8bc5bf30b91d36534f11ba2b3826af6209902d7f3bf4edf6198dd589bf9437b2a94d1172e2eb94638956507f887429d9429f9bdcbf81995240d661d3529281f3dc005734afe583840d2788cb0a7003feba84ac5368028f4edf618c716367f1319581e21ef52990530d6b2a1c097a18428280ea2750e89865890d852c1c0be41fa9490807723fec3d3b7d8632a8db4e25442422a93898f6cad64066236f6f82106db2d987006af6329526373bbdc331b2d8956530ebedabefd5bfd9638164fe8e25d6388ad4b86e6213ea5e413298f94747392c49550476ff0022194c64d772a5e06a136a4f81cb35e007d7ab6fb45b01617dde2023f8856acb2ce94a6bb3fd9550a3ce143d9f215913563c1108578e1255329da6fbf930f56df6583818457be93084a6e105e480c8571dca0907833b4b26a50161e261b092105b50398288e49e7e218b8afc3d1e6057301c07af6fb170af0c283cc2a1a7c4bc30db2fb3b81860988e79c4ca55cd5418151c67885d55fea2b37c740735e7c4dc1c2f2bb7d8dbea2709f70b82a816813fd4628bf318ae93f61fa8142b13744e4800b7311432a912ee065b3782115b68da5d11f7406ba335443c34e77bae2520bf240688fc7ab6fe6c0c0ed895379688dd0f80957bcc0c59332f50671120844a6231304d539804942c697f0c501a753e19ce8e8868812711805340c43812fc53d4610fb898a1be9837f9dbf8ed6f444161eb82135845c30416ee58989d660b0c4cd724615387697e2508e50ccbdea0bdf03ffbccdf697102e0b9419388c37a86fccc2af8182d6ff1b668408eb97441445598f53cce4d08f869c8114062e42b057f1beef15511009947642d96d92a295a211709dc39163aac1290140f12b8ab087fb436a7a4125a956f88b66448a884e6392b0b920208ee6d8146f51e6a553d73071a63a8960d455eb66e0ffd99b33ca22f5f6e904900271d5627ea17de01c4c1d82fe48a5622c4143e1a5e09bbeea15f84211a1cfa5f3070f83a3f72cfa7b604fd4e33586256660df44b94da7f51d38a97c394f25cd228a09715c0c330d6e39958206fb53b8d9f360e1f922170ca3af6476f8717173255469a00797c13343a715568efe6666e5a6c31c863c4bb2731d0b194f432adbb8ea8e51fc4bad4c91dc0d41cfe3508014954c4e2f668a1fa8ba05e43ff0098661f23bfc893816578883545b75dfca10400701386704d23c24d6291ddc713404755396b0663a5d84c0789825e63a822ce609292e2e9a9796aaf335ed53e0787c4b41dff00f47c13c62b821e25dce7132260cd23b0f2ccc8b959d7ea36872a33f52511773312e5c1a85b7295041da444904a867a960f12ee23a4e22c5b0a6e67112da6e599442ef61129ab9a596d3c454b7a73f716c3c93019c533905c24f296c545e25d61332a584aaae833163e4ac8ad67171425862e6394695788c0ea2dce6cee89b8d540e8e2200cb28bd159196ab9e4f119721081dfe39428906506e4913725e228995b5e625111de225ff12e4c249a0249b24a8b539aefb240c9d131b24181d8ac8d859e646c6120ffd9, 15, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mealplaninfo`
--
ALTER TABLE `mealplaninfo`
  ADD PRIMARY KEY (`MEALID`),
  ADD KEY `USERID` (`USERID`),
  ADD KEY `USERID_2` (`USERID`);

--
-- Indexes for table `recipestorage`
--
ALTER TABLE `recipestorage`
  ADD PRIMARY KEY (`RECIPEID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`USERID`);

--
-- Indexes for table `userimage`
--
ALTER TABLE `userimage`
  ADD PRIMARY KEY (`IMAGEID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mealplaninfo`
--
ALTER TABLE `mealplaninfo`
  MODIFY `MEALID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `recipestorage`
--
ALTER TABLE `recipestorage`
  MODIFY `RECIPEID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `USERID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `userimage`
--
ALTER TABLE `userimage`
  MODIFY `IMAGEID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
