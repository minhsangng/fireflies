-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2024 at 12:09 PM
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
  `attendance_id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `attendance_date` date NOT NULL,
  `check_in_time` time DEFAULT NULL,
  `check_out_time` time DEFAULT NULL,
  `attendance_status` varchar(50) DEFAULT 'Có mặt'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `employee_id`, `attendance_date`, `check_in_time`, `check_out_time`, `attendance_status`) VALUES
(1, NULL, '2023-09-10', '08:00:00', '17:00:00', 'Có mặt'),
(2, NULL, '2023-09-10', '13:00:00', '22:00:00', 'Có mặt'),
(3, NULL, '2023-09-11', '08:00:00', '17:00:00', 'Có mặt'),
(4, NULL, '2023-09-11', '13:00:00', '22:00:00', 'Có mặt'),
(5, NULL, '2023-09-12', '08:00:00', '17:00:00', 'Có mặt'),
(6, NULL, '2023-09-12', '13:00:00', '22:00:00', 'Có mặt'),
(7, NULL, '2023-09-13', '08:00:00', '17:00:00', 'Có mặt'),
(8, NULL, '2023-09-13', '13:00:00', '22:00:00', 'Có mặt'),
(9, NULL, '2023-09-14', '08:00:00', '17:00:00', 'Có mặt'),
(10, NULL, '2023-09-14', '13:00:00', '22:00:00', 'Có mặt');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_phone` varchar(20) NOT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `customer_address` text DEFAULT NULL,
  `customer_blacklist_status` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_phone`, `customer_email`, `customer_address`, `customer_blacklist_status`) VALUES
(1, 'Nguyen Van A', '0901123456', 'nguyenvana@gmail.com', '123 Đường ABC, Quận 1, TP.HCM', 0),
(2, 'Tran Thi B', '0902345678', 'tranthib@gmail.com', '456 Đường DEF, Quận 3, TP.HCM', 0),
(3, 'Le Van C', '0903344455', 'levanc@gmail.com', '789 Đường GHI, Quận 5, TP.HCM', 1),
(4, 'Pham Thi D', '0904455566', 'phamthid@gmail.com', '101 Đường JKL, Quận 7, TP.HCM', 0),
(5, 'Hoang Van E', '0905566778', 'hoangvane@gmail.com', '121 Đường MNO, Quận 9, TP.HCM', 0),
(6, 'Nguyen Thi F', '0906677889', 'nguyenthif@gmail.com', '321 Đường PQR, Quận 11, TP.HCM', 0),
(7, 'Tran Van G', '0907788990', 'tranvang@gmail.com', '654 Đường STU, Quận 4, TP.HCM', 0),
(8, 'Le Thi H', '0908899001', 'lethih@gmail.com', '987 Đường VWX, Quận 6, TP.HCM', 0),
(9, 'Pham Van I', '0909900112', 'phamvani@gmail.com', '456 Đường YZA, Quận 2, TP.HCM', 0),
(10, 'Hoang Thi J', '0910011223', 'hoangthij@gmail.com', '678 Đường BCD, Quận 8, TP.HCM', 0),
(11, 'Nguyen Van K', '0911122334', 'nguyenvank@gmail.com', '123 Đường ABC, Quận 1, TP.HCM', 0),
(12, 'Tran Thi L', '0912233445', 'tranthil@gmail.com', '456 Đường DEF, Quận 3, TP.HCM', 0),
(13, 'Le Van M', '0913344556', 'levanm@gmail.com', '789 Đường GHI, Quận 5, TP.HCM', 1),
(14, 'Pham Thi N', '0914455667', 'phamthin@gmail.com', '101 Đường JKL, Quận 7, TP.HCM', 0),
(15, 'Hoang Van O', '0915566778', 'hoangvano@gmail.com', '121 Đường MNO, Quận 9, TP.HCM', 0),
(16, 'Nguyen Thi P', '0916677889', 'nguyenthif@gmail.com', '321 Đường PQR, Quận 11, TP.HCM', 0),
(17, 'Tran Van Q', '0917788990', 'tranvanq@gmail.com', '654 Đường STU, Quận 4, TP.HCM', 0),
(18, 'Le Thi R', '0918899001', 'lethir@gmail.com', '987 Đường VWX, Quận 6, TP.HCM', 0),
(19, 'Pham Van S', '0919900112', 'phamvans@gmail.com', '456 Đường YZA, Quận 2, TP.HCM', 0),
(20, 'Hoang Thi T', '0920011223', 'hoangthit@gmail.com', '678 Đường BCD, Quận 8, TP.HCM', 0),
(21, 'Nguyen Van A', '0901123456', 'nguyenvana@gmail.com', '123 Đường ABC, Quận 1, TP.HCM', 0),
(22, 'Tran Thi B', '0902345678', 'tranthib@gmail.com', '456 Đường DEF, Quận 3, TP.HCM', 0),
(23, 'Le Van C', '0903344455', 'levanc@gmail.com', '789 Đường GHI, Quận 5, TP.HCM', 1),
(24, 'Pham Thi D', '0904455566', 'phamthid@gmail.com', '101 Đường JKL, Quận 7, TP.HCM', 0),
(25, 'Hoang Van E', '0905566778', 'hoangvane@gmail.com', '121 Đường MNO, Quận 9, TP.HCM', 0),
(26, 'Nguyen Thi F', '0906677889', 'nguyenthif@gmail.com', '321 Đường PQR, Quận 11, TP.HCM', 0),
(27, 'Tran Van G', '0907788990', 'tranvang@gmail.com', '654 Đường STU, Quận 4, TP.HCM', 0),
(28, 'Le Thi H', '0908899001', 'lethih@gmail.com', '987 Đường VWX, Quận 6, TP.HCM', 0),
(29, 'Pham Van I', '0909900112', 'phamvani@gmail.com', '456 Đường YZA, Quận 2, TP.HCM', 0),
(30, 'Hoang Thi J', '0910011223', 'hoangthij@gmail.com', '678 Đường BCD, Quận 8, TP.HCM', 0),
(31, 'Nguyen Van K', '0911122334', 'nguyenvank@gmail.com', '123 Đường ABC, Quận 1, TP.HCM', 0),
(32, 'Tran Thi L', '0912233445', 'tranthil@gmail.com', '456 Đường DEF, Quận 3, TP.HCM', 0),
(33, 'Le Van M', '0913344556', 'levanm@gmail.com', '789 Đường GHI, Quận 5, TP.HCM', 1),
(34, 'Pham Thi N', '0914455667', 'phamthin@gmail.com', '101 Đường JKL, Quận 7, TP.HCM', 0),
(35, 'Hoang Van O', '0915566778', 'hoangvano@gmail.com', '121 Đường MNO, Quận 9, TP.HCM', 0),
(36, 'Nguyen Thi P', '0916677889', 'nguyenthif@gmail.com', '321 Đường PQR, Quận 11, TP.HCM', 0),
(37, 'Tran Van Q', '0917788990', 'tranvanq@gmail.com', '654 Đường STU, Quận 4, TP.HCM', 0),
(38, 'Le Thi R', '0918899001', 'lethir@gmail.com', '987 Đường VWX, Quận 6, TP.HCM', 0),
(39, 'Pham Van S', '0919900112', 'phamvans@gmail.com', '456 Đường YZA, Quận 2, TP.HCM', 0),
(40, 'Hoang Thi T', '0920011223', 'hoangthit@gmail.com', '678 Đường BCD, Quận 8, TP.HCM', 0);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `employee_name` varchar(255) NOT NULL,
  `employee_phone` varchar(20) DEFAULT NULL,
  `employee_address` text DEFAULT NULL,
  `employee_position` varchar(50) DEFAULT NULL,
  `employee_shift` varchar(50) DEFAULT NULL,
  `employee_salary` decimal(10,2) DEFAULT NULL,
  `employee_status` varchar(50) DEFAULT 'Đang làm'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `employee_name`, `employee_phone`, `employee_address`, `employee_position`, `employee_shift`, `employee_salary`, `employee_status`) VALUES
(1, 'Tran Van A', '0901123456', '123 Đường ABC, Quận 1, TP.HCM', 'Nhân viên nhận đơn', 'Sáng', 7000000.00, 'Đang làm'),
(2, 'Le Thi B', '0902233445', '456 Đường DEF, Quận 3, TP.HCM', 'Nhân viên bếp', 'Chiều', 8000000.00, 'Đang làm'),
(3, 'Pham Van C', '0903344556', '789 Đường GHI, Quận 5, TP.HCM', 'Quản lý cửa hàng', 'Sáng', 12000000.00, 'Đang làm'),
(4, 'Nguyen Thi D', '0904455667', '101 Đường JKL, Quận 7, TP.HCM', 'Nhân viên bếp', 'Tối', 7500000.00, 'Đang làm'),
(5, 'Hoang Van E', '0905566778', '121 Đường MNO, Quận 9, TP.HCM', 'Nhân viên nhận đơn', 'Sáng', 7000000.00, 'Đang làm'),
(6, 'Nguyen Van F', '0906677889', '321 Đường PQR, Quận 11, TP.HCM', 'Nhân viên bếp', 'Chiều', 8000000.00, 'Đang làm'),
(7, 'Le Thi G', '0907788990', '654 Đường STU, Quận 4, TP.HCM', 'Quản lý chuỗi cửa hàng', 'Sáng', 15000000.00, 'Đang làm'),
(8, 'Pham Thi H', '0908899001', '987 Đường VWX, Quận 6, TP.HCM', 'Nhân viên nhận đơn', 'Tối', 7000000.00, 'Đang làm'),
(9, 'Hoang Van I', '0909900112', '456 Đường YZA, Quận 2, TP.HCM', 'Nhân viên bếp', 'Sáng', 8000000.00, 'Đang làm'),
(10, 'Tran Van J', '0910011223', '678 Đường BCD, Quận 8, TP.HCM', 'Nhân viên nhận đơn', 'Chiều', 7000000.00, 'Đang làm'),
(11, 'Tran Van A', '0901123456', '123 Đường ABC, Quận 1, TP.HCM', 'Nhân viên nhận đơn', 'Sáng', 7000000.00, 'Đang làm'),
(12, 'Le Thi B', '0902233445', '456 Đường DEF, Quận 3, TP.HCM', 'Nhân viên bếp', 'Chiều', 8000000.00, 'Đang làm'),
(13, 'Pham Van C', '0903344556', '789 Đường GHI, Quận 5, TP.HCM', 'Quản lý cửa hàng', 'Sáng', 12000000.00, 'Đang làm'),
(14, 'Nguyen Thi D', '0904455667', '101 Đường JKL, Quận 7, TP.HCM', 'Nhân viên bếp', 'Tối', 7500000.00, 'Đang làm'),
(15, 'Hoang Van E', '0905566778', '121 Đường MNO, Quận 9, TP.HCM', 'Nhân viên nhận đơn', 'Sáng', 7000000.00, 'Đang làm'),
(16, 'Nguyen Van F', '0906677889', '321 Đường PQR, Quận 11, TP.HCM', 'Nhân viên bếp', 'Chiều', 8000000.00, 'Đang làm'),
(17, 'Le Thi G', '0907788990', '654 Đường STU, Quận 4, TP.HCM', 'Quản lý chuỗi cửa hàng', 'Sáng', 15000000.00, 'Đang làm'),
(18, 'Pham Thi H', '0908899001', '987 Đường VWX, Quận 6, TP.HCM', 'Nhân viên nhận đơn', 'Tối', 7000000.00, 'Đang làm'),
(19, 'Hoang Van I', '0909900112', '456 Đường YZA, Quận 2, TP.HCM', 'Nhân viên bếp', 'Sáng', 8000000.00, 'Đang làm'),
(20, 'Tran Van J', '0910011223', '678 Đường BCD, Quận 8, TP.HCM', 'Nhân viên nhận đơn', 'Chiều', 7000000.00, 'Đang làm');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `ingredient_id` int(11) NOT NULL,
  `ingredient_name` varchar(255) NOT NULL,
  `ingredient_unit` varchar(50) DEFAULT NULL,
  `ingredient_quantity_in_stock` decimal(10,2) DEFAULT NULL,
  `ingredient_cost` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`ingredient_id`, `ingredient_name`, `ingredient_unit`, `ingredient_quantity_in_stock`, `ingredient_cost`) VALUES
(1, 'Bột mì', 'kg', 50.00, 25000.00),
(2, 'Phô mai', 'kg', 30.00, 150000.00),
(3, 'Cà chua', 'kg', 40.00, 20000.00),
(4, 'Thịt bò', 'kg', 60.00, 250000.00),
(5, 'Rau sống', 'kg', 50.00, 15000.00),
(6, 'Bánh mì', 'cái', 100.00, 5000.00),
(7, 'Gạo', 'kg', 200.00, 15000.00),
(8, 'Thịt heo', 'kg', 80.00, 180000.00),
(9, 'Hành lá', 'kg', 40.00, 10000.00),
(10, 'Sườn', 'kg', 70.00, 200000.00),
(11, 'Thịt gà', 'kg', 50.00, 170000.00),
(12, 'Trứng gà', 'quả', 150.00, 5000.00),
(13, 'Rau xanh', 'kg', 60.00, 15000.00),
(14, 'Nước cốt dừa', 'lit', 40.00, 50000.00),
(15, 'Tôm', 'kg', 30.00, 220000.00),
(16, 'Bánh tráng', 'kg', 60.00, 10000.00),
(17, 'Cá hồi', 'kg', 40.00, 350000.00),
(18, 'Rong biển', 'kg', 20.00, 150000.00),
(19, 'Thịt xông khói', 'kg', 25.00, 220000.00),
(20, 'Bơ', 'kg', 50.00, 45000.00);

-- --------------------------------------------------------

--
-- Table structure for table `menuitems`
--

CREATE TABLE `menuitems` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_category` varchar(255) DEFAULT NULL,
  `item_price` decimal(10,2) NOT NULL,
  `item_status` varchar(50) DEFAULT 'Còn',
  `item_preparation` text DEFAULT NULL,
  `item_image` varchar(255) DEFAULT NULL,
  `item_ingredient_quantity` text DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menuitems`
--

INSERT INTO `menuitems` (`item_id`, `item_name`, `item_category`, `item_price`, `item_status`, `item_preparation`, `item_image`, `item_ingredient_quantity`, `employee_id`) VALUES
(1, 'Burger Bò', 'Burger', 45000.00, 'Còn', 'Nướng thịt bò, kèm sốt', 'burgerbo.png', 'Bánh mì, thịt bò, rau sống', 2),
(2, 'Mì Ý Sốt Kem', 'Mì Ý', 25000.00, 'Còn', 'Nấu mì với sốt kem', 'miysotkem.png', 'Mì Ý, trứng, thịt xông khói', 3),
(3, 'Gà Rán', 'Gà', 30000.00, 'Còn', 'Chiên giòn gà', 'garan.png', 'Thịt gà, bột chiên, dầu ăn', 6),
(4, 'Khoai tây chiên (M)', 'Đồ chiên', 25000.00, 'Còn', 'Cắt khoai tây thành sợi và chiên giòn', 'khoaitaychien.png', 'Khoai tây, bột phô mai', 15),
(5, 'Kem Sữa Tươi', 'Tráng miệng', 10000.00, 'Còn', 'Làm từ sữa tươi', 'kemsuatuoi.png', 'Sữa tươi', 15),
(7, 'Burger Heo', 'Burger', 45000.00, 'Còn', 'Nướng thịt heo, kèm sốt', 'burgerheo.png', 'Bánh mì, thịt heo, rau sống', 2),
(8, 'Gà Rán Sốt Bơ', 'Gà', 33000.00, 'Còn', 'Chiên giòn gà, sốt bơ', 'garansotbo.png', 'Thịt gà, bột chiên, bơ, dầu ăn', 6),
(9, 'Coca-cola', 'Đồ uống', 18000.00, 'Còn', 'Coca-cola', 'cocacola.png', 'Coca-cola', 16),
(10, 'Pepsi', 'Đồ uống', 18000.00, 'Còn', 'Pepsi', 'pepsi.png', 'Pepsi', 16),
(11, 'Khoai tây chiên (L)', 'Đồ chiên', 30000.00, 'Còn', 'Cắt khoai tây thành sợi và chiên giòn', 'khoaitaychien.png', 'Khoai tây, bột phô mai', 15),
(12, 'Sprite', 'Đồ uống', 18000.00, 'Còn', 'Sprite', 'sprite.png', 'Sprite', 16);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `order_detail_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_quantity` int(11) NOT NULL,
  `item_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`order_detail_id`, `order_id`, `item_id`, `item_quantity`, `item_price`) VALUES
