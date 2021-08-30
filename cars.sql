-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Gazdă: 127.0.0.1
-- Timp de generare: aug. 30, 2021 la 10:56 AM
-- Versiune server: 10.4.13-MariaDB
-- Versiune PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Bază de date: `cars`
--

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `created_at`, `updated_at`) VALUES
(5, NULL, 'Sedan', '2021-05-21 03:25:53', '2021-05-21 03:25:53'),
(6, NULL, 'SUV', '2021-05-21 03:26:09', '2021-05-21 03:26:09'),
(7, NULL, 'Pickup Truck', '2021-05-21 03:26:18', '2021-05-21 03:26:18'),
(12, 5, 'Honda (Sedan)', '2021-05-24 07:44:37', '2021-05-24 07:44:37'),
(13, 5, 'Chevrolet (Sedan)', '2021-05-24 07:45:05', '2021-05-24 07:45:05'),
(14, 5, 'Toyota (Sedan)', '2021-05-24 07:45:27', '2021-05-24 07:45:27'),
(15, 5, 'Audi (Sedan)', '2021-05-24 07:45:58', '2021-05-24 07:45:58'),
(16, 5, 'Nissan (Sedan)', '2021-05-24 07:46:26', '2021-05-24 07:46:26'),
(17, 6, 'Jeep (SUV)', '2021-05-24 07:47:20', '2021-05-24 07:47:20'),
(18, 6, 'Chevrolet (SUV)', '2021-05-24 07:47:57', '2021-05-24 07:47:57'),
(19, 6, 'Toyota (SUV)', '2021-05-24 07:48:46', '2021-05-24 07:48:46'),
(20, 6, 'Volkswagen (SUV)', '2021-05-24 07:49:18', '2021-05-24 07:49:18'),
(21, 6, 'Ford (SUV)', '2021-05-24 07:49:26', '2021-05-24 07:49:26'),
(22, 7, 'Chevrolet (Pickup Truck)', '2021-05-24 07:50:14', '2021-05-24 07:50:14'),
(23, 7, 'Nissan (Pickup Truck)', '2021-05-24 07:50:28', '2021-05-24 07:50:28'),
(24, 7, 'Ford (Pickup Truck)', '2021-05-24 07:50:34', '2021-05-24 07:50:34');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 0,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `is_active`, `author`, `email`, `body`, `created_at`, `updated_at`) VALUES
(32, 25, 1, 'cosminwebdinasty', 'cosmin@webdinasty.ro', 'Interesant', '2021-05-24 11:32:22', '2021-05-24 11:32:37'),
(33, 26, 1, 'test', 'sd@mail.com', '\"Originea omului rămâne încă necunoscută\"\r\nlooool)))', '2021-05-25 04:25:40', '2021-05-25 04:25:50'),
(34, 32, 1, 'test', 'sd@mail.com', '\"În munți, temperatura medie a verii este sub 18° \"   :\'(', '2021-05-25 04:58:04', '2021-05-25 04:58:16');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `comment_replies`
--

CREATE TABLE `comment_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 0,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `comment_replies`
--

INSERT INTO `comment_replies` (`id`, `comment_id`, `is_active`, `author`, `email`, `body`, `created_at`, `updated_at`) VALUES
(24, 32, 1, 'cosmin', 'test@mail.com', 'igaf :)', '2021-05-24 11:33:56', '2021-05-24 11:34:12'),
(26, 34, 1, 'cosminwebdinasty', 'cosmin@webdinasty.ro', 'x_x', '2021-05-25 04:59:11', '2021-05-25 04:59:28');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_02_22_091651_create_posts_table', 1),
(5, '2021_02_24_073514_create_permissions_table', 1),
(6, '2021_02_24_073544_create_roles_table', 1),
(7, '2021_02_24_073732_create_users_permissions_table', 1),
(8, '2021_02_24_073820_create_users_roles_table', 1),
(9, '2021_02_24_074003_create_roles_permissions_table', 1),
(26, '2021_03_01_085850_create_pages_table', 2),
(27, '2021_03_01_123515_add_page_image', 2),
(28, '2021_03_08_104001_create_categories_table', 2),
(29, '2021_03_08_140519_create_photos_table', 2),
(30, '2021_03_10_113551_create_comments_table', 2),
(31, '2021_03_10_113640_create_comment_replies_table', 2),
(32, '2021_05_24_085809_add_category_id_to_posts', 3),
(33, '2021_05_24_090630_add_parent_id_to_categories', 3);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'View Dashboard', 'view-dashboard', '2021-02-24 13:11:32', '2021-02-24 13:11:32'),
(2, 'Edit Post', 'edit-post', '2021-02-25 12:11:46', '2021-02-25 12:11:46'),
(3, 'Update Users', 'update-users', '2021-02-25 12:12:25', '2021-02-25 12:12:25');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `permission_user`
--

CREATE TABLE `permission_user` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `photos`
--

CREATE TABLE `photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `photos`
--

