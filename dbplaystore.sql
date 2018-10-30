-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 30, 2018 at 05:21 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbplaystore`
--

-- --------------------------------------------------------

--
-- Table structure for table `app`
--

CREATE TABLE `app` (
  `app_id` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `rating` varchar(100) DEFAULT NULL,
  `collectionID` int(11) DEFAULT NULL,
  `categoryID` int(11) NOT NULL,
  `developerID` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app`
--

INSERT INTO `app` (`app_id`, `description`, `title`, `url`, `rating`, `collectionID`, `categoryID`, `developerID`) VALUES
('0', 'test', 'test', 'test', 'test', 1, 1, '1'),
('testing', 'test', 'test', 'test', 'test', 1, 1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryID`, `name`) VALUES
(5, 'ANDROID_WEAR'),
(6, 'ART_AND_DESIGN'),
(7, 'AUTO_AND_VEHICLES'),
(8, 'BEAUTY'),
(9, 'BOOKS_AND_REFERENCE'),
(10, 'BUSINESS'),
(11, 'COMICS'),
(12, 'COMMUNICATION'),
(13, 'DATING'),
(14, 'EDUCATION'),
(15, 'ENTERTAINMENT'),
(16, 'EVENTS'),
(17, 'FAMILY'),
(18, 'FAMILY_ACTION'),
(19, 'FAMILY_BRAINGAMES'),
(20, 'FAMILY_CREATE'),
(21, 'FAMILY_EDUCATION'),
(22, 'FAMILY_MUSICVIDEO'),
(23, 'FAMILY_PRETEND'),
(24, 'FINANCE'),
(25, 'FOOD_AND_DRINK'),
(26, 'GAME_ACTION'),
(27, 'GAME_ADVENTURE'),
(28, 'GAME_ARCADE'),
(29, 'GAME_BOARD'),
(30, 'GAME_CARD'),
(31, 'GAME_CASINO'),
(32, 'GAME_CASUAL'),
(33, 'GAME_EDUCATIONAL'),
(34, 'GAME_MUSIC'),
(35, 'GAME_PUZZLE'),
(36, 'GAME_RACING'),
(37, 'GAME_ROLE_PLAYING'),
(38, 'GAME_SIMULATION'),
(39, 'GAME_SPORTS'),
(40, 'GAME_STRATEGY'),
(41, 'GAME_TRIVIA'),
(42, 'GAME_WORD'),
(43, 'HEALTH_AND_FITNESS'),
(44, 'HOUSE_AND_HOME'),
(45, 'LIBRARIES_AND_DEMO'),
(46, 'LIFESTYLE'),
(47, 'MAPS_AND_NAVIGATION'),
(48, 'MEDICAL'),
(49, 'MUSIC_AND_AUDIO'),
(50, 'NEWS_AND_MAGAZINES'),
(51, 'PARENTING'),
(52, 'PERSONALIZATION'),
(53, 'PHOTOGRAPHY'),
(54, 'PRODUCTIVITY'),
(55, 'SHOPPING'),
(56, 'SOCIAL'),
(57, 'SPORTS'),
(58, 'TOOLS'),
(59, 'TRAVEL_AND_LOCAL'),
(60, 'VIDEO_PLAYERS'),
(61, 'WEATHER');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `class_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `protect_id` int(11) NOT NULL,
  `perm_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `collections`
--

CREATE TABLE `collections` (
  `collectionID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `collections`
--

INSERT INTO `collections` (`collectionID`, `name`) VALUES
(2, 'NEW_FREE'),
(3, 'NEW_PAID'),
(4, 'TOP_FREE'),
(5, 'TOP_PAID'),
(6, 'TOP_GROSSING'),
(7, 'TRENDING');

-- --------------------------------------------------------

--
-- Table structure for table `developer`
--

CREATE TABLE `developer` (
  `developerID` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dev_url` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `developer`
--

INSERT INTO `developer` (`developerID`, `name`, `dev_url`, `email`, `address`) VALUES
('1', 'test', 'test', 'test', 'test'),
('5700313618786177705', 'Google LLC', 'http://www.google.com/chrome/android', 'apps-help@google.com', '1600 Amphitheatre Parkway, Mountain View 94043'),
('Facebook', 'Facebook', 'https://www.facebook.com/facebook', 'android-support@fb.com', '1 Hacker Way\nMenlo Park, CA 94025'),
('WhatsApp+Inc.', 'WhatsApp Inc.', 'http://www.whatsapp.com/', 'android@support.whatsapp.com', '1601 Willow Road\nMenlo Park, CA 94025');

-- --------------------------------------------------------

--
-- Table structure for table `method`
--

CREATE TABLE `method` (
  `method_id` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `protect_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `perm_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`perm_id`, `name`) VALUES
(1, 'android.permission.ACCESS_COARSE_LOCATION');

-- --------------------------------------------------------

--
-- Table structure for table `protection`
--

CREATE TABLE `protection` (
  `protect_id` int(11) NOT NULL,
  `level` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app`
--
ALTER TABLE `app`
  ADD PRIMARY KEY (`app_id`),
  ADD KEY `FK_Collection` (`collectionID`),
  ADD KEY `FK_Category` (`categoryID`),
  ADD KEY `developerID` (`developerID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`class_id`),
  ADD KEY `perm_id` (`perm_id`);

--
-- Indexes for table `collections`
--
ALTER TABLE `collections`
  ADD PRIMARY KEY (`collectionID`);

--
-- Indexes for table `developer`
--
ALTER TABLE `developer`
  ADD PRIMARY KEY (`developerID`);

--
-- Indexes for table `method`
--
ALTER TABLE `method`
  ADD PRIMARY KEY (`method_id`),
  ADD KEY `FK_ProtectID` (`protect_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`perm_id`);

--
-- Indexes for table `protection`
--
ALTER TABLE `protection`
  ADD PRIMARY KEY (`protect_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `collections`
--
ALTER TABLE `collections`
  MODIFY `collectionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `method`
--
ALTER TABLE `method`
  MODIFY `method_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `perm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `protection`
--
ALTER TABLE `protection`
  MODIFY `protect_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `app`
--
ALTER TABLE `app`
  ADD CONSTRAINT `FK_Category` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`),
  ADD CONSTRAINT `FK_Collection` FOREIGN KEY (`collectionID`) REFERENCES `collections` (`collectionID`),
  ADD CONSTRAINT `app_ibfk_1` FOREIGN KEY (`developerID`) REFERENCES `developer` (`developerID`);

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `FK_PermID` FOREIGN KEY (`perm_id`) REFERENCES `permission` (`perm_id`);

--
-- Constraints for table `method`
--
ALTER TABLE `method`
  ADD CONSTRAINT `FK_ClassID` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  ADD CONSTRAINT `FK_ProtectID` FOREIGN KEY (`protect_id`) REFERENCES `protection` (`protect_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