(101, NULL, NULL, 2, 120000.00),
(102, NULL, NULL, 1, 95000.00),
(103, NULL, NULL, 1, 90000.00),
(104, NULL, NULL, 2, 35000.00),
(105, NULL, NULL, 3, 75000.00),
(106, NULL, NULL, 1, 65000.00),
(107, NULL, NULL, 1, 150000.00),
(108, NULL, NULL, 1, 55000.00),
(109, NULL, NULL, 1, 50000.00),
(110, NULL, NULL, 1, 60000.00),
(111, NULL, NULL, 1, 30000.00),
(112, NULL, NULL, 2, 60000.00),
(113, NULL, NULL, 2, 50000.00),
(114, NULL, NULL, 1, 45000.00),
(115, NULL, NULL, 2, 30000.00),
(116, NULL, NULL, 2, 45000.00),
(117, NULL, NULL, 1, 50000.00),
(118, NULL, NULL, 2, 40000.00),
(119, NULL, NULL, 2, 25000.00),
(120, NULL, NULL, 1, 35000.00);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_date` datetime NOT NULL,
  `order_status` varchar(50) DEFAULT 'Đã đặt',
  `order_total_amount` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `delivery_address` text DEFAULT NULL,
  `recipient_name` varchar(255) DEFAULT NULL,
  `recipient_phone` varchar(20) DEFAULT NULL,
  `order_notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`, `order_status`, `order_total_amount`, `payment_method`, `delivery_address`, `recipient_name`, `recipient_phone`, `order_notes`) VALUES
(1, 1, '2023-09-10 12:30:00', 'Đã đặt', 350000.00, 'Tiền mặt', '123 Đường ABC, Quận 1, TP.HCM', 'Nguyen Van A', '0901123456', 'Giao nhanh'),
(2, 2, '2023-09-11 14:00:00', 'Đã đặt', 200000.00, 'Chuyển khoản', '456 Đường DEF, Quận 3, TP.HCM', 'Tran Thi B', '0902345678', ''),
(3, 3, '2023-09-12 15:00:00', 'Đã đặt', 250000.00, 'Tiền mặt', '789 Đường GHI, Quận 5, TP.HCM', 'Le Van C', '0903344455', ''),
(4, 4, '2023-09-13 13:45:00', 'Đã đặt', 150000.00, 'Tiền mặt', '101 Đường JKL, Quận 7, TP.HCM', 'Pham Thi D', '0904455566', ''),
(5, 5, '2023-09-14 11:30:00', 'Đã đặt', 180000.00, 'Chuyển khoản', '121 Đường MNO, Quận 9, TP.HCM', 'Hoang Van E', '0905566778', 'Không hành'),
(6, 6, '2023-09-15 16:30:00', 'Đã đặt', 60000.00, 'Tiền mặt', '321 Đường PQR, Quận 11, TP.HCM', 'Nguyen Thi F', '0906677889', ''),
(7, 7, '2023-09-16 12:00:00', 'Đã đặt', 95000.00, 'Chuyển khoản', '654 Đường STU, Quận 4, TP.HCM', 'Tran Van G', '0907788990', ''),
(8, 8, '2023-09-17 10:00:00', 'Đã đặt', 50000.00, 'Tiền mặt', '987 Đường VWX, Quận 6, TP.HCM', 'Le Thi H', '0908899001', ''),
(9, 9, '2023-09-18 13:00:00', 'Đã đặt', 75000.00, 'Chuyển khoản', '456 Đường YZA, Quận 2, TP.HCM', 'Pham Van I', '0909900112', 'Giao nhanh'),
(10, 10, '2023-09-19 14:30:00', 'Đã đặt', 120000.00, 'Tiền mặt', '678 Đường BCD, Quận 8, TP.HCM', 'Hoang Thi J', '0910011223', ''),
(11, 11, '2023-09-20 15:45:00', 'Đã đặt', 350000.00, 'Chuyển khoản', '123 Đường ABC, Quận 1, TP.HCM', 'Nguyen Van K', '0911122334', ''),
(12, 12, '2023-09-21 12:15:00', 'Đã đặt', 200000.00, 'Tiền mặt', '456 Đường DEF, Quận 3, TP.HCM', 'Tran Thi L', '0912233445', 'Không hành'),
(13, 13, '2023-09-22 14:30:00', 'Đã đặt', 250000.00, 'Chuyển khoản', '789 Đường GHI, Quận 5, TP.HCM', 'Le Van M', '0913344556', ''),
(14, 14, '2023-09-23 16:00:00', 'Đã đặt', 180000.00, 'Tiền mặt', '101 Đường JKL, Quận 7, TP.HCM', 'Pham Thi N', '0914455667', ''),
(15, 15, '2023-09-24 10:45:00', 'Đã đặt', 150000.00, 'Chuyển khoản', '121 Đường MNO, Quận 9, TP.HCM', 'Hoang Van O', '0915566778', 'Không hành'),
(16, 16, '2023-09-25 12:00:00', 'Đã đặt', 300000.00, 'Tiền mặt', '321 Đường PQR, Quận 11, TP.HCM', 'Nguyen Thi P', '0916677889', ''),
(17, 17, '2023-09-26 11:15:00', 'Đã đặt', 95000.00, 'Chuyển khoản', '654 Đường STU, Quận 4, TP.HCM', 'Tran Van Q', '0917788990', ''),
(18, 18, '2023-09-27 14:30:00', 'Đã đặt', 50000.00, 'Tiền mặt', '987 Đường VWX, Quận 6, TP.HCM', 'Le Thi R', '0918899001', ''),
(19, 19, '2023-09-28 16:00:00', 'Đã đặt', 75000.00, 'Chuyển khoản', '456 Đường YZA, Quận 2, TP.HCM', 'Pham Van S', '0919900112', ''),
(20, 20, '2023-09-29 13:45:00', 'Đã đặt', 120000.00, 'Tiền mặt', '678 Đường BCD, Quận 8, TP.HCM', 'Hoang Thi T', '0920011223', 'Giao nhanh');

-- --------------------------------------------------------

--
-- Table structure for table `partyorders`
--

CREATE TABLE `partyorders` (
  `party_order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `party_date` date NOT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `deposit_amount` decimal(10,2) DEFAULT NULL,
  `party_status` varchar(50) DEFAULT 'Đã đặt'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `partyorders`
