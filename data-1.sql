-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2021 at 11:05 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbshrimp_data`
--

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE `data` (
  `Day` varchar(11) NOT NULL,
  `Date_Rec` varchar(50) NOT NULL,
  `Time_Rec` varchar(50) NOT NULL,
  `Population_Rec` varchar(11) NOT NULL,
  `Time_1` varchar(11) NOT NULL,
  `Time_2` varchar(11) NOT NULL,
  `Time_3` varchar(11) NOT NULL,
  `Average Body Weight g` varchar(50) NOT NULL,
  `Feed_Type` varchar(50) NOT NULL,
  `Total Feed per Day g` varchar(11) NOT NULL,
  `Total Feed per Distribution g` varchar(11) NOT NULL,
  `Total Feed per Shrimp g` varchar(11) NOT NULL,
  `Frequency` varchar(11) NOT NULL,
  `Feed Rate %` varchar(11) NOT NULL,
  `Biomass kg` varchar(11) NOT NULL,
  `Water Level m` varchar(11) NOT NULL,
  `Water temp C` varchar(11) NOT NULL,
  `Ph Level` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
