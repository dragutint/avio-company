-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2020 at 04:08 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aviodb`
--

-- --------------------------------------------------------

--
-- Table structure for table `aeroplane`
--

CREATE TABLE `aeroplane` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `aeroplane`
--

INSERT INTO `aeroplane` (`id`, `name`, `capacity`) VALUES
(1, 'Aeroplane1', 40),
(2, 'Aeroplane2', 10),
(4, 'Aeroplane3', 50),
(5, 'Aeroplane4', 60),
(6, 'Aeroplane5', 9),
(7, 'Aeroplane6', 1),
(8, 'Aeroplane', 123),
(9, 'Aeroplane1', 1231),
(10, 'Aeroplane1', 123123),
(11, 'Aeroplane444', 4444),
(12, 'Aeroplane', 444);

-- --------------------------------------------------------

--
-- Table structure for table `class_type`
--

CREATE TABLE `class_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `class_type`
--

INSERT INTO `class_type` (`id`, `name`) VALUES
(1, 'Economy'),
(2, 'Business');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(25) NOT NULL,
  `email` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `passport_num` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `first_name`, `last_name`, `date_of_birth`, `gender`, `email`, `country`, `contact`, `passport_num`, `user_id`) VALUES
(1, 'Bojan', 'Lalic', '1997-01-01', 'other', 'bojan@gmail.com', 'Serbia', '0631234567', 1231231, 2),
(3, 'Nikola', 'Petrovic', '1997-01-01', 'NA', 'petrovicn.1904@gmail.com', 'Serbia', '0645613587', 69774353, 5),
(4, 'asd', 'asd', '1997-01-01', 'male', 'as', 'asd', '546546', 6464, 6),
(5, 'Filip', 'Kostic', '1997-01-01', 'female', 'koles@hertz.com', 'Canada', '0600', 6986, 7),
(6, 'Filip', 'Koles', '1997-01-01', 'female', 'koles@hertz.com', 'Canada', '06323', 65894, 9),
(7, 'Milica', 'Nikolic', '1997-01-20', 'female', 'milica@gmail.com', 'Serbia', '0631234567', 6983665, 10),
(8, 'Milan', 'Milanovic', '1992-01-11', 'male', 'milan@gmail.com', 'Serbia', '0631234567', 92334165, 11);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `first_name`, `last_name`, `email`, `user_id`) VALUES
(1, 'Admin', 'Admin', 'admin@gmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `id` int(11) NOT NULL,
  `pilot_id` int(11) NOT NULL,
  `aeroplane_id` int(11) NOT NULL,
  `airport_dep_iata` varchar(11) NOT NULL,
  `airport_arr_iata` varchar(11) NOT NULL,
  `gate` varchar(25) NOT NULL,
  `duration` int(11) NOT NULL,
  `time_dep` datetime NOT NULL,
  `time_arr` datetime NOT NULL,
  `free_seats` int(11) NOT NULL,
  `price_bu` double NOT NULL,
  `price_ec` double NOT NULL,
  `date_created` date NOT NULL,
  `date_updated` date NOT NULL,
  `lock_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`id`, `pilot_id`, `aeroplane_id`, `airport_dep_iata`, `airport_arr_iata`, `gate`, `duration`, `time_dep`, `time_arr`, `free_seats`, `price_bu`, `price_ec`, `date_created`, `date_updated`, `lock_id`) VALUES
(3, 1, 1, 'BEG', 'ORE', '123as', 123, '2020-01-14 09:46:42', '2020-01-14 11:49:42', 249, 321, 233, '2020-01-14', '2020-01-14', NULL),
(4, 1, 10, 'BEG', 'BVA', '123as', 120, '2020-01-16 16:18:14', '2020-01-16 18:18:14', 12333, 123, 123, '2020-01-14', '2020-01-14', NULL),
(6, 1, 1, 'BEG', 'BVA', 'as2', 123, '2020-01-14 16:20:18', '2020-01-14 18:23:18', 250, 133, 121, '2020-01-14', '2020-01-14', NULL),
(9, 1, 8, 'BEG', 'BVA', '12a', 123, '2020-01-19 09:33:10', '2020-01-19 11:36:10', 23, 321, 123, '2020-01-15', '2020-01-15', NULL),
(11, 1, 1, 'BEG', 'BVA', '12a', 120, '2020-01-12 00:20:37', '2020-01-12 02:20:37', 250, 150, 100, '2020-01-16', '2020-01-16', NULL),
(14, 1, 1, 'BEG', 'BVA', '12A', 120, '2020-01-16 20:32:40', '2020-01-16 22:32:40', 250, 120, 60, '2020-01-16', '2020-01-16', NULL),
(15, 1, 12, 'FRA', 'ZRH', '5A', 600, '2020-01-24 22:10:26', '2020-01-25 08:10:26', 4444, 2400, 1200, '2020-01-16', '2020-01-16', NULL),
(16, 1, 1, 'BEG', 'BBV', 'a6', 900, '2020-01-29 02:15:26', '2020-01-29 16:15:26', 250, 694, 525, '2020-01-17', '2020-01-17', NULL),
(17, 1, 6, 'BEG', 'BVA', 'A5', 120, '2020-01-12 22:47:34', '2020-01-13 00:47:34', 85, 240, 120, '2020-01-20', '2020-01-20', NULL),
(18, 1, 6, 'BEG', 'BVA', 'A2', 120, '2020-01-31 22:49:07', '2020-01-01 00:49:07', 0, 240, 120, '2020-01-20', '2020-01-24', NULL),
(19, 1, 1, 'BEG', 'BVA', 'B4', 150, '2020-01-23 10:16:47', '2020-01-23 12:46:47', 18, 321, 123, '2020-01-22', '2020-01-23', NULL),
(20, 1, 4, 'BEG', 'BVA', 'C3', 150, '2020-01-25 10:58:54', '2020-01-25 13:28:54', 45, 300, 150, '2020-01-24', '2020-01-24', NULL),
(21, 1, 1, 'BEG', 'BVA', 'G5', 150, '2020-01-25 18:00:00', '2020-01-25 20:30:00', 39, 270, 140, '2020-01-24', '2020-01-24', NULL),
(22, 1, 12, 'BEG', 'BVA', 'K1', 150, '2020-01-28 11:00:00', '2020-01-28 13:30:00', 444, 390, 190, '2020-01-24', '2020-01-24', NULL);

--
-- Triggers `flight`
--
DELIMITER $$
CREATE TRIGGER `flight_change_trigg` AFTER UPDATE ON `flight` FOR EACH ROW INSERT INTO flight_change (flight_id, date_time_change) VALUES (NEW.id, SYSDATE())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `flight_change`
--

CREATE TABLE `flight_change` (
  `id` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `date_time_change` datetime NOT NULL,
  `processed` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flight_change`
--

INSERT INTO `flight_change` (`id`, `flight_id`, `date_time_change`, `processed`) VALUES
(12, 6, '2020-01-22 01:42:26', 1),
(13, 9, '2020-01-22 01:42:42', 1),
(14, 6, '2020-01-22 01:44:57', 1),
(15, 3, '2020-01-22 01:45:34', 1),
(16, 3, '2020-01-22 01:46:54', 1),
(17, 3, '2020-01-22 01:48:30', 1),
(18, 18, '2020-01-22 01:57:57', 1),
(19, 18, '2020-01-22 02:02:24', 1),
(20, 18, '2020-01-22 02:02:31', 1),
(21, 18, '2020-01-22 02:02:38', 1),
(22, 18, '2020-01-22 02:04:13', 1),
(23, 18, '2020-01-22 02:04:19', 1),
(24, 18, '2020-01-22 02:06:51', 1),
(25, 18, '2020-01-22 09:52:15', 1),
(26, 18, '2020-01-22 10:04:16', 1),
(27, 18, '2020-01-22 21:17:04', 1),
(28, 18, '2020-01-22 21:29:02', 1),
(29, 19, '2020-01-22 21:32:33', 1),
(30, 19, '2020-01-22 21:33:26', 1),
(31, 19, '2020-01-22 22:10:01', 1),
(32, 18, '2020-01-22 22:10:22', 1),
(33, 18, '2020-01-22 22:13:13', 1),
(34, 19, '2020-01-22 22:19:22', 1),
(35, 18, '2020-01-22 22:19:39', 1),
(36, 19, '2020-01-22 23:20:15', 1),
(37, 19, '2020-01-22 23:20:42', 1),
(38, 19, '2020-01-23 00:07:54', 1),
(39, 19, '2020-01-23 00:08:07', 1),
(40, 19, '2020-01-23 00:08:07', 1),
(41, 18, '2020-01-23 00:16:06', 0),
(42, 18, '2020-01-23 00:16:19', 1),
(43, 18, '2020-01-23 00:16:28', 1),
(44, 18, '2020-01-23 00:16:28', 1),
(45, 19, '2020-01-23 00:17:40', 1),
(46, 19, '2020-01-23 00:17:53', 1),
(47, 19, '2020-01-23 00:17:53', 1),
(48, 19, '2020-01-23 00:18:18', 1),
(49, 19, '2020-01-23 00:18:26', 1),
(50, 19, '2020-01-23 00:18:26', 1),
(51, 18, '2020-01-23 00:19:48', 1),
(52, 18, '2020-01-23 00:23:14', 1),
(53, 18, '2020-01-23 00:23:18', 1),
(54, 18, '2020-01-23 00:23:41', 1),
(55, 18, '2020-01-23 00:24:22', 0),
(56, 19, '2020-01-23 00:26:23', 1),
(57, 19, '2020-01-23 00:26:38', 1),
(58, 19, '2020-01-23 00:31:10', 1),
(59, 19, '2020-01-23 00:31:18', 1),
(60, 19, '2020-01-23 00:31:18', 1),
(61, 19, '2020-01-23 00:31:27', 1),
(62, 19, '2020-01-23 00:33:13', 1),
(63, 18, '2020-01-23 00:33:55', 1),
(64, 18, '2020-01-23 00:36:24', 0),
(65, 18, '2020-01-23 00:36:27', 0),
(66, 19, '2020-01-23 00:38:37', 1),
(67, 19, '2020-01-23 00:38:52', 1),
(68, 18, '2020-01-23 00:39:31', 1),
(69, 19, '2020-01-23 00:39:43', 1),
(70, 18, '2020-01-23 00:39:46', 1),
(71, 19, '2020-01-23 00:39:59', 1),
(72, 19, '2020-01-23 00:49:28', 1),
(73, 19, '2020-01-23 00:49:43', 1),
(74, 18, '2020-01-24 10:55:09', 1),
(75, 18, '2020-01-24 10:55:14', 1),
(76, 18, '2020-01-24 10:55:14', 1),
(77, 18, '2020-01-24 10:55:23', 1),
(78, 18, '2020-01-24 10:55:38', 1),
(79, 18, '2020-01-24 10:55:58', 1),
(80, 18, '2020-01-24 10:56:05', 1),
(81, 18, '2020-01-24 10:56:05', 1),
(82, 18, '2020-01-24 10:58:00', 1),
(83, 18, '2020-01-24 10:58:08', 1),
(84, 21, '2020-01-24 11:01:19', 1),
(85, 20, '2020-01-24 11:02:54', 1),
(86, 20, '2020-01-24 11:03:04', 1),
(87, 20, '2020-01-24 11:03:04', 1),
(88, 20, '2020-01-24 11:03:09', 1),
(89, 20, '2020-01-24 11:03:24', 1),
(90, 22, '2020-01-24 11:13:01', 1),
(91, 20, '2020-01-24 11:18:51', 1),
(92, 20, '2020-01-24 11:19:00', 1),
(93, 20, '2020-01-24 11:19:02', 1),
(94, 20, '2020-01-24 11:19:02', 1),
(95, 22, '2020-01-24 11:19:29', 1),
(96, 20, '2020-01-24 15:19:03', 1),
(97, 20, '2020-01-24 15:19:18', 1),
(98, 20, '2020-01-24 15:19:27', 1),
(99, 20, '2020-01-24 15:19:28', 1),
(100, 20, '2020-01-24 15:19:28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `flight_lock`
--

CREATE TABLE `flight_lock` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `start_timestamp` datetime NOT NULL,
  `end_timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flight_lock`
--

INSERT INTO `flight_lock` (`id`, `client_id`, `start_timestamp`, `end_timestamp`) VALUES
(1, 3, '2020-01-23 00:07:54', '2020-01-23 00:08:07'),
(2, 3, '2020-01-23 00:16:19', '2020-01-23 00:16:28'),
(3, 3, '2020-01-23 00:17:40', '2020-01-23 00:17:53'),
(4, 3, '2020-01-23 00:18:18', '2020-01-23 00:18:26'),
(5, 3, '2020-01-23 00:19:48', '2020-01-23 00:18:26'),
(6, 3, '2020-01-23 00:23:41', '2020-01-23 00:18:26'),
(7, 3, '2020-01-23 00:26:23', '2020-01-23 00:26:38'),
(8, 3, '2020-01-23 00:31:10', '2020-01-23 00:31:18'),
(9, 8, '2020-01-23 00:31:27', '2020-01-23 00:00:00'),
(10, 8, '2020-01-23 00:33:55', '2020-01-23 00:00:00'),
(11, 7, '2020-01-23 00:38:37', '2020-01-23 00:38:52'),
(12, 7, '2020-01-23 00:39:30', '2020-01-23 00:39:46'),
(13, 7, '2020-01-23 00:39:43', '2020-01-23 00:39:59'),
(14, 7, '2020-01-23 00:49:28', '2020-01-23 00:49:43'),
(15, 8, '2020-01-24 10:55:09', '2020-01-24 10:55:14'),
(16, 7, '2020-01-24 10:55:23', '2020-01-24 10:55:38'),
(17, 7, '2020-01-24 10:55:58', '2020-01-24 10:56:05'),
(18, 8, '2020-01-24 11:02:54', '2020-01-24 11:03:04'),
(19, 7, '2020-01-24 11:03:09', '2020-01-24 11:03:04'),
(20, 5, '2020-01-24 11:18:51', '2020-01-24 11:03:04'),
(21, 5, '2020-01-24 11:19:00', '2020-01-24 11:19:02'),
(22, 8, '2020-01-24 15:19:03', '2020-01-24 15:19:18'),
(23, 8, '2020-01-24 15:19:27', '2020-01-24 15:19:28');

-- --------------------------------------------------------

--
-- Table structure for table `pilot`
--

CREATE TABLE `pilot` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `licence` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pilot`
--

INSERT INTO `pilot` (`id`, `first_name`, `last_name`, `email`, `licence`, `date_of_birth`) VALUES
(1, 'Milos', 'Pecikoza', 'milos@gmail.com', 'L1EC6Q987D', '1997-03-06');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `passengers_num` int(11) NOT NULL,
  `price` double DEFAULT NULL,
  `date_created` date NOT NULL,
  `finished` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`id`, `flight_id`, `client_id`, `passengers_num`, `price`, `date_created`, `finished`) VALUES
(28, 4, 1, 2, 320, '2020-01-15', 1),
(29, 9, 1, 3, NULL, '2020-01-15', 1),
(30, 4, 1, 1, NULL, '2020-01-15', 1),
(31, 6, 1, 1, NULL, '2020-01-15', 0),
(32, 6, 1, 2, 500, '2020-01-15', 1),
(33, 11, 1, 2, NULL, '2020-01-16', 0),
(34, 11, 1, 2, NULL, '2020-01-16', 0),
(35, 6, 1, 2, NULL, '2020-01-16', 0),
(36, 6, 1, 2, NULL, '2020-01-16', 0),
(37, 11, 1, 2, NULL, '2020-01-16', 0),
(38, 11, 1, 1, 0, '2020-01-16', 1),
(39, 11, 1, 2, NULL, '2020-01-16', 0),
(40, 11, 1, 2, NULL, '2020-01-16', 0),
(41, 11, 1, 2, NULL, '2020-01-16', 0),
(42, 9, 1, 1, 321, '2020-01-16', 1),
(43, 6, 1, 2, 266, '2020-01-16', 1),
(44, 3, 1, 2, NULL, '2020-01-16', 0),
(45, 3, 1, 5, NULL, '2020-01-16', 0),
(46, 11, 1, 2, NULL, '2020-01-16', 0),
(47, 11, 1, 3, NULL, '2020-01-16', 0),
(48, 11, 1, 2, 300, '2020-01-16', 1),
(49, 6, 1, 2, 254, '2020-01-16', 1),
(50, 14, 7, 1, NULL, '2020-01-16', 0),
(51, 9, 7, 1, 321, '2020-01-17', 1),
(52, 9, 1, 2, 246, '2020-01-17', 1),
(53, 9, 1, 2, NULL, '2020-01-17', 0),
(54, 9, 7, 2, 642, '2020-01-17', 1),
(55, 9, 7, 2, 246, '2020-01-17', 1),
(56, 18, 1, 2, NULL, '2020-01-22', 0),
(57, 18, 1, 2, NULL, '2020-01-22', 0),
(58, 18, 1, 1, NULL, '2020-01-22', 0),
(59, 18, 8, 2, 480, '2020-01-22', 1),
(60, 19, 1, 3, NULL, '2020-01-22', 0),
(61, 19, 1, 3, NULL, '2020-01-22', 0),
(62, 19, 7, 3, NULL, '2020-01-22', 0),
(63, 18, 7, 10, NULL, '2020-01-22', 0),
(64, 19, 8, 3, NULL, '2020-01-22', 0),
(65, 18, 8, 7, NULL, '2020-01-22', 0),
(66, 19, 7, 2, NULL, '2020-01-22', 0),
(67, 19, 7, 3, NULL, '2020-01-22', 0),
(68, 19, 3, 1, NULL, '2020-01-23', 0),
(69, 18, 3, 1, NULL, '2020-01-23', 0),
(70, 19, 3, 1, 123, '2020-01-23', 1),
(71, 19, 3, 2, NULL, '2020-01-23', 0),
(72, 19, 3, 1, NULL, '2020-01-23', 0),
(73, 18, 8, 7, NULL, '2020-01-24', 0),
(74, 18, 7, 2, 240, '2020-01-24', 1),
(75, 20, 8, 1, NULL, '2020-01-24', 0),
(76, 20, 5, 2, NULL, '2020-01-24', 0),
(77, 20, 8, 2, 600, '2020-01-24', 1);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'client');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `price` double DEFAULT 0,
  `passport_num` bigint(20) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `class_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id`, `first_name`, `last_name`, `price`, `passport_num`, `reservation_id`, `class_type_id`) VALUES
(1, 'Milos', 'Opacic', 120, 1169486, 28, 1),
(2, 'Dimitrije', 'Milacic', 220, 9968676, 28, 2),
(3, 'Filip', 'Kostic', 350, 66656, 29, 2),
(4, 'Nikola', 'Milovanovic', 350, 56544, 29, 2),
(5, 'Ivan', 'Obilic', 150, 99878, 29, 1),
(6, 'Dragutin', 'Todorovic', 200, 500, 30, 2),
(7, 'Bojan', 'Radak', 250, 998798, 32, 2),
(8, 'Dragutin', 'Todorovic', 250, 656463, 32, 2),
(9, 'Filip', 'Filipovic', NULL, 12343, 38, 2),
(10, 'Milan', 'NIkolic', 321, 6598664, 42, 2),
(11, 'Dragutin', 'Todorovic', 133, 656978, 43, 2),
(12, 'Milos', 'Pecikoza', 133, 657935, 43, 2),
(13, 'Nikola', 'Petrovic', 150, 60556462, 48, 2),
(14, 'Milica', 'Nikolic', 150, 65679564, 48, 2),
(15, 'asd', 'asd', 133, 6565, 49, 2),
(16, 'asd', 'asd', 133, 6565, 49, 2),
(17, 'asd', 'asd', 133, 6565, 49, 2),
(18, 'asd', 'asd', 133, 6565, 49, 2),
(19, 'asd', 'asd', 133, 6565, 49, 2),
(20, 'asd', 'asd', 133, 6565, 49, 2),
(21, 'asd', 'asd', 121, 35656, 49, 1),
(22, 'Milica', 'Nikolic', 321, 697863, 51, 2),
(23, 'Ana', 'Cekic', 123, 64616626564, 52, 1),
(24, 'Bojana', 'Pejcic', 123, 45454552, 52, 1),
(25, 'asd', 'asdfg', 123, 123, 55, 1),
(26, '12asd', 'qwrt132', 123, 1234, 55, 2),
(27, '124', 'dqwr', 321, 34, 54, 2),
(28, 'sdg', '123', 321, 123, 54, 2),
(29, 'Filip', 'Filipovic', 240, 650987, 59, 2),
(30, 'Milan', 'Mratic', 240, 980245, 59, 2),
(31, 'Filip', 'Visnjic', 123, 699871, 70, 1),
(32, 'Marko', 'Markovic', 120, 546562, 74, 1),
(33, 'Mina', 'Minovic', 120, 4565626, 74, 1),
(34, 'Milan', 'Kocic', 300, 699456, 77, 2),
(35, 'Filip', 'Filipovic', 300, 977455, 77, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `role_id`) VALUES
(1, 'admin', '$2a$12$MziiFrtFQCT.Cea1JEMddeBwI6pD67ZROrEXixBSGWw.WgWISY3H2', 1),
(2, 'client', '$2a$12$uLEjA4S4SzKVLw62DfB/5.VSwq5yhtozrQWCCDnWTvfu8WZOIPSLu', 2),
(5, 'nikola', '$2a$12$Jk6m/ms9dcuqmXXZf2Gb5.BCXALxtO7zdw1mn9b/v1bq/phpNZ3du', 2),
(6, 'asd', '$2a$12$BFm/SvTaT8hdM0w3l.QYkey/xzAOC2TPX2iIm3sTb8FIPb0moNprC', 2),
(7, 'koles', '$2a$12$m3TUysgun7BZnE9.btg3fO45OCpNdmlHL9vwM6Mol6nK.i57dzTXy', 2),
(8, '', '$2a$12$rw9Z2aen22qOqbh.TVThtOyBNCohI6HzQP24DW0eIboDvJyOEQMSG', 2),
(9, 'koles123', '$2a$12$dNm5whdIoRgElxTJiF9YsOarK/3ROcMmD6v8VD4opl2i3lt31ewnK', 2),
(10, 'milica', '$2a$12$MHpYUhAq6cyaT5wH9mk/i.W0kM0hN1SJPWSnGS7sKDxjswKBjIxfK', 2),
(11, 'milan', '$2a$12$AFBnPryPUpeDG5TOFKYWV.prXZ1DGOf0Mf9MzxWyVv/yYYGsUARaK', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aeroplane`
--
ALTER TABLE `aeroplane`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_type`
--
ALTER TABLE `class_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_cli` (`user_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_employee` (`user_id`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pilot` (`pilot_id`),
  ADD KEY `fk_aeroplane` (`aeroplane_id`),
  ADD KEY `fk_airport_dep` (`airport_dep_iata`),
  ADD KEY `fk_airport_arr` (`airport_arr_iata`),
  ADD KEY `fk_lock_id` (`lock_id`);

--
-- Indexes for table `flight_change`
--
ALTER TABLE `flight_change`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_flight_changed` (`flight_id`);

--
-- Indexes for table `flight_lock`
--
ALTER TABLE `flight_lock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_client_lock` (`client_id`);

--
-- Indexes for table `pilot`
--
ALTER TABLE `pilot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_client_res` (`client_id`),
  ADD KEY `fk_flight` (`flight_id`) USING BTREE;

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_reservation` (`reservation_id`),
  ADD KEY `fk_class_type` (`class_type_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_role` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aeroplane`
--
ALTER TABLE `aeroplane`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `class_type`
--
ALTER TABLE `class_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `flight_change`
--
ALTER TABLE `flight_change`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `flight_lock`
--
ALTER TABLE `flight_lock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `pilot`
--
ALTER TABLE `pilot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_user_cli` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fk_user_employee` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `fk_aeroplane` FOREIGN KEY (`aeroplane_id`) REFERENCES `aeroplane` (`id`),
  ADD CONSTRAINT `fk_lock_id` FOREIGN KEY (`lock_id`) REFERENCES `flight_lock` (`id`),
  ADD CONSTRAINT `fk_pilot` FOREIGN KEY (`pilot_id`) REFERENCES `pilot` (`id`);

--
-- Constraints for table `flight_change`
--
ALTER TABLE `flight_change`
  ADD CONSTRAINT `fk_flight_changed` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`id`);

--
-- Constraints for table `flight_lock`
--
ALTER TABLE `flight_lock`
  ADD CONSTRAINT `fk_client_lock` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `fk_client_res` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `fk_flight_id` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`id`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `fk_class_type` FOREIGN KEY (`class_type_id`) REFERENCES `class_type` (`id`),
  ADD CONSTRAINT `fk_reservation` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