--

INSERT INTO `partyorders` (`party_order_id`, `customer_id`, `store_id`, `party_date`, `total_amount`, `deposit_amount`, `party_status`) VALUES
(1, NULL, NULL, '2023-09-30', 5000000.00, 1000000.00, 'Đã đặt'),
(2, NULL, NULL, '2023-10-01', 7000000.00, 2000000.00, 'Đã đặt'),
(3, NULL, NULL, '2023-10-05', 6000000.00, 1500000.00, 'Đã đặt'),
(4, NULL, NULL, '2023-10-10', 8000000.00, 2500000.00, 'Đã đặt'),
(5, NULL, NULL, '2023-10-15', 9000000.00, 3000000.00, 'Đã đặt'),
(6, NULL, NULL, '2023-10-20', 10000000.00, 3500000.00, 'Đã đặt'),
(7, NULL, NULL, '2023-10-25', 11000000.00, 4000000.00, 'Đã đặt'),
(8, NULL, NULL, '2023-10-30', 12000000.00, 4500000.00, 'Đã đặt'),
(9, NULL, NULL, '2023-11-05', 13000000.00, 5000000.00, 'Đã đặt'),
(10, NULL, NULL, '2023-11-10', 14000000.00, 5500000.00, 'Đã đặt');

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `promotion_id` int(11) NOT NULL,
  `promotion_name` varchar(255) DEFAULT NULL,
  `discount_percentage` decimal(5,2) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `promotion_status` varchar(50) DEFAULT 'Đang áp dụng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promotions`
