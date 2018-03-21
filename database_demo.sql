-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2018 at 01:25 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trial`
--

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_location` text COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `project_type` enum('building','estate') COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tier_one` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tier_two` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tier_three` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area_label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `elevation_label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `css` text COLLATE utf8_unicode_ci,
  `thanks` text COLLATE utf8_unicode_ci,
  `thanks_callback` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `show_numbers` tinyint(1) DEFAULT NULL,
  `show_level_addons` tinyint(1) DEFAULT NULL,
  `custom_fields` text COLLATE utf8_unicode_ci,
  `tooltip_order` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_widescreen` tinyint(1) NOT NULL DEFAULT '0',
  `pdf_highlight` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdf_cover` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdf_pricelist` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdf_promotion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdf_columns` text COLLATE utf8_unicode_ci,
  `pdf` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdf_masterplan` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `linked_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `runway_client_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `runway_client_secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `runway_oauth_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `runway_token_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `disable_empty_levels` tinyint(1) DEFAULT '0',
  `highlightable` tinyint(1) DEFAULT '0',
  `ga_tracking_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `name`, `uid`, `file_location`, `is_active`, `company_id`, `project_type`, `logo`, `link`, `tier_one`, `tier_two`, `tier_three`, `area_label`, `elevation_label`, `css`, `thanks`, `thanks_callback`, `show_numbers`, `show_level_addons`, `custom_fields`, `tooltip_order`, `image`, `is_widescreen`, `pdf_highlight`, `pdf_cover`, `pdf_pricelist`, `pdf_promotion`, `pdf_columns`, `pdf`, `pdf_masterplan`, `created_at`, `updated_at`, `deleted_at`, `linked_logo`, `runway_client_id`, `runway_client_secret`, `runway_oauth_uri`, `runway_token_uri`, `disable_empty_levels`, `highlightable`, `ga_tracking_code`) VALUES
(1, 'Bushmead', 'bushmead', '/to_import/bushmead.xlsx', 0, NULL, 'estate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL),
(2, 'sydney', 'sydney', '/to_import/sydney.xlsx', 0, NULL, 'estate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `is_poa` tinyint(1) DEFAULT NULL,
  `area` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_id` int(10) UNSIGNED DEFAULT NULL,
  `override_status_id` int(10) UNSIGNED DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `points` text COLLATE utf8_unicode_ci,
  `center_x` decimal(12,8) DEFAULT NULL,
  `center_y` decimal(12,8) DEFAULT NULL,
  `automatic_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `override_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_fields` text COLLATE utf8_unicode_ci,
  `sort_order` int(11) NOT NULL DEFAULT '999',
  `section_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `via_runway` tinyint(1) NOT NULL DEFAULT '0',
  `via_import` int(11) NOT NULL DEFAULT '0',
  `lot_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `runway_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `name`, `price`, `is_poa`, `area`, `status_id`, `override_status_id`, `image`, `points`, `center_x`, `center_y`, `automatic_image`, `override_image`, `custom_fields`, `sort_order`, `section_id`, `created_at`, `updated_at`, `deleted_at`, `via_runway`, `via_import`, `lot_id`, `runway_status`) VALUES
