-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 2021-03-10 16:47:22
-- 服务器版本： 5.6.35
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projectII`
--
CREATE DATABASE IF NOT EXISTS `projectII` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `projectII`;

-- --------------------------------------------------------

--
-- 表的结构 `Scores`
--

CREATE TABLE `Scores` (
  `NAME` varchar(10) NOT NULL,
  `SCORES` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户积分表';

--
-- 转存表中的数据 `Scores`
--

INSERT INTO `Scores` (`NAME`, `SCORES`) VALUES
('admin', 10000440),
('admin2', 10),
('admin3', 110),
('user', 20),
('test', 10);

-- --------------------------------------------------------

--
-- 表的结构 `Users`
--

CREATE TABLE `Users` (
  `ID` int(10) NOT NULL,
  `NAME` varchar(20) NOT NULL COMMENT '用户名',
  `PSWORD` varchar(20) NOT NULL COMMENT '密码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- 转存表中的数据 `Users`
--

INSERT INTO `Users` (`ID`, `NAME`, `PSWORD`) VALUES
(10000000, 'admin', 'admin'),
(10000023, 'admin2', 'None'),
(10000024, 'admin3', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `US_ID_2` (`ID`),
  ADD KEY `US_ID` (`ID`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `Users`
--
ALTER TABLE `Users`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10000025;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
