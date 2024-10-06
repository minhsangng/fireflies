-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 03, 2024 at 06:42 AM
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
-- Database: `fireflies`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendanceID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `attendanceDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendanceID`, `userID`, `attendanceDate`) VALUES
(1, 6, '2024-10-01'),
(2, 7, '2024-10-02');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categoryID` int(11) NOT NULL,
  `categoryName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customerID` int(11) NOT NULL,
  `customerName` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customerID`, `customerName`, `email`, `phone`, `address`, `createdAt`) VALUES
(1, 'Nguyễn Văn A', 'vana@example.com', '0987654321', '123 Đường ABC, Quận 1, TP.HCM', '2024-10-03 04:23:08'),
(2, 'Trần Thị B', 'thib@example.com', '0912345678', '456 Đường DEF, Quận 3, TP.HCM', '2024-10-03 04:23:08');

-- --------------------------------------------------------

--
-- Table structure for table `dish`
--

CREATE TABLE `dish` (
  `dishID` int(11) NOT NULL,
  `dishName` varchar(100) NOT NULL,
  `dishCategory` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `businessStatus` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `preparationProcess` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `dish`
--

INSERT INTO `dish` (`dishID`, `dishName`, `dishCategory`, `price`, `businessStatus`, `description`, `preparationProcess`, `image`) VALUES
(1, 'Gà rán giòn', 'Gà rán', 50000.00, 'available', 'Gà rán giòn với lớp vỏ giòn tan', 'Chiên gà trong dầu nóng', 'garan.png'),
(2, 'Mì Ý sốt cà chua', 'Mì Ý', 45000.00, 'available', 'Mì Ý kèm sốt cà chua đậm đà', 'Luộc mì và nấu sốt', 'miysocachua.png'),
(3, 'Kem vani', 'Kem', 20000.00, 'available', 'Kem vani mát lạnh', 'Làm lạnh kem', 'kemvani.png'),
(4, 'Pepsi', 'Nước ngọt', 15000.00, 'available', 'Nước ngọt có gas vị Pepsi', 'Đóng chai', 'pepsivua.png'),
(5, 'Coca-cola', 'Nước ngọt', 15000.00, 'available', 'Nước ngọt có gas vị Coca', 'Đóng chai', 'cocacolavua.png'),
(6, 'Sprite', 'Nước ngọt', 15000.00, 'available', 'Nước ngọt có gas vị Sprite', 'Đóng chai', 'spritevua.png'),
(7, 'Burger bò', 'Burger', 60000.00, 'available', 'Burger bò ngon miệng', 'Nướng bánh và làm nhân bò', 'burgerbo.png');

-- --------------------------------------------------------

--
-- Table structure for table `dish_ingredient`
--

CREATE TABLE `dish_ingredient` (
  `dishID` int(11) NOT NULL,
  `ingredientID` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `dish_ingredient`
--

INSERT INTO `dish_ingredient` (`dishID`, `ingredientID`, `quantity`) VALUES
(1, 1, 1),
(2, 2, 1),
(2, 3, 1),
(3, 4, 1),
(4, 5, 1),
(5, 6, 1),
(6, 7, 1),
(7, 8, 1),
(7, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `employeeshift`
--

CREATE TABLE `employeeshift` (
  `employeeShiftID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `shiftID` int(11) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `employeeshift`
--

INSERT INTO `employeeshift` (`employeeShiftID`, `userID`, `shiftID`, `startDate`, `endDate`) VALUES
(5, 6, 1, '2024-10-01', '2024-10-01'),
(6, 7, 2, '2024-10-01', '2024-10-01'),
(7, 6, 2, '2024-10-02', '2024-10-02'),
(8, 7, 1, '2024-10-02', '2024-10-02');

-- --------------------------------------------------------

--
-- Table structure for table `importorder`
--

CREATE TABLE `importorder` (
  `importOrderID` int(11) NOT NULL,
  `storeID` int(11) DEFAULT NULL,
  `importDate` date DEFAULT NULL,
  `expirationDate` date DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `importorder`
--

INSERT INTO `importorder` (`importOrderID`, `storeID`, `importDate`, `expirationDate`, `total`) VALUES
(1, 1, '2024-09-15', '2024-12-15', 500000.00),
(2, 2, '2024-09-20', '2024-12-20', 300000.00);

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

CREATE TABLE `ingredient` (
  `ingredientID` int(11) NOT NULL,
  `ingredientName` varchar(100) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `manufactureDate` date DEFAULT NULL,
  `expirationDate` date DEFAULT NULL,
  `quantityInStock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `ingredient`
--

INSERT INTO `ingredient` (`ingredientID`, `ingredientName`, `info`, `manufactureDate`, `expirationDate`, `quantityInStock`) VALUES
(1, 'Thịt gà', 'Thịt gà tươi', '2024-09-01', '2024-12-01', 100),
(2, 'Mì Ý', 'Mì Ý chất lượng cao', '2024-09-01', '2025-03-01', 200),
(3, 'Sốt cà chua', 'Sốt cà chua nhập khẩu', '2024-09-15', '2025-01-01', 150),
(4, 'Kem vani', 'Kem vani tươi ngon', '2024-09-01', '2025-01-01', 50),
(5, 'Pepsi', 'Nước ngọt có gas vị Pepsi', '2024-09-10', '2025-09-10', 500),
(6, 'Coca', 'Nước ngọt có gas vị Coca', '2024-09-10', '2025-09-10', 500),
(7, 'Sprite', 'Nước ngọt có gas vị Sprite', '2024-09-10', '2025-09-10', 500),
(8, 'Thịt bò', 'Thịt bò nhập khẩu', '2024-09-01', '2024-12-01', 80),
(9, 'Bánh burger', 'Bánh burger mềm', '2024-09-01', '2024-11-01', 100);

-- --------------------------------------------------------

--
-- Table structure for table `needingingredient`
--

CREATE TABLE `needingingredient` (
  `dishID` int(11) NOT NULL,
  `ingredientID` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `needingingredient`
--

INSERT INTO `needingingredient` (`dishID`, `ingredientID`, `quantity`) VALUES
(1, 1, 1),
(2, 2, 1),
(2, 3, 1),
(7, 8, 1),
(7, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderID` int(11) NOT NULL,
  `customerID` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `totalAmount` decimal(10,2) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderID`, `customerID`, `orderDate`, `totalAmount`, `status`) VALUES
(1, 1, '2024-09-30 17:00:00', 120000.00, 'Hoàn thành'),
(2, 2, '2024-10-01 17:00:00', 60000.00, 'Đang chế biến');

-- --------------------------------------------------------

--
-- Table structure for table `order_dish`
--

CREATE TABLE `order_dish` (
  `orderID` int(11) NOT NULL,
  `dishID` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `order_dish`
--

INSERT INTO `order_dish` (`orderID`, `dishID`, `quantity`) VALUES
(1, 1, 1),
(1, 4, 1),
(2, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `orderItemID` int(11) NOT NULL,
  `orderID` int(11) DEFAULT NULL,
  `productID` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `partypackage`
--

CREATE TABLE `partypackage` (
  `partyPackageID` int(11) NOT NULL,
  `partyPackageName` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `decoration` text DEFAULT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `partypackage`
--

INSERT INTO `partypackage` (`partyPackageID`, `partyPackageName`, `price`, `image`, `startDate`, `endDate`, `decoration`, `note`) VALUES
(1, 'Gói tiệc sinh nhật', 650000.00, 'party1.png', '2024-09-01', '2025-01-01', 'Trang trí bóng bay, chữ và nến', 'Gói tiệc cho 10 người'),
(2, 'Gói tiệc gia đình', 1200000.00, 'party2.png', '2024-09-01', '2025-01-01', 'Trang trí chuyên nghiệp với hoa và nến', 'Gói tiệc cho 20 người');

-- --------------------------------------------------------

--
-- Table structure for table `partypackage_dish`
--

CREATE TABLE `partypackage_dish` (
  `partyPackageID` int(11) NOT NULL,
  `dishID` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `partypackage_dish`
--

INSERT INTO `partypackage_dish` (`partyPackageID`, `dishID`, `quantity`) VALUES
(1, 1, 10),
(1, 4, 10),
(2, 5, 20),
(2, 7, 20);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `productID` int(11) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  `categoryID` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `promotionID` int(11) NOT NULL,
  `promotionName` varchar(100) DEFAULT NULL,
  `discountPercentage` decimal(5,2) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `promotion`
--

INSERT INTO `promotion` (`promotionID`, `promotionName`, `discountPercentage`, `startDate`, `endDate`, `description`) VALUES
(1, 'Combo 2 gà rán 1 pepsi vừa', 15.00, '2024-10-04', '2024-10-26', 'Giảm giá 15% cho combo 2 món'),
(2, 'Tuần lễ sales', 5.00, '2024-09-30', '2024-10-06', 'Giảm giá 5% tất cả sản phẩm'),
(3, 'Giảm giá khai trương', 10.00, '2024-10-01', '2024-10-31', 'Giảm giá 10% nhân dịp khai trương');

-- --------------------------------------------------------

--
-- Table structure for table `proposal`
--

CREATE TABLE `proposal` (
  `proposalID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `typeOfProposal` varchar(100) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `roleID` int(11) NOT NULL,
  `roleName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`roleID`, `roleName`) VALUES
(1, 'Admin'),
(2, 'Staff');

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE `shift` (
  `shiftID` int(11) NOT NULL,
  `shiftName` varchar(50) DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `shift`
--

INSERT INTO `shift` (`shiftID`, `shiftName`, `startTime`, `endTime`) VALUES
(1, 'Ca sáng', '08:00:00', '12:00:00'),
(2, 'Ca chiều', '13:00:00', '17:00:00'),
(3, 'Ca tối', '18:00:00', '22:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `storeID` int(11) NOT NULL,
  `storeName` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`storeID`, `storeName`, `address`, `status`, `contact`) VALUES
(1, 'Cửa hàng Fireflies 111', '12 Đường ABC, Quận Gò Vấp, TP.HCM', 'Đang hoạt động', '0982564321'),
(2, 'Cửa hàng Fireflies 112', '5 Đường EFD, Quận Gò Vấp, TP.HCM', 'Đang hoạt động', '0965245921'),
(3, 'Cửa hàng Fireflies 113', '18B Đường JKL, Quận Gò Vấp, TP.HCM', 'Đang hoạt động', '0962549823'),
(4, 'Cửa hàng Fireflies 114', '90/5 Đường AHD, Quận Gò Vấp, TP.HCM', 'Đang hoạt động', '09356248921'),
(5, 'Cửa hàng Fireflies 115', '6 Đường DEF, Quận Gò Vấp, TP.HCM', 'Đang hoạt động', '0913645678');

-- --------------------------------------------------------

--
-- Table structure for table `store_ingredient`
--

CREATE TABLE `store_ingredient` (
  `storeID` int(11) NOT NULL,
  `ingredientID` int(11) NOT NULL,
  `quantityInStock` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `store_ingredient`
--

INSERT INTO `store_ingredient` (`storeID`, `ingredientID`, `quantityInStock`, `date`) VALUES
(1, 1, 50, '2024-09-30'),
(1, 5, 100, '2024-09-30'),
(2, 9, 30, '2024-09-30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','staff') DEFAULT 'staff',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `username`, `password`, `role`, `createdAt`) VALUES
(1, 'admin111', 'password', 'admin', '2024-10-03 04:36:19'),
(2, 'admin112', 'password', 'admin', '2024-10-03 04:36:19'),
(3, 'admin113', 'password', 'admin', '2024-10-03 04:36:19'),
(4, 'admin114', 'password', 'admin', '2024-10-03 04:36:19'),
(5, 'admin115', 'password', 'admin', '2024-10-03 04:36:19'),
(6, 'staffA', 'password', 'staff', '2024-10-03 04:36:19'),
(7, 'staffB', 'password', 'staff', '2024-10-03 04:36:19'),
(8, 'staffC', 'password', 'staff', '2024-10-03 04:36:19'),
(9, 'staffD', 'password', 'staff', '2024-10-03 04:36:19'),
(10, 'staffE', 'password', 'staff', '2024-10-03 04:36:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendanceID`),
  ADD KEY `user_id` (`userID`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customerID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `dish`
--
ALTER TABLE `dish`
  ADD PRIMARY KEY (`dishID`);

--
-- Indexes for table `dish_ingredient`
--
ALTER TABLE `dish_ingredient`
  ADD PRIMARY KEY (`dishID`,`ingredientID`),
  ADD KEY `ingredientID` (`ingredientID`);

--
-- Indexes for table `employeeshift`
--
ALTER TABLE `employeeshift`
  ADD PRIMARY KEY (`employeeShiftID`),
  ADD KEY `user_id` (`userID`),
  ADD KEY `shiftID` (`shiftID`);

--
-- Indexes for table `importorder`
--
ALTER TABLE `importorder`
  ADD PRIMARY KEY (`importOrderID`),
  ADD KEY `storeID` (`storeID`);

--
-- Indexes for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`ingredientID`);

--
-- Indexes for table `needingingredient`
--
ALTER TABLE `needingingredient`
  ADD PRIMARY KEY (`dishID`,`ingredientID`),
  ADD KEY `ingredientID` (`ingredientID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `customer_id` (`customerID`);

--
-- Indexes for table `order_dish`
--
ALTER TABLE `order_dish`
  ADD PRIMARY KEY (`orderID`,`dishID`),
  ADD KEY `dishID` (`dishID`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`orderItemID`),
  ADD KEY `order_id` (`orderID`),
  ADD KEY `product_id` (`productID`);

--
-- Indexes for table `partypackage`
--
ALTER TABLE `partypackage`
  ADD PRIMARY KEY (`partyPackageID`);

--
-- Indexes for table `partypackage_dish`
--
ALTER TABLE `partypackage_dish`
  ADD PRIMARY KEY (`partyPackageID`,`dishID`),
  ADD KEY `dishID` (`dishID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productID`),
  ADD KEY `category_id` (`categoryID`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`promotionID`);

--
-- Indexes for table `proposal`
--
ALTER TABLE `proposal`
  ADD PRIMARY KEY (`proposalID`),
  ADD KEY `user_id` (`userID`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`roleID`);

--
-- Indexes for table `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`shiftID`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`storeID`);

--
-- Indexes for table `store_ingredient`
--
ALTER TABLE `store_ingredient`
  ADD PRIMARY KEY (`storeID`,`ingredientID`),
  ADD KEY `ingredientID` (`ingredientID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendanceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dish`
--
ALTER TABLE `dish`
  MODIFY `dishID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `employeeshift`
--
ALTER TABLE `employeeshift`
  MODIFY `employeeShiftID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `importorder`
--
ALTER TABLE `importorder`
  MODIFY `importOrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `ingredientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `orderItemID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partypackage`
--
ALTER TABLE `partypackage`
  MODIFY `partyPackageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `promotionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `proposal`
--
ALTER TABLE `proposal`
  MODIFY `proposalID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `roleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shift`
--
ALTER TABLE `shift`
  MODIFY `shiftID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `storeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);

--
-- Constraints for table `dish_ingredient`
--
ALTER TABLE `dish_ingredient`
  ADD CONSTRAINT `dish_ingredient_ibfk_1` FOREIGN KEY (`dishID`) REFERENCES `dish` (`dishID`),
  ADD CONSTRAINT `dish_ingredient_ibfk_2` FOREIGN KEY (`ingredientID`) REFERENCES `ingredient` (`ingredientID`);

--
-- Constraints for table `employeeshift`
--
ALTER TABLE `employeeshift`
  ADD CONSTRAINT `employeeshift_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`),
  ADD CONSTRAINT `employeeshift_ibfk_2` FOREIGN KEY (`shiftID`) REFERENCES `shift` (`shiftID`);

--
-- Constraints for table `importorder`
--
ALTER TABLE `importorder`
  ADD CONSTRAINT `importorder_ibfk_1` FOREIGN KEY (`storeID`) REFERENCES `store` (`storeID`);

--
-- Constraints for table `needingingredient`
--
ALTER TABLE `needingingredient`
  ADD CONSTRAINT `needingingredient_ibfk_1` FOREIGN KEY (`dishID`) REFERENCES `dish` (`dishID`),
  ADD CONSTRAINT `needingingredient_ibfk_2` FOREIGN KEY (`ingredientID`) REFERENCES `ingredient` (`ingredientID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customers` (`customerID`);

--
-- Constraints for table `order_dish`
--
ALTER TABLE `order_dish`
  ADD CONSTRAINT `order_dish_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`),
  ADD CONSTRAINT `order_dish_ibfk_2` FOREIGN KEY (`dishID`) REFERENCES `dish` (`dishID`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`);

--
-- Constraints for table `partypackage_dish`
--
ALTER TABLE `partypackage_dish`
  ADD CONSTRAINT `partypackage_dish_ibfk_1` FOREIGN KEY (`partyPackageID`) REFERENCES `partypackage` (`partyPackageID`),
  ADD CONSTRAINT `partypackage_dish_ibfk_2` FOREIGN KEY (`dishID`) REFERENCES `dish` (`dishID`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`categoryID`);

--
-- Constraints for table `proposal`
--
ALTER TABLE `proposal`
  ADD CONSTRAINT `proposal_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);

--
-- Constraints for table `store_ingredient`
--
ALTER TABLE `store_ingredient`
  ADD CONSTRAINT `store_ingredient_ibfk_1` FOREIGN KEY (`storeID`) REFERENCES `store` (`storeID`),
  ADD CONSTRAINT `store_ingredient_ibfk_2` FOREIGN KEY (`ingredientID`) REFERENCES `ingredient` (`ingredientID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
