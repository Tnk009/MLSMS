-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 06, 2023 at 12:45 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bsms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `category_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`category_id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(12, 'Beer', '', 1, 0, '2023-06-24 09:40:51', NULL),
(13, 'Wine', '', 1, 0, '2023-06-24 09:40:57', NULL),
(14, 'Gin', '', 1, 0, '2023-06-24 09:43:30', NULL),
(15, 'Vodka', '', 1, 0, '2023-06-24 09:43:38', NULL),
(16, 'Brandy', '', 1, 0, '2023-06-24 09:43:52', NULL),
(17, 'Whiskey', '', 1, 0, '2023-06-24 09:44:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `product_id` int(30) NOT NULL,
  `product_code` text NOT NULL,
  `category_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `alert_restock` double NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`product_id`, `product_code`, `category_id`, `name`, `description`, `price`, `alert_restock`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(7, 'cspb', 12, 'Special Brew', '', 1000, 20, 1, 0, '2023-06-24 09:48:30', NULL),
(8, 'cg', 12, 'Carlsberg Green', '', 1000, 20, 1, 0, '2023-06-24 09:49:16', NULL),
(9, 'cb', 12, 'Castel Beer', '', 1000, 20, 1, 0, '2023-06-24 09:49:40', '2023-06-24 09:50:06');

-- --------------------------------------------------------

--
-- Table structure for table `stock_list`
--

CREATE TABLE `stock_list` (
  `stock_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL DEFAULT 0,
  `expiry_date` datetime NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock_list`
--

INSERT INTO `stock_list` (`stock_id`, `product_id`, `quantity`, `expiry_date`, `date_added`) VALUES
(7, 8, 100, '2025-06-24 00:00:00', '2023-06-24 07:50:49'),
(8, 9, 100, '2025-06-24 00:00:00', '2023-06-24 07:51:11'),
(9, 7, 100, '2025-06-24 00:00:00', '2023-06-24 07:51:31'),
(10, 9, 50, '2025-06-24 00:00:00', '2023-06-24 08:31:59'),
(11, 8, 100, '2025-06-27 00:00:00', '2023-06-27 11:49:22');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_items`
--

CREATE TABLE `transaction_items` (
  `transaction_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction_items`
--

INSERT INTO `transaction_items` (`transaction_id`, `product_id`, `quantity`, `price`, `description`, `date_added`) VALUES
(11, 7, 2, 1000, '', '2023-06-24 08:26:41'),
(11, 8, 1, 1000, '', '2023-06-24 08:26:41'),
(12, 9, 50, 1000, '', '2023-06-24 08:28:39'),
(13, 8, 40, 1000, '', '2023-06-24 08:38:55'),
(14, 8, 1, 1000, '', '2023-06-25 08:37:05'),
(15, 8, 4, 1000, '', '2023-06-25 08:37:31'),
(16, 9, 1, 1000, '', '2023-06-27 09:41:39'),
(17, 9, 1, 1000, '', '2023-06-27 11:14:34');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_list`
--

CREATE TABLE `transaction_list` (
  `transaction_id` int(30) NOT NULL,
  `receipt_no` text NOT NULL,
  `total` double NOT NULL DEFAULT 0,
  `tendered_amount` double NOT NULL DEFAULT 0,
  `change` double NOT NULL DEFAULT 0,
  `user_id` int(30) DEFAULT 1,
  `description` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction_list`
--

INSERT INTO `transaction_list` (`transaction_id`, `receipt_no`, `total`, `tendered_amount`, `change`, `user_id`, `description`, `date_added`) VALUES
(1, '1644804759', 205, 300, 95, 1, '', '2022-02-14 02:12:39'),
(2, '1644804881', 1000, 1000, 0, 1, '', '2022-02-14 02:14:41'),
(4, '1644806318', 125, 150, 25, NULL, '', '2022-02-14 02:38:38'),
(5, '1644807473', 85, 100, 15, 2, '', '2022-02-14 02:57:53'),
(6, '1687016212', 10, 20, 10, 1, '', '2023-06-17 15:36:52'),
(7, '1687017673', 10, 10, 0, 1, 'Retrospective sale from 15 June 2023', '2023-06-17 16:01:13'),
(8, '1687018069', 10, 10, 0, 1, '', '2023-06-17 16:07:49'),
(9, '1687018248', -10, 0, 0, 1, '', '2023-06-17 16:10:48'),
(10, '1687019032', -10, 0, 0, 1, '', '2023-06-17 16:23:52'),
(11, '1687595201', 3000, 3000, 0, 1, '', '2023-06-24 08:26:41'),
(12, '1687595319', 50000, 50000, 0, 1, '', '2023-06-24 08:28:39'),
(13, '1687595935', -40000, 0, 0, 1, '', '2023-06-24 08:38:55'),
(14, '1687682225', 1000, 1000, 0, 1, '', '2023-06-25 08:37:05'),
(15, '1687682251', -4000, 0, 0, 1, '', '2023-06-25 08:37:31'),
(16, '1687858898', -1000, 0, 0, 1, '', '2023-06-27 09:41:38'),
(17, '1687864474', -1000, 0, 0, 1, '', '2023-06-27 11:14:34');

-- --------------------------------------------------------

--
-- Table structure for table `user_list`
--

CREATE TABLE `user_list` (
  `user_id` int(30) NOT NULL,
  `fullname` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `type` int(30) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_list`
--

INSERT INTO `user_list` (`user_id`, `fullname`, `username`, `password`, `type`, `status`, `date_created`) VALUES
(1, 'Administrator', 'admin', '0192023a7bbd73250516f069df18b500', 1, 1, '2022-02-14 00:44:30'),
(2, 'Claire Blake', 'cblake', 'cd74fae0a3adf459f73bbf187607ccea', 0, 1, '2022-02-14 02:29:23'),
(3, 'Mark Cooper', 'mcooper', '0c4635c5af0f173c26b0d85b6c9b398b', 1, 1, '2022-02-14 02:29:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `stock_list`
--
ALTER TABLE `stock_list`
  ADD PRIMARY KEY (`stock_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `transaction_items`
--
ALTER TABLE `transaction_items`
  ADD KEY `product_id` (`product_id`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `transaction_list`
--
ALTER TABLE `transaction_list`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_list`
--
ALTER TABLE `user_list`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `category_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `product_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `stock_list`
--
ALTER TABLE `stock_list`
  MODIFY `stock_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `transaction_list`
--
ALTER TABLE `transaction_list`
  MODIFY `transaction_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user_list`
--
ALTER TABLE `user_list`
  MODIFY `user_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `product_list_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`category_id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_list`
--
ALTER TABLE `stock_list`
  ADD CONSTRAINT `stock_list_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_items`
--
ALTER TABLE `transaction_items`
  ADD CONSTRAINT `transaction_items_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_items_ibfk_2` FOREIGN KEY (`transaction_id`) REFERENCES `transaction_list` (`transaction_id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_list`
--
ALTER TABLE `transaction_list`
  ADD CONSTRAINT `transaction_list_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_list` (`user_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
