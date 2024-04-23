-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 28, 2022 at 05:13 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)   SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'HP'),
(2, 'Samsung'),
(3, 'Apple'),
(4, 'Sony'),
(5, 'LG'),
(6, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 26, '::1', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Electronics'),
(2, 'Mobiles'),
(3, 'Laptops'),
(4, 'Camera'),
(5, 'Accessories'),
(6, 'Home Appliances'),
(7, 'Electronics Gadgets');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(6, 'shivam21113@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 12, 1, 1, '07M47684BS5725041', 'Completed'),
(2, 27, 2, 1, '07M47684SR5725041', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 12, 'Shivam Yadav', 'shivam2111@gmail.com', 'Vitthalwadi', 'Kalyan', 'Maharashtra', 560074, 'pokjhgfcxc', '4321 2345 6788 7654', '12/90', 3, 77000, 1234),
(2, 27, 'shivam  yadav', 'shivam@gmail.com', 'vitthalwadi', 'kalyan', 'maharashtra', 421306, 'shivam yadav', '4211 3444 5544 4444', '12/24', 2, 178000, 123),
(3, 12, 'shivam yadav', 'shivam21113@gmail.com', 'vitthalwadi', 'kalyan', 'sss', 421306, 'sfdfdf', '3445 666755 43334', '12/24', 1, 50000, 123),
(4, 12, 'shivam yadav', 'shivam21113@gmail.com', 'vitthalwadi', 'kalyan', 'dddd', 421306, 'egrg', '4546 5768 7989 8990', '12/24', 1, 115000, 234),
(5, 27, 'shivam  yadav', 'shivam@gmail.com', 'vitthalwadi', 'kalyan', 'maharashtra', 421306, 'shivam yadav', '4445 4553 4255 4545', '12/25', 1, 50000, 367);

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(73, 1, 1, 1, 5000),
(91, 2, 2, 1, 115000),
(92, 2, 45, 1, 63000),
(93, 3, 74, 1, 50000),
(94, 4, 2, 1, 115000),
(95, 5, 74, 1, 50000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 2, 2, 'Samsung Galaxy S22 Ultra', 95000, 'Samsung S Series', 'product-6.png', 'Samsung Mobile'),
(2, 2, 3, 'iPhone 13 Pro', 115000, 'iPhone ', 'product-3.png', 'Apple Mobile'),
(3, 2, 3, 'iPhone 13', 65999, 'iPhone', 'product-24.png', 'Apple Mobile'),
(4, 2, 6, 'Redmi Note 10 Pro', 18000, 'Redmi', 'product-9.png', 'MI Mobile'),
(5, 2, 6, 'Redmi Note 11 Pro+', 20000, 'Redmi', 'product-13.png', 'MI Mobile'),
(6, 2, 6, 'Redmi K50i', 32000, 'Redmi', 'product-21.jpg', 'MI Mobile'),
(7, 2, 6, 'Mi 11X Ultra', 87000, 'MI', 'product-22.png', 'MI Mobile'),
(8, 2, 2, 'Samsung Galaxy S22', 62000, 'Samsung Galaxy S Series', 'product-25.png', 'Samsung Mobile'),
(9, 2, 6, 'One Plus 9', 72000, 'OnePlus', 'product-27.png', '1+ Mobile'),
(32, 2, 6, 'vivo X70 pro', 64000, 'vivo', 'product-28.png', 'Vivo Mobile'),
(33, 1, 6, 'Logitech Webcam', 1500, 'Logitech', 'product-45.png', 'Logitech Webcam'),
(34, 1, 6, 'Logitech Webcam', 1200, 'Logitech', 'product-46.png', 'Logitech Webcam'),
(35, 1, 6, 'Logitech Webcam', 1200, 'Logitech', 'product-47.png', 'Logitech Webcam'),
(36, 1, 6, 'Wifi Dongle', 450, 'Dongle', 'product-48.png', 'Wifi Dongle'),
(37, 1, 4, 'Sony Pendrive 32GB ', 900, 'Sony ', 'product-50.png', 'Sony Pendrive'),
(38, 1, 1, 'HP Pendrive 32GB', 750, 'HP', 'product-51.png', 'HP Pendrive'),
(39, 1, 6, 'Bluetooth Dongle', 450, 'Dongle', 'product-49.png', 'Bluetooth Dongle'),
(40, 3, 6, 'Asus Rog Strix', 65000, 'Asus', 'product-30.png', 'Asus Gaming Laptop'),
(45, 3, 1, 'HP Pavilion Gaming', 63000, 'HP', 'product-31.png', 'HP Gaming Laptop'),
(46, 3, 1, 'HP Victus Omen', 74000, 'HP', 'product-33.png', 'HP Premium Laptop'),
(47, 2, 6, 'Motorola Edge 20', 44000, 'Motorola', 'product-43.png', 'Motorola Mobile'),
(48, 2, 6, 'Motorola Edge 30', 55000, 'Motorola', 'product-44.png', 'Motorola'),
(49, 2, 6, 'oppo Reno 8', 28000, 'oppo', 'product-29.png', 'oppo Mobile'),
(50, 3, 6, 'Lenovo ideapad Slim 3', 36000, 'Lenovo', 'product-36.png', 'Lenovo Laptop'),
(51, 3, 6, 'Acer Nitro 5', 62000, 'Acer', 'product-35.png', 'Acer Gaming Laptop'),
(52, 3, 6, 'Dell Inspiration 3515', 38000, 'Dell', 'Product-52.png', 'Dell Laptop'),
(53, 3, 3, 'Apple Macbook Air Pro', 160000, 'Apple', 'product-53.png', 'Apple Macbook'),
(54, 4, 4, 'Sony Alpha DSLR', 54000, 'Sony', 'product-54.png', 'Canon Camera'),
(55, 4, 4, 'Sony A7i DSLR', 38000, 'Sony', 'product-55.png', 'Sony Camera'),
(56, 4, 4, 'Sony A9 DSLR', 45000, 'Sony', 'product-56.jpeg', 'Sony Camera'),
(57, 4, 6, 'Canon EOS2 DSLR', 38000, 'Canon', 'product-74.png', 'Canon Camera'),
(58, 4, 6, 'Canon EOS DSLR', 28000, 'Canon', 'product-58.png', 'Canon Camera'),
(59, 5, 6, 'Mi 33watt Adapter', 2700, 'MI', 'product-59.png', 'MI Adapter'),
(60, 5, 6, 'Mi 33Watt Charger', 3300, 'MI', 'product-60.png', 'MI Charger'),
(61, 5, 6, 'Type C Cable', 350, 'Cable', 'product-61.jpg', 'Type C Cable'),
(62, 5, 6, 'Keyboard and Mouse Combo', 2800, 'Keyboard and Mouse', 'product-62.png', 'Keyboard and Mouse'),
(63, 5, 1, 'HP Mouse', 700, 'HP', 'product-63.png', 'HP Mouse'),
(64, 5, 1, 'HP Keyboard', 1600, 'HP', 'product-66.png', 'HP Keyboard'),
(65, 5, 4, 'Sony Speaker', 900, 'Sony', 'product-64.png', 'Sony Speaker'),
(66, 6, 4, 'Sony R4 Smart TV', 75000, 'Sony', 'product-67.png', 'Sony Smart TV'),
(67, 6, 4, 'Sony Bravia Smart TV', 84000, 'Sony', 'product-68.png', 'Sony Smart TV'),
(68, 6, 5, 'LG 4K Smart TV', 95000, 'LG', 'product-69.png', 'LG 4K Smart TV'),
(69, 6, 2, 'Samsung UHD 4K Smart TV', 120000, 'Samsung', 'product-70.png', 'Samsung Smart 4K TV'),
(70, 6, 6, 'BENQ Projector', 38000, 'BENQ', 'product-71.png', 'BENQ Projector'),
(71, 6, 5, 'LG Refrigerator', 34000, 'LG', 'product-72.png', 'LG Fridge'),
(72, 7, 6, 'JBL Quantum Headphone', 8000, 'JBL', 'product-38.jpg', 'JBL Headphone'),
(73, 7, 2, 'Samsung Headphone', 16000, 'Samsung', 'product-5.png', 'Samsung Headphone'),
(74, 7, 3, 'Apple Smart Watch 7', 50000, 'Apple', 'product-19.jpg', 'Apple Smart Watch'),
(75, 7, 6, 'JBL TWS Earphone', 4600, 'JBL', 'product-12.jpg', 'JBL Earphone'),
(76, 7, 4, 'Sony Headphone', 12000, 'Sony', 'product-2.png', 'Sony Headphone'),
(77, 7, 4, 'Sony Headphone Elite', 24000, 'Sony', 'product-37.jpg', 'Sony Elite Headphone'),
(78, 3, 6, 'Asus Rog Strix G15', 89000, 'Asus', 'product-34.png', 'Asus Gaming Laptop'),
(79, 4, 6, 'canon 5D DSLR', 52000, 'canon', 'product-57.png', 'Canon Camera'),
(80, 6, 6, 'Washing Machine', 25000, 'Washing Machine', 'product-73.png', 'Washing Machine'),
(81, 7, 3, 'Apple Smart Watch 5', 35000, 'Apple', 'product-7.jpg', 'Apple Smart Watch');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'shivam', 'yadav', 'shivam21113@gmail.com', 'admin', '9082518875', 'vitthalwadi', 'kalyan'),
(27, 'shivam ', 'yadav', 'shivam@gmail.com', 'Shivam@123', '9082518875', 'vitthalwadi', 'kalyan');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'shivam', 'yadav', 'shivam21113@gmail.com', 'admin', '9082518875', 'vitthalwadi', 'kalyan'),
(27, 'shivam ', 'yadav', 'shivam@gmail.com', 'Shivam@123', '9082518875', 'vitthalwadi', 'kalyan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
