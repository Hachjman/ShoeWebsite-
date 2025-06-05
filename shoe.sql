-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2025 at 04:03 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shoe`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(50) DEFAULT 'staff',
  `fullname` varchar(100) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `email`, `role`, `fullname`, `role_id`, `status`, `created_at`) VALUES
(1, 'admin', '1', 'admin@gmail.com', 'admin', 'Super_admin', 1, 'active', '2025-04-24 10:22:54'),
(2, '123', '1', 'caophongtc1988@gmail.com', 'admin', 'Norml_admin', 1, 'active', '2025-04-26 07:00:28'),
(3, 'admin123', '1', '1@gmail.com', 'admin', 'Normal_admin', 1, 'active', '2025-04-26 07:04:15'),
(5, 'Tuong123', '1', 'tuongtrotc333@gmail.com', 'staff', 'Staff', 2, 'active', '2025-04-26 08:00:14'),
(6, 'Tuong1234', '1', 'kukala278@gmail.com', 'staff', 'Staff', 3, 'active', '2025-05-18 09:49:04');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `user_id`, `product_id`, `size_id`, `quantity`) VALUES
(1, 1, 49, 94, 1),
(2, 1, 48, 93, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`) VALUES
(1, 'Giày thể thao', 'Các loại giày dành cho hoạt động thể thao', '2025-04-24 10:22:54'),
(2, 'Giày casual', 'Giày thời trang thường ngày', '2025-04-24 10:22:54'),
(3, 'Giày chạy bộ', 'Giày chuyên dụng cho chạy bộ', '2025-04-24 10:22:54'),
(4, 'Giày bóng đá', 'Giày dành cho môn bóng đá', '2025-04-24 10:22:54');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `discount_percent` int(11) NOT NULL DEFAULT 0,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `discount_percent`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 'PPP65', 20, '0000-00-00', '2025-06-08', 'inactive', '2025-06-04 14:57:19', '2025-06-05 13:41:11'),
(2, 'Hachjman', 15, '0000-00-00', '2025-06-14', 'active', '2025-06-05 06:34:35', '2025-06-05 06:34:35'),
(3, 'Haruuu', 5, '0000-00-00', '2025-06-10', 'active', '2025-06-05 13:40:56', '2025-06-05 13:41:07');

-- --------------------------------------------------------

--
-- Table structure for table `email_verifications`
--

CREATE TABLE `email_verifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `verification_code` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `expires_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `sender_role` enum('user','admin') NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `receiver_role` enum('user','admin') NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `sender_id`, `sender_role`, `receiver_id`, `receiver_role`, `message`, `created_at`, `image`) VALUES
(1, 1, 'user', 1, 'admin', 'xin chào', '2025-05-16 12:44:35', NULL),
(2, 1, 'admin', 1, 'user', 'cháo bạn', '2025-05-16 12:49:43', NULL),
(3, 1, 'admin', 1, 'user', 'bạn cần gì ạ', '2025-05-16 12:58:02', NULL),
(4, 1, 'admin', 1, 'user', 'sv', '2025-05-16 13:01:56', NULL),
(5, 1, 'user', 1, 'admin', 'asd', '2025-05-16 13:03:42', 'uploads/chat/chatimg_6826d53ea47fc.jpg'),
(6, 1, 'admin', 1, 'user', 'bạn cần gì ạ', '2025-05-16 13:11:31', NULL),
(7, 1, 'admin', 1, 'user', 'asd', '2025-05-16 14:09:34', 'uploads/chat/chatimg_6826e4ae4fd05.jpg'),
(8, 1, 'user', 1, 'admin', 'asd', '2025-05-16 15:35:20', NULL),
(9, 1, 'user', 1, 'admin', 'asd', '2025-05-16 15:36:41', 'uploads/chat/chatimg_6826f919843e8.jpg'),
(10, 1, 'admin', 1, 'user', 'asd', '2025-05-16 15:39:09', 'uploads/chat/chatimg_6826f9ad72900.jpg'),
(11, 1, 'admin', 1, 'user', 'asdasdasdasd', '2025-05-16 15:39:27', 'uploads/chat/chatimg_6826f9bfe876c.jpg'),
(12, 1, 'admin', 1, 'user', '', '2025-05-16 15:43:08', 'uploads/chat/chatimg_6826fa9c62028.jpg'),
(13, 1, 'admin', 1, 'user', 'https://www.bing.com/images/search?view=detailV2&ccid=5yNcgb%2fV&id=8190560628B6BF4606B8509769A5EFD378B3499C&thid=OIP.5yNcgb_V44HGbp0A6Xh9iQHaHa&mediaurl=https%3a%2f%2f2.bp.blogspot.com%2f-f6WKVS7-ri0%2fWMeY50UMbNI%2fAAAAAAAABK8%2f7kT2o1tj6e43kt_7tnhr4MMLFSX0yWhRgCLcB%2fs1600%2fgiay-the-thao-cho-nam.jpg&cdnurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.e7235c81bfd5e381c66e9d00e9787d89%3frik%3dnEmzeNPvpWmXUA%26pid%3dImgRaw%26r%3d0&exph=960&expw=960&q=gi%c3%a0y&simid=607995202143061690&FORM=IRPRST&ck=AE8664727913D4B99AB6D750F4C5BC71&selectedIndex=4&itb=0', '2025-05-16 15:43:54', NULL),
(14, 1, 'user', 1, 'admin', '', '2025-05-16 15:46:53', 'uploads/chat/chatimg_6826fb7daccc6.jpg'),
(15, 1, 'admin', 1, 'user', 'asd', '2025-05-16 16:01:25', NULL),
(16, 1, 'admin', 1, 'user', '', '2025-05-16 16:12:05', 'uploads/chat/chatimg_682701650fa81.jpg'),
(17, 1, 'admin', 1, 'user', '', '2025-05-16 16:14:13', 'uploads/chat/chatimg_682701e5d0184.jpg'),
(18, 1, 'user', 1, 'admin', 'shiba', '2025-05-18 13:43:46', NULL),
(19, 1, 'user', 1, 'admin', '', '2025-05-18 13:43:55', 'uploads/chat/chatimg_682981ab2abbb.jpg'),
(20, 1, 'admin', 1, 'user', 'huhaishdasd', '2025-05-18 14:47:44', NULL),
(21, 1, 'admin', 1, 'user', 'ai o si` ma`', '2025-05-18 21:40:50', NULL),
(22, 1, 'admin', 1, 'user', '', '2025-05-18 21:41:16', 'uploads/chat/chatimg_6829f18c7af92.jpg'),
(23, 1, 'user', 1, 'admin', 'ai o si` ma`', '2025-05-18 21:41:35', NULL),
(24, 1, 'admin', 1, 'user', '123123', '2025-05-18 21:43:34', NULL),
(25, 1, 'admin', 1, 'user', '12312343542365246', '2025-05-18 21:43:41', NULL),
(26, 10, 'user', 1, 'admin', '123', '2025-06-05 13:37:11', NULL),
(27, 1, 'user', 1, 'admin', 'asdasd', '2025-06-05 21:00:53', NULL),
(28, 1, 'user', 1, 'admin', 'qweqwe', '2025-06-05 21:01:37', NULL),
(29, 1, 'admin', 1, 'user', '', '2025-06-05 21:01:56', 'uploads/chat/chatimg_6841a3542069e.jpg'),
(30, 1, 'admin', 1, 'user', '213', '2025-06-05 21:01:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('pending','processing','shipped','delivered','cancelled') NOT NULL DEFAULT 'pending',
  `shipping_address` text NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_method` varchar(50) DEFAULT 'cod',
  `coupon_id` int(11) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_amount`, `status`, `shipping_address`, `phone`, `created_at`, `payment_method`, `coupon_id`, `discount_amount`) VALUES
