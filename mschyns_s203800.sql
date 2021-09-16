-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mer 15 Septembre 2021 à 19:40
-- Version du serveur :  5.5.60-MariaDB
-- Version de PHP :  7.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `mschyns_s203800`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `id` int(11) NOT NULL,
  `country` int(11) NOT NULL,
  `city` varchar(100) NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `street` varchar(255) NOT NULL,
  `number` varchar(20) NOT NULL,
  `box` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `aircraft`
--

CREATE TABLE IF NOT EXISTS `aircraft` (
  `id` int(11) NOT NULL,
  `capacity` int(11) NOT NULL,
  `type` enum('Boeing 737','Boeing 747','Boeing 757') NOT NULL,
  `purchase_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `maintenance_id` int(11) NOT NULL,
  `suuplier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `airport`
--

CREATE TABLE IF NOT EXISTS `airport` (
  `id` int(11) NOT NULL,
  `short_name` int(11) NOT NULL COMMENT '3 letters id',
  `long_name` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `altitude` int(11) NOT NULL,
  `country` varchar(255) NOT NULL,
  `timezone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL,
  `TVA_number` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address_id` int(11) NOT NULL,
  `tel_num` varchar(255) NOT NULL,
  `date_became_client` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `company`
--

CREATE TABLE IF NOT EXISTS `company` (
  `tva_number` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `crew_members`
--

CREATE TABLE IF NOT EXISTS `crew_members` (
  `flight_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `manager_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `emp_no` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `address_id` int(11) NOT NULL,
  `gender` enum('M','F','O') NOT NULL,
  `hire_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `birth_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `email` varchar(255) NOT NULL,
  `mobile_number` varchar(255) NOT NULL,
  `job_id` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `retired` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `flight`
--

CREATE TABLE IF NOT EXISTS `flight` (
  `id` int(11) NOT NULL,
  `airport_departure` int(11) NOT NULL,
  `airport_arrival` int(11) NOT NULL,
  `products_details` int(11) NOT NULL,
  `departure_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `arrival_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `crew_members_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `job`
--

CREATE TABLE IF NOT EXISTS `job` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `job_detail`
--

CREATE TABLE IF NOT EXISTS `job_detail` (
  `id_job` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_date` timestamp NULL DEFAULT NULL,
  `type` enum('CDI','CDD','internship','other') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `maintenance`
--

CREATE TABLE IF NOT EXISTS `maintenance` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `aircraft_id` int(11) NOT NULL,
  `status` enum('to do','in progress','completed') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `maintenance_employee`
--

CREATE TABLE IF NOT EXISTS `maintenance_employee` (
  `id` int(11) NOT NULL,
  `maintenance_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `details` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `shipment`
--

CREATE TABLE IF NOT EXISTS `shipment` (
  `flight_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `supplier`
--

CREATE TABLE IF NOT EXISTS `supplier` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `supplier_type`
--

CREATE TABLE IF NOT EXISTS `supplier_type` (
  `id` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `vehicle`
--

CREATE TABLE IF NOT EXISTS `vehicle` (
  `id` int(11) NOT NULL,
  `immatriculation_number` varchar(255) NOT NULL,
  `type_id` int(11) NOT NULL,
  `maintenance_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `supplier_id` int(11) NOT NULL,
  `purchase_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `vehicle_type`
--

CREATE TABLE IF NOT EXISTS `vehicle_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `aircraft`
--
ALTER TABLE `aircraft`
  ADD PRIMARY KEY (`id`),
  ADD KEY `maintenance_id` (`maintenance_id`),
  ADD KEY `suuplier_id` (`suuplier_id`);

--
-- Index pour la table `airport`
--
ALTER TABLE `airport`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `address_id` (`address_id`);

--
-- Index pour la table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`tva_number`),
  ADD KEY `address_id` (`address_id`);

--
-- Index pour la table `crew_members`
--
ALTER TABLE `crew_members`
  ADD PRIMARY KEY (`flight_id`,`employee_id`),
  ADD KEY `flight_id` (`flight_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Index pour la table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manager_id` (`manager_id`);

--
-- Index pour la table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_no`),
  ADD KEY `address_id` (`address_id`),
  ADD KEY `job_id` (`job_id`),
  ADD KEY `dep_id` (`dep_id`);

--
-- Index pour la table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`id`),
  ADD KEY `airport_departure` (`airport_departure`),
  ADD KEY `airport_arrival` (`airport_arrival`),
  ADD KEY `products_details` (`products_details`),
  ADD KEY `crew_members_id` (`crew_members_id`);

--
-- Index pour la table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `job_detail`
--
ALTER TABLE `job_detail`
  ADD PRIMARY KEY (`id_job`,`id_employee`),
  ADD KEY `id_employee` (`id_employee`);

--
-- Index pour la table `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aircraft_id` (`aircraft_id`);

--
-- Index pour la table `maintenance_employee`
--
ALTER TABLE `maintenance_employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `maintenance_id` (`maintenance_id`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `shipment`
--
ALTER TABLE `shipment`
  ADD PRIMARY KEY (`flight_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Index pour la table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `address_id` (`address_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Index pour la table `supplier_type`
--
ALTER TABLE `supplier_type`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Index pour la table `vehicle_type`
--
ALTER TABLE `vehicle_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `aircraft`
--
ALTER TABLE `aircraft`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `employee`
--
ALTER TABLE `employee`
  MODIFY `emp_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `supplier_type`
--
ALTER TABLE `supplier_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `vehicle_type`
--
ALTER TABLE `vehicle_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `aircraft`
--
ALTER TABLE `aircraft`
  ADD CONSTRAINT `aircraft_ibfk_2` FOREIGN KEY (`suuplier_id`) REFERENCES `supplier` (`id`),
  ADD CONSTRAINT `aircraft_ibfk_1` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenance` (`id`);

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`);

--
-- Contraintes pour la table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`);

--
-- Contraintes pour la table `crew_members`
--
ALTER TABLE `crew_members`
  ADD CONSTRAINT `crew_members_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`id`),
  ADD CONSTRAINT `crew_members_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`emp_no`);

--
-- Contraintes pour la table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`emp_no`);

--
-- Contraintes pour la table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`),
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`dep_id`) REFERENCES `department` (`id`);

--
-- Contraintes pour la table `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`airport_departure`) REFERENCES `airport` (`id`),
  ADD CONSTRAINT `flight_ibfk_2` FOREIGN KEY (`airport_arrival`) REFERENCES `airport` (`id`);

--
-- Contraintes pour la table `job_detail`
--
ALTER TABLE `job_detail`
  ADD CONSTRAINT `job_detail_ibfk_2` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`emp_no`),
  ADD CONSTRAINT `job_detail_ibfk_1` FOREIGN KEY (`id_job`) REFERENCES `job` (`id`);

--
-- Contraintes pour la table `maintenance`
--
ALTER TABLE `maintenance`
  ADD CONSTRAINT `maintenance_ibfk_1` FOREIGN KEY (`aircraft_id`) REFERENCES `aircraft` (`id`);

--
-- Contraintes pour la table `maintenance_employee`
--
ALTER TABLE `maintenance_employee`
  ADD CONSTRAINT `maintenance_employee_ibfk_2` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `maintenance_employee_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`emp_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `shipment`
--
ALTER TABLE `shipment`
  ADD CONSTRAINT `shipment_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `shipment_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`id`);

--
-- Contraintes pour la table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `supplier_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `supplier_type` (`id`);

--
-- Contraintes pour la table `vehicle`
--
ALTER TABLE `vehicle`
  ADD CONSTRAINT `vehicle_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`),
  ADD CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `vehicle_type` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
