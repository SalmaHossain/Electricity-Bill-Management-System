-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2024 at 03:23 PM
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
-- Database: `e_b_m_s`
--

-- --------------------------------------------------------

--
-- Table structure for table `appliance`
--

CREATE TABLE `appliance` (
  `appliance_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `power_rating` float DEFAULT NULL,
  `usage_rate` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appliance`
--

INSERT INTO `appliance` (`appliance_id`, `name`, `power_rating`, `usage_rate`) VALUES
(1, 'Air Conditioner', 2.5, 5),
(2, 'Heater', 1.5, 3),
(3, 'Fan', 0.75, 1),
(4, 'Refrigerator', 1.2, 2.5),
(5, 'LED TV', 0.5, 1.2);

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `bill_id` int(11) NOT NULL,
  `meter_id` int(11) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `amount_due` float DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`bill_id`, `meter_id`, `issue_date`, `due_date`, `amount_due`, `status`) VALUES
(1, 1, '2024-10-01', '2024-10-31', 100, 'Unpaid'),
(2, 2, '2024-09-01', '2024-09-30', 300, 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `electricity_usage`
--

CREATE TABLE `electricity_usage` (
  `usage_id` int(11) NOT NULL,
  `meter_id` int(11) DEFAULT NULL,
  `total_usage` float DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `electricity_usage`
--

INSERT INTO `electricity_usage` (`usage_id`, `meter_id`, `total_usage`, `start_time`, `end_time`) VALUES
(1, 1, 120.5, '2024-10-01 00:00:00', '2024-10-31 23:59:59'),
(2, 2, 300, '2024-10-01 00:00:00', '2024-10-31 23:59:59'),
(3, 3, 450.5, '2024-10-01 00:00:00', '2024-10-31 23:59:59'),
(4, 4, 210.3, '2024-09-01 00:00:00', '2024-09-30 23:59:59'),
(5, 5, 78.9, '2024-08-01 00:00:00', '2024-08-31 23:59:59');

-- --------------------------------------------------------

--
-- Table structure for table `electric_meters`
--

CREATE TABLE `electric_meters` (
  `meter_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `installation_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `electric_meters`
--

INSERT INTO `electric_meters` (`meter_id`, `user_id`, `location`, `installation_date`) VALUES
(1, 1, 'Apartment 3B', '2024-01-01'),
(2, 2, 'Warehouse', '2023-12-01'),
(3, 3, 'House 45', '2022-05-10'),
(4, 4, 'Shop 22', '2023-06-15'),
(5, 5, 'Village House', '2021-02-12'),
(6, 6, 'Market Lane', '2022-09-25'),
(7, 7, 'Flat B-2', '2024-08-12'),
(8, 8, 'Factory Complex', '2023-03-04'),
(9, 9, 'Block 7', '2023-01-22'),
(10, 10, 'Sector 4', '2024-07-01');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `sent_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notification_id`, `user_id`, `message`, `status`, `sent_date`) VALUES
(1, 1, 'Your bill is due', 'Pending', '2024-10-18 10:00:00'),
(2, 2, 'Meter reading required', 'Completed', '2024-10-10 08:00:00'),
(3, 3, 'Scheduled maintenance', 'Pending', '2024-09-25 14:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `usage_estimation`
--

CREATE TABLE `usage_estimation` (
  `estimation_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `appliance_id` int(11) DEFAULT NULL,
  `usage_duration` float DEFAULT NULL,
  `estimated_cost` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usage_estimation`
--

INSERT INTO `usage_estimation` (`estimation_id`, `user_id`, `appliance_id`, `usage_duration`, `estimated_cost`) VALUES
(1, 1, 1, 8.5, 50),
(2, 2, 2, 10, 60),
(3, 3, 3, 12, 30),
(4, 4, 4, 15, 75),
(5, 5, 5, 5, 10);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `account_type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `account_type`) VALUES
(1, 'Alice', 'Residential'),
(2, 'Bob', 'Commercial'),
(3, 'Tanvir', 'Residential'),
(4, 'Rahim & Brothers', 'Commercial'),
(5, 'Shamim', 'Residential'),
(6, 'Chowdhury Electronics', 'Commercial'),
(7, 'Ayesha', 'Residential'),
(8, 'Kamal', 'Residential'),
(9, 'Sadia', 'Residential'),
(10, 'Zaman Pharmaceuticals', 'Commercial'),
(11, 'Ruhul Amin', 'Residential'),
(12, 'Laila', 'Residential'),
(13, 'Amin Traders', 'Commercial'),
(14, 'Nusrat', 'Residential'),
(15, 'Majid & Sons', 'Commercial'),
(16, 'Sumaiya', 'Residential'),
(17, 'Habib', 'Residential'),
(18, 'Faruk Enterprise', 'Commercial'),
(19, 'Rubina', 'Residential'),
(20, 'Tasnim', 'Residential'),
(21, 'Alam Steel', 'Commercial'),
(22, 'Sara', 'Residential'),
(23, 'Afia', 'Residential'),
(24, 'Sumair', 'Commercial'),
(25, 'Salma', 'Commercial');

-- --------------------------------------------------------

--
-- Table structure for table `user_address`
--

CREATE TABLE `user_address` (
  `user_id` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `area_type` enum('Urban','Rural') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_address`
--

INSERT INTO `user_address` (`user_id`, `address`, `city`, `district`, `postal_code`, `area_type`) VALUES
(1, '123 Main Street', 'Dhaka', 'Dhaka', '1207', 'Urban'),
(2, 'Warehouse 12', 'Chittagong', 'Chattogram', '4000', 'Urban'),
(3, 'House 45', 'Sylhet', 'Sylhet', '3100', 'Urban'),
(4, 'Shop 22, Bazar Road', 'Khulna', 'Khulna', '9000', 'Urban'),
(5, 'Village 5', 'Barisal', 'Barishal', '8200', 'Rural'),
(6, 'Market Lane', 'Rajshahi', 'Rajshahi', '6000', 'Urban'),
(7, 'House 21', 'Comilla', 'Comilla', '3500', 'Rural'),
(8, 'Flat B-2', 'Dhaka', 'Dhaka', '1207', 'Urban'),
(9, 'Block 7', 'Sylhet', 'Sylhet', '3100', 'Urban'),
(10, 'Factory Complex', 'Gazipur', 'Gazipur', '1700', 'Urban'),
(11, 'House 23/A', 'Narayanganj', 'Narayanganj', '1400', 'Urban'),
(12, 'Sector 4', 'Dhaka', 'Dhaka', '1212', 'Urban'),
(13, 'Wholesale Market', 'Chittagong', 'Chattogram', '4000', 'Urban'),
(14, 'Building 9', 'Feni', 'Feni', '3900', 'Rural'),
(15, 'Depot Road', 'Bogura', 'Bogura', '5800', 'Urban'),
(16, 'Flat 5-D', 'Dhaka', 'Dhaka', '1209', 'Urban'),
(17, 'House 99', 'Barisal', 'Barishal', '8200', 'Rural'),
(18, 'Warehouse B', 'Gazipur', 'Gazipur', '1700', 'Urban'),
(19, 'Lane 33', 'Rajshahi', 'Rajshahi', '6000', 'Urban'),
(20, 'Apartment 4C', 'Sylhet', 'Sylhet', '3100', 'Urban'),
(21, 'Steel Yard', 'Chittagong', 'Chattogram', '4000', 'Urban'),
(22, 'Sara | Dheu', 'Dhaka', 'Dhaka', '1228', 'Urban'),
(23, 'House 22, Block B', 'Dhaka', 'Dhaka', '1212', 'Urban'),
(24, 'Office 12, Road 10', 'Chittagong', 'Chittagong', '4100', 'Urban'),
(25, 'Shop 44, Main Market', 'Bagerhaat', 'Rajshahi', '6200', 'Urban');

-- --------------------------------------------------------

--
-- Table structure for table `user_email`
--

CREATE TABLE `user_email` (
  `user_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_email`
--

INSERT INTO `user_email` (`user_id`, `email`) VALUES
(1, 'alice01@hotmail.com'),
(2, 'bob02@company.com'),
(3, 'tanvir@gmail.com'),
(4, 'info@rahim.com'),
(5, 'shamim@yahoo.com'),
(6, 'support@chowdhuryelec.com'),
(7, 'ayesha@domain.com'),
(8, 'kamal08@xyz.net'),
(9, 'sadia09@edu.com'),
(10, 'hr10@zamanpharma.com'),
(11, 'ruhulamin@mail.com'),
(12, 'laila@info.org'),
(13, 'amintraders@domain.com'),
(14, 'nusrat@xyz.com'),
(15, 'majidsons@biz.com'),
(16, 'sumaiya@edu.com'),
(17, 'habib@domain.net'),
(18, 'faruk.ent18@gmail.com'),
(19, 'rubina19@mail.com'),
(20, 'tasnim20@abc.org'),
(21, 'sales21@alamsteel.com'),
(22, 'sara22@yahoo.com'),
(23, 'afia23@gmail.com'),
(24, 'sumair24@CHU.edu.com'),
(25, 'salma25@northsouth.com');

-- --------------------------------------------------------

--
-- Table structure for table `user_phone`
--

CREATE TABLE `user_phone` (
  `user_id` int(11) NOT NULL,
  `phone_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_phone`
--

INSERT INTO `user_phone` (`user_id`, `phone_number`) VALUES
(1, '0123456789'),
(2, '0987654321'),
(3, '01711223344'),
(4, '01887765432'),
(5, '01612349876'),
(6, '01556789012'),
(7, '01798745632'),
(8, '01822119988'),
(9, '01334566789'),
(10, '01756123489'),
(11, '01922447890'),
(12, '01877654321'),
(13, '01622334455'),
(14, '01599887766'),
(15, '01866554432'),
(16, '01777123456'),
(17, '01933455678'),
(18, '01544778899'),
(19, '01788223456'),
(20, '01399887755'),
(21, '01966778844'),
(22, '01112233995'),
(23, '01233445566'),
(24, '01877889900'),
(25, '01259887766');

-- --------------------------------------------------------

--
-- Table structure for table `user_service`
--

CREATE TABLE `user_service` (
  `Help_ID` int(11) NOT NULL,
  `City` varchar(100) NOT NULL,
  `Contact_Info` varchar(15) NOT NULL,
  `Area_Type` enum('Urban','Rural') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_service`
--

INSERT INTO `user_service` (`Help_ID`, `City`, `Contact_Info`, `Area_Type`) VALUES
(1, 'Dhaka', '01712345678', 'Urban'),
(2, 'Feni', '01787654321', 'Rural'),
(3, 'Chittagong', '01812345678', 'Urban'),
(4, 'Chittagong', '01887654321', 'Rural'),
(5, 'Khulna', '01912345678', 'Urban'),
(6, 'Khulna', '01987654321', 'Rural'),
(7, 'Rajshahi', '02012345678', 'Urban'),
(8, 'Rajshahi', '02087654321', 'Rural'),
(9, 'Sylhet', '02112345678', 'Urban'),
(10, 'Sylhet', '02187654321', 'Rural'),
(11, 'Barisal', '02212345678', 'Urban'),
(12, 'Barisal', '02287654321', 'Rural'),
(13, 'Cumilla', '02312345678', 'Urban'),
(14, 'Cumilla', '02387654321', 'Rural'),
(15, 'Gazipur', '02412345678', 'Urban'),
(16, 'Narayanganj', '01712345678', 'Urban'),
(17, 'Bogura', '01812345678', 'Urban');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appliance`
--
ALTER TABLE `appliance`
  ADD PRIMARY KEY (`appliance_id`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `meter_id` (`meter_id`);

--
-- Indexes for table `electricity_usage`
--
ALTER TABLE `electricity_usage`
  ADD PRIMARY KEY (`usage_id`),
  ADD KEY `meter_id` (`meter_id`);

--
-- Indexes for table `electric_meters`
--
ALTER TABLE `electric_meters`
  ADD PRIMARY KEY (`meter_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `usage_estimation`
--
ALTER TABLE `usage_estimation`
  ADD PRIMARY KEY (`estimation_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `appliance_id` (`appliance_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_address`
--
ALTER TABLE `user_address`
  ADD PRIMARY KEY (`user_id`,`address`);

--
-- Indexes for table `user_email`
--
ALTER TABLE `user_email`
  ADD PRIMARY KEY (`user_id`,`email`);

--
-- Indexes for table `user_phone`
--
ALTER TABLE `user_phone`
  ADD PRIMARY KEY (`user_id`,`phone_number`);

--
-- Indexes for table `user_service`
--
ALTER TABLE `user_service`
  ADD PRIMARY KEY (`Help_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appliance`
--
ALTER TABLE `appliance`
  MODIFY `appliance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `bill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `electricity_usage`
--
ALTER TABLE `electricity_usage`
  MODIFY `usage_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `electric_meters`
--
ALTER TABLE `electric_meters`
  MODIFY `meter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `usage_estimation`
--
ALTER TABLE `usage_estimation`
  MODIFY `estimation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user_service`
--
ALTER TABLE `user_service`
  MODIFY `Help_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`meter_id`) REFERENCES `electric_meters` (`meter_id`);

--
-- Constraints for table `electricity_usage`
--
ALTER TABLE `electricity_usage`
  ADD CONSTRAINT `electricity_usage_ibfk_1` FOREIGN KEY (`meter_id`) REFERENCES `electric_meters` (`meter_id`);

--
-- Constraints for table `electric_meters`
--
ALTER TABLE `electric_meters`
  ADD CONSTRAINT `electric_meters_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `usage_estimation`
--
ALTER TABLE `usage_estimation`
  ADD CONSTRAINT `usage_estimation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `usage_estimation_ibfk_2` FOREIGN KEY (`appliance_id`) REFERENCES `appliance` (`appliance_id`);

--
-- Constraints for table `user_address`
--
ALTER TABLE `user_address`
  ADD CONSTRAINT `user_address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `user_email`
--
ALTER TABLE `user_email`
  ADD CONSTRAINT `user_email_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `user_phone`
--
ALTER TABLE `user_phone`
  ADD CONSTRAINT `user_phone_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