INSERT INTO `photos` (`id`, `file`, `created_at`, `updated_at`) VALUES
(26, '1630311996chMIgu6lQsQyZgtNH2XFQQ6we5QqA7YknA9QCLrr.jpg', '2021-08-30 05:26:36', '2021-08-30 05:26:36'),
(28, '1630312010WOKeVClSLQ5nSykFVIBkTfbVkeXE3g77jqi43HQf.jpg', '2021-08-30 05:26:50', '2021-08-30 05:26:50'),
(29, '1630312049app.js', '2021-08-30 05:27:29', '2021-08-30 05:27:29'),
(31, '1630312105blobid1626333617829.jpg', '2021-08-30 05:28:25', '2021-08-30 05:28:25'),
(32, '1630312129Chart.min.js', '2021-08-30 05:28:49', '2021-08-30 05:28:49'),
(33, '1630312129Chart.js', '2021-08-30 05:28:49', '2021-08-30 05:28:49');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `category_id`, `title`, `post_image`, `body`, `created_at`, `updated_at`) VALUES
(24, 24, 13, '2017 Chevrolet Malibu', 'images/CgkFv2rUoVnbA7vxfMh1ph1a4NKPTk264nhIzUzt.jpg', '<h2 class=\"section-title\">SELLER\'S NOTES</h2>\r\n<div class=\"notes__overflow\">\r\n<p class=\"margin-bottom-0\">IN-HOUSE FINANCING AVAILABLE!<br />CASH PRICE DEALS AVAILABLE!<br />LIMITED TIME WARRANTY AVAILABLE!</p>\r\n<p class=\"margin-bottom-0\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2017-chevrolet-malibu-ls-fleet-4dr-sedan (1).jpg\" src=\"../../../storage/uploads/blobid1630044754163.jpg\" alt=\"\" width=\"486\" height=\"364\" /></p>\r\n<p class=\"margin-bottom-0\">The front windshield is in excellent condition. The paint is in great shape and condition. No dings are visible on this vehicle. The tires are slightly worn with about 75% of tread life left. The interior was well maintained and is extra clean. The exterior was well maintained and is extra clean. The engine is functioning properly and has no issues. The transmission shifts very smoothly. The brakes are in great condition. The battery is in excellent condition. The car was previously owned by a non smoker.</p>\r\n<p class=\"margin-bottom-0\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2017-chevrolet-malibu-ls-fleet-4dr-sedan (2).jpg\" src=\"../../../storage/uploads/blobid1630044788870.jpg\" alt=\"\" width=\"488\" height=\"366\" /></p>\r\n</div>', '2021-05-21 03:13:10', '2021-08-27 03:13:31'),
(25, 24, 14, '2017 Toyota Corolla', 'images/yi9nneBt6HGcBqGo7PXlkJKqztRyPr4rGy6ZLdYA.jpg', '<h2 class=\"section-title\">SELLER\'S NOTES</h2>\r\n<div class=\"notes__overflow\">\r\n<p class=\"margin-bottom-0\">Auto Boutique is proud to offer excellent, pre-owned vehicles. With our no haggle pricing policy you can be sure you are getting the best deal possible on every car as they already discounted and thousands below market value. Buying a car from us is easy. You can purchase the vehicle by paying cash or finance through one of our partnered lenders such as: Capital One, Wells Fargo, Ally Financial, Community First Credit Union, Westlake Financial, USAA and</p>\r\n<p class=\"margin-bottom-0\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2017-toyota-corolla-se-4dr-sedan-cvt (2).jpg\" src=\"../../../storage/uploads/blobid1630045101144.jpg\" alt=\"\" width=\"481\" height=\"361\" /></p>\r\n<p class=\"margin-bottom-0\">more! Give us a call to confirm if we are partnered with your lender. Visit our web site to fill out an application for a quick and easy approval. Thank you for considering Auto Boutique for your next vehicle purchase. For more information, please visit OUR WEBSITE: WWW.AUTOBOUTIQUETEXAS.COM Advertised price does not include tag, tax, title, registration,</p>\r\n<p class=\"margin-bottom-0\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2017-toyota-corolla-se-4dr-sedan-cvt (1).jpg\" src=\"../../../storage/uploads/blobid1630045132982.jpg\" alt=\"\" width=\"479\" height=\"359\" /></p>\r\n</div>', '2021-05-21 03:14:33', '2021-08-27 03:19:24'),
(26, 24, 17, '2018 Jeep Compass', 'images/uvG9Z3W4h756A1R63bPBw51R1QGCBjhZRF2JRbXC.jpg', '<h2 class=\"section-title\">SELLER\'S NOTES</h2>\r\n<div class=\"notes__overflow\">\r\n<p class=\"margin-bottom-0\">YOU SEARCH, YOU REQUEST, AND WE DELIVER TO YOUR HOME OR OFFICE! SCHEDULE A SHOWROOM VISIT VIA PHONE, EMAIL, OR INTERNET! And complete your purchase online at www.gollingbloomfield.com or call us at 248-409-2300.</p>\r\n<p class=\"margin-bottom-0\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2018-jeep-compass-limited-4x4-4dr-suv (1).jpg\" src=\"../../../storage/uploads/blobid1630045921500.jpg\" alt=\"\" width=\"417\" height=\"313\" /></p>\r\n<p class=\"margin-bottom-0\">Certified. Free Lifetime Oil Changes**, Rear Backup Camera, Bluetooth*, Heated Seats**, Carfax One Owner!!, Leather*, Local Trade**, USB Carging Ports, Steering Wheel Controls, Aluminum Wheels, Remote Start. CARFAX One-Owner. Clean CARFAX.<br /><br />22/30 City/Highway MPG Odometer is 22400 miles below market average!</p>\r\n<p class=\"margin-bottom-0\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2018-jeep-compass-limited-4x4-4dr-suv (2).jpg\" src=\"../../../storage/uploads/blobid1630045949114.jpg\" alt=\"\" width=\"438\" height=\"329\" /></p>\r\n</div>', '2021-05-21 03:15:55', '2021-08-27 03:33:01'),
(27, 24, 18, '2018 Chevrolet Traverse', 'images/B4ujRz0rlo4hUh515GXkjmuGLb7nuuX2PQjjdDsi.jpg', '<h2 class=\"section-title\">SELLER\'S NOTES</h2>\r\n<div class=\"\">\r\n<p class=\"margin-bottom-0\">Graphite Metallic 2019 Chevrolet Traverse LT Cloth w/1LT FWD 9-Speed Automatic 3.6L V6 SIDI VVTOdometer is 6815 miles below market average! 18/27 City/Highway MPG</p>\r\n<p class=\"margin-bottom-0\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2019-chevrolet-traverse-lt-cloth-4dr-suv-w-1lt (3).jpg\" src=\"../../../storage/uploads/blobid1630046327476.jpg\" alt=\"\" width=\"432\" height=\"324\" /></p>\r\n<h2 class=\"section-title clearfix\">RECALL INFORMATION</h2>\r\n<div id=\"recallCollapse\" class=\"collapse in\">\r\n<p>This vehicle may have an open safety recall. Head to the National Highway Traffic Safety Administration (NHTSA) website to perform a quick search.</p>\r\n<p><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2019-chevrolet-traverse-lt-cloth-4dr-suv-w-1lt (2).jpg\" src=\"../../../storage/uploads/blobid1630046357867.jpg\" alt=\"\" width=\"433\" height=\"325\" /></p>\r\n</div>\r\n</div>', '2021-05-21 03:16:28', '2021-08-27 03:40:15'),
(28, 24, 18, '2018 Chevrolet Equinox', 'images/qOICpMUqPc14Iz1lsO5tdS3jMeuDOdJQ7KZQhESL.jpg', '<h2 class=\"section-title\">SELLER\'S NOTES</h2>\r\n<div class=\"notes__overflow\">\r\n<p class=\"margin-bottom-0\">If you\'re shopping for a quality vehicle with perks such as a push button start, backup camera, braking assist, hill start assist, stability control, traction control, anti-lock brakes, dual airbags, side air bag system, and digital display, this 2019 Chevrolet Equinox LS may be the car for you. This one\'s available at the low price of $19,900. Stay safe with this SUV\'s 5 out of 5 star crash</p>\r\n<p class=\"margin-bottom-0\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2019-chevrolet-equinox-ls-4dr-suv-w-1ls (1).jpg\" src=\"../../../storage/uploads/blobid1630046502124.jpg\" alt=\"\" width=\"450\" height=\"337\" /></p>\r\n<p class=\"margin-bottom-0\">test rating. For a good-looking vehicle from the inside out, this SUV features a timeless sandy ridge metallic exterior along with a medium ash gray interior. Call today to test it out! Contact Information: Stadium GM Superstore, 214-292 w. State Street, Salem, OH, 44460,&nbsp;</p>\r\n<p class=\"margin-bottom-0\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2019-chevrolet-equinox-ls-4dr-suv-w-1ls (2).jpg\" src=\"../../../storage/uploads/blobid1630046538366.jpg\" alt=\"\" width=\"452\" height=\"339\" /></p>\r\n<p class=\"margin-bottom-0\">&nbsp;</p>\r\n<p class=\"margin-bottom-0\">&nbsp;</p>\r\n</div>', '2021-05-21 03:19:19', '2021-08-27 03:42:36'),
(29, 24, 19, '2018 Toyota RAV4', 'images/9Kq47MQdBIn6CAe20ilK6o5ml5HNBESD9BE6rA5Q.jpg', '<h2 class=\"section-title\">SELLER\'S NOTES</h2>\r\n<div class=\"notes__overflow\">\r\n<p class=\"margin-bottom-0\">AWD, Black w/Fabric Seat Trim.<br /><br />At Westboro Toyota we want you to know that all our vehicles are priced at a competitive value position to the market. We use an independent 3rd party software to research internet listings on all vehicles in the market so we can ensure that our prices are the most competitive out</p>\r\n<p class=\"margin-bottom-0\" style=\"text-align: center;\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2019-toyota-rav4-le-awd-4dr-suv.jpg\" src=\"../../../storage/uploads/blobid1630046700085.jpg\" alt=\"\" width=\"410\" height=\"308\" /></p>\r\n<p class=\"margin-bottom-0\" style=\"text-align: left;\">there. We do this simply so people choose us when they start searching for their next car. CASH PURCHASE OR OUTSIDE FINANCING $1000.00 ADDITION.<br />CARFAX One-Owner. Odometer is 22049 miles below market average! 2019 Toyota RAV4 2.5L 4-Cylinder DOHC Dual VVT-i 25/33 City/Highway MPG AWD 8-Speed Automatic LE Magnetic</p>\r\n<p class=\"margin-bottom-0\" style=\"text-align: center;\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2019-toyota-rav4-le-awd-4dr-suv (1).jpg\" src=\"../../../storage/uploads/blobid1630046729894.jpg\" alt=\"\" width=\"411\" height=\"308\" /></p>\r\n<p class=\"margin-bottom-0\" style=\"text-align: left;\">&nbsp;</p>\r\n<p class=\"margin-bottom-0\" style=\"text-align: center;\">&nbsp;</p>\r\n<p class=\"margin-bottom-0\" style=\"text-align: center;\">&nbsp;</p>\r\n<p class=\"margin-bottom-0\">&nbsp;</p>\r\n</div>', '2021-05-21 03:20:06', '2021-08-27 03:45:48'),
(30, 24, 20, '2017 Volkswagen Tiguan', 'images/gzt0U5tKut0JM9jFpge5kgO9kcDD7q7O2bHaDU3m.jpg', '<h2 class=\"section-title\">SELLER\'S NOTES</h2>\r\n<div class=\"notes__overflow\">\r\n<p class=\"margin-bottom-0\">Just arrived is this NO-ACCIDENT, ONE-OWNER, NONSMOKER, TURBOCHARGED 2018 Volkswagen Tiguan SE!<br /><br />WINNER OF U.S. NEWS &amp; WORLD REPORT\'S 2018 BEST NEW CARS FOR TEENS AWARD, this turbocharged, affordable compact SUV has a good predicted rating and provides a smooth ride over most road surfaces.</p>\r\n<p class=\"margin-bottom-0\" style=\"text-align: center;\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2018-volkswagen-tiguan-2-0t-se-with-3rd-row-seating (1).jpg\" src=\"../../../storage/uploads/blobid1630046873797.jpg\" alt=\"\" width=\"437\" height=\"292\" /></p>\r\n<p class=\"margin-bottom-0\" style=\"text-align: left;\">The National Highway Traffic Safety Administration gave the 2018 Volkswagen Tiguan five out of five stars in the side crash test and four stars in the rollover test. The Insurance Institute for Highway Safety gave the 2018 Tiguan the highest rating of Good in all six crash tests.</p>\r\n<p class=\"margin-bottom-0\" style=\"text-align: left;\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2018-volkswagen-tiguan-2-0t-se-with-3rd-row-seating.jpg\" src=\"../../../storage/uploads/blobid1630046903113.jpg\" alt=\"\" width=\"434\" height=\"290\" /></p>\r\n<p class=\"margin-bottom-0\">&nbsp;</p>\r\n</div>', '2021-05-21 03:20:41', '2021-08-27 03:48:38'),
(31, 24, 24, '2019 Ford Ranger', 'images/fPYuA1wVzUYHAwBxio1BfrJ3VwA4laA6Bq0D3cwv.jpg', '<h2 class=\"section-title\">SELLER\'S NOTES</h2>\r\n<div class=\"\">\r\n<p class=\"margin-bottom-0\">2019 Ford Ranger XL Ranger XL, Super Cab, EcoBoost 2.3L I4 GTDi DOHC Turbocharged VCT, 10-Speed Automatic, RWD, Ingot Silver, Ebony.<br />Odometer is 16396 miles below market average!</p>\r\n<p class=\"margin-bottom-0\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2019-ford-ranger-xl-4x2-4dr-supercab-6-1-ft-sb (2).jpg\" src=\"../../../storage/uploads/blobid1630047857277.jpg\" alt=\"\" width=\"437\" height=\"291\" /></p>\r\n<p class=\"margin-bottom-0\">This vehicle may have an open safety recall. Head to the National Highway Traffic Saf</p>\r\n<p class=\"margin-bottom-0\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2019-ford-ranger-xl-4x2-4dr-supercab-6-1-ft-sb (1).jpg\" src=\"../../../storage/uploads/blobid1630047888979.jpg\" alt=\"\" width=\"438\" height=\"291\" /></p>\r\n</div>', '2021-05-21 03:21:31', '2021-08-27 04:05:08'),
(32, 24, 23, '2018 Nissan Titan XD', 'images/wDW4TU9tVPrJ1Skt2bRnOrTO9y9ohviR89SjYvqy.jpg', '<h2 class=\"section-title\">SELLER\'S NOTES</h2>\r\n<div class=\"notes__overflow\">\r\n<p class=\"margin-bottom-0\">Mauscare is exclusive to Maus Family Automotive. Mauscare features benefits and added options to protect and extend the life of your vehicle and includes Life Time Oil Changes, Life Time Tire Rotations, Life Time Nitrogen Refills, Battery Warranty*, Interior and Exterior Protections*, Roadside Assistance, Microbial Defense,*, Identity Protection*, VIN Etching and</p>\r\n<p class=\"margin-bottom-0\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2018-nissan-titan-xd-sv-4x4-2dr-single-cab (2).jpg\" src=\"../../../storage/uploads/blobid1630047460683.jpg\" alt=\"\" width=\"443\" height=\"332\" /></p>\r\n<p class=\"margin-bottom-0\">so much more.. Exclusions may apply, see dealer for details. Our goal is to never lose your business over price. All prices displayed do not include additional accessories or fees and costs of closing including any government, additional packages applied to vehicle, including but not limited to MausCare, federal, dealer fees, taxes, registration, dealer document, cost of</p>\r\n<p class=\"margin-bottom-0\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2018-nissan-titan-xd-sv-4x4-2dr-single-cab (1).jpg\" src=\"../../../storage/uploads/blobid1630047483549.jpg\" alt=\"\" width=\"442\" height=\"331\" /></p>\r\n</div>', '2021-05-21 03:22:15', '2021-08-27 03:58:21'),
(46, 24, 12, '2018 Honda Accord', 'images/OpXitfsWMeK3geyp14655LuQXr3Mha8GTVbOu6Ia.jpg', '<h2 class=\"section-title\">SELLER\'S NOTES</h2>\r\n<div class=\"notes__overflow\">\r\n<p class=\"margin-bottom-0\">ACCIDENT FREE CARFAX, APPLE CERTIFIED, ONE OWNER, TURBO, Rear Camera, Bluetooth, 181 Point Inspection, White Glove Detail, SERVICED &amp; CERTIFIED.LXOdometer is 20074 miles below market average! 30/38 City/Highway MPGAwards:* JD Power Automotive Performance, Execution and Layout (APEAL) Study * ALG Residual Value Awards, Residual Value Awards * NACTOY 2018 North American Car of the Year * 2018 KBB.com Brand Image Awards * 2018</p>\r\n<p class=\"margin-bottom-0\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2019-honda-accord-sport-4dr-sedan-1-5t-i4-cvt.jpg\" src=\"../../../storage/uploads/blobid1630044550193.jpg\" alt=\"\" width=\"431\" height=\"323\" /></p>\r\n<p class=\"margin-bottom-0\">KBB.com 10 Most Awarded BrandsKelley Blue Book Brand Image Awards are based on the Brand Watch(tm) study from Kelley Blue Book Market Intelligence. Award calculated among non-luxury shoppers. For more information, visit www.kbb.com. Kelley Blue Book is a</p>\r\n<p class=\"margin-bottom-0\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2019-honda-accord-sport-4dr-sedan-1-5t-i4-cvt (1).jpg\" src=\"../../../storage/uploads/blobid1630044587857.jpg\" alt=\"\" width=\"423\" height=\"317\" /></p>\r\n<p class=\"margin-bottom-0\">&nbsp;</p>\r\n</div>', '2021-07-15 09:51:05', '2021-08-27 03:10:13'),
(47, 24, 12, '2019 Honda Civic', 'images/WjbBStggXQfF4nMW3XwbloE80dgQtTPeBZCDuEQI.jpg', '<h2 class=\"section-title\">SELLER\'S NOTES</h2>\r\n<div class=\"notes__overflow\">\r\n<p class=\"margin-bottom-0\">Recent Arrival! Odometer is 42688 miles below market average! Looks and feels Like new and factory warranty applies!..<br />Priced to move fast and below KBB Fair Purchase Price.This beauty won\'t Last, it is an amazing deal on an amazing vehicle. Our Pre-Owned vehicles undergo a rigorous multi-point inspection, are test driven by our picky master technicians and strict approval standards. We compare this vehicle to others in a 150 miles radius while weighing in the color, miles, condition, and all that is relevant for the future owner, with thi</p>\r\n<p class=\"margin-bottom-0\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2017-honda-civic-ex-l-4dr-sedan (2).jpg\" src=\"../../../storage/uploads/blobid1629982742009.jpg\" alt=\"\" width=\"487\" height=\"326\" /></p>\r\n<p class=\"margin-bottom-0\">hard work and research, so you don\'t have to, allowing us to offer a great vehicle in great condition at a great price, simple as that. Daily Changes In inventory may Result in the unavailability of certain vehicles listed. Information provided is believed to be accurate, but specifications, pricing, and availability must be confirmed in writing (Directly) with the Dealer To be binding. Custom or Chrome Wheels, Lift Kits and accessories are additional cost to t</p>\r\n<p class=\"margin-bottom-0\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2017-honda-civic-ex-l-4dr-sedan (1).jpg\" src=\"../../../storage/uploads/blobid1630044420159.jpg\" alt=\"\" width=\"487\" height=\"326\" /></p>\r\n</div>', '2021-07-15 09:52:37', '2021-08-27 03:07:23'),
(50, 24, 14, '2018 Toyota Camry', 'images/mB1FJTdb4sHC5MCv5nKDDWYTHIMKN4niI052kVtV.jpg', '<h2 class=\"section-title visible-md visible-lg\">PREMIUM FEATURES</h2>\r\n<ul class=\"features__premium\">\r\n<ul class=\"features__premium\">\r\n<li>Audio Controls on Steering Wheel</li>\r\n<li>Bluetooth</li>\r\n<li>Alloy Wheels&nbsp;</li>\r\n</ul>\r\n</ul>\r\n<p><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2019-toyota-camry-se-4dr-sedan (1).jpg\" src=\"../../../storage/uploads/blobid1630045299516.jpg\" alt=\"\" width=\"436\" height=\"327\" /></p>\r\n<p><strong>SELLER\'S NOTES</strong><br />Contact Marano &amp; Sons Auto Sales for more information.</p>\r\n<p><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2019-toyota-camry-se-4dr-sedan (2).jpg\" src=\"../../../storage/uploads/blobid1630045353339.jpg\" alt=\"\" width=\"464\" height=\"348\" /></p>', '2021-07-15 10:15:26', '2021-08-27 03:24:12'),
(51, 24, 15, '2018 Audi A4', 'images/z66uC2It9CgsuddRpOoKLE7GTQ0Qj6GWd02LFVYV.jpg', '<h2 class=\"section-title\">SELLER\'S NOTES</h2>\r\n<div class=\"notes__overflow\">\r\n<p class=\"margin-bottom-0\">GREAT VALUE - HUBER CERTIFIED, Clean, Quality checked, Fully serviced. Blind Spot, Virtual Cockpit, Audi Pre Sense, Sport Seats, Back up Camera w/ sensors, Navigation, Smart radio w/ Android auto &amp; Apple CarPlay. One Owner. All maintenance complete, Ready to go! Pa insp &amp; our bumper-to-bumper mechanical guarantee. Professional service after the sale w/ loyalty discounts, 10% off parts &amp; labor on all repairs, free state insp specials, and more. NO GAMES.</p>\r\n<p class=\"margin-bottom-0\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2018-audi-a4-2-0t-premium-plus-quattro (1).jpg\" src=\"../../../storage/uploads/blobid1630045560901.jpg\" alt=\"\" width=\"420\" height=\"315\" /></p>\r\n<p class=\"margin-bottom-0\">Same price cash, finance, trade or not. NO HASSLE PRICE + state sales tax / title / tags &amp; Doc fee, NO ADDITIONAL DEALER FEES! Fuel efficient 2.0 L 4 cyl engine, Automatic trans w/ tiptronic, Beautiful non smoker interior, Heated Steering wheel, Power heated leather seats w/</p>\r\n<p class=\"margin-bottom-0\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2018-audi-a4-2-0t-premium-plus-quattro (2).jpg\" src=\"../../../storage/uploads/blobid1630045593175.jpg\" alt=\"\" width=\"424\" height=\"317\" /></p>\r\n</div>', '2021-07-15 10:21:33', '2021-08-27 03:27:33'),
(52, 24, 16, '2019 Nissan Altima', 'images/YrgHPvItWgeEehDJQmFpi1OYCyilK6bbqAKNFR6d.jpg', '<h2 class=\"section-title\">SELLER\'S NOTES</h2>\r\n<div class=\"notes__overflow\">\r\n<p class=\"margin-bottom-0\">Nissan Altima 2017. Low mileage 13000<br />Clean Title<br />Well maintained like brand new<br />Backup camera<br />Attractive Alloy wheels with new tires<br />Cruise control<br />Premium sound system<br />Bluetooth and auxiliary option</p>\r\n<p class=\"margin-bottom-0\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2017-nissan-altima-2-5-sr-4dr-sedan (1).jpg\" src=\"../../../storage/uploads/blobid1630045762036.jpg\" alt=\"\" width=\"435\" height=\"326\" /></p>\r\n<p class=\"margin-bottom-0\">Best fuel efficient<br />Inside specious Room<br />Smooth drive pleasure<br />Some slightly hail spots<br />Non smoker and pet free<br />Recently all services done<br />Ready for test drive<br />Cash only</p>\r\n<p class=\"margin-bottom-0\">This vehicle may have an open safety recall. Head to the National Highway Traffic Safety Administration (NHTSA) website to perform a quick search.</p>\r\n<p class=\"margin-bottom-0\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2017-nissan-altima-2-5-sr-4dr-sedan (2).jpg\" src=\"../../../storage/uploads/blobid1630045808901.jpg\" alt=\"\" width=\"445\" height=\"334\" /></p>\r\n<p class=\"margin-bottom-0\">&nbsp;</p>\r\n<p class=\"margin-bottom-0\">&nbsp;</p>\r\n</div>', '2021-07-15 10:27:07', '2021-08-27 03:30:31'),
(53, 24, 17, '2019 Jeep Cherokee', 'images/8sIzfxXKzFDALcqRpQPLgOZHZdRy4befyX4d9bGM.jpg', '<h2 class=\"section-title\">SELLER\'S NOTES</h2>\r\n<div class=\"notes__overflow\">\r\n<p class=\"margin-bottom-0\">Thank you for shopping European Auto Expo, located in Lodi New Jersey. We are your #1 choice for Pre-Owned Vehicles for over 15 years. For phenomenal customer service before, during, and after the sale. Call us 973-665- 8010 or online <a href=\"http://www.europeanautoexpo.com\">www.europeanautoexpo.com</a>.</p>\r\n<p class=\"margin-bottom-0\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2019-jeep-cherokee-latitude-plus-4x4-4dr-suv (2).jpg\" src=\"../../../storage/uploads/blobid1630046166292.jpg\" alt=\"\" width=\"473\" height=\"355\" /></p>\r\n<p class=\"margin-bottom-0\">CARFAX One-Owner. Recent Arrival! Odometer is 2088 miles below market average! 21/29 City/Highway MPG APRs as low as 2.99%!, 3.734 Axle Ratio, 4-Wheel Disc Brakes, 6 Speakers, ABS brakes, Air Conditioning, Alloy wheels, AM/FM radio: SiriusXM, Anti-whiplash front head restraints, Apple CarPlay/Android Auto, AutoStick Automatic Transmission, Auxiliary Transmission Oil Cooler, Brake assist, Bumpers: body-color, Cloth/Premium Vinyl Bucket Seats,</p>\r\n<p class=\"margin-bottom-0\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2019-jeep-cherokee-latitude-plus-4x4-4dr-suv (1).jpg\" src=\"../../../storage/uploads/blobid1630046193149.jpg\" alt=\"\" width=\"472\" height=\"354\" /></p>\r\n</div>', '2021-07-15 10:50:59', '2021-08-27 03:36:50'),
(54, 24, 20, '2018 Volkswagen Atlas', 'images/O81CQeaIDOKTbdN0Xw1xSkMWRXl5wqbZS8l48gbT.jpg', '<h2 class=\"section-title\">SELLER\'S NOTES</h2>\r\n<div class=\"notes__overflow\">\r\n<p class=\"margin-bottom-0\">Just arrived is this NO-ACCIDENT, ONE-OWNER, NONSMOKER 2019 Volkswagen Atlas SEL!<br /><br />Driven only 13,096 miles, this SPACIOUS, three-row midsize SUV boasts roomy seating and cargo space, user-friendly features, and refined handling.</p>\r\n<p class=\"margin-bottom-0\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2019-volkswagen-atlas-v6-sel-4dr-suv (1).jpg\" src=\"../../../storage/uploads/blobid1630046989180.jpg\" alt=\"\" width=\"446\" height=\"297\" /></p>\r\n<p class=\"margin-bottom-0\">Plus, it is STILL COVERED under the balance of the factory BUMPER-TO-BUMPER &amp; POWERTRAIN warranties until June 2025 or 72,000 miles (whichever comes first)!<br /><br />The SEL trim adds:<br /><br />- A HEATED STEERING WHEEL<br />- A SUNROOF<br />- A NAVIGATION SYSTEM<br />- A 10-INCH DIGITAL INSTRUMENT DISPLAY<br />- FRONT AND REAR PARKING SENSORS<br />- A HANDS-FREE LIFTGATE</p>\r\n<p class=\"margin-bottom-0\" style=\"text-align: center;\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2019-volkswagen-atlas-v6-sel-4dr-suv (2).jpg\" src=\"../../../storage/uploads/blobid1630047022273.jpg\" alt=\"\" width=\"446\" height=\"297\" /></p>\r\n<p class=\"margin-bottom-0\">&nbsp;</p>\r\n</div>', '2021-07-15 11:09:44', '2021-08-27 03:50:48'),
(55, 24, 21, '2019 Ford Edge', 'images/y1B2EKjszfRwhmdzlEBmWJl0j7oHjX1w03jO6MXp.jpg', '<h2 class=\"section-title\">SELLER\'S NOTES</h2>\r\n<div class=\"\">\r\n<p id=\"react_0HMB92HE1T4T0\" class=\"margin-bottom-0\">Contact&nbsp;<button class=\"btn-link\" title=\"Email Seller\">STUTEVILLE CHRYSLER DODGE JEEP RAM</button>&nbsp;for more information.</p>\r\n</div>\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n<p><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2019-ford-edge-sel-4dr-crossover (1).jpg\" src=\"../../../storage/uploads/blobid1630047154475.jpg\" alt=\"\" width=\"404\" height=\"303\" /></p>\r\n<h2 class=\"section-title clearfix\">RECALL INFORMATION</h2>\r\n<div id=\"recallCollapse\" class=\"collapse in\">\r\n<p>This vehicle may have an open safety recall. Head to the National Highway Traffic Safety Administration (NHTSA) website to perform a quick search.</p>\r\n<p><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2019-ford-edge-sel-4dr-crossover (2).jpg\" src=\"../../../storage/uploads/blobid1630047186331.jpg\" alt=\"\" width=\"405\" height=\"304\" /></p>\r\n</div>', '2021-07-15 11:14:02', '2021-08-27 03:53:24'),
(56, 24, 24, '2019 Ford F-150', 'images/1GaJlvG788NEQBUNbCzkwffW58GoivM5xsIeM4mO.jpg', '<h2 class=\"section-title\">SELLER\'S NOTES</h2>\r\n<div class=\"\">\r\n<p class=\"margin-bottom-0\">Almost new! Let someone else take the depreciation hit by buying new! This F150 is ready for work. 4x4. Ecoboost 3.5L. Backup camera. Bluetooth. Call/Text Jeremiah to schedule a test drive. 801.960.8736</p>\r\n<p class=\"margin-bottom-0\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2019-ford-f-150-xl-4x4-4dr-supercrew-6-5-ft-sb (1).jpg\" src=\"../../../storage/uploads/blobid1630047676468.jpg\" alt=\"\" width=\"435\" height=\"326\" /></p>\r\n<p class=\"margin-bottom-0\">This vehicle may have an open safety recall. Head to the Natio</p>\r\n<p class=\"margin-bottom-0\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2019-ford-f-150-xl-4x4-4dr-supercrew-6-5-ft-sb (2).jpg\" src=\"../../../storage/uploads/blobid1630047776313.jpg\" alt=\"\" width=\"439\" height=\"329\" /></p>\r\n<p class=\"margin-bottom-0\">&nbsp;</p>\r\n<p class=\"margin-bottom-0\">&nbsp;</p>\r\n</div>', '2021-07-23 03:46:30', '2021-08-27 04:03:11'),
(57, 24, 22, '2019 Chevrolet Silverado 1500', 'images/MPtJN1QjF6rWPeyfNSFCKqjq6KVosOLHZJ5Y9LDJ.jpg', '<h2 class=\"section-title\">SELLER\'S NOTES</h2>\r\n<div class=\"notes__overflow\">\r\n<p class=\"margin-bottom-0\">NEARLY NEW-ONLY 13K MILES! REGULAR CAB LONG BED PICKUP!! Discover what makes Marietta Truck Sales special. Top quality, fleet maintained vehicles with the best reconditioning program. Family owned and operated since 1980. 2019 Chevrolet Silverado C1500 Regular Cab Pickup, only 13K miles, factory warranty, automatic transmission, air conditioning, cloth seats,</p>\r\n<p class=\"margin-bottom-0\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2019-chevrolet-silverado-1500-work-truck-4x2-2dr-regular-cab-8-ft-lb (1).jpg\" src=\"../../../storage/uploads/blobid1630047301136.jpg\" alt=\"\" width=\"422\" height=\"317\" /></p>\r\n<p class=\"margin-bottom-0\">vinyl floor, cruise control, tilt steering wheel with controls, dual airbags with passenger on/off switch, AM/FM/CD player with auxiliary connection, power windows &amp; locks, power mirrors, keyless entry, folding center console armrest with cup holders, bedliner, rear step bumper, tow hitch, backup camera and great tires. One owner and fleet maintained since new! Runs and drives great! GREAT FINANCING OPTIONS AVAILABLE! Ask for details. CAN&rsquo;T MAKE IT TO</p>\r\n<p class=\"margin-bottom-0\"><img class=\"img-responsive\" style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"2019-chevrolet-silverado-1500-work-truck-4x2-2dr-regular-cab-8-ft-lb (2).jpg\" src=\"../../../storage/uploads/blobid1630047325593.jpg\" alt=\"\" width=\"426\" height=\"320\" /></p>\r\n</div>', '2021-07-23 03:50:51', '2021-08-27 03:55:42');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', '2021-02-24 13:11:02', '2021-02-24 13:11:02'),
(2, 'Manager', 'manager', '2021-02-25 07:07:31', '2021-02-25 07:07:31'),
(3, 'Author', 'author', '2021-02-25 07:07:58', '2021-02-25 07:07:58'),
(4, 'Subscriber', 'subscriber', '2021-02-25 07:08:16', '2021-02-25 07:08:16');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `role_user`
--

