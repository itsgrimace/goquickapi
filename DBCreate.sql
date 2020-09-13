-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 28, 2020 at 04:10 AM
-- Server version: 5.7.31-0ubuntu0.18.04.1
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `Malabar_DB`
--
CREATE DATABASE IF NOT EXISTS `Malabar_DB` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `Malabar_DB`;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `event_title` varchar(255) NOT NULL,
  `event_description` text NOT NULL,
  `event_private` tinyint(4) NOT NULL,
  `event_active` tinyint(4) NOT NULL,
  `event_keen` tinyint(4) NOT NULL,
  `capacity` int(11) NOT NULL,
  `update_time` datetime NOT NULL,
  `create_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `event_users`
--

CREATE TABLE `event_users` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `approved` tinyint(4) NOT NULL,
  `update_time` datetime NOT NULL,
  `create_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `legends`
--

CREATE TABLE `legends` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `bio` text NOT NULL,
  `approved` tinyint(4) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `update_time` datetime NOT NULL,
  `create_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `legend_skills`
--

CREATE TABLE `legend_skills` (
  `id` int(11) NOT NULL,
  `legend_id` int(11) NOT NULL,
  `source` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `attained_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `create_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `legen_reviews`
--

CREATE TABLE `legend_reviews` (
  `id` int(11) NOT NULL,
  `legend_id` int(11) NOT NULL,
  `rating` tinyint(4) NOT NULL,
  `comment` varchar(511) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `point_location` point NOT NULL,
  `location_name` varchar(255) NOT NULL,
  `location_description` text NOT NULL,
  `location_private` tinyint(4) NOT NULL,
  `location_approved` tinyint(4) NOT NULL,
  `update_time` datetime NOT NULL,
  `create_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `location_activities`
--

CREATE TABLE `location_activities` (
  `id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `difficulty` varchar(63) NOT NULL,
  `description` varchar(511) NOT NULL,
  `update_time` datetime NOT NULL,
  `create_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mates`
--

CREATE TABLE `mates` (
  `id` int(11) NOT NULL,
  `user_1` int(11) NOT NULL,
  `user_2` int(11) NOT NULL,
  `favourite_1` tinyint(4) NOT NULL,
  `favourite_2` tinyint(4) NOT NULL,
  `update_time` datetime NOT NULL,
  `create_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `file_location` varchar(511) NOT NULL,
  `update_time` datetime NOT NULL,
  `create_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(127) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `bio` text NOT NULL,
  `postcode` varchar(32) NOT NULL,
  `push_notifications` tinyint(4) NOT NULL,
  `user_active` tinyint(4) NOT NULL,
  `user_suggestions` tinyint(4) NOT NULL,
  `dob` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `create_time` datetime NOT NULL,
  `last_login` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_activities`
--

CREATE TABLE `user_activities` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `update_time` datetime NOT NULL,
  `create_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_users`
--
ALTER TABLE `event_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `legends`
--
ALTER TABLE `legends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `legend_skills`
--
ALTER TABLE `legend_skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `legen_reviews`
--
ALTER TABLE `legen_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location_activities`
--
ALTER TABLE `location_activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mates`
--
ALTER TABLE `mates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_activities`
--
ALTER TABLE `user_activities`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_users`
--
ALTER TABLE `event_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `legends`
--
ALTER TABLE `legends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `legend_skills`
--
ALTER TABLE `legend_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `legen_reviews`
--
ALTER TABLE `legen_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location_activities`
--
ALTER TABLE `location_activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mates`
--
ALTER TABLE `mates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_activities`
--
ALTER TABLE `user_activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;
