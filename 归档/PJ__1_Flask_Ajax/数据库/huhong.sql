-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 09, 2021 at 04:56 AM
-- Server version: 5.6.35
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `huhong`
--

-- --------------------------------------------------------

--
-- Table structure for table `Scores`
--

CREATE TABLE `Scores` (
  `US_NAME` varchar(10) NOT NULL,
  `US_SCORES` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户积分表';

--
-- Dumping data for table `Scores`
--

INSERT INTO `Scores` (`US_NAME`, `US_SCORES`) VALUES
('admin', 10000420),
('admin2', 10),
('admin3', 110),
('user', 20),
('test', 10);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `US_ID` int(10) NOT NULL,
  `US_NAME` varchar(20) NOT NULL COMMENT '用户名',
  `US_PSWORD` varchar(20) NOT NULL COMMENT '密码',
  `US_EMAIL` varchar(50) NOT NULL COMMENT 'E-mail',
  `US_REALNAME` varchar(20) NOT NULL COMMENT '真实姓名',
  `US_SEX` int(1) NOT NULL COMMENT '用户性别(女为1,男为0)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`US_ID`, `US_NAME`, `US_PSWORD`, `US_EMAIL`, `US_REALNAME`, `US_SEX`) VALUES
(10000000, 'admin', 'admin', 'admin@email.com', 'admin', 0),
(10000001, 'test', 'test', 'test@email.com', 'test', 0),
(10000004, 'admin_SQL_test1', '123456', 'email@email.com', 'SQL_TEST', 0),
(10000022, 'user', 'user', 'email@email.com', 'SQL_TEST', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Ware`
--

CREATE TABLE `Ware` (
  `WE_ID` int(10) NOT NULL COMMENT '商品编号',
  `WE_NAME` varchar(128) NOT NULL COMMENT '商品名称',
  `WE_PRICE` int(8) NOT NULL DEFAULT '999999' COMMENT '价格',
  `WE_TYPE` int(10) NOT NULL COMMENT '商品分类编号',
  `WE_SELLERID` int(10) NOT NULL COMMENT '卖家编号',
  `WE_SELLED` int(10) NOT NULL COMMENT '销量',
  `WE_COMMENT` int(20) NOT NULL COMMENT '评论数',
  `WE_IMG` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Ware`
--

INSERT INTO `Ware` (`WE_ID`, `WE_NAME`, `WE_PRICE`, `WE_TYPE`, `WE_SELLERID`, `WE_SELLED`, `WE_COMMENT`, `WE_IMG`) VALUES
(1, '牛仔裤', 127, 2, 1, 58, 0, 'https://img12.360buyimg.com/n7/jfs/t1/152890/11/19445/131634/6036129cE280294fc/fb50a3cafb0d321d.jpg'),
(2, '羊毛裤', 279, 2, 1, 23, 6, 'https://img13.360buyimg.com/n7/jfs/t1/163682/39/1240/199120/5ff560b6E21b41cca/6220e5330798c67f.png'),
(3, '耐克训练裤', 199, 2, 1, 157, 23, 'https://img10.360buyimg.com/n7/jfs/t1/163974/5/9520/232870/6042eb51Eadcc424a/a442583826957ce6.jpg'),
(4, '坎肩', 128, 3, 2, 26, 21, 'https://img14.360buyimg.com/n7/jfs/t1/120326/23/13046/333536/5f64e53aE09418378/bd388f5e026b6d9b.jpg'),
(5, '牛仔裤', 88, 2, 2, 29, 5, 'https://img11.360buyimg.com/n8/jfs/t1/114230/38/16767/210694/5f4e0f4fEb4bc48cc/3eeb3555f7563927.jpg'),
(6, '羊毛袜', 69, 4, 1, 26, 12, 'https://img12.360buyimg.com/n7/jfs/t1/96617/12/16727/326119/5e816b3aE44bcf5ce/4f008146bc5921ad.jpg'),
(7, '羊毛袜', 39, 4, 3, 168, 86, 'https://img14.360buyimg.com/n7/jfs/t1/149393/26/15518/155162/5fbc9da2Ea23e3fe8/9dfa1997774e1547.jpg'),
(8, 'Ubras欧阳娜娜同款无尺码文胸无痕', 119, 5, 2, 2000, 186, 'https://img10.360buyimg.com/n7/jfs/t1/147362/38/8751/87081/5f644505E92ecf73e/b295dc1b86752066.jpg'),
(9, '猫人2件装无钢圈文胸女士内衣女可调节肩带美背抹胸女士运动无缝内衣', 60, 5, 2, 15888, 1222, 'https://img14.360buyimg.com/n7/jfs/t1/151406/12/19313/129052/602fa00cEaa3468b3/89517fbf8566f585.jpg'),
(10, '【券后预估价：59】361女鞋运动鞋', 59, 1, 3, 158, 32, 'http://img3m0.ddimg.cn/2/13/1870576490-1_b_3.jpg'),
(11, '安踏男鞋秋冬季缓震耐磨运动鞋男士', 139, 1, 1, 222, 158, 'http://img3m5.ddimg.cn/37/14/1687658185-1_b_5.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`US_ID`),
  ADD UNIQUE KEY `US_ID` (`US_ID`),
  ADD KEY `US_ID_2` (`US_ID`);

--
-- Indexes for table `Ware`
--
ALTER TABLE `Ware`
  ADD PRIMARY KEY (`WE_ID`),
  ADD UNIQUE KEY `WE_ID` (`WE_ID`),
  ADD KEY `WE_ID_2` (`WE_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `US_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10000023;
--
-- AUTO_INCREMENT for table `Ware`
--
ALTER TABLE `Ware`
  MODIFY `WE_ID` int(10) NOT NULL AUTO_INCREMENT COMMENT '商品编号', AUTO_INCREMENT=12;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