CREATE TABLE `role_user` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(24, 1, NULL, NULL),
(24, 2, NULL, NULL),
(25, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Eliminarea datelor din tabel `users`
--

INSERT INTO `users` (`id`, `username`, `avatar`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'cosmin', 'images/hwaVxbjRsa6agkQ32UBxBkWLlrX5l3hMx6umyZJu.ico', 'cosmin', 'test@mail.com', NULL, '$2y$10$Zaa.qs9HL1iOPu9iX9xcNOVBmBU0yaE.NWgBfei/ud0JaqGWtwcl2', NULL, '2021-02-24 11:12:20', '2021-08-30 05:22:08'),
(2, 'test', 'images/vRg0uqZqI7PaoNbuM5gaOrsdypU3qO6o0naZsL1R.ico', 'test', 'sd@mail.com', NULL, '$2y$10$W.hJsUiXWBjMsElaa1wbEeV0GNkzl.ijqRSGol7e09vezoH1gD54W', NULL, '2021-02-24 11:19:26', '2021-08-30 05:21:28'),
(24, 'webdinasty', 'images/sPBYuuWCbGmeZzFFkcVVvUVoTbBsX07BxYFY4Jya.ico', 'cosminwebdinasty', 'cosmin@webdinasty.ro', NULL, '$2y$10$DIbzwH1VykmbXTQOnBXs6uT2tISfZA85Uwu9jIJSIaeZ2WApP4fs.', NULL, '2021-05-20 07:00:11', '2021-08-30 05:21:44');

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `comment_replies`
--
ALTER TABLE `comment_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexuri pentru tabele `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`),
  ADD UNIQUE KEY `permissions_slug_unique` (`slug`);

--
-- Indexuri pentru tabele `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`);

--
-- Indexuri pentru tabele `permission_user`
--
ALTER TABLE `permission_user`
  ADD PRIMARY KEY (`user_id`,`permission_id`);

--
-- Indexuri pentru tabele `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Indexuri pentru tabele `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`);

--
-- Indexuri pentru tabele `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pentru tabele eliminate
--

--
-- AUTO_INCREMENT pentru tabele `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pentru tabele `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pentru tabele `comment_replies`
--
ALTER TABLE `comment_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pentru tabele `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pentru tabele `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT pentru tabele `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pentru tabele `photos`
--
ALTER TABLE `photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT pentru tabele `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT pentru tabele `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pentru tabele `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