(2, 'Lot 105, Stage 2 Calibre, sydney', NULL, NULL, '445', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"9bf31c7ff062936a96d3c8bd1f8f2ff3":15},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 3, '2018-03-21 09:25:51', '2018-03-21 09:51:33', NULL, 0, 1, '105', NULL),
(3, 'Lot 107, Stage 2 Calibre, sydney', NULL, NULL, '450', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"9bf31c7ff062936a96d3c8bd1f8f2ff3":15},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 3, '2018-03-21 09:25:51', '2018-03-21 09:51:33', NULL, 0, 1, '107', NULL),
(4, 'Lot 108, Stage 2 Calibre, sydney', NULL, NULL, '450', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"9bf31c7ff062936a96d3c8bd1f8f2ff3":15},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 3, '2018-03-21 09:25:51', '2018-03-21 09:51:33', NULL, 0, 1, '108', NULL),
(5, 'Lot 109, Stage 2 Calibre, sydney', NULL, NULL, '450', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"9bf31c7ff062936a96d3c8bd1f8f2ff3":15},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 3, '2018-03-21 09:25:51', '2018-03-21 09:51:33', NULL, 0, 1, '109', NULL),
(6, 'Lot 113, Stage 2 Calibre, sydney', NULL, NULL, '367', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"9bf31c7ff062936a96d3c8bd1f8f2ff3":15},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 3, '2018-03-21 09:25:51', '2018-03-21 09:51:33', NULL, 0, 1, '113', NULL),
(7, 'Lot 146, Stage 1 Overwatch, sydney ', NULL, NULL, '301', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 4, '2018-03-21 09:25:51', '2018-03-21 09:51:33', NULL, 0, 1, '146', NULL),
(8, 'Lot 236, Stage 1 Overwatch, sydney ', NULL, NULL, '381', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 4, '2018-03-21 09:25:51', '2018-03-21 09:51:33', NULL, 0, 1, '236', NULL),
(9, 'Lot 240, Stage 1 Overwatch, sydney ', NULL, NULL, '225', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"0d640498fb206f2d67e1829ba976d945":7.5},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 4, '2018-03-21 09:25:51', '2018-03-21 09:51:34', NULL, 0, 1, '240', NULL),
(11, 'Lot 242, Stage 1 Overwatch, Bushmead ', NULL, NULL, '225', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"0d640498fb206f2d67e1829ba976d945":7.5},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 2, '2018-03-21 09:25:51', '2018-03-21 09:25:51', NULL, 0, 1, '242', NULL),
(12, 'Lot 243, Stage 1 Overwatch, Bushmead ', NULL, NULL, '180', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"1679091c5a880faf6fb5e6087eb1b2dc":6},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 2, '2018-03-21 09:25:51', '2018-03-21 09:25:51', NULL, 0, 1, '243', NULL),
(13, 'Lot 244, Stage 1 Overwatch, Bushmead ', NULL, NULL, '180', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"1679091c5a880faf6fb5e6087eb1b2dc":6},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 2, '2018-03-21 09:25:52', '2018-03-21 09:25:52', NULL, 0, 1, '244', NULL),
(44, 'Lot 104, Stage 2 Calibre, sydney', NULL, NULL, '370', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"9bf31c7ff062936a96d3c8bd1f8f2ff3":15},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 3, '2018-03-21 09:43:50', '2018-03-21 10:19:36', NULL, 0, 1, '104', NULL),
(45, 'Lot 104, Stage 2 Calibre, Bushmead', NULL, NULL, '370', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"9bf31c7ff062936a96d3c8bd1f8f2ff3":15},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 1, '2018-03-21 09:53:48', '2018-03-21 09:53:48', NULL, 0, 1, '104', NULL),
(46, 'Lot 105, Stage 2 Calibre, Bushmead', NULL, NULL, '445', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"9bf31c7ff062936a96d3c8bd1f8f2ff3":15},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 1, '2018-03-21 09:53:49', '2018-03-21 09:53:49', NULL, 0, 1, '105', NULL),
(47, 'Lot 107, Stage 2 Calibre, Bushmead', NULL, NULL, '450', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"9bf31c7ff062936a96d3c8bd1f8f2ff3":15},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 1, '2018-03-21 09:53:49', '2018-03-21 09:53:49', NULL, 0, 1, '107', NULL),
(48, 'Lot 108, Stage 2 Calibre, Bushmead', NULL, NULL, '450', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"9bf31c7ff062936a96d3c8bd1f8f2ff3":15},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 1, '2018-03-21 09:53:49', '2018-03-21 09:53:49', NULL, 0, 1, '108', NULL),
(49, 'Lot 109, Stage 2 Calibre, Bushmead', NULL, NULL, '450', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"9bf31c7ff062936a96d3c8bd1f8f2ff3":15},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 1, '2018-03-21 09:53:49', '2018-03-21 09:53:49', NULL, 0, 1, '109', NULL),
(50, 'Lot 113, Stage 2 Calibre, Bushmead', NULL, NULL, '367', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"9bf31c7ff062936a96d3c8bd1f8f2ff3":15},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 1, '2018-03-21 09:53:49', '2018-03-21 09:53:49', NULL, 0, 1, '113', NULL),
(51, 'Lot 146, Stage 1 Overwatch, Bushmead ', NULL, NULL, '301', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 2, '2018-03-21 09:53:49', '2018-03-21 09:53:49', NULL, 0, 1, '146', NULL),
(52, 'Lot 236, Stage 1 Overwatch, Bushmead ', NULL, NULL, '381', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 2, '2018-03-21 09:53:49', '2018-03-21 09:53:49', NULL, 0, 1, '236', NULL),
(53, 'Lot 240, Stage 1 Overwatch, Bushmead ', NULL, NULL, '225', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"0d640498fb206f2d67e1829ba976d945":7.5},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 2, '2018-03-21 09:53:49', '2018-03-21 09:53:49', NULL, 0, 1, '240', NULL),
(54, 'Lot 241, Stage 1 Overwatch, Bushmead ', NULL, NULL, '240', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"c9f0f895fb98ab9159f51fd0297e236d":8},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 2, '2018-03-21 09:53:49', '2018-03-21 09:53:49', NULL, 0, 1, '241', NULL),
(71, 'Lot 246, Stage 1 Overwatch, Bushmead ', NULL, NULL, '180', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"1679091c5a880faf6fb5e6087eb1b2dc":6},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 2, '2018-03-21 10:17:18', '2018-03-21 10:17:18', NULL, 0, 1, '246', NULL),
(72, 'Lot 247, Stage 1 Overwatch, Bushmead ', NULL, NULL, '180', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"1679091c5a880faf6fb5e6087eb1b2dc":6},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 2, '2018-03-21 10:17:18', '2018-03-21 10:17:18', NULL, 0, 1, '247', NULL),
(73, 'Lot 248, Stage 1 Overwatch, Bushmead ', NULL, NULL, '224', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"0d640498fb206f2d67e1829ba976d945":7.5},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 2, '2018-03-21 10:17:18', '2018-03-21 10:17:18', NULL, 0, 1, '248', NULL),
(74, 'Lot 249, Stage 1 Overwatch, Bushmead ', NULL, NULL, '225', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"0d640498fb206f2d67e1829ba976d945":7.5},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 2, '2018-03-21 10:17:18', '2018-03-21 10:17:18', NULL, 0, 1, '249', NULL),
(75, 'Lot 250, Stage 1 Overwatch, Bushmead ', NULL, NULL, '180', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"1679091c5a880faf6fb5e6087eb1b2dc":6},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 2, '2018-03-21 10:17:18', '2018-03-21 10:17:18', NULL, 0, 1, '250', NULL),
(76, 'Lot 251, Stage 1 Overwatch, Bushmead ', NULL, NULL, '180', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"1679091c5a880faf6fb5e6087eb1b2dc":6},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 2, '2018-03-21 10:17:18', '2018-03-21 10:17:18', NULL, 0, 1, '251', NULL),
(77, 'Lot 252, Stage 1 Overwatch, Bushmead ', NULL, NULL, '180', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"1679091c5a880faf6fb5e6087eb1b2dc":6},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 2, '2018-03-21 10:17:18', '2018-03-21 10:17:18', NULL, 0, 1, '252', NULL),
(78, 'Lot 253, Stage 1 Overwatch, Bushmead ', NULL, NULL, '180', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"1679091c5a880faf6fb5e6087eb1b2dc":6},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 2, '2018-03-21 10:17:18', '2018-03-21 10:17:18', NULL, 0, 1, '253', NULL),
(79, 'Lot 255, Stage 1 Overwatch, Bushmead ', NULL, NULL, '180', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"1679091c5a880faf6fb5e6087eb1b2dc":6},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 2, '2018-03-21 10:17:18', '2018-03-21 10:17:18', NULL, 0, 1, '255', NULL),
(80, 'Lot 59, Stage 2 Calibre, Bushmead', NULL, NULL, '510', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"70efdf2ec9b086079795c442636b55fb":17},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 1, '2018-03-21 10:17:18', '2018-03-21 10:17:18', NULL, 0, 1, '59', NULL),
(81, 'Lot 60, Stage 2 Calibre, Bushmead', NULL, NULL, '510', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"70efdf2ec9b086079795c442636b55fb":17},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 1, '2018-03-21 10:17:18', '2018-03-21 10:17:18', NULL, 0, 1, '60', NULL),
(82, 'Lot 61, Stage 2 Calibre, Bushmead', NULL, NULL, '510', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"70efdf2ec9b086079795c442636b55fb":17},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 1, '2018-03-21 10:17:18', '2018-03-21 10:17:18', NULL, 0, 1, '61', NULL),
(83, 'Lot 64, Stage 2 Calibre, Bushmead', NULL, NULL, '510', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"70efdf2ec9b086079795c442636b55fb":17},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 1, '2018-03-21 10:17:18', '2018-03-21 10:17:18', NULL, 0, 1, '64', NULL),
(84, 'Lot 66, Stage 2 Calibre, Bushmead', NULL, NULL, '519', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"aab7d9999e13470c54d4539b05703776":17.3},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 1, '2018-03-21 10:17:18', '2018-03-21 10:17:18', NULL, 0, 1, '66', NULL),
(85, 'Lot 83, Stage 2 Calibre, Bushmead', NULL, NULL, '445', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"9bf31c7ff062936a96d3c8bd1f8f2ff3":15},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 1, '2018-03-21 10:17:18', '2018-03-21 10:17:18', NULL, 0, 1, '83', NULL),
(86, 'Lot 85, Stage 2 Calibre, Bushmead', NULL, NULL, '370', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{"9bf31c7ff062936a96d3c8bd1f8f2ff3":15},{"d41d8cd98f00b204e9800998ecf8427e":null},{"d41d8cd98f00b204e9800998ecf8427e":null}]', 999, 1, '2018-03-21 10:17:18', '2018-03-21 10:17:18', NULL, 0, 1, '85', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_widescreen` tinyint(1) NOT NULL DEFAULT '0',
  `points` text COLLATE utf8_unicode_ci,
  `tier_three` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '999',
  `pdf_optional_note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdf_section` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdf` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `stage_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `via_runway` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `name`, `uid`, `is_active`, `image`, `is_widescreen`, `points`, `tier_three`, `sort_order`, `pdf_optional_note`, `pdf_section`, `pdf`, `project_id`, `stage_id`, `created_at`, `updated_at`, `deleted_at`, `via_runway`) VALUES