--

INSERT INTO `promotions` (`promotion_id`, `promotion_name`, `discount_percentage`, `start_date`, `end_date`, `description`, `promotion_status`) VALUES
(1, 'Khuyến mãi mùa hè', 10.00, '2023-06-01', '2023-08-31', 'Giảm giá 10% cho tất cả đơn hàng', 'Sắp áp dụng'),
(2, 'Giảm giá cuối tuần', 15.00, '2023-09-01', '2023-09-30', 'Giảm 15% cho đơn hàng từ 200,000 VND', 'Đang áp dụng'),
(3, 'Giáng sinh an lành', 20.00, '2023-12-01', '2023-12-25', 'Giảm 20% cho đơn hàng từ 500,000 VND', 'Sắp áp dụng'),
(4, 'Tết Nguyên Đán', 25.00, '2024-01-15', '2024-02-15', 'Giảm 25% cho tất cả các món tráng miệng', 'Sắp áp dụng'),
(5, 'Ngày Phụ nữ Việt Nam', 10.00, '2023-10-20', '2023-10-20', 'Giảm giá 10% cho tất cả đơn hàng', 'Sắp áp dụng'),
(6, 'Mừng sinh nhật Đom Đóm', 15.00, '2023-11-01', '2023-11-10', 'Giảm 15% cho mọi đơn hàng', 'Đang áp dụng'),
(7, 'Flash sale', 30.00, '2023-09-05', '2023-09-07', 'Giảm 30% trong 3 ngày duy nhất', 'Ngừng áp dụng'),
(8, 'Black Friday', 50.00, '2023-11-24', '2023-11-24', 'Giảm 50% cho tất cả sản phẩm', 'Sắp áp dụng'),
(9, 'Cyber Monday', 40.00, '2023-11-27', '2023-11-27', 'Giảm 40% cho tất cả đơn hàng online', 'Sắp áp dụng'),
(10, 'Khuyến mãi VIP', 20.00, '2023-09-01', '2023-09-30', 'Giảm giá 20% cho khách hàng VIP', 'Đang áp dụng');

