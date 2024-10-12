-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2024 at 06:00 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `electricbillsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `appliances`
--

CREATE TABLE `appliances` (
  `appliance_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `power_rating` float DEFAULT NULL,
  `usage_rate` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appliances`
--

INSERT INTO `appliances` (`appliance_id`, `name`, `power_rating`, `usage_rate`) VALUES
(1, 'Air Conditioner', 2000, 0.15),
(2, 'Refrigerator', 150, 0.10),
(3, 'Washing Machine', 500, 0.12),
(4, 'Television', 100, 0.05),
(5, 'Heater', 1500, 0.20),
(6, 'Fan', 75, 0.03),
(7, 'Computer', 200, 0.10);

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `bill_id` int(11) NOT NULL,
  `meter_id` int(11) DEFAULT NULL,
  `amount_due` decimal(10,2) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `issue_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`bill_id`, `meter_id`, `amount_due`, `due_date`, `status`, `issue_date`) VALUES
(1, 1, 100.50, '2023-04-01', 'Unpaid', '2023-03-25'),
(2, 2, 150.75, '2023-04-01', 'Paid', '2023-03-25'),
(3, 3, 105.20, '2023-04-02', 'Unpaid', '2023-03-26'),
(4, 4, 200.45, '2023-04-03', 'Paid', '2023-03-27'),
(5, 5, 75.30, '2023-04-04', 'Unpaid', '2023-03-28'),
(6, 6, 123.60, '2023-04-05', 'Paid', '2023-03-29'),
(7, 7, 98.50, '2023-04-06', 'Unpaid', '2023-03-30');

-- --------------------------------------------------------

--
-- Table structure for table `electricityusage`
--

CREATE TABLE `electricityusage` (
  `usage_id` int(11) NOT NULL,
  `meter_id` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `total_usage` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `electricityusage`
--

INSERT INTO `electricityusage` (`usage_id`, `meter_id`, `start_time`, `end_time`, `total_usage`) VALUES
(1, 1, '2023-03-01 08:00:00', '2023-03-01 10:00:00', 15.5),
(2, 2, '2023-03-01 09:00:00', '2023-03-01 11:00:00', 20),
(3, 3, '2023-03-02 08:00:00', '2023-03-02 10:00:00', 18.2),
(4, 4, '2023-03-02 09:00:00', '2023-03-02 11:00:00', 22.5),
(5, 5, '2023-03-03 07:00:00', '2023-03-03 09:00:00', 12.7),
(6, 6, '2023-03-04 06:00:00', '2023-03-04 08:00:00', 16.4),
(7, 7, '2023-03-05 05:00:00', '2023-03-05 07:00:00', 14.9);

-- --------------------------------------------------------

--
-- Table structure for table `electricmeters`
--

CREATE TABLE `electricmeters` (
  `meter_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `installation_date` date DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `electricmeters`
--

INSERT INTO `electricmeters` (`meter_id`, `user_id`, `installation_date`, `location`) VALUES
(1, 1, '2023-01-15', 'Living Room'),
(2, 2, '2023-02-20', 'Office'),
(3, 3, '2023-03-01', 'Kitchen'),
(4, 4, '2023-03-02', 'Workshop'),
(5, 5, '2023-03-03', 'Garage'),
(6, 6, '2023-03-04', 'Office'),
(7, 7, '2023-03-05', 'Living Room');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `sent_date` date DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `user_id`, `message`, `sent_date`, `status`) VALUES
(1, 1, 'Your bill is due soon.', '2023-03-25', 'Unread'),
(2, 2, 'Your bill has been paid.', '2023-03-25', 'Read'),
(3, 3, 'Your bill is due soon.', '2023-03-26', 'Unread'),
(4, 4, 'Your bill has been paid.', '2023-03-27', 'Read'),
(5, 5, 'Your bill is overdue.', '2023-03-28', 'Unread'),
(6, 6, 'Your usage is high this month.', '2023-03-29', 'Read'),
(7, 7, 'Your bill is due soon.', '2023-03-30', 'Unread');

-- --------------------------------------------------------

--
-- Table structure for table `usageestimations`
--

CREATE TABLE `usageestimations` (
  `estimation_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `appliance_id` int(11) DEFAULT NULL,
  `usage_duration` float DEFAULT NULL,
  `estimated_cost` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usageestimations`
--

INSERT INTO `usageestimations` (`estimation_id`, `user_id`, `appliance_id`, `usage_duration`, `estimated_cost`) VALUES
(1, 1, 1, 5, 1.50),
(2, 2, 2, 24, 2.40),
(3, 3, 3, 2, 0.24),
(4, 4, 4, 8, 0.40),
(5, 5, 5, 4, 0.80),
(6, 6, 6, 12, 0.36),
(7, 7, 7, 10, 1.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `account_type` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `phone_number`, `address`, `account_type`) VALUES
(1, 'John Doe', 'john@example.com', '1234567890', '123 Elm St', 'Residential'),
(2, 'Jane Smith', 'jane@example.com', '0987654321', '456 Oak St', 'Commercial'),
(3, 'Alice Johnson', 'alice@example.com', '1112223333', '789 Pine St', 'Residential'),
(4, 'Bob Brown', 'bob@example.com', '4445556666', '101 Maple St', 'Commercial'),
(5, 'Charlie Davis', 'charlie@example.com', '7778889999', '202 Birch St', 'Residential'),
(6, 'Diana Evans', 'diana@example.com', '0001112222', '303 Cedar St', 'Commercial'),
(7, 'Eve Foster', 'eve@example.com', '3334445555', '404 Spruce St', 'Residential');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appliances`
--
ALTER TABLE `appliances`
  ADD PRIMARY KEY (`appliance_id`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `meter_id` (`meter_id`);

--
-- Indexes for table `electricityusage`
--
ALTER TABLE `electricityusage`
  ADD PRIMARY KEY (`usage_id`),
  ADD KEY `meter_id` (`meter_id`);

--
-- Indexes for table `electricmeters`
--
ALTER TABLE `electricmeters`
  ADD PRIMARY KEY (`meter_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `usageestimations`
--
ALTER TABLE `usageestimations`
  ADD PRIMARY KEY (`estimation_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `appliance_id` (`appliance_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`meter_id`) REFERENCES `electricmeters` (`meter_id`);

--
-- Constraints for table `electricityusage`
--
ALTER TABLE `electricityusage`
  ADD CONSTRAINT `electricityusage_ibfk_1` FOREIGN KEY (`meter_id`) REFERENCES `electricmeters` (`meter_id`);

--
-- Constraints for table `electricmeters`
--
ALTER TABLE `electricmeters`
  ADD CONSTRAINT `electricmeters_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `usageestimations`
--
ALTER TABLE `usageestimations`
  ADD CONSTRAINT `usageestimations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `usageestimations_ibfk_2` FOREIGN KEY (`appliance_id`) REFERENCES `appliances` (`appliance_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
