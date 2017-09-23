-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2017 at 09:03 AM
-- Server version: 5.7.9
-- PHP Version: 5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminlogin`
--

DROP TABLE IF EXISTS `adminlogin`;
CREATE TABLE IF NOT EXISTS `adminlogin` (
  `id` varchar(20) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adminlogin`
--

INSERT INTO `adminlogin` (`id`, `pass`) VALUES
('aasif001', 'khan123');

-- --------------------------------------------------------

--
-- Table structure for table `ordertbl`
--

DROP TABLE IF EXISTS `ordertbl`;
CREATE TABLE IF NOT EXISTS `ordertbl` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `pname` varchar(50) NOT NULL,
  `remark` varchar(50) NOT NULL,
  `odate` date NOT NULL,
  `rdate` date NOT NULL,
  `email` varchar(250) NOT NULL,
  `fname` varchar(50) NOT NULL,
  PRIMARY KEY (`oid`),
  KEY `fk_pid` (`pid`),
  KEY `fk_pname` (`pname`),
  KEY `fk_email` (`email`),
  KEY `fk_fname` (`fname`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `txn_id` varchar(255) NOT NULL,
  `payment_gross` float(10,2) NOT NULL,
  `currency_code` varchar(5) NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `vid` int(11) NOT NULL,
  `pname` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `qty` int(5) NOT NULL,
  `entrydate` date NOT NULL,
  `pdesc` varchar(1000) NOT NULL,
  `purl` varchar(250) NOT NULL,
  `remark` varchar(250) DEFAULT NULL,
  `ptype` varchar(20) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pid`, `vid`, `pname`, `price`, `qty`, `entrydate`, `pdesc`, `purl`, `remark`, `ptype`) VALUES
(1, 1, 'VOLTAS 2 Ton Window AC', 7500, 1, '2017-09-12', 'The peace full sleep at anytime and the fight to hot summer..\r\nperfect choice for home and offices', 'bootstrap/image/ac1.jpeg', 'AC', 'AC'),
(2, 2, 'AC 1.5 ton', 100.67, 1, '2017-09-04', 'Looking for an AC that''s both reliable and effective? Then meet the Micromax Split AC - the AC that understands you and your family and offers effective cooling to make summers comfortable. ', 'bootstrap/image/ac2.jpeg', 'dqwdqwdqw', 'AC'),
(3, 3, 'AC 2.5 ton voltas', 66633, 1, '2017-09-20', 'Your Answer to Blissful Sleep\r\n\r\nHow many times have you woken up in the middle of the night to switch the AC off because it got too cold? Well, gone are those days, thanks to the Kamin function of this AC. By warming the room by up to 1°C every hour (for a max of four hours), this AC not only helps you enjoy an ideal temperature, but also undisturbed sleep all night long.\r\nPerfect Cooling Experience\r\n\r\nFeeling hot and humid? Say no more, you just got lucky. The Auto Climate technology and Auto Humid control feature in the AC sense the ambient heat and humidity of your room and adjust the temperature and fan speed accordingly, helping you relax.\r\n', 'bootstrap/image/ac3.jpeg', 'nice ac', 'AC'),
(4, 4, 'Onida 1.5 Ton 5 Star ', 600, 1, '2017-09-20', '1.5 Ton : Great for medium sized rooms (110-150 sq ft)\r\n5 Star : For energy savings upto 25% (compared to Non-Inverter 1 Star)\r\nAuto Restart: No need to manually reset the settings post power-cut', 'bootstrap/image/ac6.jpg', 'Onida window AC', 'AC'),
(5, 5, 'Vu 80cm (32 inch) HD Ready LED TV  ', 66633, 1, '2017-09-15', 'Awesome Viewing from All Angles\r\n\r\nIs there a single spot in your living room that everyone fights for as it offers the best viewing angle for your TV? Well, you can say goodbye to that fight, thanks to the 178-degree viewing angle of this TV. Now, you can get an enjoyable experience from almost anywhere in the room.\r\n', 'bootstrap/image/tv2.jpeg', 'good tv', 'TV'),
(6, 6, 'Vu 109cm (43 inch) Full HD LED TV  ', 142323, 2, '2017-09-18', 'Movies, games, music, and sports events, you can catch them all in stunning clarity on this Full-HD LED TV from Vu. Its IPS panel technology protects the TV ''s display from external pressure and gives you ripple-free images. This TV also packs an Advanced Micro Lens Optical design IPS panel which facilitates high transmittance of every picture to bring you a truly High Definition feel. To add to your experience is this TV’s jumbo-sized box-type design speakers which create stereo separation, thereby allowing it to deliver a stadium-like surround-sound experience.', 'bootstrap/image/tv3.jpeg', 'good tv', 'TV'),
(7, 7, 'Noble Skiodo 55cm (22 inch) Full HD LED TV  ', 66633, 1, '2017-09-15', 'Experience entertainment in its pure form on this Noble Skiodo TV’s large 55 cm (22) screen. This TV’s zero dot screen eliminates unnecessary noise so you can enjoy crystal-clear images. This is backed by its powerful speakers which offer you an immersive audio-visual experience. ', 'bootstrap/image/tv1.jpeg', 'nice tv', 'TV'),
(9, 9, 'LG(24 inch) FHD TV 1080P', 700, 1, '2017-09-05', 'The Heart of a Beast\r\n\r\nDo you want higher levels of colour, contrast and clarity on your TV, along with the best possible picture, quality and performance? If yes, then this TV is perfect for you. It comes with LG’s Triple XD Engine, so you can experience your favourite action or superhero movies in better quality.\r\n\r\nGame On\r\n\r\nLove playing games occasionally, but don’t wish to invest on a console? Then this TV might be the answer. Bundled with a bunch of games already installed in it, you’ll have a wonderful time playing them. If not you, why not let your kids have some fun?\r\n\r\n', 'bootstrap/image/tv4.jpeg', 'FHD TV', 'TV');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
CREATE TABLE IF NOT EXISTS `registration` (
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(250) NOT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `pass` varchar(30) NOT NULL,
  `repass` varchar(30) NOT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `country` varchar(15) NOT NULL,
  `utype` varchar(6) NOT NULL DEFAULT 'NORMAL',
  PRIMARY KEY (`email`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`fname`, `lname`, `email`, `mobile`, `pass`, `repass`, `gender`, `country`, `utype`) VALUES
('Aasif', 'pathan', 'aasifk757@gmail.com', '9033363354', '123', '123', 'male', 'India', 'NORMAL'),
('Aasif', 'Pathan', 'admin@admin.in', '8460624304', 'adm', 'adm', 'male', 'India', 'ADMIN'),
('sohel', 'Pathan', 'sohel@gmail.com', '9033123124', '123', '123', 'male', 'US', 'NORMAL'),
('javed', 'Pathan', 'javed@gmail.com', '9033123125', '123', '123', 'male', 'US', 'NORMAL'),
('nisha', 'mistry', 'nisha@gmail.com', '9033123128', '123', '123', 'female', 'india', 'NORMAL'),
('neha', 'agrawal', 'neha@gmail.com', '9033123122', '123', '123', 'female', 'india', 'NORMAL'),
('mark', 'steve', 'mark@gmail.com', '9033128981', '123', '123', 'male', 'AUS', 'normal'),
('Ishrat', 'Chowwala', 'ishu@gmail.com', '9464425251', 'ishu143', 'ishu143', 'others', 'India', 'Normal'),
('Nasrin', 'Pathan', 'nasrin@gmail.com', '9016489524', 'angel143', 'angel143', 'female', 'India', 'Normal'),
('Sahena', 'Mansuri', 'sahena@gmail.com', '9076543346', 'sahu', 'sahu', 'female', 'US', 'Normal'),
('Fahim', 'Hotelwala', 'fahim@gmail.com', '9723135101', 'fahim11', 'fahim11', 'male', 'India', 'Normal'),
('Muffasil', 'Lightwala', 'mufa@gmail.com', '9723249664', 'mufa111', 'mufa111', 'male', 'India', 'Normal'),
('Saddam', 'Chauhan', 'saddam@yahoo.in', '9979812345', 'saddam99', 'saddam99', 'male', 'India', 'Normal'),
('Idris', 'Shaikh', 'idris09@gmail.com', '9879896477', 'idris09', 'idris089', 'male', 'India', 'Normal');

-- --------------------------------------------------------

--
-- Table structure for table `vendorreg`
--

DROP TABLE IF EXISTS `vendorreg`;
CREATE TABLE IF NOT EXISTS `vendorreg` (
  `vid` int(11) NOT NULL AUTO_INCREMENT,
  `vname` varchar(40) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `regdate` date NOT NULL,
  `utype` varchar(6) NOT NULL DEFAULT 'VENDOR',
  `pass` varchar(30) NOT NULL,
  `repass` varchar(30) NOT NULL,
  PRIMARY KEY (`vid`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `contact` (`mobile`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendorreg`
--

INSERT INTO `vendorreg` (`vid`, `vname`, `address`, `city`, `state`, `email`, `mobile`, `regdate`, `utype`, `pass`, `repass`) VALUES
(1, 'Nasrin', 'wadi taiwada', 'vadodara', 'gujarat', 'nasrin@gmail.com', '9016489524', '2017-09-17', 'VENDOR', '123', '123');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
