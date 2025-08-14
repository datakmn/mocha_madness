
-- Schema and sample data for mocha_madness demo
CREATE DATABASE IF NOT EXISTS mocha_madness_v3;
USE mocha_madness_v3;

-- Drop tables if they exist to avoid conflicts
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- Create tables
CREATE TABLE customers (
  customer_id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE products (
  product_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  price DECIMAL(8,2) NOT NULL,
  stock INT NOT NULL CHECK (stock >= 0)
) ENGINE=InnoDB;

CREATE TABLE orders (
  order_id INT PRIMARY KEY AUTO_INCREMENT,
  customer_id INT NOT NULL,
  order_date DATETIME NOT NULL,
  CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
) ENGINE=InnoDB;

CREATE TABLE payments (
  payment_id INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT NOT NULL,
  paid_amount DECIMAL(8,2) NOT NULL,
  paid_at DATETIME NOT NULL,
  method VARCHAR(20) NOT NULL,
  CONSTRAINT fk_pay_order FOREIGN KEY (order_id) REFERENCES orders(order_id)
) ENGINE=InnoDB;

CREATE TABLE order_items (
  order_item_id INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  qty INT NOT NULL,
  price DECIMAL(8,2) NOT NULL,
  CONSTRAINT fk_oi_order   FOREIGN KEY (order_id)  REFERENCES orders(order_id),
  CONSTRAINT fk_oi_product FOREIGN KEY (product_id) REFERENCES products(product_id)
) ENGINE=InnoDB;


-- Generated sample data inserts (100 rows per table)
SET FOREIGN_KEY_CHECKS=0;
START TRANSACTION;

-- customers (100 rows)
INSERT INTO `customers` (`customer_id`, `email`) VALUES
(1, 'connercindy@gmail.com'),
(2, 'kimberly28@gmail.com'),
(3, 'robertsderek@yahoo.com'),
(4, 'whitejustin@hotmail.com'),
(5, 'emily60@simpson-scott.biz'),
(6, 'robertdiaz@hernandez.com'),
(7, 'john28@gmail.com'),
(8, 'bonniecarson@mueller-carr.net'),
(9, 'whitneytran@gmail.com'),
(10, 'iking@gmail.com'),
(11, 'stephensonjessica@yahoo.com'),
(12, 'brewergeorge@griffin-moore.com'),
(13, 'michaelrodriguez@dixon.biz'),
(14, 'landrews@yahoo.com'),
(15, 'fcarter@gmail.com'),
(16, 'orobinson@hotmail.com'),
(17, 'shellywalker@gmail.com'),
(18, 'maryestrada@hotmail.com'),
(19, 'shane87@brown-lloyd.net'),
(20, 'teresasmith@miller.com'),
(21, 'bking@freeman-powell.com'),
(22, 'yolanda52@khan.com'),
(23, 'alyssa30@howell.info'),
(24, 'hillalexis@sanchez.com'),
(25, 'denise75@gmail.com'),
(26, 'santiagomariah@morgan-cohen.org'),
(27, 'taylorian@gmail.com'),
(28, 'petersonaaron@yahoo.com'),
(29, 'anthony87@gmail.com'),
(30, 'robert67@yahoo.com'),
(31, 'timothyweber@gmail.com'),
(32, 'amyalvarez@yahoo.com'),
(33, 'blackshirley@williams.biz'),
(34, 'ellen73@gmail.com'),
(35, 'rebecca67@gmail.com'),
(36, 'williamsbrenda@yahoo.com'),
(37, 'jamesnichols@patel.com'),
(38, 'bellsandra@mitchell-pitts.com'),
(39, 'franklinjames@bryant.com'),
(40, 'mccarthymegan@jones.com'),
(41, 'crystalwarren@yahoo.com'),
(42, 'msmith@hotmail.com'),
(43, 'johnsonkristina@hotmail.com'),
(44, 'lfrench@tanner-good.org'),
(45, 'cartereric@hotmail.com'),
(46, 'katherinedavis@cox-evans.com'),
(47, 'currybrian@yahoo.com'),
(48, 'thompsonjohn@hotmail.com'),
(49, 'figueroabecky@davis.com'),
(50, 'cliffordmontgomery@hotmail.com'),
(51, 'bakerloretta@hotmail.com'),
(52, 'heather67@thomas.com'),
(53, 'smithashley@sharp.com'),
(54, 'briankeith@garcia-clark.com'),
(55, 'stephen75@walker.net'),
(56, 'hinesbrian@robinson-cooper.com'),
(57, 'josephholt@yahoo.com'),
(58, 'santiagojacob@yahoo.com'),
(59, 'mariegreen@benson-johnson.com'),
(60, 'jonessophia@gmail.com'),
(61, 'oboyd@hotmail.com'),
(62, 'amandafisher@johnson-alvarado.com'),
(63, 'nchen@wright.com'),
(64, 'pauldavis@hotmail.com'),
(65, 'matthewsstephen@hoover.info'),
(66, 'garrettmiller@gmail.com'),
(67, 'tprince@yahoo.com'),
(68, 'georgewalker@hotmail.com'),
(69, 'amandamorrow@yahoo.com'),
(70, 'ian79@johnson.com'),
(71, 'steven24@parker-brown.org'),
(72, 'brianna42@gmail.com'),
(73, 'xmartinez@summers.com'),
(74, 'wbender@wilson.net'),
(75, 'linda05@yahoo.com'),
(76, 'imaxwell@hotmail.com'),
(77, 'burnswesley@hotmail.com'),
(78, 'dawn42@yahoo.com'),
(79, 'vpatton@patterson.com'),
(80, 'tray@banks.com'),
(81, 'pthomas@gmail.com'),
(82, 'andrewbentley@gmail.com'),
(83, 'phillip46@hotmail.com'),
(84, 'marcus08@hotmail.com'),
(85, 'ihooper@yahoo.com'),
(86, 'ashley32@sutton.biz'),
(87, 'timothy79@yahoo.com'),
(88, 'bowenhelen@scott-galvan.biz'),
(89, 'leslie88@carroll.com'),
(90, 'tamararios@hotmail.com'),
(91, 'hwhite@gmail.com'),
(92, 'penningtondennis@black-morales.com'),
(93, 'banderson@gmail.com'),
(94, 'williamcummings@gmail.com'),
(95, 'ijackson@yahoo.com'),
(96, 'palmerjamie@yahoo.com'),
(97, 'harperdennis@brady.com'),
(98, 'devinsummers@bright-bonilla.org'),
(99, 'ntaylor@gmail.com'),
(100, 'uschwartz@gmail.com');

-- products (100 rows)
INSERT INTO `products` (`product_id`, `name`, `price`, `stock`) VALUES
(1, 'Suddenly', 13.67, 126),
(2, 'Who', 12.11, 52),
(3, 'Ability', 34.84, 114),
(4, 'Throw', 32.06, 58),
(5, 'Employee', 22.39, 70),
(6, 'About', 25.0, 3),
(7, 'Attention', 33.31, 156),
(8, 'Measure', 45.76, 38),
(9, 'Marriage', 5.44, 172),
(10, 'Realize', 22.4, 184),
(11, 'Control', 25.83, 82),
(12, 'Camera', 1.51, 123),
(13, 'Contain', 8.06, 0),
(14, 'Executive', 16.83, 161),
(15, 'Among', 25.73, 41),
(16, 'Whatever', 43.74, 157),
(17, 'Usually', 22.41, 16),
(18, 'Fall', 21.99, 192),
(19, 'School', 38.34, 128),
(20, 'Teacher', 42.72, 84),
(21, 'Page', 34.88, 151),
(22, 'Send', 12.99, 187),
(23, 'Ago', 7.86, 21),
(24, 'Finally', 9.14, 96),
(25, 'Analysis', 44.37, 52),
(26, 'Measure', 12.5, 41),
(27, 'Test', 31.81, 136),
(28, 'Final', 10.35, 169),
(29, 'Military', 45.93, 165),
(30, 'Game', 14.63, 184),
(31, 'Appear', 46.43, 68),
(32, 'Base', 29.04, 142),
(33, 'Dog', 17.66, 39),
(34, 'Throughout', 4.06, 75),
(35, 'Bad', 44.15, 39),
(36, 'Guy', 3.8, 74),
(37, 'Difficult', 43.84, 26),
(38, 'Full', 28.52, 65),
(39, 'Others', 25.78, 31),
(40, 'As', 33.82, 173),
(41, 'Blue', 22.01, 168),
(42, 'Southern', 11.71, 176),
(43, 'Share', 19.42, 121),
(44, 'Community', 47.51, 133),
(45, 'Station', 7.71, 63),
(46, 'Rich', 20.89, 190),
(47, 'Watch', 12.16, 1),
(48, 'Admit', 11.18, 71),
(49, 'Step', 26.11, 150),
(50, 'Police', 34.52, 161),
(51, 'Political', 36.52, 194),
(52, 'Rather', 43.62, 146),
(53, 'Ready', 42.86, 91),
(54, 'Ready', 38.63, 155),
(55, 'Pressure', 28.1, 90),
(56, 'Free', 25.2, 27),
(57, 'Fish', 38.53, 61),
(58, 'Bring', 33.04, 25),
(59, 'Agent', 30.61, 35),
(60, 'Travel', 43.87, 133),
(61, 'Probably', 2.0, 32),
(62, 'Support', 45.8, 122),
(63, 'Arrive', 15.08, 99),
(64, 'Executive', 30.56, 70),
(65, 'Bad', 14.05, 1),
(66, 'Figure', 4.26, 169),
(67, 'Quality', 23.15, 173),
(68, 'Have', 21.14, 10),
(69, 'Stock', 46.56, 190),
(70, 'Evening', 10.31, 82),
(71, 'Particularly', 8.26, 167),
(72, 'Around', 34.59, 77),
(73, 'Country', 41.7, 175),
(74, 'Sell', 17.85, 194),
(75, 'Until', 48.76, 104),
(76, 'Event', 24.6, 3),
(77, 'Girl', 28.53, 146),
(78, 'Happen', 23.08, 99),
(79, 'Anything', 15.92, 103),
(80, 'Security', 46.81, 156),
(81, 'Second', 26.93, 51),
(82, 'Community', 7.71, 156),
(83, 'Such', 5.75, 76),
(84, 'Doctor', 42.26, 103),
(85, 'At', 22.73, 168),
(86, 'Sound', 17.58, 4),
(87, 'Beat', 28.05, 182),
(88, 'Indeed', 28.64, 45),
(89, 'Show', 2.28, 194),
(90, 'Enter', 16.24, 34),
(91, 'Finish', 30.23, 181),
(92, 'Miss', 17.76, 38),
(93, 'Yeah', 31.16, 23),
(94, 'Training', 24.06, 25),
(95, 'Require', 44.37, 174),
(96, 'Each', 28.46, 105),
(97, 'Center', 43.69, 16),
(98, 'Too', 38.11, 181),
(99, 'Tough', 21.15, 122),
(100, 'Box', 33.91, 27);

-- orders (100 rows)
INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`) VALUES
(1, 74, '2025-03-02 20:59:48'),
(2, 99, '2025-06-29 08:05:15'),
(3, 51, '2025-07-22 07:34:30'),
(4, 61, '2025-03-17 19:26:43'),
(5, 91, '2025-05-30 12:06:49'),
(6, 31, '2025-06-23 08:04:20'),
(7, 32, '2025-05-23 06:56:13'),
(8, 16, '2025-05-07 16:35:28'),
(9, 68, '2025-07-17 19:50:33'),
(10, 56, '2025-05-04 05:47:59'),
(11, 21, '2025-06-25 06:32:38'),
(12, 95, '2025-04-28 15:55:58'),
(13, 8, '2025-03-16 07:53:49'),
(14, 30, '2025-02-27 19:20:34'),
(15, 25, '2025-03-13 02:19:54'),
(16, 96, '2025-04-05 03:05:40'),
(17, 70, '2025-06-17 05:06:19'),
(18, 57, '2025-07-15 02:54:45'),
(19, 52, '2025-06-04 14:19:51'),
(20, 54, '2025-02-24 10:41:02'),
(21, 60, '2025-01-06 20:42:56'),
(22, 90, '2025-05-15 22:44:25'),
(23, 67, '2025-06-17 17:42:30'),
(24, 56, '2025-04-24 22:21:11'),
(25, 2, '2025-07-03 07:49:42'),
(26, 24, '2025-07-23 05:36:43'),
(27, 7, '2025-01-21 17:41:16'),
(28, 51, '2025-06-10 18:28:38'),
(29, 71, '2025-03-05 15:24:29'),
(30, 34, '2025-05-15 16:33:43'),
(31, 79, '2025-01-09 05:09:07'),
(32, 47, '2025-02-17 17:01:27'),
(33, 41, '2025-07-13 03:16:36'),
(34, 52, '2025-04-07 17:52:22'),
(35, 60, '2025-01-10 14:57:18'),
(36, 80, '2025-02-03 07:49:59'),
(37, 74, '2025-01-20 04:08:13'),
(38, 12, '2025-04-05 08:24:23'),
(39, 95, '2025-05-17 13:15:37'),
(40, 68, '2025-02-06 03:52:16'),
(41, 3, '2025-07-29 05:06:20'),
(42, 98, '2025-04-14 23:01:58'),
(43, 14, '2025-01-22 10:02:31'),
(44, 54, '2025-07-12 22:27:10'),
(45, 97, '2025-01-04 11:08:30'),
(46, 6, '2025-01-16 04:29:19'),
(47, 46, '2025-04-11 13:30:45'),
(48, 48, '2025-02-08 10:08:09'),
(49, 56, '2025-02-26 11:36:48'),
(50, 18, '2025-07-13 19:06:06'),
(51, 75, '2025-06-02 03:26:29'),
(52, 30, '2025-01-31 03:49:31'),
(53, 50, '2025-05-22 15:50:28'),
(54, 34, '2025-01-06 05:44:43'),
(55, 73, '2025-08-02 14:20:09'),
(56, 90, '2025-07-04 20:38:33'),
(57, 3, '2025-06-24 12:22:10'),
(58, 25, '2025-05-21 21:41:00'),
(59, 47, '2025-04-03 14:45:37'),
(60, 33, '2025-06-12 00:45:41'),
(61, 21, '2025-07-19 10:21:58'),
(62, 72, '2025-01-29 07:30:07'),
(63, 20, '2025-04-17 08:15:30'),
(64, 50, '2025-02-14 04:23:25'),
(65, 93, '2025-04-08 11:33:02'),
(66, 54, '2025-05-07 10:30:49'),
(67, 16, '2025-07-16 15:14:47'),
(68, 99, '2025-05-30 05:00:05'),
(69, 76, '2025-06-23 00:51:44'),
(70, 68, '2025-04-08 03:13:41'),
(71, 2, '2025-02-27 03:36:30'),
(72, 40, '2025-02-14 18:56:33'),
(73, 24, '2025-02-11 22:40:51'),
(74, 2, '2025-08-03 16:39:28'),
(75, 90, '2025-02-08 14:25:05'),
(76, 64, '2025-04-27 08:30:15'),
(77, 45, '2025-03-20 12:37:28'),
(78, 57, '2025-03-20 13:37:46'),
(79, 4, '2025-02-14 18:44:58'),
(80, 40, '2025-05-31 22:53:17'),
(81, 26, '2025-04-06 11:18:54'),
(82, 76, '2025-02-05 07:07:43'),
(83, 55, '2025-04-30 18:53:18'),
(84, 5, '2025-05-20 04:40:38'),
(85, 72, '2025-06-14 01:34:28'),
(86, 96, '2025-06-01 01:40:46'),
(87, 97, '2025-03-26 18:46:29'),
(88, 46, '2025-03-10 18:21:00'),
(89, 87, '2025-02-13 22:14:18'),
(90, 71, '2025-05-04 19:24:57'),
(91, 59, '2025-03-07 02:24:45'),
(92, 94, '2025-04-07 16:29:25'),
(93, 91, '2025-07-21 12:06:35'),
(94, 42, '2025-01-26 14:46:05'),
(95, 78, '2025-01-31 03:12:25'),
(96, 47, '2025-01-24 22:21:26'),
(97, 71, '2025-07-29 17:21:54'),
(98, 90, '2025-07-13 23:07:30'),
(99, 17, '2025-05-04 21:44:28'),
(100, 38, '2025-02-02 04:25:41');

-- payments (100 rows)
INSERT INTO `payments` (`payment_id`, `order_id`, `paid_amount`, `paid_at`, `method`) VALUES
(1, 85, 292.62, '2025-04-24 07:16:24', 'ONLINE'),
(2, 78, 14.32, '2025-02-06 08:44:41', 'CASH'),
(3, 17, 278.96, '2025-08-08 03:08:22', 'CARD'),
(4, 73, 253.75, '2025-04-20 01:24:21', 'ONLINE'),
(5, 6, 327.01, '2025-03-11 19:48:56', 'ONLINE'),
(6, 38, 348.21, '2025-01-10 09:44:07', 'ONLINE'),
(7, 63, 301.37, '2025-04-24 20:46:40', 'ONLINE'),
(8, 81, 318.97, '2025-08-11 22:40:22', 'ONLINE'),
(9, 34, 297.72, '2025-06-15 21:06:36', 'CARD'),
(10, 54, 169.64, '2025-05-29 14:54:46', 'CARD'),
(11, 90, 205.9, '2025-02-16 04:51:50', 'CARD'),
(12, 71, 276.44, '2025-04-18 01:48:45', 'ONLINE'),
(13, 13, 175.3, '2025-02-10 06:59:56', 'CASH'),
(14, 71, 144.01, '2025-04-27 14:29:16', 'ONLINE'),
(15, 99, 74.88, '2025-01-22 18:42:07', 'ONLINE'),
(16, 100, 46.1, '2025-05-09 11:32:57', 'CASH'),
(17, 81, 213.88, '2025-03-01 02:47:53', 'ONLINE'),
(18, 47, 336.65, '2025-05-17 00:25:58', 'ONLINE'),
(19, 53, 449.06, '2025-01-30 20:15:57', 'CASH'),
(20, 71, 84.54, '2025-03-26 11:05:46', 'CASH'),
(21, 10, 184.69, '2025-07-07 16:57:01', 'ONLINE'),
(22, 4, 265.93, '2025-02-16 17:18:45', 'CARD'),
(23, 20, 24.66, '2025-05-11 12:31:06', 'CASH'),
(24, 53, 326.09, '2025-03-09 21:33:47', 'CARD'),
(25, 8, 44.25, '2025-07-26 12:47:58', 'CASH'),
(26, 98, 409.09, '2025-06-20 22:42:18', 'ONLINE'),
(27, 98, 449.5, '2025-06-19 22:36:24', 'CARD'),
(28, 12, 452.4, '2025-02-10 21:22:52', 'CARD'),
(29, 74, 32.88, '2025-06-05 00:54:21', 'CARD'),
(30, 10, 175.04, '2025-03-27 21:42:26', 'CASH'),
(31, 87, 329.71, '2025-06-23 20:39:53', 'CARD'),
(32, 8, 415.19, '2025-02-04 00:51:01', 'CASH'),
(33, 99, 299.69, '2025-03-21 03:27:24', 'CARD'),
(34, 81, 44.64, '2025-06-11 13:42:02', 'ONLINE'),
(35, 47, 430.35, '2025-05-03 14:26:05', 'CASH'),
(36, 69, 236.24, '2025-04-10 15:44:53', 'CARD'),
(37, 33, 206.36, '2025-03-11 14:51:21', 'ONLINE'),
(38, 77, 143.36, '2025-01-03 04:35:25', 'CARD'),
(39, 79, 495.75, '2025-02-19 15:13:50', 'CASH'),
(40, 95, 106.95, '2025-02-15 22:23:42', 'CASH'),
(41, 82, 412.89, '2025-03-16 06:04:19', 'CASH'),
(42, 51, 158.82, '2025-04-11 18:26:44', 'CASH'),
(43, 70, 413.43, '2025-04-12 12:50:26', 'ONLINE'),
(44, 83, 144.1, '2025-07-08 00:35:31', 'ONLINE'),
(45, 2, 254.97, '2025-04-04 16:31:10', 'CASH'),
(46, 54, 8.56, '2025-07-20 01:18:22', 'CARD'),
(47, 65, 290.29, '2025-04-22 15:32:43', 'ONLINE'),
(48, 49, 238.9, '2025-07-24 08:28:57', 'CASH'),
(49, 9, 53.43, '2025-01-24 05:39:12', 'CARD'),
(50, 51, 35.38, '2025-06-18 10:35:07', 'CASH'),
(51, 22, 315.75, '2025-04-06 20:46:45', 'CARD'),
(52, 94, 50.68, '2025-03-15 10:51:10', 'CARD'),
(53, 38, 380.45, '2025-05-11 00:19:20', 'ONLINE'),
(54, 63, 164.65, '2025-03-01 00:23:21', 'CASH'),
(55, 99, 391.6, '2025-06-28 10:36:07', 'ONLINE'),
(56, 88, 90.23, '2025-04-26 04:49:11', 'CASH'),
(57, 67, 167.45, '2025-05-13 19:32:28', 'ONLINE'),
(58, 55, 168.08, '2025-06-23 07:05:02', 'ONLINE'),
(59, 47, 78.59, '2025-06-12 00:13:46', 'CASH'),
(60, 16, 397.83, '2025-03-09 13:13:06', 'CARD'),
(61, 92, 290.11, '2025-03-02 09:46:28', 'CASH'),
(62, 1, 168.01, '2025-06-23 21:09:44', 'ONLINE'),
(63, 63, 139.27, '2025-04-03 03:59:38', 'CARD'),
(64, 30, 22.73, '2025-04-04 18:34:12', 'CASH'),
(65, 24, 352.29, '2025-07-23 00:24:26', 'ONLINE'),
(66, 94, 285.35, '2025-02-03 17:01:31', 'CARD'),
(67, 61, 446.24, '2025-01-19 19:44:34', 'CARD'),
(68, 23, 219.45, '2025-05-16 06:33:16', 'ONLINE'),
(69, 73, 237.49, '2025-02-08 00:45:23', 'CARD'),
(70, 41, 347.6, '2025-02-07 15:04:49', 'CARD'),
(71, 83, 60.86, '2025-06-24 20:43:27', 'ONLINE'),
(72, 5, 270.01, '2025-03-30 14:43:55', 'CARD'),
(73, 38, 85.78, '2025-07-24 13:45:12', 'CARD'),
(74, 65, 380.76, '2025-06-21 08:26:42', 'CASH'),
(75, 31, 453.46, '2025-01-07 04:30:59', 'ONLINE'),
(76, 78, 109.99, '2025-02-24 15:28:26', 'ONLINE'),
(77, 83, 271.28, '2025-03-13 03:34:21', 'CASH'),
(78, 36, 490.8, '2025-03-28 10:09:45', 'CARD'),
(79, 86, 255.09, '2025-05-24 11:38:17', 'ONLINE'),
(80, 52, 33.02, '2025-04-28 22:23:31', 'ONLINE'),
(81, 37, 160.81, '2025-05-26 16:24:10', 'CASH'),
(82, 81, 468.17, '2025-02-12 13:15:28', 'ONLINE'),
(83, 3, 227.52, '2025-05-15 10:09:01', 'CASH'),
(84, 2, 67.74, '2025-05-28 17:44:46', 'CASH'),
(85, 68, 409.12, '2025-04-26 17:05:19', 'CASH'),
(86, 2, 178.01, '2025-03-02 07:20:51', 'ONLINE'),
(87, 15, 497.07, '2025-06-16 12:09:54', 'CARD'),
(88, 30, 255.66, '2025-06-20 20:41:58', 'CASH'),
(89, 30, 437.62, '2025-06-13 08:17:29', 'ONLINE'),
(90, 67, 130.13, '2025-04-15 06:39:37', 'ONLINE'),
(91, 61, 114.31, '2025-03-13 03:54:49', 'ONLINE'),
(92, 25, 71.86, '2025-06-21 22:12:10', 'CASH'),
(93, 90, 96.39, '2025-03-13 13:18:54', 'CARD'),
(94, 53, 425.56, '2025-04-23 00:43:23', 'CASH'),
(95, 27, 48.99, '2025-07-09 12:23:47', 'ONLINE'),
(96, 17, 331.73, '2025-06-02 14:49:34', 'CASH'),
(97, 81, 58.05, '2025-05-28 21:48:48', 'CARD'),
(98, 29, 125.45, '2025-02-24 19:56:31', 'CARD'),
(99, 64, 259.27, '2025-03-20 11:46:08', 'CARD'),
(100, 92, 231.15, '2025-01-16 00:52:01', 'CASH');

-- order_items (100 rows)
INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `qty`, `price`) VALUES
(1.0, 37.0, 54.0, 1.0, 41.6),
(2.0, 95.0, 82.0, 10.0, 37.91),
(3.0, 69.0, 96.0, 9.0, 32.47),
(4.0, 1.0, 90.0, 7.0, 29.95),
(5.0, 71.0, 100.0, 7.0, 39.47),
(6.0, 23.0, 37.0, 8.0, 25.74),
(7.0, 41.0, 28.0, 4.0, 44.09),
(8.0, 90.0, 89.0, 8.0, 9.69),
(9.0, 81.0, 68.0, 5.0, 10.87),
(10.0, 16.0, 76.0, 9.0, 33.38),
(11.0, 55.0, 27.0, 5.0, 44.71),
(12.0, 89.0, 43.0, 9.0, 32.98),
(13.0, 83.0, 21.0, 9.0, 1.77),
(14.0, 25.0, 24.0, 9.0, 48.77),
(15.0, 96.0, 55.0, 7.0, 43.2),
(16.0, 90.0, 61.0, 6.0, 38.33),
(17.0, 40.0, 27.0, 8.0, 27.85),
(18.0, 21.0, 1.0, 1.0, 43.51),
(19.0, 24.0, 12.0, 2.0, 17.92),
(20.0, 97.0, 40.0, 5.0, 5.29),
(21.0, 4.0, 41.0, 7.0, 17.96),
(22.0, 64.0, 7.0, 10.0, 10.04),
(23.0, 13.0, 58.0, 6.0, 34.67),
(24.0, 98.0, 65.0, 6.0, 49.32),
(25.0, 43.0, 83.0, 9.0, 19.76),
(26.0, 97.0, 77.0, 7.0, 9.5),
(27.0, 20.0, 55.0, 7.0, 9.33),
(28.0, 12.0, 46.0, 3.0, 28.75),
(29.0, 33.0, 93.0, 6.0, 45.52),
(30.0, 19.0, 16.0, 3.0, 38.22),
(31.0, 11.0, 12.0, 7.0, 23.28),
(32.0, 55.0, 82.0, 2.0, 44.52),
(33.0, 33.0, 64.0, 10.0, 37.22),
(34.0, 43.0, 13.0, 2.0, 43.57),
(35.0, 20.0, 51.0, 1.0, 35.32),
(36.0, 81.0, 97.0, 5.0, 10.95),
(37.0, 74.0, 97.0, 4.0, 6.46),
(38.0, 11.0, 26.0, 5.0, 7.16),
(39.0, 97.0, 20.0, 9.0, 41.27),
(40.0, 52.0, 81.0, 9.0, 35.69),
(41.0, 72.0, 13.0, 9.0, 30.29),
(42.0, 25.0, 44.0, 8.0, 45.7),
(43.0, 82.0, 92.0, 4.0, 29.53),
(44.0, 79.0, 72.0, 8.0, 34.84),
(45.0, 89.0, 12.0, 10.0, 6.98),
(46.0, 15.0, 73.0, 10.0, 35.66),
(47.0, 35.0, 23.0, 3.0, 26.72),
(48.0, 45.0, 49.0, 2.0, 27.56),
(49.0, 77.0, 60.0, 1.0, 23.91),
(50.0, 52.0, 53.0, 4.0, 37.37),
(51.0, 85.0, 25.0, 9.0, 1.38),
(52.0, 80.0, 69.0, 10.0, 41.68),
(53.0, 17.0, 87.0, 4.0, 11.53),
(54.0, 25.0, 99.0, 2.0, 41.28),
(55.0, 30.0, 16.0, 9.0, 31.9),
(56.0, 23.0, 68.0, 6.0, 22.48),
(57.0, 85.0, 19.0, 5.0, 27.74),
(58.0, 36.0, 28.0, 8.0, 34.36),
(59.0, 2.0, 32.0, 8.0, 6.51),
(60.0, 34.0, 19.0, 10.0, 43.28),
(61.0, 51.0, 81.0, 10.0, 45.69),
(62.0, 73.0, 42.0, 1.0, 48.53),
(63.0, 20.0, 12.0, 9.0, 3.78),
(64.0, 87.0, 79.0, 9.0, 19.86),
(65.0, 95.0, 44.0, 2.0, 4.56),
(66.0, 90.0, 99.0, 4.0, 16.07),
(67.0, 79.0, 62.0, 10.0, 14.23),
(68.0, 21.0, 1.0, 7.0, 13.12),
(69.0, 37.0, 46.0, 5.0, 4.24),
(70.0, 63.0, 33.0, 4.0, 48.82),
(71.0, 83.0, 17.0, 4.0, 46.46),
(72.0, 68.0, 61.0, 7.0, 42.53),
(73.0, 99.0, 15.0, 1.0, 32.54),
(74.0, 20.0, 75.0, 3.0, 18.49),
(75.0, 35.0, 71.0, 1.0, 43.33),
(76.0, 12.0, 90.0, 3.0, 2.24),
(77.0, 91.0, 28.0, 1.0, 47.72),
(78.0, 66.0, 100.0, 9.0, 27.09),
(79.0, 66.0, 96.0, 2.0, 14.11),
(80.0, 5.0, 60.0, 6.0, 49.96),
(81.0, 76.0, 20.0, 6.0, 8.56),
(82.0, 43.0, 57.0, 9.0, 1.87),
(83.0, 5.0, 34.0, 8.0, 44.3),
(84.0, 37.0, 79.0, 8.0, 8.73),
(85.0, 52.0, 88.0, 6.0, 6.07),
(86.0, 12.0, 94.0, 2.0, 44.54),
(87.0, 93.0, 92.0, 4.0, 20.49),
(88.0, 2.0, 76.0, 2.0, 24.67),
(89.0, 97.0, 75.0, 6.0, 36.19),
(90.0, 5.0, 54.0, 3.0, 43.62),
(91.0, 21.0, 32.0, 6.0, 29.47),
(92.0, 89.0, 13.0, 7.0, 12.1),
(93.0, 81.0, 34.0, 2.0, 41.4),
(94.0, 75.0, 35.0, 9.0, 27.94),
(95.0, 55.0, 46.0, 7.0, 21.66),
(96.0, 81.0, 30.0, 4.0, 26.57),
(97.0, 99.0, 81.0, 5.0, 48.59),
(98.0, 97.0, 58.0, 5.0, 26.78),
(99.0, 85.0, 93.0, 8.0, 32.39),
(100.0, 56.0, 47.0, 7.0, 40.42);

COMMIT;
SET FOREIGN_KEY_CHECKS=1;





-- ******************** Week-6 ***********************

-- Example: a “successful” transaction (COMMIT)
-- Goal: Show that when all steps succeed, they are saved together.
-- Example: Selling a product of our coffee shop.

USE mocha_madness_v3;

START TRANSACTION;

-- Step 1: Create a new order for an existing customer
INSERT INTO orders (customer_id, order_date)
VALUES (1, NOW());
SET @order_id := LAST_INSERT_ID();

-- Step 2: Add item to the order
INSERT INTO order_items (order_id, product_id, qty, price)
SELECT @order_id, 1, 2, price FROM products WHERE product_id = 1;

-- Step 3: Reduce stock
UPDATE products
SET stock = stock - 2
WHERE product_id = 1;

-- Step 4: Record payment
INSERT INTO payments (order_id, paid_amount, paid_at, method)
VALUES (@order_id, (2 * (SELECT price FROM products WHERE product_id = 1)),
        NOW(), 'CARD');

COMMIT;

-- Check results
SELECT * FROM orders WHERE order_id = @order_id;
SELECT * FROM order_items WHERE order_id = @order_id;
SELECT stock FROM products WHERE product_id = 1;
SELECT * FROM payments WHERE order_id = @order_id;

-- ******************** ROLLBACK ***********************
-- Demonstrate a “failure” transaction (ROLLBACK)
-- Goal: Show that when one step fails, everything is undone.
-- Example: Try to sell more than available stock:

START TRANSACTION;

INSERT INTO orders (customer_id, order_date)
VALUES (1, NOW());
SET @bad_order := LAST_INSERT_ID();

INSERT INTO order_items (order_id, product_id, qty, price)
SELECT @bad_order, 2, 999, price FROM products WHERE product_id = 2;

-- This step should fail logically (no stock)
UPDATE products
SET stock = stock - 999
WHERE product_id = 2 AND stock >= 999;

-- Check if stock update happened
SELECT ROW_COUNT() AS rows_changed;

-- If no stock update happened, undo everything
ROLLBACK;

-- Verify rollback
SELECT * FROM orders WHERE order_id = @bad_order; -- should be empty
SELECT * FROM order_items WHERE order_id = @bad_order; -- should be empty
SELECT stock FROM products WHERE product_id = 2; -- unchanged


