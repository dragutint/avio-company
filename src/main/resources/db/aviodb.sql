-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2020 at 02:27 AM
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
  `capacity_bu` int(11) NOT NULL,
  `capacity_ec` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `aeroplane`
--

INSERT INTO `aeroplane` (`id`, `name`, `capacity_bu`, `capacity_ec`) VALUES
(1, 'Aeroplane1', 40, 250),
(2, 'Aeroplane2', 10, 100),
(4, 'Aeroplane3', 50, 500),
(5, 'Aeroplane4', 60, 250),
(6, 'Aeroplane5', 9, 85),
(7, 'Aeroplane6', 1, 14),
(8, 'Aeroplane', 123, 123),
(9, 'Aeroplane1', 1231, 12333),
(10, 'Aeroplane1', 123123, 12333),
(11, 'Aeroplane444', 4444, 44),
(12, 'Aeroplane', 444, 4444);

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
(3, 'Nikola', 'Petrovic', NULL, 'NA', 'petrovicn.1904@gmail.com', 'Serbia', '0645613587', 69774353, 5),
(4, 'asd', 'asd', NULL, 'male', 'as', 'asd', '546546', 6464, 6),
(5, 'Filip', 'Kostic', NULL, 'female', 'koles@hertz.com', 'Canada', '0600', 6986, 7),
(6, 'Filip', 'Koles', NULL, 'female', 'koles@hertz.com', 'Canada', '06323', 65894, 9),
(7, 'Milica', 'Nikolic', '1997-01-20', 'female', 'milica@gmail.com', 'Serbia', '0631234567', 6983665, 10);

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
  `free_seats_bu` int(11) NOT NULL,
  `free_seats_ec` int(11) NOT NULL,
  `price_bu` double NOT NULL,
  `price_ec` double NOT NULL,
  `date_created` date NOT NULL,
  `date_updated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`id`, `pilot_id`, `aeroplane_id`, `airport_dep_iata`, `airport_arr_iata`, `gate`, `duration`, `time_dep`, `time_arr`, `free_seats_bu`, `free_seats_ec`, `price_bu`, `price_ec`, `date_created`, `date_updated`) VALUES
(3, 1, 1, 'BEG', 'ORE', '123as', 123, '2020-01-14 09:46:42', '2020-01-14 11:49:42', 40, 250, 321, 233, '2020-01-14', '2020-01-14'),
(4, 1, 10, 'BEG', 'BVA', '123as', 120, '2020-01-16 16:18:14', '2020-01-16 18:18:14', 123123, 12333, 123, 123, '2020-01-14', '2020-01-14'),
(6, 1, 1, 'BEG', 'BVA', 'as2', 123, '2020-01-14 16:20:18', '2020-01-14 18:23:18', 40, 250, 133, 121, '2020-01-14', '2020-01-14'),
(9, 1, 8, 'BEG', 'BVA', '12a', 123, '2020-01-19 09:33:10', '2020-01-19 11:36:10', 123, 123, 321, 123, '2020-01-15', '2020-01-15'),
(11, 1, 1, 'BEG', 'BVA', '12a', 120, '2020-01-12 00:20:37', '2020-01-12 02:20:37', 40, 250, 150, 100, '2020-01-16', '2020-01-16'),
(14, 1, 1, 'BEG', 'BVA', '12A', 120, '2020-01-16 20:32:40', '2020-01-16 22:32:40', 40, 250, 120, 60, '2020-01-16', '2020-01-16'),
(15, 1, 12, 'FRA', 'ZRH', '5A', 600, '2020-01-24 22:10:26', '2020-01-25 08:10:26', 444, 4444, 2400, 1200, '2020-01-16', '2020-01-16'),
(16, 1, 1, 'BEG', 'BBV', 'a6', 900, '2020-01-29 02:15:26', '2020-01-29 16:15:26', 40, 250, 694, 525, '2020-01-17', '2020-01-17');

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
  `payed` int(1) NOT NULL DEFAULT 0,
  `price` double DEFAULT NULL,
  `date_created` date NOT NULL,
  `finished` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`id`, `flight_id`, `client_id`, `passengers_num`, `payed`, `price`, `date_created`, `finished`) VALUES
(28, 4, 1, 2, 0, 320, '2020-01-15', 1),
(29, 9, 1, 3, 0, NULL, '2020-01-15', 0),
(30, 4, 1, 1, 0, NULL, '2020-01-15', 0),
(31, 6, 1, 1, 0, NULL, '2020-01-15', 0),
(32, 6, 1, 2, 0, 500, '2020-01-15', 1),
(33, 11, 1, 2, 0, NULL, '2020-01-16', 0),
(34, 11, 1, 2, 0, NULL, '2020-01-16', 0),
(35, 6, 1, 2, 0, NULL, '2020-01-16', 0),
(36, 6, 1, 2, 0, NULL, '2020-01-16', 0),
(37, 11, 1, 2, 0, NULL, '2020-01-16', 0),
(38, 11, 1, 1, 0, 0, '2020-01-16', 1),
(39, 11, 1, 2, 0, NULL, '2020-01-16', 0),
(40, 11, 1, 2, 0, NULL, '2020-01-16', 0),
(41, 11, 1, 2, 0, NULL, '2020-01-16', 0),
(42, 9, 1, 1, 0, 321, '2020-01-16', 1),
(43, 6, 1, 2, 0, 266, '2020-01-16', 1),
(44, 3, 1, 2, 0, NULL, '2020-01-16', 0),
(45, 3, 1, 5, 0, NULL, '2020-01-16', 0),
(46, 11, 1, 2, 0, NULL, '2020-01-16', 0),
(47, 11, 1, 3, 0, NULL, '2020-01-16', 0),
(48, 11, 1, 2, 0, 300, '2020-01-16', 1),
(49, 6, 1, 2, 0, 254, '2020-01-16', 1),
(50, 14, 7, 1, 0, NULL, '2020-01-16', 0),
(51, 9, 7, 1, 0, 321, '2020-01-17', 1),
(52, 9, 1, 2, 0, 246, '2020-01-17', 1);

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
(24, 'Bojana', 'Pejcic', 123, 45454552, 52, 1);

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
(10, 'milica', '$2a$12$MHpYUhAq6cyaT5wH9mk/i.W0kM0hN1SJPWSnGS7sKDxjswKBjIxfK', 2);

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
  ADD KEY `fk_airport_arr` (`airport_arr_iata`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `pilot`
--
ALTER TABLE `pilot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  ADD CONSTRAINT `fk_pilot` FOREIGN KEY (`pilot_id`) REFERENCES `pilot` (`id`);

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