-- --------------------------------------------------------

--
-- Table structure for table `revenuereports`
--

CREATE TABLE `revenuereports` (
  `report_id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `report_date` date NOT NULL,
  `total_revenue` decimal(10,2) DEFAULT NULL,
  `total_cost` decimal(10,2) DEFAULT NULL,
  `total_profit` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `revenuereports`
--

INSERT INTO `revenuereports` (`report_id`, `store_id`, `report_date`, `total_revenue`, `total_cost`, `total_profit`) VALUES
(31, NULL, '2023-09-10', 5000000.00, 3000000.00, 2000000.00),
(32, NULL, '2023-09-11', 4000000.00, 2500000.00, 1500000.00),
(33, NULL, '2023-09-12', 4500000.00, 2700000.00, 1800000.00),
(34, NULL, '2023-09-13', 6000000.00, 3500000.00, 2500000.00),
(35, NULL, '2023-09-14', 7000000.00, 4000000.00, 3000000.00),
(36, NULL, '2023-09-15', 8000000.00, 4500000.00, 3500000.00),
(37, NULL, '2023-09-16', 7500000.00, 4300000.00, 3200000.00),
(38, NULL, '2023-09-17', 6500000.00, 3800000.00, 2700000.00),
(39, NULL, '2023-09-18', 7000000.00, 4000000.00, 3000000.00),
(40, NULL, '2023-09-19', 8500000.00, 5000000.00, 3500000.00);

-- --------------------------------------------------------

--
-- Table structure for table `shiftregistration`
--

CREATE TABLE `shiftregistration` (
  `shift_registration_id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `shift_date` date NOT NULL,
  `shift_time` varchar(50) DEFAULT NULL,
  `shift_status` varchar(50) DEFAULT 'Đã xác nhận'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shiftregistration`
--

INSERT INTO `shiftregistration` (`shift_registration_id`, `employee_id`, `shift_date`, `shift_time`, `shift_status`) VALUES
(1, 1, '2023-09-10', 'Sáng', 'Đã xác nhận'),
(2, 2, '2023-09-10', 'Chiều', 'Đã xác nhận'),
(3, 3, '2023-09-11', 'Sáng', 'Đã xác nhận'),
(4, 4, '2023-09-11', 'Tối', 'Đã xác nhận'),
(5, 5, '2023-09-12', 'Sáng', 'Đã xác nhận'),
(6, 6, '2023-09-12', 'Chiều', 'Đã xác nhận'),
(7, 7, '2023-09-13', 'Sáng', 'Đã xác nhận'),
(8, 8, '2023-09-13', 'Tối', 'Đã xác nhận'),
(9, 9, '2023-09-14', 'Sáng', 'Đã xác nhận'),
(10, 10, '2023-09-14', 'Chiều', 'Đã xác nhận');

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `store_id` int(11) NOT NULL,
  `store_name` varchar(255) NOT NULL,
  `store_address` text DEFAULT NULL,
  `store_status` varchar(50) DEFAULT 'Đang kinh doanh',
  `store_manager_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`store_id`, `store_name`, `store_address`, `store_status`, `store_manager_id`) VALUES
