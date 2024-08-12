-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2024 at 03:54 AM
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
-- Database: `php_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(4) NOT NULL,
  `admin_name` varchar(250) NOT NULL,
  `admin_email` text NOT NULL,
  `admin_password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@email.com', '827ccb0eea8a706c4c34a16891f84e7b');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_cost` decimal(8,2) NOT NULL,
  `order_status` varchar(100) NOT NULL DEFAULT 'on_hold',
  `user_id` int(11) NOT NULL,
  `user_phone` int(11) NOT NULL,
  `user_city` varchar(255) NOT NULL,
  `user_address` varchar(255) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_cost`, `order_status`, `user_id`, `user_phone`, `user_city`, `user_address`, `order_date`) VALUES
(17, 60000.00, 'not paid', 1, 123456789, 'ktm', 'boudha', '2024-04-12 09:19:02'),
(18, 60000.00, 'not paid', 1, 123456789, 'ktm', 'boudha', '2024-04-12 19:04:10'),
(19, 60000.00, 'not paid', 1, 1234567890, 'ktm', 'boudha', '2024-04-12 19:06:18'),
(20, 190000.00, 'not paid', 9, 123456789, 'ktm', 'sda', '2024-05-10 11:12:00'),
(21, 75000.00, 'not paid', 10, 123456789, 'ktm', 'boudha', '2024-05-12 12:56:43'),
(22, 274000.00, 'not paid', 10, 1234567890, 'ktm', 'boudha', '2024-05-12 12:57:35'),
(23, 274000.00, 'not paid', 10, 1234567890, 'ktm', 'boudha', '2024-05-12 12:58:35');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_price` decimal(8,2) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`item_id`, `order_id`, `product_id`, `product_name`, `product_image`, `product_price`, `product_quantity`, `user_id`, `order_date`) VALUES
(2, 17, '4', 'Dell Latitude 7760', 'featured4.jpg', 60000.00, 1, 1, '2024-04-12 09:19:02'),
(3, 18, '4', 'Dell Latitude 7760', 'featured4.jpg', 60000.00, 1, 1, '2024-04-12 19:04:10'),
(4, 19, '4', 'Dell Latitude 7760', 'featured4.jpg', 60000.00, 1, 1, '2024-04-12 19:06:18'),
(5, 20, '3', 'MSI Katana', 'featured3.jpg', 190000.00, 1, 9, '2024-05-10 11:12:00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_category` varchar(108) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_image2` varchar(255) DEFAULT NULL,
  `product_image3` varchar(255) DEFAULT NULL,
  `product_image4` varchar(255) DEFAULT NULL,
  `product_price` decimal(8,2) NOT NULL,
  `product_special_offer` int(2) DEFAULT NULL,
  `product_color` varchar(108) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_category`, `product_description`, `product_image`, `product_image2`, `product_image3`, `product_image4`, `product_price`, `product_special_offer`, `product_color`) VALUES
(1, 'HP Victus-16', 'HP', 'Victus by HP is a new lineup of gaming laptops that will complement the existing Omen range of notebooks.', 'featured1.jpg', 'vic1.png', 'vic2.jpg', 'vic3.jpg', 110000.00, 0, 'Blue'),
(2, 'Mac M1 Air', 'Apple', 'Best Notebook', 'featured2.jpg', 'air1.jpg', 'air2.jpg', 'air3.jpg', 150000.00, 0, 'White'),
(3, 'MSI Katana', 'MSI', 'Powerful Gaming Laptop', 'featured3.jpg', 'kat1.jpg', 'kat2.jpg', 'kat3.jpg', 190000.00, 0, 'Black'),
(4, 'Dell Latitude 7760', 'Dell', 'Budget Friendly', 'featured4.jpg', 'lat1.jpg', 'lat2.jpg', 'lat3.jpg', 60000.00, 1000, 'Silver'),
(6, 'HP Full HD 24 inch Monitor', 'HP', 'Best Monitor', 'featured5.jpg', 'featured5.jpg', 'featured5.jpg', 'featured5.jpg', 51000.00, 0, 'Black'),
(7, 'MSI- Gk007 Mouse and Keyboard', 'MSI', 'Wireless For Gaming', 'featured6.jpg', 'featured6.jpg', 'featured6.jpg', 'featured6.jpg', 7000.00, 0, 'Smoked Black'),
(8, 'Dell Inspiron-14', 'Dell', 'Notebook', 'featured7.jpg', 'featured7.jpg', 'featured7.jpg', 'featured7.jpg', 75000.00, 0, 'Black'),
(9, 'Mac M1 Pro', 'Apple', 'Best in class', 'featured8.jpg', 'featured8.jpg', 'featured8.jpg', 'featured8.jpg', 199000.00, 0, 'Silver Pearl'),
(10, 'MSI Stealth-15', 'MSI', 'Lethal Gaming Tool', 'featured9.jpg', 'featured9.jpg', 'featured9.jpg', 'featured9.jpg', 150000.00, 0, 'Black '),
(11, 'Dell G-15', 'Dell', 'RGB backlit and powerful', 'featured10.jpg', 'featured10.jpg', 'featured10.jpg', 'featured10.jpg', 130000.00, 0, 'Moist Silver'),
(12, 'HP wireless Keyboard and Mouse', 'HP', 'wireless Keyboard and Mouse', 'featured11.jpg', 'featured11.jpg', 'featured11.jpg', 'featured11.jpg', 8000.00, 0, 'Shady Black'),
(13, 'MSI- GC03-controller', 'MSI', 'Wired and Wireless Controller', 'featured12.png', 'featured12.png', 'featured12.png', 'featured12.png', 2700.00, 0, 'Black and White'),
(14, 'Mac M2 Pro', 'Apple', 'Best Notebook Available', 'featured13.jpg', 'featured13.jpg', 'featured13.jpg', 'featured13.jpg', 175000.00, 0, 'Mettalic Silver'),
(15, 'HP notebook-15', 'HP', 'Light and Durable', 'featured14.webp', 'featured14.webp', 'featured14.webp', 'featured14.webp', 90100.00, 0, 'Light White'),
(16, 'MSI GF235', 'MSI', 'Best', 'featured15.jpg', 'featured15.jpg', 'featured15.jpg', 'featured15.jpg', 165000.00, 0, 'Smoked Black'),
(17, 'MSI Alpha', 'MSI', 'Stereo Headphones', 'featured16.jpg', 'featured16.jpg', 'featured16.jpg', 'featured16.jpg', 8000.00, 0, 'Black'),
(18, 'Mac board', 'Apple', 'For Elegant Typing Experience', 'featured17.jpg', 'featured17.jpg', 'featured17.jpg', 'featured17.jpg', 21000.00, 0, 'Moist Silver'),
(19, ' MSI modern 14', 'MSI', 'Budget Friendly', 'featured18.jpg', 'featured18.jpg', 'featured18.jpg', 'featured18.jpg', 125000.00, 0, 'Black');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(108) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_password`) VALUES
(1, 'Hari', 'hari@gmail.com', '25f9e794323b453885f5181f1b624d0b'),
(2, 'username', 'user@gmail.com', '123456'),
(8, 'Pep Gonzalez  ', 'pep@hotmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
(9, 'Sajan', 'sajan12@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
(10, 'Suyog', 'suyog007@gmail.com', 'e10adc3949ba59abbe56e057f20f883e');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `UX_Constraint` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
