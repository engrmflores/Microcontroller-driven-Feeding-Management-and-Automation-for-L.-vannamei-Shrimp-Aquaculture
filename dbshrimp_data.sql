-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2021 at 07:58 AM
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

--
-- Dumping data for table `data`
--

INSERT INTO `data` (`Day`, `Date_Rec`, `Time_Rec`, `Population_Rec`, `Time_1`, `Time_2`, `Time_3`, `Average Body Weight g`, `Feed_Type`, `Total Feed per Day g`, `Total Feed per Distribution g`, `Total Feed per Shrimp g`, `Frequency`, `Feed Rate %`, `Biomass kg`, `Water Level m`, `Water temp C`, `Ph Level`) VALUES
('29', '07 18 2021', '00:29:48', '200', '07', '14', '22', '4.80', 'GROWER', '57.60', '19.20', '0.29', '3', '6.00', '0.96', '3', '0.00', '4.57'),
('36', '07 18 2021', '00:39:01', '200', '07', '14', '22', '1.36', 'GROWER', '0.00', '0.00', '0.00', '3', '00.00', '0.27', '2', '0.00', '5.22'),
('43', '07 18 2021', '00:45:27', '200', '07', '14', '22', '8.00', 'GROWER', '64.00', '21.33', '0.32', '3', '4.00', '1.60', '2', '0.00', '4.39'),
('50', '07 18 2021', '00:53:03', '200', '07', '14', '22', '10.00', 'GROWER', '70.00', '23.33', '0.35', '3', '3.50', '2.00', '3', '0.00', '4.38'),
('57', '07 18 2021', '00:56:26', '200', '07', '14', '22', '11.80', 'GROWER', '75.52', '25.17', '0.38', '3', '3.20', '2.36', '0', '0.00', '3.91'),
('64', '07 18 2021', '00:57:43', '200', '07', '14', '22', '13.20', 'GROWER', '84.48', '28.16', '0.42', '3', '3.20', '2.64', '2', '0.00', '4.30'),
('70', '07 18 2021', '00:59:55', '200', '07', '14', '22', '15.00', 'GROWER', '84.00', '28.00', '0.42', '3', '2.80', '3.00', '3', '0.00', '4.54'),
('70', '07 18 2021', '11:41:57', '200', '07', '14', '22', '15.00', 'GROWER', '84.00', '28.00', '0.42', '3', '2.80', '3.00', '0', '0', '0');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
