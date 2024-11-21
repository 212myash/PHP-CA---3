-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 16, 2024 at 03:49 PM
-- Server version: 5.6.39-83.1
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phpscine_cryptoportfolio`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `adminuser` varchar(500) NOT NULL,
  `adminpassword` varchar(999) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `adminuser`, `adminpassword`) VALUES
(1, 'admin', 'f925916e2754e5e03f75dd58a5733251');

-- --------------------------------------------------------

--
-- Table structure for table `coins`
--

CREATE TABLE `coins` (
  `id` int(11) NOT NULL,
  `coin` varchar(5) NOT NULL,
  `coinfull` varchar(100) NOT NULL,
  `date` varchar(600) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `valuebuy` decimal(10,3) NOT NULL,
  `trashbin` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coins`
--

INSERT INTO `coins` (`id`, `coin`, `coinfull`, `date`, `amount`, `valuebuy`, `trashbin`) VALUES
(1, 'LTC', 'Litecoin', '22-11-2013', '0.73', '9.480', 0),
(3, 'XRP', 'Ripple', '31-08-2017', '79.90', '0.230', 0),
(17, 'NXT', 'NXT', '11-12-2017', '73.00', '0.660', 0),
(19, 'PIVX', 'Pivx', '04-09-2017', '50.00', '3.050', 0),
(22, 'ARK', 'Ark', '13-12-2017', '32.95', '3.930', 0),
(25, 'XVG', 'Verge', '07-09-2017', '25000.00', '0.007', 0),
(26, 'STRAT', 'Stratis', '01-12-2017', '45.00', '5.050', 0),
(29, 'DASH', 'Dash', '15-03-2017', '5.00', '81.000', 0),
(32, 'BTC', 'Bitcoin', '16-08-2024', '500.00', '10.000', 0),
(33, 'ETH', 'Ethereum', '16-08-2024', '200.00', '2.622', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coins`
--
ALTER TABLE `coins`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `coins`
--
ALTER TABLE `coins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