(1, 'Bushmead-Stage 2 Calibre', NULL, 0, NULL, 0, NULL, NULL, 999, NULL, NULL, NULL, 1, NULL, '2018-03-21 09:25:51', '2018-03-21 09:25:51', NULL, 0),
(2, 'Bushmead-Stage 1 Overwatch ', NULL, 0, NULL, 0, NULL, NULL, 999, NULL, NULL, NULL, 1, NULL, '2018-03-21 09:25:51', '2018-03-21 09:25:51', NULL, 0),
(3, 'sydney-Stage 2 Calibre', NULL, 0, NULL, 0, NULL, NULL, 999, NULL, NULL, NULL, 2, NULL, '2018-03-21 09:51:33', '2018-03-21 09:51:33', NULL, 0),
(4, 'sydney-Stage 1 Overwatch ', NULL, 0, NULL, 0, NULL, NULL, 999, NULL, NULL, NULL, 2, NULL, '2018-03-21 09:51:33', '2018-03-21 09:51:33', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('simple','icon','price') COLLATE utf8_unicode_ci NOT NULL,
  `show_pdf` tinyint(1) DEFAULT NULL,
  `allow_enquiry` tinyint(1) DEFAULT NULL,
  `foreground` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `background` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '999',
  `project_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `code`, `description`, `type`, `show_pdf`, `allow_enquiry`, `foreground`, `background`, `sort_order`, `project_id`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Released', 'simple', NULL, NULL, '', '', 999, 1, '2018-03-21 09:25:51', '2018-03-21 09:25:51'),
(2, NULL, 'Released', 'simple', NULL, NULL, '', '', 999, 2, '2018-03-21 09:51:33', '2018-03-21 09:51:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `properties_section_id_foreign` (`section_id`),
  ADD KEY `properties_status_id_foreign` (`status_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sections_project_id_foreign` (`project_id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `statuses_project_id_foreign` (`project_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