(41, 'Đom Đóm Quận 1', '123 Đường ABC, Quận 1, TP.HCM', 'Đang kinh doanh', 3),
(42, 'Đom Đóm Quận 3', '456 Đường DEF, Quận 3, TP.HCM', 'Đang kinh doanh', 3),
(43, 'Đom Đóm Quận 5', '789 Đường GHI, Quận 5, TP.HCM', 'Đang kinh doanh', 3),
(44, 'Đom Đóm Quận 7', '101 Đường JKL, Quận 7, TP.HCM', 'Đang kinh doanh', 3),
(45, 'Đom Đóm Quận 9', '121 Đường MNO, Quận 9, TP.HCM', 'Tạm đóng cửa', 3),
(46, 'Đom Đóm Quận 11', '321 Đường PQR, Quận 11, TP.HCM', 'Đang kinh doanh', 3),
(47, 'Đom Đóm Quận 4', '654 Đường STU, Quận 4, TP.HCM', 'Ngừng kinh doanh', 3),
(48, 'Đom Đóm Quận 6', '987 Đường VWX, Quận 6, TP.HCM', 'Đang kinh doanh', 3),
(49, 'Đom Đóm Quận 2', '456 Đường YZA, Quận 2, TP.HCM', 'Đang kinh doanh', 3),
(50, 'Đom Đóm Quận 8', '678 Đường BCD, Quận 8, TP.HCM', 'Đang kinh doanh', 3),
(51, 'Đom Đóm Quận 1', '123 Đường ABC, Quận 1, TP.HCM', 'Đang kinh doanh', 3),
(52, 'Đom Đóm Quận 3', '456 Đường DEF, Quận 3, TP.HCM', 'Đang kinh doanh', 3),
(53, 'Đom Đóm Quận 5', '789 Đường GHI, Quận 5, TP.HCM', 'Đang kinh doanh', 3),
(54, 'Đom Đóm Quận 7', '101 Đường JKL, Quận 7, TP.HCM', 'Đang kinh doanh', 3),
(55, 'Đom Đóm Quận 9', '121 Đường MNO, Quận 9, TP.HCM', 'Tạm đóng cửa', 3),
(56, 'Đom Đóm Quận 11', '321 Đường PQR, Quận 11, TP.HCM', 'Đang kinh doanh', 3),
(57, 'Đom Đóm Quận 4', '654 Đường STU, Quận 4, TP.HCM', 'Ngừng kinh doanh', 3),
(58, 'Đom Đóm Quận 6', '987 Đường VWX, Quận 6, TP.HCM', 'Đang kinh doanh', 3),
(59, 'Đom Đóm Quận 2', '456 Đường YZA, Quận 2, TP.HCM', 'Đang kinh doanh', 3),
(60, 'Đom Đóm Quận 8', '678 Đường BCD, Quận 8, TP.HCM', 'Đang kinh doanh', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`ingredient_id`);

