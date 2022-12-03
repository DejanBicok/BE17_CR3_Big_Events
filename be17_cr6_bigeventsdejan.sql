-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2022 at 02:40 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `be17_cr6_bigeventsdejan`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20221202090320', '2022-12-02 10:03:32', 44);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacity` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `name`, `date`, `description`, `picture`, `capacity`, `email`, `phone_number`, `address`, `url`, `type`) VALUES
(4, '\"Ice World\"', '2023-11-19 10:00:00', 'Around 3,000 m2 of pure, mirror-smooth ice - and in the heart of Vienna. Surrounded by atmospheric lighting, gliding through the Rathauspark on icy dream paths with ice skates - this is a true joy for all the senses.\r\nAccompanied by Christmas sounds.', 'iceworld-638b4806a70c0.jpg', '90', 'office@stadtwienmarketing.at', '+43/1/319 82 00-0', 'Rathausplatz, 1010 Wien', 'www.events.wien.info/en/ka2/ice-world/', 'Sports'),
(5, '\"Magic Trumpet\"', '2022-12-02 17:30:00', 'Wolfgang Mair, trumpet\r\nReinhard Schobesberger, organ / piano\r\nWorks by Wolfgang Amadeus Mozart, Johann Sebastian Bach, Franz Schubert, Joseph Haydn and the most beautiful Christmas songs and Christams carols.', 'magictrumpet-638b480f13a1f.jpg', '250', 'tickets@kunstkultur.com', '+43 (0) 1 581 86 40', 'St. Anna Church, Annagasse 3b, 1010 Wien', 'www.annakirche.at', 'Concerts'),
(6, '\"Christmas Village\"', '2022-12-05 11:00:00', 'The Upper Belvedere is not only an overall Baroque work of art but also the home of world-famous artworks, including Gustav Klimt\'s \"The Kiss\". Numerous works by Schiele and Kokoschka can also be seen.', 'belvedere-638b48218c035.jpg', 'Not Limited', 'info@belvedere.at', '+43 1 795 57-0', 'Prinz-Eugen-Straße 27, 1030 Wien', 'www.belvedere.at', 'Advent'),
(7, '\"Winter in the MQ\"', '2022-12-20 16:00:00', 'Winter im MQ\" has always been characterized by its atmospheric, pre-Christmas ambience. Throughout the entire area, artistic impulses and diverse cultural offerings are in unmistakable harmony with encounters and enjoyment.', 'wintermq-638b4ec19cbb0.jpg', '120', 'office@mqw.at', '+43 1 523 58 81', 'Museumsplatz 1, 1070 Vienna', 'www.mqw.at', 'Family'),
(8, '\"The Puss in Boots\"', '2022-12-04 11:00:00', 'Newly told for young people of today - based on the fairy tale of the Brothers Grimm.\r\n\r\nInteractively, children between the ages of 4 and 10 learn that you can achieve something if you believe in yourself.', 'theboots-638b4eb2620c6.jpg', '350', 'info@hdm.at', '+43 1 513 48 50', 'Seilerstätte 30, 1010 Vienna', 'www.hausdermusik.com', 'Musical');

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
