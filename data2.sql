-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 21, 2021 at 02:36 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

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
('21', '06 11 2021', '15:02:02', '200', '07', '14', '22', '3.00', 'GROWER', '48.00', '16.00', '0.24', '3', '8.00', '0.60', '1', '25.37', '7.29'),
('29', '06 19 2021', '16:13:41', '200', '07', '14', '22', '4.00', 'GROWER', '48.00', '16.00', '0.24', '3', '6.00', '0.80', '1', '26.04', '7.40'),
('37', '06 27 2021', '09:05:55', '200', '07', '14', '22', '6.00', 'GROWER', '54.00', '18.00', '0.27', '3', '4.50', '1.20', '1', '17.56', '7.18'),
('45', '07 05 2021', '10:15:35', '200', '07', '14', '22', '8.00', 'GROWER', '64.00', '21.33', '0.32', '3', '4.00', '1.60', '1', '18.49', '7.19'),
('53', '07 13 2021', '16:31:37', '200', '07', '14', '22', '10.00', 'GROWER', '70.00', '23.33', '0.35', '3', '3.50', '2.00', '1', '19.34', '7.12'),
('61', '07 21 2021', '08:31:19', '200', '07', '14', '22', '13.00', 'GROWER', '83.20', '27.73', '0.42', '3', '3.20', '2.60', '1', '16.23', '7.07');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