(13, 1, 300000.00, 'delivered', 'ewewe', '', '2025-05-09 00:40:28', 'cod', NULL, 0.00),
(14, 1, 350000.00, 'shipped', 'ewewe', '', '2025-05-09 00:40:42', 'cod', NULL, 0.00),
(15, 1, 250000.00, 'delivered', 'ewewe', '', '2025-05-09 00:40:52', 'cod', NULL, 0.00),
(16, 1, 200000.00, 'processing', 'ewewe', '', '2025-05-09 00:45:38', 'cod', NULL, 0.00),
(17, 1, 200000.00, 'delivered', 'ewewe', '', '2025-05-09 02:13:49', 'cod', NULL, 0.00),
(18, 1, 10000.00, 'pending', 'ewewe', '', '2025-05-16 04:33:55', 'bank', NULL, 0.00),
(19, 1, 2500000.00, 'pending', 'ewewe', NULL, '2025-06-04 13:42:55', 'bank', NULL, 0.00),
(20, 1, 500000.00, 'pending', 'ewewe', NULL, '2025-06-04 13:57:24', 'bank', NULL, 0.00),
(21, 1, 480000.00, 'pending', 'ewewe', NULL, '2025-06-04 14:59:02', 'cod', 1, 120000.00),
(22, 1, 2080000.00, 'pending', 'ewewe', NULL, '2025-06-04 14:59:29', 'bank', 1, 520000.00),
(23, 9, 500000.00, 'pending', 'Ao Đôi', NULL, '2025-06-05 04:54:29', 'bank', NULL, 0.00),
(24, 9, 500000.00, 'pending', 'Ao Đôi', NULL, '2025-06-05 05:52:56', 'bank', NULL, 0.00),
(25, 9, 600000.00, 'pending', 'Ao Đôi', NULL, '2025-06-05 05:59:07', 'cod', NULL, 0.00),
(26, 1, 2000000.00, 'pending', 'ewewe', NULL, '2025-06-05 06:07:05', 'cod', 1, 500000.00),
(27, 9, 255000.00, 'pending', 'Ao Đôi', NULL, '2025-06-05 07:49:21', 'bank', 2, 45000.00),
(28, 9, 425000.00, 'pending', 'Ao Đôi', NULL, '2025-06-05 07:49:44', 'cod', 2, 75000.00),
(29, 9, 170000.00, 'pending', 'Ao Đôi', NULL, '2025-06-05 07:51:40', 'cod', 2, 30000.00),
(30, 1, 7600000.00, 'pending', 'ewewe', NULL, '2025-06-05 08:25:21', 'bank', 1, 1900000.00),
(31, 9, 3060000.00, 'delivered', 'Ao Đôi', NULL, '2025-06-05 13:08:26', 'bank', 2, 540000.00),
(32, 1, 935000.00, 'pending', 'ewewe', NULL, '2025-06-05 13:38:29', 'bank', 2, 165000.00),
(33, 1, 2090000.00, 'pending', 'ewewe', NULL, '2025-06-05 13:42:40', 'bank', 3, 110000.00),
(34, 1, 2232500.00, 'pending', 'ewewe', NULL, '2025-06-05 13:45:54', 'bank', 3, 117500.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size` varchar(10) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `size`, `quantity`, `price`) VALUES
(7, 13, 5, '42', 1, 300000.00),
(8, 14, 6, '40', 1, 350000.00),
(9, 15, 7, '40', 1, 250000.00),
(10, 16, 3, '40', 1, 200000.00),
(11, 17, 2, 'EU 37', 1, 200000.00),
(12, 18, 12, '42', 1, 10000.00),
(13, 19, 23, '39', 1, 2500000.00),
(14, 20, 21, '30', 1, 500000.00),
(15, 21, 22, '23', 1, 600000.00),
(16, 22, 23, '45', 1, 2600000.00),
(17, 23, 22, '30', 1, 500000.00),
(18, 24, 22, '30', 1, 500000.00),
(19, 25, 22, '23', 1, 600000.00),
(20, 26, 23, '39', 1, 2500000.00),
(21, 27, 5, '42', 1, 300000.00),
(22, 28, 21, '30', 1, 500000.00),
(23, 29, 23, '32', 1, 200000.00),
(24, 30, 19, '40', 1, 9500000.00),
(25, 31, 35, '43.5', 1, 3600000.00),
(26, 32, 27, '41', 1, 1100000.00),
(27, 33, 50, '43', 1, 2200000.00),
(28, 34, 49, '43', 1, 2350000.00);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `description`) VALUES
(1, 'manage_products', 'Quản lý sản phẩm'),
(2, 'manage_categories', 'Quản lý danh mục'),
(3, 'manage_orders', 'Quản lý đơn hàng'),
(4, 'manage_users', 'Quản lý người dùng'),
(5, 'manage_admins', 'Quản lý admin'),
(6, 'view_reports', 'Xem báo cáo');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `sale_percent` int(11) DEFAULT 0,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `image` varchar(255) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `brand` varchar(100) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `condition` enum('new','2hand','used') DEFAULT 'new',
  `is_sale` tinyint(1) DEFAULT 0,
  `sale_price` decimal(10,2) DEFAULT NULL,
  `is_best_seller` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `sale_percent`, `status`, `image`, `category_id`, `created_at`, `brand`, `color`, `condition`, `is_sale`, `sale_price`, `is_best_seller`) VALUES
(2, 'Adidas Ultraboost', 'Giày thể thao Adidas với đệm Boost', 3000000.00, 0, 'active', 'uploads/products/6840777ed36f1.jpg', 1, '2025-04-24 10:22:54', NULL, NULL, 'new', 0, NULL, 0),
(3, 'Walking on the Sunshine', 'Thích hợp cho chạy bộ leo núi', 420000.00, 0, 'active', 'uploads/products/68407766c2875.jpg', 3, '2025-04-25 01:28:13', NULL, NULL, 'new', 0, NULL, 0),
(5, 'Air Force One', 'Nike', 310000.00, 10, 'active', 'uploads/products/6840773ae3ca7.jpg', 2, '2025-04-26 07:35:34', NULL, NULL, 'new', 0, NULL, 0),
(6, 'Nike X Dior', 'Thiết kê đôc đáo kết hợp với Dior toát lên vẻ hoàng gia', 2000000.00, 0, 'active', 'uploads/products/681dad0c643fd.jpg', 2, '2025-04-26 07:35:56', NULL, NULL, 'new', 0, NULL, 0),
(7, 'Super Star x TranFormer', 'Thích hợp cho thể thao và chạy bộ', 750000.00, 10, 'active', 'uploads/products/684076d5119c7.jpg', 1, '2025-04-26 07:36:23', NULL, NULL, 'new', 0, NULL, 0),
(8, 'Nike Kyrie 6', 'Màu sắc chủ đạo là trong suốt kết hợp với đế giày màu nâu gỗ, cùng các chi tiết đen ở cổ giày và logo \"Kyrie\" trên lưỡi gà. Dây giày trắng in chữ \"Just Do It\" mang phong cách đặc trưng của Nike. Đế ngoài có độ bám cao, phù hợp cho các hoạt động thể thao, đặc biệt là bóng rổ, với đệm êm ái hỗ trợ chuyển động linh hoạt.', 3000000.00, 10, 'active', 'uploads/products/6840768b2e0e5.jpg', 1, '2025-04-26 07:36:46', NULL, NULL, 'new', 0, NULL, 0),
(12, 'Nike LeBron 13', 'Đôi giày trong ảnh là của Nike, thuộc dòng LeBron. Dựa trên thiết kế và màu sắc đỏ nổi bật, đây có thể là mẫu Nike LeBron 13. Tên đầy đủ có thể là \"Nike LeBron 13\" hoặc một biến thể như \"Nike LeBron 13 Red/Black/White\" tùy thuộc vào phối màu cụ thể. Đặc điểm nổi bật bao gồm đế Air Max, logo Swoosh, và phần upper có cấu trúc dạng lưới với các chi tiết phản quang. Để xác định chính xác, bạn nên kiểm tra nhãn hiệu hoặc số serial trên lưỡi gà hoặc bên trong giày.', 1000000.00, 0, 'active', 'uploads/products/6840766555791.jpg', 1, '2025-05-09 00:47:40', NULL, NULL, 'new', 0, NULL, 0),
(13, 'Vans Hight End Form', 'Vans of the Wall', 800000.00, 20, 'active', 'uploads/products/68407639bde99.jpg', 2, '2025-05-09 01:10:45', NULL, NULL, 'new', 0, NULL, 0),
(14, 'Addidas Origin X Super Star', 'Addidas', 350000.00, 0, 'active', 'uploads/products/68407602b41d0.jpg', 2, '2025-05-15 09:14:21', NULL, NULL, 'new', 0, NULL, 0),
(18, 'Addidas Yellow Warm', 'Addidas', 450000.00, 0, 'active', 'uploads/products/684075cc7d44d.jpg', 2, '2025-05-18 08:05:52', NULL, NULL, 'new', 0, NULL, 0),
(19, 'Lightning Stars', 'Đi bộ rất êm chân', 7000000.00, 0, 'active', 'uploads/products/684075a060b24.jpg', 2, '2025-05-18 08:06:56', NULL, NULL, 'new', 0, NULL, 0),
(20, 'Nike Vandal High Supreme', 'Đôi giày trong ảnh là của Nike, với thiết kế cao cổ và các lỗ thoáng khí đặc trưng. Đây có thể là mẫu Nike Vandal High Supreme, một biến thể của dòng Vandal. Tên đầy đủ có thể là \"Nike Vandal High Supreme\" hoặc một phiên bản cụ thể dựa trên màu trắng chủ đạo. Để xác định chính xác, bạn nên kiểm tra nhãn hiệu hoặc số serial trên lưỡi gà hoặc bên trong giày.', 800000.00, 0, 'active', 'uploads/products/6840717257326.jpg', 2, '2025-05-18 08:08:07', NULL, NULL, 'new', 0, NULL, 0),
(21, 'Vans Blue Sky', 'Van of the wall', 6000000.00, 0, 'active', 'uploads/products/68407792c6734.jpg', 2, '2025-05-18 08:09:04', NULL, NULL, 'new', 0, NULL, 0),
(22, 'National Geographic Sneaker', 'Đôi giày trong ảnh có logo \"National Geographic\" và thiết kế retro, với phối màu xanh dương, trắng và đế màu kem. Đây có thể là mẫu giày thuộc dòng hợp tác giữa National Geographic và một thương hiệu giày, nhưng không có đủ thông tin để xác định chính xác thương hiệu gốc. Dựa trên kiểu dáng, nó trông giống một biến thể của giày thể thao cổ thấp phong cách thập niên 80-90, có thể là từ Nike hoặc một thương hiệu tương tự. Tên cụ thể có thể là \"National Geographic x [Thương hiệu] Collaboration Sneaker\". Để biết chính xác, bạn nên kiểm tra nhãn hiệu hoặc số serial trên lưỡi gà hoặc bên trong giày.', 200000.00, 0, 'active', 'uploads/products/6840755675090.jpg', 3, '2025-05-18 08:09:10', NULL, NULL, 'new', 0, NULL, 0),
(23, 'Vans Coblab Caros', 'đây là đôi vans được colab với với King and Queen', 1500000.00, 30, 'active', 'uploads/products/6829960404b36.jpg', 2, '2025-05-18 08:10:44', NULL, NULL, 'new', 0, NULL, 0),
(24, 'Nike Dunk', 'From Nike', 700000.00, 0, 'active', 'uploads/products/68415599886fd.jpg', 1, '2025-06-05 08:30:17', NULL, NULL, 'new', 0, NULL, 0),
(25, 'Nike Mercurial Vapor 16 Academy Kylian Mbappe Grand Purple/Pale Ivory - FQ8384-500', 'Nike tiếp tục tôn vinh Kylian Mbappé với phiên bản signature mới nhất thuộc dòng Mercurial Superfly/Vapor. Khoác lên mình sắc tím hoàng gia “Grand Purple” kết hợp với màu kem nhã nhặn “Pale Ivory”, đôi giày mang vẻ ngoài mạnh mẽ, tinh tế và đậm chất Mbappé.\r\nPhần lót giày thiết kế riêng với logo cá nhân hóa và hình ảnh những ngôi sao lấp lánh – tượng trưng cho tiềm năng vô hạn cùng khát vọng không ngừng vươn cao của ngôi sao Real Madrid.\r\nĐiểm đặc biệt nhất của phiên bản này chính là cách Nike lồng ghép những dấu ấn trong hành trình sự nghiệp của Mbappé:\r\n\r\n Tia chớp “Rosa” 2020: Biểu tượng tốc độ và khả năng bứt phá không ai theo kịp.\r\n  Ngọn lửa “Flames” 2021: Đam mê và tinh thần thi đấu rực cháy.', 1850000.00, 10, 'active', 'uploads/products/684157fc8b1af.jpeg', 4, '2025-06-05 08:40:28', NULL, NULL, 'new', 0, NULL, 0),
(26, 'Nike Zoom Mercurial Vapor 15 Academy MDS TF', 'Đồng hành cùng bạn trên sân cỏ', 1200000.00, 0, 'active', 'uploads/products/6841597eb4632.jpg', 4, '2025-06-05 08:46:54', NULL, NULL, 'new', 0, NULL, 0),
(27, 'NIKE ZOOM SUPERFLY 9 ACADEMY TF', 'Dành cho các tín đồ đam mê sân cỏ, mẫu giày đá bóng cổ cao với thiết kế màu sắc cực chất, phù hợp cho sân cỏ nhân tạo, giúp bạn tự tin thể hiện kỹ thuật trên sân.\r\n Chất liệu vải co giãn ôm chân, đế TF bám sân, hỗ trợ di chuyển linh hoạt và tăng độ bền.\r\nThích hợp cho cả tập luyện và thi đấu.', 1000000.00, 0, 'active', 'uploads/products/684159fa6a6de.jpg', 4, '2025-06-05 08:48:58', NULL, NULL, 'new', 0, NULL, 0),
(28, 'NIKE ZOOM SUPERFLY 8 ACADEMY TF', 'Dành cho các tín đồ đam mê sân cỏ, mẫu giày đá bóng cổ cao với thiết kế màu sắc cực chất, phù hợp cho sân cỏ nhân tạo, giúp bạn tự tin thể hiện kỹ thuật trên sân.\r\nChất liệu vải co giãn ôm chân, đế TF bám sân, hỗ trợ di chuyển linh hoạt và tăng độ bền.\r\nThích hợp cho cả tập luyện và thi đấu.', 900000.00, 5, 'active', 'uploads/products/68415a70b58a6.jpg', 4, '2025-06-05 08:50:56', NULL, NULL, 'new', 0, NULL, 0),
(29, 'NIKE ZOOM SUPERFLY 7 ACADEMY TF', 'GIÀY ĐÁ BANH CỔ CAO SÂN CỎ NHÂN TẠO\r\nDành cho các tín đồ đam mê sân cỏ, mẫu giày đá bóng cổ cao với thiết kế màu sắc cực chất, phù hợp cho sân cỏ nhân tạo, giúp bạn tự tin thể hiện kỹ thuật trên sân.', 1200000.00, 7, 'active', 'uploads/products/68415ac26ada1.jpg', 4, '2025-06-05 08:52:18', NULL, NULL, 'new', 0, NULL, 0),
(30, 'NIKE ZOOM SUPERFLY 6 ACADEMY TF', 'Chất liệu vải co giãn ôm chân, đế TF bám sân, hỗ trợ di chuyển linh hoạt và tăng độ bền.\r\n Thích hợp cho cả tập luyện và thi đấu.', 700000.00, 10, 'active', 'uploads/products/68415b00ddcf1.jpg', 4, '2025-06-05 08:53:21', NULL, NULL, 'new', 0, NULL, 0),
(31, 'F50 Messi Elite FG', 'Phối màu không thể bỏ qua phiên bản dành riêng cho M10', 8000000.00, 10, 'active', 'uploads/products/684168e38b884.jpg', 4, '2025-06-05 09:52:35', NULL, NULL, 'new', 0, NULL, 0),
(32, 'Zoom Vapor 15 Academy TF', 'Giày siêu nhẹ, thiết kế cho tốc độ, upper Flyknit ôm chân, đế TF bám sân cỏ nhân tạo tốt, màu hồng gradient nổi bật', 2100000.00, 10, 'active', 'uploads/products/68416950867a9.jpg', 4, '2025-06-05 09:54:24', NULL, NULL, 'new', 0, NULL, 0),
(33, 'Adidas X Crazyfast .3 TF Marine Rush', 'Đế TF tối ưu cho sân cỏ nhân tạo, chất liệu da tổng hợp, hỗ trợ kiểm soát bóng, được nhiều cầu thủ nổi tiếng sử dụng', 3000000.00, 30, 'active', 'uploads/products/684169bfd980d.jpg', 4, '2025-06-05 09:56:15', NULL, NULL, 'new', 0, NULL, 0),
(34, 'Mizuno Morelia Neo IV Pro AS', 'Kết hợp cổ điển và hiện đại, đệm Enerzy êm ái, đế TF bám sân, phù hợp chân bè, da mềm, bền', 2100000.00, 12, 'active', 'uploads/products/68416a3e4a6e1.jpg', 4, '2025-06-05 09:58:22', NULL, NULL, 'new', 0, NULL, 0),
(35, 'Nike LeBron 21', 'Nike LeBron 21 là bản nâng cấp từ LeBron 20, nổi bật với hệ thống đệm êm ái, độ bám vượt trội, phù hợp cho sân trong và ngoài trời. Phần upper sử dụng chất liệu nhẹ, thoáng khí, ôm chân, hỗ trợ các động tác linh hoạt. Đế giữa tích hợp công nghệ Zoom Air, tăng độ phản hồi và hấp thụ lực, giúp cầu thủ bật nhảy mạnh mẽ. Thiết kế cá tính, màu sắc đa dạng, mang phong cách bùng nổ. Giày lý tưởng cho vị trí tiền đạo mạnh mẽ nhờ độ ổn định và bảo vệ cổ chân. LeBron James, ngôi sao Los Angeles Lakers, đã mang đôi giày này trong các trận NBA, thể hiện phong cách chơi toàn diện, tốc độ và sức mạnh. Giày mang thông điệp gia đình với tên các thành viên nhà James được mã hóa trên thiết kế.', 3500000.00, 3, 'active', 'uploads/products/68416adc4509b.jpg', 1, '2025-06-05 10:01:00', NULL, NULL, 'new', 0, NULL, 0),
(36, 'Under Armour Curry 10 Bang Bang', 'Under Armour Curry 10 Bang Bang là lựa chọn hoàn hảo cho lối chơi nhanh, linh hoạt. Giày có trọng lượng nhẹ (12 Oz), upper đan lưới thoáng khí, gót da lộn sang trọng. Hệ thống dây buộc co giãn, đế TPE chống sốc, tăng khả năng vận động. Thiết kế tối ưu cho các động tác kỹ thuật cao, đặc biệt phù hợp với hậu vệ. Stephen Curry, siêu sao Golden State Warriors, sử dụng mẫu giày này trong các trận đấu NBA, tận dụng độ bám và sự thoải mái để thực hiện những cú ném ba điểm chính xác. Màu sắc nổi bật, phong cách hiện đại, giày phản ánh phong cách chơi bùng nổ của Curry.', 8900000.00, 10, 'active', 'uploads/products/68416b9359ed6.jpg', 1, '2025-06-05 10:04:03', NULL, NULL, 'new', 0, NULL, 0),
(37, 'Anta KT 7', 'Anta KT 7 là giày chữ ký của Klay Thompson, nhà vô địch NBA 2022. Giày sở hữu hệ thống đệm bọt nitơ tiên tiến, êm ái, ổn định, phù hợp cho tiền đạo và trung phong. Upper ôm chân, đế ngoài bám đa bề mặt, hỗ trợ các pha di chuyển nhanh. Thiết kế hiện đại, màu sắc năng động, giày mang lại độ bền và hiệu suất cao. Thompson đã mang đôi này trong các trận đấu NBA, tận dụng đệm êm để thực hiện các cú ném xa và phòng thủ mạnh mẽ. Giày phù hợp cho cầu thủ có lối chơi linh hoạt, cần sự cân bằng giữa tốc độ và sức mạnh.', 4000000.00, 0, 'active', 'uploads/products/68416bfa1c8c8.jpg', 1, '2025-06-05 10:05:46', NULL, NULL, 'new', 0, NULL, 0),
(38, 'New Balance TWO WXY V4', 'New Balance TWO WXY V4 là mẫu giày hiệu năng cao, phù hợp cho tiền đạo mạnh mẽ. Đệm FuelCell mang lại độ hoàn năng lượng tối ưu, hỗ trợ bật nhảy và di chuyển linh hoạt. Upper cải tiến, thoáng khí, ôm chân, đế ngoài bám tốt trên mọi bề mặt. Thiết kế tinh tế, màu sắc thời thượng, giày được tối ưu cho lối chơi bùng nổ. Kawhi Leonard, ngôi sao Los Angeles Clippers, đã mang mẫu giày này trong các trận NBA, tận dụng độ ổn định và đệm êm để thực hiện các pha tấn công và phòng thủ mạnh mẽ. Giày là lựa chọn lý tưởng cho người mới chơi nhờ sự thoải mái và hỗ trợ vượt trội.', 5000000.00, 0, 'active', 'uploads/products/68416c82c9df9.jpg', 1, '2025-06-05 10:08:02', NULL, NULL, 'new', 0, NULL, 0),
(39, 'Nike ZoomX Vaporfly Next% 2', 'Giày chạy bộ đỉnh cao, thiết kế cho tốc độ với đế ZoomX siêu nhẹ, êm, phản hồi năng lượng tối ưu. Tấm carbon ở đế giữa tăng lực đẩy, hỗ trợ phá kỷ lục. Upper Flyknit thoáng khí, ôm chân, đế ngoài cao su bám tốt trên đường nhựa. Phù hợp cho marathon hoặc thi đấu. Eliud Kipchoge, huyền thoại marathon, đã mang phiên bản Alphafly NEXT% (tiền thân) phá kỷ lục thế giới tại Berlin 2018. Giày lý tưởng cho vận động viên muốn tối ưu tốc độ và hiệu suất, dù giá khá cao.', 4000000.00, 0, 'active', 'uploads/products/68416ee892053.jpg', 3, '2025-06-05 10:18:16', NULL, NULL, 'new', 0, NULL, 0),
(40, 'Fila Ray Tracer', 'Fila Ray Tracer là một dòng giày sneaker mang phong cách retro, nổi bật với thiết kế chunky và đế giày dày đặc trưng của xu hướng thời trang thập niên 90. Đôi giày thường có phối màu đa dạng, với các tông màu cơ bản như trắng, đỏ, đen, và xám, kết hợp giữa chất liệu da lộn và lưới thoáng khí. Điểm nhấn bao gồm logo Fila lớn trên thân giày, dây giày có sọc nổi, và đế ngoài cao su bền bỉ với lớp đệm êm ái. Đây là mẫu giày thời trang, phù hợp cho cả phong cách đường phố và hoạt động hàng ngày.', 2000000.00, 0, 'active', 'uploads/products/684197b40c10b.jpg', 2, '2025-06-05 13:12:20', NULL, NULL, 'new', 0, NULL, 0),
(41, 'Adidas Campus ADV Blue', 'Đôi giày Adidas Campus ADV trong ảnh có thiết kế mang phong cách cổ điển với phần upper làm từ chất liệu da tổng hợp và da lộn, chủ đạo là màu đen kết hợp với các điểm nhấn xanh dương và xám. Đế giày màu trắng kem, tạo sự tương phản, với đường viền xanh dương chạy dọc quanh thân giày. Dòng chữ \"Adidas\" xuất hiện trên lưỡi gà và bên hông giày, đặc trưng với ba sọc dọc nổi bật. Đây là mẫu giày phù hợp cho phong cách đường phố, mang lại cảm giác thoải mái và bền bỉ cho các hoạt động hàng ngày.', 1500000.00, 0, 'active', 'uploads/products/684198064a37b.jpg', 2, '2025-06-05 13:13:42', NULL, NULL, 'new', 0, NULL, 0),
(42, 'Nike Vandal 1', 'một mẫu sneaker kinh điển với thiết kế thấp, đế giày dày, và phối màu trắng-đen đặc trưng. Logo Nike Swoosh xuất hiện nổi bật trên thân giày, cùng với phần upper làm từ da và đế cao su bền bỉ. Để xác định chính xác hơn, bạn có thể kiểm tra nhãn hiệu hoặc số serial trên lưỡi gà hoặc bên trong giày.', 3000000.00, 0, 'inactive', 'uploads/products/684198523e2b0.jpg', 2, '2025-06-05 13:14:58', NULL, NULL, 'new', 0, NULL, 0),
(43, 'Nike Air Max 90 White', 'Đôi giày trong ảnh là của Nike, với thiết kế đặc trưng của dòng Air Max. Đây có thể là mẫu Nike Air Max 90 hoặc một biến thể như \"Nike Air Max 90 White/Black\". Tên đầy đủ phụ thuộc vào phối màu và phiên bản cụ thể, nhưng đặc điểm như đế Air Max vàng và logo Swoosh lớn là dấu hiệu nhận diện. Để xác định chính xác, bạn nên kiểm tra nhãn hiệu hoặc số serial trên lưỡi gà hoặc bên trong giày.', 1800000.00, 0, 'active', 'uploads/products/684198d1c7a99.jpg', 2, '2025-06-05 13:17:05', NULL, NULL, 'new', 0, NULL, 0),
(44, 'Adidas Top Ten Low', 'Adidas Top Ten Low trong ảnh có thiết kế thấp cổ, với phần upper làm từ da tổng hợp màu trắng, kết hợp các chi tiết màu xám nhạt và xanh lá cây trên đế ngoài. Ba sọc của Adidas chạy dọc thân giày, tạo điểm nhấn nổi bật. Đế giày màu kem, mang phong cách retro, phù hợp cho cả thời trang đường phố và hoạt động thể thao nhẹ. Logo Adidas được in trên đế và gót giày, cùng với một biểu tượng hình ngôi sao trên phần gót, tăng tính nhận diện thương hiệu. Đôi giày này mang lại cảm giác thoải mái, bền bỉ và phong cách cổ điển.', 2000000.00, 0, 'active', 'uploads/products/68419a34615d6.jpg', 2, '2025-06-05 13:23:00', NULL, NULL, 'new', 0, NULL, 0),
(45, 'Adidas Forum Low', 'Đây là một đôi giày thể thao cổ điển với thiết kế đặc trưng của Adidas, bao gồm ba sọc màu xanh dương, logo Adidas ở bên hông và phần đế màu cam. Giày có dây buộc và một dây đai dán ở phần trên. Phần đế giày có màu be và có logo Adidas in nổi.', 1500000.00, 15, 'active', 'uploads/products/68419ac9bfe87.jpg', 2, '2025-06-05 13:25:29', NULL, NULL, 'new', 0, NULL, 0),
(46, 'Nike Airmax', 'Đôi giày có màu xanh dương, vàng, trắng và đen, với logo Nike màu vàng nổi bật ở bên. Giày có dây buộc màu xanh dương, đế giữa màu trắng và đế ngoài màu đen. Thiết kế trẻ trung, phù hợp để mang thường ngày hoặc chơi thể thao.', 2000000.00, 15, 'active', 'uploads/products/68419b1f7154d.jpg', 3, '2025-06-05 13:26:55', NULL, NULL, 'new', 0, NULL, 0),
(47, 'Nike Kyrie 6.', 'Đôi giày có màu trắng chủ đạo với các chi tiết xanh dương và đỏ, cùng logo Nike màu xanh dương ở cổ giày. Đế giày có màu vàng nhạt và xanh dương với thiết kế đặc trưng của dòng Kyrie. Lưỡi gà có logo Kyrie màu đỏ.', 2500000.00, 10, 'active', 'uploads/products/68419b95b5b05.jpg', 1, '2025-06-05 13:28:54', NULL, NULL, 'new', 0, NULL, 0),
(48, 'Adidas Adizero Takumi Ren,', 'Đôi giày trong ảnh là Adidas Adizero Takumi Ren, một dòng giày chạy bộ cao cấp với thiết kế gọn nhẹ, phù hợp cho những vận động viên muốn tối ưu tốc độ trên đường đua. Giày có màu đen chủ đạo, kết hợp với ba sọc trắng đặc trưng của Adidas và các chi tiết đỏ nổi bật, tạo điểm nhấn về phong cách. Với phần lót màu đỏ cùng thân giày streamline, mẫu giày này mang lại cảm giác thoải mái và linh hoạt khi di chuyển, đồng thời áp dụng công nghệ hiện đại giúp cải thiện hiệu suất chạy bộ trên cự ly ngắn và trung bình. Nếu bạn đang tìm kiếm một đôi giày tốc độ, đây có thể là một lựa chọn đáng cân nhắc.', 1500000.00, 0, 'active', 'uploads/products/68419bc66a56e.jpg', 3, '2025-06-05 13:29:42', NULL, NULL, 'new', 0, NULL, 0),
(49, 'Adidas Crazy Explosive', 'Đây là Adidas Crazy Explosive, một mẫu giày bóng rổ với thiết kế cổ cao giúp bảo vệ mắt cá chân, màu xanh đậm kết hợp với chi tiết hồng nổi bật trên logo và đế ngoài, phần thân có lỗ thoáng khí tăng sự thoải mái, công nghệ đệm ADIPRENE+ hỗ trợ độ đàn hồi và giảm tác động khi chơi bóng rổ.', 2350000.00, 0, 'active', 'uploads/products/68419c9e09a78.jpg', 1, '2025-06-05 13:33:18', NULL, NULL, 'new', 0, NULL, 0),
(50, 'Jodan1 BLue Sky', 'Đây là một đôi giày tuyệt vời', 2000000.00, 13, 'active', 'uploads/products/68419e31df4fe.jpg', 1, '2025-06-05 13:40:01', NULL, NULL, 'new', 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_sizes`
--

CREATE TABLE `product_sizes` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size` varchar(10) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `stock` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_sizes`
--

INSERT INTO `product_sizes` (`id`, `product_id`, `size`, `price`, `stock`, `created_at`, `updated_at`) VALUES
(12, 2, 'EU 36', 200000.00, 10, '2025-04-24 10:22:54', '2025-05-08 11:16:02'),
(13, 2, 'EU 37', 200000.00, 14, '2025-04-24 10:22:54', '2025-05-09 03:34:36'),
(14, 2, 'EU 38', 200000.00, 20, '2025-04-24 10:22:54', '2025-05-08 11:16:02'),
(15, 2, 'EU 39', 200000.00, 15, '2025-04-24 10:22:54', '2025-05-08 11:16:02'),
(16, 2, 'EU 40', 200000.00, 10, '2025-04-24 10:22:54', '2025-05-08 11:16:02'),
(17, 2, 'EU 41', 200000.00, 5, '2025-04-24 10:22:54', '2025-05-08 11:16:02'),
(18, 3, '40', 200000.00, 2, '2025-04-25 01:28:13', '2025-06-04 16:42:18'),
(20, 5, '40', 400000.00, 1, '2025-04-26 07:35:34', '2025-05-08 11:15:51'),
(21, 5, '41', 450000.00, 2, '2025-04-26 07:35:34', '2025-05-08 11:15:51'),
(22, 5, '42', 300000.00, 2, '2025-04-26 07:35:34', '2025-06-05 07:49:21'),
(23, 6, '40', 350000.00, 3, '2025-04-26 07:35:56', '2025-05-08 11:15:51'),
(24, 7, '40', 250000.00, 1, '2025-04-26 07:36:23', '2025-06-04 16:39:49'),
(25, 8, '40', 3000000.00, 5, '2025-04-26 07:36:46', '2025-06-05 13:18:03'),
(28, 12, '42', 10000.00, 1, '2025-05-09 00:47:40', '2025-05-16 04:33:55'),
(29, 13, '40', 400000.00, 4, '2025-05-09 01:10:45', '2025-05-09 01:10:45'),
(30, 14, '40', 12414.00, 2, '2025-05-15 09:14:21', '2025-05-15 09:14:21'),
(31, 18, '34', 20000000.00, 5, '2025-05-18 08:05:52', '2025-05-18 08:05:52'),
(32, 18, '36', 2300000.00, 6, '2025-05-18 08:05:52', '2025-05-18 08:05:52'),
(33, 18, '25', 2200000.00, 5, '2025-05-18 08:05:52', '2025-05-18 08:05:52'),
(34, 19, '40', 9500000.00, 3, '2025-05-18 08:06:57', '2025-06-05 08:25:21'),
(35, 19, '43', 1000000.00, 2, '2025-05-18 08:06:57', '2025-05-18 08:06:57'),
(36, 20, '43', 1200000.00, 5, '2025-05-18 08:08:07', '2025-05-18 08:08:07'),
(37, 20, '44', 1500000.00, 2, '2025-05-18 08:08:07', '2025-05-18 08:08:07'),
(38, 21, '30', 500000.00, 3, '2025-05-18 08:09:05', '2025-06-05 07:49:44'),
(39, 21, '23', 600000.00, 2, '2025-05-18 08:09:05', '2025-05-18 08:09:05'),
(40, 22, '30', 500000.00, 3, '2025-05-18 08:09:10', '2025-06-05 05:52:57'),
(41, 22, '23', 600000.00, 4, '2025-05-18 08:09:10', '2025-06-05 08:30:28'),
(42, 23, '39', 2500000.00, 0, '2025-05-18 08:10:44', '2025-06-05 06:07:06'),
(43, 23, '45', 2600000.00, 2, '2025-05-18 08:10:44', '2025-06-05 05:25:40'),
(44, 23, '32', 200000.00, 1, '2025-06-05 05:24:59', '2025-06-05 07:51:40'),
(45, 24, '34', 710000.00, 3, '2025-06-05 08:30:17', '2025-06-05 08:30:17'),
(46, 25, '35', 1650000.00, 3, '2025-06-05 08:40:29', '2025-06-05 08:40:29'),
(47, 25, '40', 1750000.00, 4, '2025-06-05 08:40:29', '2025-06-05 08:40:29'),
(48, 26, '41', 1200000.00, 2, '2025-06-05 08:46:55', '2025-06-05 08:46:55'),
(49, 27, '40', 1000000.00, 3, '2025-06-05 08:48:58', '2025-06-05 08:48:58'),
(50, 27, '41', 1100000.00, 2, '2025-06-05 08:48:58', '2025-06-05 13:38:29'),
(51, 27, '42.5', 1200000.00, 2, '2025-06-05 08:48:58', '2025-06-05 08:48:58'),
(52, 28, '41', 1000000.00, 5, '2025-06-05 08:50:57', '2025-06-05 08:50:57'),
(53, 28, '44', 1100000.00, 2, '2025-06-05 08:50:57', '2025-06-05 08:50:57'),
(54, 28, '43', 1500000.00, 2, '2025-06-05 08:50:57', '2025-06-05 08:50:57'),
(55, 29, '41', 1250000.00, 3, '2025-06-05 08:52:18', '2025-06-05 08:52:18'),
(56, 29, '43', 1400000.00, 2, '2025-06-05 08:52:19', '2025-06-05 08:52:19'),
(57, 30, '41', 600000.00, 3, '2025-06-05 08:53:21', '2025-06-05 08:53:21'),
(58, 30, '32', 400000.00, 3, '2025-06-05 08:53:21', '2025-06-05 08:53:21'),
(59, 31, '41', 8000000.00, 2, '2025-06-05 09:52:36', '2025-06-05 09:52:36'),
(60, 31, '42.5', 8200000.00, 3, '2025-06-05 09:52:36', '2025-06-05 09:52:36'),
(61, 32, '31', 2000000.00, 3, '2025-06-05 09:54:25', '2025-06-05 09:54:25'),
(62, 32, '41', 2100000.00, 2, '2025-06-05 09:54:25', '2025-06-05 09:54:25'),
(63, 33, '39', 2900000.00, 3, '2025-06-05 09:56:16', '2025-06-05 09:56:16'),
(64, 33, '42', 3100000.00, 2, '2025-06-05 09:56:16', '2025-06-05 09:56:16'),
(65, 33, '42.5', 3125000.00, 3, '2025-06-05 09:56:16', '2025-06-05 09:56:16'),
(66, 34, '43', 2300000.00, 2, '2025-06-05 09:58:22', '2025-06-05 09:58:22'),
(67, 34, '43.5', 2350000.00, 2, '2025-06-05 09:58:22', '2025-06-05 09:58:22'),
(68, 34, '44', 2000000.00, 1, '2025-06-05 09:58:22', '2025-06-05 09:58:22'),
(69, 35, '44', 3510000.00, 2, '2025-06-05 10:01:00', '2025-06-05 10:01:00'),
(70, 35, '43.5', 3600000.00, 1, '2025-06-05 10:01:00', '2025-06-05 13:41:31'),
(71, 35, '42', 3200000.00, 3, '2025-06-05 10:01:00', '2025-06-05 10:01:00'),
(72, 36, '42', 9000000.00, 3, '2025-06-05 10:04:03', '2025-06-05 10:04:03'),
(73, 36, '42.5', 9100000.00, 2, '2025-06-05 10:04:03', '2025-06-05 10:04:03'),
(74, 36, '39', 8500000.00, 4, '2025-06-05 10:04:04', '2025-06-05 10:04:04'),
(75, 37, '34', 3200000.00, 2, '2025-06-05 10:05:46', '2025-06-05 10:05:46'),
(76, 37, '42', 3600000.00, 3, '2025-06-05 10:05:46', '2025-06-05 10:05:46'),
(77, 37, '44', 4000000.00, 5, '2025-06-05 10:05:46', '2025-06-05 10:05:46'),
(78, 38, '43', 5000000.00, 5, '2025-06-05 10:08:03', '2025-06-05 10:08:03'),
(79, 38, '43.5', 5210000.00, 5, '2025-06-05 10:08:03', '2025-06-05 10:08:03'),
(80, 38, '34', 300000.00, 2, '2025-06-05 10:08:03', '2025-06-05 10:08:03'),
(81, 39, '43', 4000000.00, 4, '2025-06-05 10:18:17', '2025-06-05 10:18:17'),
(82, 39, '34', 2300000.00, 2, '2025-06-05 10:18:17', '2025-06-05 10:18:17'),
(83, 40, '40', 200000.00, 2, '2025-06-05 13:12:20', '2025-06-05 13:12:20'),
(84, 41, '40 ', 1500000.00, 2, '2025-06-05 13:13:42', '2025-06-05 13:13:42'),
(85, 42, '40', 3000000.00, 3, '2025-06-05 13:14:58', '2025-06-05 13:14:58'),
(86, 43, '43', 1800000.00, 2, '2025-06-05 13:17:06', '2025-06-05 13:17:06'),
(87, 43, '43.5', 1850000.00, 1, '2025-06-05 13:17:06', '2025-06-05 13:17:06'),
(88, 8, '41', 3500000.00, 2, '2025-06-05 13:18:03', '2025-06-05 13:18:03'),
(89, 44, '40.5', 2000000.00, 2, '2025-06-05 13:23:00', '2025-06-05 13:23:00'),
(90, 45, '39', 1500000.00, 2, '2025-06-05 13:25:29', '2025-06-05 13:25:29'),
(91, 46, '41', 1700000.00, 2, '2025-06-05 13:26:55', '2025-06-05 13:26:55'),
(92, 47, '44', 2200000.00, 3, '2025-06-05 13:28:54', '2025-06-05 13:28:54'),
(93, 48, '40', 1500000.00, 3, '2025-06-05 13:29:42', '2025-06-05 13:29:42'),
(94, 49, '43', 2350000.00, 2, '2025-06-05 13:33:18', '2025-06-05 13:45:54'),
(95, 50, '34', 1900000.00, 2, '2025-06-05 13:40:02', '2025-06-05 13:40:02'),
(96, 50, '33', 1850000.00, 2, '2025-06-05 13:40:02', '2025-06-05 13:40:02'),
(97, 50, '41', 2100000.00, 3, '2025-06-05 13:40:02', '2025-06-05 13:40:23'),
(98, 50, '43', 2200000.00, 1, '2025-06-05 13:40:23', '2025-06-05 13:42:40');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`) VALUES
(1, 'super_admin', 'Quản trị viên cao cấp với toàn quyền'),
(2, 'product_manager', 'Quản lý sản phẩm'),
(3, 'order_manager', 'Quản lý đơn hàng'),
(4, 'customer_manager', 'Quản lý khách hàng');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(2, 1),
(2, 2),
(3, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `profile_picture` varchar(255) DEFAULT NULL,
  `two_factor_secret` varchar(32) DEFAULT NULL,
  `two_factor_enabled` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `fullname`, `address`, `phone`, `created_at`, `profile_picture`, `two_factor_secret`, `two_factor_enabled`) VALUES
(1, '1', '123456', 'tuongtrotc333@gmail.com', NULL, 'ewewe', '0326513222', '2025-04-24 10:28:14', NULL, NULL, 0),
(7, '2', '1234567', '1@gmail.com', NULL, 'ăeaea', '0326513222', '2025-04-26 07:22:13', NULL, NULL, 0),
(8, '4', '123456', 'cauamxacon2@gmail.com', NULL, 'Ao Đôi', '0987654321', '2025-05-18 09:46:03', NULL, NULL, 0),
(9, '7', '123456', '7@gmail.com', NULL, 'Ao Đôi', '0987654321', '2025-06-05 04:50:19', NULL, 'D23YYOSKEZXVS7SA', 1),
(10, '8', '123456', '8@gmail.com', NULL, 'Thủ Đức', '0326311252', '2025-06-05 06:36:51', NULL, 'S7K2XYJ6B5UTY2Z6', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_product_size_unique` (`user_id`,`product_id`,`size_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `size_id` (`size_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `email_verifications`
--
ALTER TABLE `email_verifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_size_unique` (`product_id`,`size`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `email_verifications`
--
ALTER TABLE `email_verifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`id`) REFERENCES `messages` (`id`);

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_ibfk_3` FOREIGN KEY (`size_id`) REFERENCES `product_sizes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `email_verifications`
--
ALTER TABLE `email_verifications`
  ADD CONSTRAINT `email_verifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD CONSTRAINT `product_sizes_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD CONSTRAINT `role_permissions_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