--
-- Indexes for table `menuitems`
--
ALTER TABLE `menuitems`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`order_detail_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `partyorders`
--
ALTER TABLE `partyorders`
  ADD PRIMARY KEY (`party_order_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`promotion_id`);

--
-- Indexes for table `revenuereports`
--
ALTER TABLE `revenuereports`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `shiftregistration`
--
ALTER TABLE `shiftregistration`
  ADD PRIMARY KEY (`shift_registration_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`store_id`),
  ADD KEY `store_manager_id` (`store_manager_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `ingredient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `menuitems`
--
ALTER TABLE `menuitems`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `partyorders`
--
ALTER TABLE `partyorders`
  MODIFY `party_order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `promotion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `revenuereports`
--
ALTER TABLE `revenuereports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `shiftregistration`
--
ALTER TABLE `shiftregistration`
  MODIFY `shift_registration_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);

--
-- Constraints for table `menuitems`
--
ALTER TABLE `menuitems`
  ADD CONSTRAINT `menuitems_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `menuitems` (`item_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `partyorders`
--
ALTER TABLE `partyorders`
  ADD CONSTRAINT `partyorders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `partyorders_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`);

--
-- Constraints for table `revenuereports`
--
ALTER TABLE `revenuereports`
  ADD CONSTRAINT `revenuereports_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`);

--
-- Constraints for table `shiftregistration`
--
ALTER TABLE `shiftregistration`
  ADD CONSTRAINT `shiftregistration_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);

--
-- Constraints for table `stores`
--
ALTER TABLE `stores`
  ADD CONSTRAINT `stores_ibfk_1` FOREIGN KEY (`store_manager_id`) REFERENCES `employees` (`employee_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
