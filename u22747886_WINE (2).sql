-- phpMyAdmin SQL Dump
-- version 5.0.4deb2~bpo10+1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 07, 2023 at 10:57 AM
-- Server version: 10.3.31-MariaDB-0+deb10u1
-- PHP Version: 7.3.31-1~deb10u3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u22747886_WINE`
--

-- --------------------------------------------------------

--
-- Table structure for table `DessertWine`
--

CREATE TABLE `DessertWine` (
  `DessertWineID` int(11) NOT NULL,
  `WineID` int(11) DEFAULT NULL,
  `Sweetness` varchar(255) DEFAULT NULL,
  `IntenseFlavors` varchar(255) DEFAULT NULL,
  `SyrupyTexture` varchar(255) DEFAULT NULL,
  `HighSugarContent` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `DessertWine`
--

INSERT INTO `DessertWine` (`DessertWineID`, `WineID`, `Sweetness`, `IntenseFlavors`, `SyrupyTexture`, `HighSugarContent`) VALUES
(16, 84, 'A luscious and honeyed Sauternes with flavors of apricot, honey, and botrytis.', 'Sémillon, Sauvignon Blanc', '70', '13.5'),
(17, 85, 'A rich and fortified Port with intense flavors of dark fruits, chocolate, and spices.', 'Touriga Nacional, Touriga Franca, Tinta Roriz', '80', '20'),
(18, 86, 'A complex and sweet Tokaji Aszú with flavors of dried fruits, caramel, and botrytis.', 'Furmint, Hárslevelű', '90.99', '11'),
(19, 87, 'A luxurious and concentrated Icewine with intense sweetness and flavors of ripe fruits and honey.', 'Vidal Blanc, Riesling', '90', '9.5'),
(20, 88, 'A light and effervescent Moscato d\'Asti with floral aromas and sweet peach flavors.', 'Moscato Bianco', '90.99', '5.5'),
(21, 89, 'A rich and syrupy Pedro Ximénez with intense flavors of raisins, toffee, and caramel.', 'Pedro Ximénez', '80', '15'),
(22, 90, 'A fortified Banyuls with notes of dark fruits, chocolate, and spices, and a touch of Mediterranean herbs.', 'Grenache', '80', '16'),
(23, 91, 'A sweet and aromatic Late Harvest Riesling with flavors of ripe peaches, honey, and petrol.', 'Riesling', '80', '9'),
(24, 92, 'An aromatic and floral Muscat de Beaumes-de-Venise with flavors of orange blossom, apricot, and honey.', 'Muscat Blanc à Petits Grains', '80', '15.5'),
(25, 93, 'A nutty and oxidized Vin Santo with flavors of dried fruits, toasted almonds, and honey.', 'Trebbiano, Malvasia', '80', '15');

-- --------------------------------------------------------

--
-- Table structure for table `Grape_Varieties`
--

CREATE TABLE `Grape_Varieties` (
  `VarietyID` int(11) NOT NULL,
  `VarietyName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Manager`
--

CREATE TABLE `Manager` (
  `ManagerID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Surname` varchar(255) DEFAULT NULL,
  `Nationality` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Salt` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Manager`
--

INSERT INTO `Manager` (`ManagerID`, `Name`, `Surname`, `Nationality`, `Email`, `Password`, `Salt`) VALUES
(6, 'Bossy', 'Mambozzo', 'Australia', 'witchcraftmoloi@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$YWNNYmNidDZhL0o2aGJOaQ$ULMdFNAX8J5tIRECZS82fQ13Y5aXoAO5V+haM4PKHfg', 'e5uhare278'),
(7, 'Atidumshe', 'Boloi', 'Australia', 'superdumm@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$bWdZcFRvTHYvbW91TnRybQ$l43yVGX7Qa9CTqzpMjmECHRqiqwrYjSnYuHMAVEpOBU', 'duoafvn3bh'),
(8, 'Given', 'Chuake', 'USA', 'mrfrontend@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$QjlvWkFHbDVyLjJFUGZxLw$PEU9y+tql8SdvcYRPrSeyE8H7olpI7nuhdBHOqIrXOs', 'sp10n7jeax'),
(9, 'Rengoku', 'SetYourHeartAblaze', 'AF', 'Hashira1234@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$WU8wTy5iZHhBeThDZUloLg$GkJgTxrYWlgBXqduEwr4cjiiTmt3IF1m9HZwL2xgRgs', 'chzxiwpz9c'),
(10, 'Sengoku', 'Setyou', 'Nigeria', 'yourset@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$UkxyZzkwOHVNNGx3aTZZUQ$v6j0FE4JPD7muw7nLIDF98nTyQg6aUp30Tf3/CPi3As', 'ddo2jv29lo'),
(11, 'Rengoku', 'Chauke', 'AF', 'GTC@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$SXBhQXY4Tmp4VUMwYWlrcA$r5rZMoF5Eq6rVt0pPVGwVHDzGJ8Ji8ZzQmmEv1y2QWc', '7ihe43s7pa'),
(12, 'mulisa', 'idk', 'ZW', 'mulisa@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$OHNPS3RtUUh0OWRRSHhndw$LVNELsKMcwgB7lI/pD3qjLc12Y4VltLxu91Ycge3f/I', 'mfxie42dkn'),
(13, 'Thabiso', 'Matau', 'ZW', 'mulisa1@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$bDBCdWVvZ2xEZnQuSU5zcA$HD8+SC2n7K9xSRV1pGXqLHrgE8AcOlsJ4sHLSqvd7EM', '3k5zz09q9b'),
(14, 'Given', 'SetYourHeartAblaze', 'BD', 'Fortunate1234@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$bnZMNXJJSzdYSEZmei9XQg$GJh2w7MZc4kEPbjw3njvCjSOfE7ZfLfq27Z9TrkPbkc', '0qwlc6tl29'),
(15, 'Rengoku', 'SetYourHeartAblaze', 'AF', 'Hashira12345@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$ZE9rZjY4bjlvSlM4c25xNw$uYFmOUuhlWiMRk5UqUhQX64MB2NHstlEDBnATEZw8PQ', 'uk24yqvsmb'),
(16, 'Mnashe', 'Chauke', 'AF', 'Giza123@mail.com', '$argon2id$v=19$m=65536,t=4,p=1$OW1zbXlhdEFWRGNyeUp2MA$5AiGXkud2h2jJk7CGqPNXWyHwEubj/WkCQ/rizmxK50', 'u0qqnlzevx'),
(17, 'Mnashe', 'Chauke', 'AF', '4@mail.com', '$argon2id$v=19$m=65536,t=4,p=1$bzFLeGNycVVWZkN2VDh2Ng$QXYo69teBta3sD2ZKOwwsZ1INm3GH4fl1o4RjOIu3gY', 'm43sefsfup'),
(18, 'Thabiso', 'Matau', 'ZA', 'mogabudimatau@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$TGczN1h5L3VXOHI0QTBsSw$Oi4oIrJe7iRNQI0cf/cmC7ZGNa0AF1K+j0YTDmyEh2s', 'hpobcfpoq5'),
(19, 'Thabiso', 'Matau', 'ZA', 'chipikechipi@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$dm41MEJSdWROZzkxMjIzSw$KtFcX9FXUSR/BS6U4Mf5uPbsPXkIUeReWKB3x8s6IRg', '6jv8u885lt'),
(20, 'Rengoku', 'SetYourHeartAblaze', 'AF', 'Hashira12434@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$enFQVDR6QnVmU0ZKd09UdQ$ZBphG0RjsJKc+PHHSLsIU6Ab86K/CZfq6eema+FIVxM', '5wtgxcb5rr'),
(21, 'Rengoku', 'SetYourHeartAblaze', 'AF', 'Hashira31234@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$a2dycWpZc21WSVpFT2FzNQ$9/9G+Uaa12GQsrFOij9jmSCwvKubVqu2eiLSjH1aEiY', 'ucc9q89zg1'),
(22, 'Thabiso', 'Matau', 'ZA', 'chipikechipi22@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$QVRleGdQeXJSMVhXZm0xeQ$uPSAWrH6YK2Bf7Cl5U63nwDvf6HqiTtHAwA4QghKkgI', 'oubi5ag6f0'),
(23, 'Thabiso', 'Matau', 'ZA', 'chipikechipi221@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$OUlrdTZhcnJpWk14MVNEeQ$9LEWtOo3tvVeo68S4QY0nB2Jqa+dOVB339MTYQPEPHM', 'apj0a33om4'),
(24, 'brian', 'griffin', 'AS', 'brian4@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$MG12ektHVHl2UkYvbjJHUQ$5BeUquOYxzLlyuLPhKEf77cMcbA4GYA3ChI9yVFUswE', 'dagbcaqagg'),
(25, 'Thabiso', 'Matau', 'ZA', 'magriza@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$WGtOVExyNmFneVVoOTkwRA$y0Oz3VCNK3ZS01g58D/L3a/1Knaq7KtFW0jCRsJFb5Q', 'k9unlahesp'),
(26, 'Atidaishe', 'mupunamunde', 'ZW', 'mupunamunde123@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$VFk1YWw1MEVzNGJCemQxSQ$1r2i7i5zeo46C9CH6V68UQEIqltoN1YSAsHMJ0sdlKU', 'unsao94t7c'),
(27, 'Thabiso', 'Matau', 'BD', 'Thomas12345@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$OGp5UnEyYXE3TklVWHUzVw$A2xbZaAi3LORnAxAXyg2V1eWHTbnQReQ97AqyV7AiPg', 'bfo2gtrj4w'),
(28, 'vino', 'vito', 'AF', 'vino@gmaoil.com', '$argon2id$v=19$m=65536,t=4,p=1$MEpoRDRVSHVCbGhvS1pJQg$PwzTpYVRGqtVeQsMiPiurlBraE708GxXD+EcZCY8ipM', '8h29luavvq'),
(29, 'Giza', 'idk', 'AR', 'gizaa@mail.com', '$argon2id$v=19$m=65536,t=4,p=1$M1duRnhuT3l5NHRpZUtGTg$UNW4NKjiHmK052ja33PtE87iFdX9HL8XPfVh2t3HLlI', 'n5qo8kqy2v'),
(30, 'Thabiso', 'Matau', 'ZA', 'magr@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$YS5tdHBuQVFMdGNsaFZnYQ$66cCvt0FUOISPajtVcXAbz0TdxDiJ4JIh+UiG9i/8Dg', 'iwmmpdqx7o');

-- --------------------------------------------------------

--
-- Table structure for table `Rating`
--

CREATE TABLE `Rating` (
  `RatingID` int(11) NOT NULL,
  `TouristID` int(11) DEFAULT NULL,
  `WineID` int(11) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Rating`
--

INSERT INTO `Rating` (`RatingID`, `TouristID`, `WineID`, `Rating`) VALUES
(1, 36, 5, 3),
(2, 36, 5, 3),
(3, 36, 5, 3),
(4, 38, 7, 0),
(5, 38, 7, 0),
(6, 38, 7, 0),
(7, 38, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `RedWine`
--

CREATE TABLE `RedWine` (
  `RedWineID` int(11) NOT NULL,
  `WineID` int(11) DEFAULT NULL,
  `FullBodied` varchar(255) DEFAULT NULL,
  `RichTannins` varchar(255) DEFAULT NULL,
  `DarkFruitFlavors` varchar(255) DEFAULT NULL,
  `EarthySpicyUndertones` varchar(255) DEFAULT NULL,
  `AgingPotential` varchar(255) DEFAULT NULL,
  `ServeAtRoomTemp` varchar(255) DEFAULT NULL
) ;

--
-- Dumping data for table `RedWine`
--

INSERT INTO `RedWine` (`RedWineID`, `WineID`, `FullBodied`, `RichTannins`, `DarkFruitFlavors`, `EarthySpicyUndertones`, `AgingPotential`, `ServeAtRoomTemp`) VALUES
(1, 62, 'Medium to Full-Bodied', 'Velvety and Supple', 'Black Cherry and Plum', 'Subtle Earthy and Spicy Notes', '5-7 years', 'Yes'),
(2, 63, 'Full-Bodied', 'Bold and Grippy', 'Blackberry and Blueberry', 'Smoky and Peppery Undertones', '8-10 years', 'Yes'),
(3, 60, 'Full-Bodied', 'Rich and Robust', 'Blackcurrant and Cassis', 'Cedar and Tobacco Undertones', '10-15 years', 'Yes'),
(4, 65, 'Medium to Full-Bodied', 'Smooth and Silky', 'Blackberry and Dark Chocolate', 'Hints of Mocha and Spice', '3-5 years', 'Yes'),
(5, 61, 'Medium-Bodied', 'Soft and Elegant', 'Plum and Red Berries', 'Cocoa and Vanilla Undertones', '5-8 years', 'Yes'),
(6, 66, 'Full-Bodied', 'Spicy and Bold', 'Blackberry and Black Pepper', 'Rich and Intense Flavors', '5-7 years', 'Yes'),
(7, 64, 'Full-Bodied', 'Zesty and Spicy', 'Blackberry and Raspberry', 'Black Pepper and Oak Undertones', '7-9 years', 'Yes'),
(8, 67, 'Medium to Full-Bodied', 'Structured and Balanced', 'Cherry and Red Currant', 'Earthy and Herbal Notes', '7-10 years', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `Shops`
--

CREATE TABLE `Shops` (
  `ShopID` int(11) NOT NULL,
  `ShopName` varchar(255) DEFAULT NULL,
  `StreetNo` varchar(50) DEFAULT NULL,
  `StreetName` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Province` varchar(255) DEFAULT NULL,
  `PostalCode` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Shops`
--

INSERT INTO `Shops` (`ShopID`, `ShopName`, `StreetNo`, `StreetName`, `City`, `Province`, `PostalCode`) VALUES
(1, 'The Grapevine', '10', 'Vineyard Avenue', 'Stellenbosch', 'Western Cape', '7600'),
(2, 'Food Fusion', '5', 'Market Street', 'Stellenbosch', 'Western Cape', '7600'),
(3, 'Fresh Delights', '20', 'Beach Road', 'Somerset West', 'Western Cape', '7130'),
(4, 'Green Grocers', '15', 'Gardens Street', 'Somerset West', 'Western Cape', '7130'),
(5, 'Taste of Durbanville', '30', 'Main Road', 'Durbanville', 'Western Cape', '7550'),
(6, 'Gourmet Market', '25', 'Market Street', 'Durbanville', 'Western Cape', '7550'),
(7, 'The Wine Cellar', '40', 'Wine Street', 'Franschhoek', 'Western Cape', '7690'),
(8, 'Farmers Market', '35', 'Vineyard Road', 'Franschhoek', 'Western Cape', '7690'),
(9, 'Urban Harvest', '50', 'Long Street', 'Cape Town', 'Western Cape', '8000'),
(10, 'Fresh Mart', '45', 'Main Road', 'Cape Town', 'Western Cape', '8000'),
(11, 'The Vineyard Store', '60', 'Vineyard Street', 'Paarl', 'Western Cape', '7646'),
(12, 'Farmers Choice', '55', 'Market Road', 'Paarl', 'Western Cape', '7646'),
(13, 'Beachside Groceries', '70', 'Beach Road', 'Noordhoek', 'Western Cape', '7979'),
(14, 'Organic Oasis', '65', 'Main Street', 'Noordhoek', 'Western Cape', '7979'),
(15, 'Vineyard Delights', '80', 'Wine Road', 'Constantia', 'Western Cape', '7848'),
(16, 'Green Gourmet', '75', 'Gardens Avenue', 'Constantia', 'Western Cape', '7848'),
(17, 'Food Haven', '90', 'Main Street', 'Panorama', 'Western Cape', '7500'),
(18, 'The Local Market', '85', 'Market Road', 'Panorama', 'Western Cape', '7500');

-- --------------------------------------------------------

--
-- Table structure for table `SparklingWine`
--

CREATE TABLE `SparklingWine` (
  `SparklingWineID` int(11) NOT NULL,
  `Effervescent` varchar(255) DEFAULT NULL,
  `Sweetness` varchar(255) DEFAULT NULL,
  `LightToMediumBodied` varchar(255) DEFAULT NULL,
  `Aromas` varchar(255) DEFAULT NULL,
  `ServeChilled` varchar(255) DEFAULT NULL,
  `WineID` int(11) DEFAULT NULL
) ;

--
-- Dumping data for table `SparklingWine`
--

INSERT INTO `SparklingWine` (`SparklingWineID`, `Effervescent`, `Sweetness`, `LightToMediumBodied`, `Aromas`, `ServeChilled`, `WineID`) VALUES
(32, 'Fine and persistent bubbles', 'Dry', 'Light-bodied', 'Toasty aromas with hints of citrus', 'Serve chilled at 6-8°C', 68),
(33, 'Light and effervescent bubbles', 'Semi-sweet', 'Light-bodied', 'Fruity aromas of apple and peach', 'Serve chilled at 6-8°C', 69),
(34, 'Crisp and lively bubbles', 'Dry', 'Light-bodied', 'Citrusy aromas with a hint of green apple', 'Serve chilled at 6-8°C', 70),
(35, 'Elegant and creamy bubbles', 'Dry', 'Medium-bodied', 'Delicate aromas of white flowers and brioche', 'Serve chilled at 8-10°C', 71),
(36, 'Sweet and aromatic bubbles', 'Sweet', 'Light-bodied', 'Aromas of ripe peaches and floral undertones', 'Serve chilled at 6-8°C', 72),
(37, 'Vibrant and effervescent bubbles', 'Dry', 'Light-bodied', 'Citrus and floral aromas with mineral notes', 'Serve chilled at 6-8°C', 73),
(38, 'Fruity and semi-sparkling bubbles', 'Semi-sweet', 'Light-bodied', 'Red berry aromas with a hint of sweetness', 'Serve chilled at 6-8°C', 74),
(39, 'Elegant and creamy bubbles', 'Dry', 'Medium-bodied', 'Toasty aromas with hints of vanilla and brioche', 'Serve chilled at 8-10°C', 75),
(40, 'Refined and complex bubbles', 'Dry', 'Medium-bodied', 'Citrusy aromas with notes of hazelnut', 'Serve chilled at 8-10°C', 76),
(41, 'Fine and delicate bubbles', 'Dry', 'Light-bodied', 'Subtle toasty aromas with a hint of brioche', 'Serve chilled at 6-8°C', 77),
(42, 'Creamy and aromatic bubbles', 'Semi-sweet', 'Medium-bodied', 'Green apple aromas with toasted almond undertones', 'Serve chilled at 8-10°C', 78),
(43, 'Fine and persistent bubbles', 'Dry', 'Light-bodied', 'Delicate toasty aromas with a hint of bread crust', 'Serve chilled at 6-8°C', 79),
(44, 'Dry and refreshing bubbles', 'Dry', 'Light-bodied', 'Lively aromas of green apple and lemon', 'Serve chilled at 6-8°C', 80),
(45, 'Vibrant and fruity bubbles', 'Dry', 'Light-bodied', 'Citrus and floral aromas with a hint of white flowers', 'Serve chilled at 6-8°C', 81),
(46, 'Refreshing and fruity bubbles', 'Dry', 'Light-bodied', 'Strawberry and raspberry aromas with a touch of sweetness', 'Serve chilled at 6-8°C', 82),
(47, 'Lively and expressive bubbles', 'Dry', 'Light-bodied', 'Vibrant pink color with flavors of red berries and citrus', 'Serve chilled at 6-8°C', 83);

-- --------------------------------------------------------

--
-- Table structure for table `Tourists`
--

CREATE TABLE `Tourists` (
  `TouristID` int(11) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Nationality` varchar(255) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Surname` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Salt` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Tourists`
--

INSERT INTO `Tourists` (`TouristID`, `Email`, `Nationality`, `Name`, `Surname`, `Password`, `Salt`) VALUES
(28, 'mototohh11@gmail.com', 'South Africa', 'Thabiso', 'Matau', '$argon2id$v=19$m=65536,t=4,p=1$NC5nYWQuWVlPdG0wNkZqcQ$H9FCdzuRZ80mGkTEy0bu2RCiuFexcl+/mCSHnnvPxig', 'dhzaggqeyv'),
(29, 'mototohh11@gmail.com', 'South Africa', 'Thabiso', 'Matau', '$argon2id$v=19$m=65536,t=4,p=1$N0FJS2VKdHRHdDE4eXRzdg$kf7SvPjHEUsya/mAtzPe3Fx6lO15S35WC52mCGpeMwM', 'jbrlj77t93'),
(30, 'mototohh11@gmail.com', 'South Africa', 'Thabiso', 'Matau', '$argon2id$v=19$m=65536,t=4,p=1$aGFSQ1ZZV05XNnZuL280RA$+4PeXTWZA4plQ5Lzs+qHgTLWYGR214A7H3t5lajOIao', 'g15juhkkqf'),
(31, 'mototohh11@gmail.com', 'South Africa', 'Thabiso', 'Matau', '$argon2id$v=19$m=65536,t=4,p=1$OFZPY3VkZEY1Umkwa0NaRA$dzy9Ou3W4nEwEWPAMeyMbliAIGaypP62Ucb/JlLVcJg', 'x3r6tgw8l9'),
(32, 'mototohh11@gmail.com', 'South Africa', 'Thabiso', 'Matau', '$argon2id$v=19$m=65536,t=4,p=1$bXZuSjRCYmMycDRtOVRjag$Dt3bIj1pFkRM/HyuBqiaLqatQ82mnzrG0rCPJscyzxI', '0jjlgkv6qn'),
(33, 'mototohh11@gmail.com', 'South Africa', 'Thabiso', 'Matau', '$argon2id$v=19$m=65536,t=4,p=1$dGdHU0lGZWQ3Rmd0eUFYSQ$9l62gpQsvPPhvRfVkhv/8dLzrwtb2Y1FLSoEy8/FIVA', 'sgrzozhhsu'),
(34, 'mrfrontend@gmail.com', 'South Africa', 'Gift', 'Shuuke', '$argon2id$v=19$m=65536,t=4,p=1$bVVmMVpBVVJTNi5kLmVBTg$bE/eUuOC/Q/TkH7aG6LZJ8sLikBLlerk4J1pIpQRyd4', '5tbys2ajt4'),
(35, 'mrgifted@gmail.com', 'Zimbabwe', 'Giften', 'Chukekke', '$argon2id$v=19$m=65536,t=4,p=1$aGZDYjRHeHlOeG9kNUxjZA$Ap6+T9yBQYigLp1ey9WgZ16dbnNvONQUnIq3vnCcXHw', 'g19sidvydj'),
(36, 'superdumm@gmail.com', 'Australia', 'Atidumshe', 'Boloi', '$argon2id$v=19$m=65536,t=4,p=1$RVBsb3VMVUFRYXJIRzFNRg$30JOQphMq1jOpxqh4CfepACYkn0MrVkgEEVCioTL5lo', 'qolwf692qo'),
(37, 'billyNumero@mail.com', 'BS', 'billy', 'numero', '$argon2id$v=19$m=65536,t=4,p=1$SHUwVG1SOFRzYVdYVEt0Yw$PkTJPYzIgJWXi2JOvm3i22HJi1uMcSXlg3hthmTWKvc', 'k8trs3yukj'),
(38, 'mrfrontend@mail.com', 'AF', 'mrFrontEnd', 'js', '$argon2id$v=19$m=65536,t=4,p=1$TEl5UTRtR1phZ1ZiZ2IwWA$lP8OfLKSbATnDM0Mn1fugQ1f+g0t14dYKbSUgC5Gzr8', 'i5iwoneh9l');

-- --------------------------------------------------------

--
-- Table structure for table `WhiteWine`
--

CREATE TABLE `WhiteWine` (
  `WhiteWineID` int(11) NOT NULL,
  `WineID` int(11) DEFAULT NULL,
  `LightBodied` varchar(255) DEFAULT NULL,
  `CrispAcidity` varchar(255) DEFAULT NULL,
  `FruitFlavors` varchar(255) DEFAULT NULL,
  `FloralMineralNotes` varchar(255) DEFAULT NULL,
  `ServeChilled` varchar(255) DEFAULT NULL
) ;

--
-- Dumping data for table `WhiteWine`
--

INSERT INTO `WhiteWine` (`WhiteWineID`, `WineID`, `LightBodied`, `CrispAcidity`, `FruitFlavors`, `FloralMineralNotes`, `ServeChilled`) VALUES
(1, 1, 'Light and refreshing', 'Crisp and lively', 'Citrus, green apple', 'Delicate floral and mineral notes', 'Yes'),
(2, 2, 'Medium-bodied', 'Balanced acidity', 'Stone fruit, melon', 'Subtle hints of flowers and minerals', 'Yes'),
(3, 3, 'Light and zesty', 'Bright and tangy', 'Citrus, tropical fruit', 'Aromatic floral and mineral nuances', 'Yes'),
(4, 4, 'Crisp and clean', 'Vibrant and refreshing', 'Apple, pear', 'Subtle floral and mineral undertones', 'Yes'),
(5, 5, 'Light and elegant', 'Lively and zingy', 'Citrus, white peach', 'Delicate floral and mineral accents', 'Yes'),
(6, 6, 'Medium-bodied', 'Balanced and bright', 'Citrus, pineapple', 'Hints of flowers and mineral complexity', 'Yes'),
(7, 7, 'Crisp and vibrant', 'Refreshing and lively', 'Green apple, pear', 'Subtle floral and mineral undertones', 'Yes'),
(8, 8, 'Light and zesty', 'Lively and tangy', 'Citrus, tropical fruit', 'Aromatic floral and mineral nuances', 'Yes'),
(9, 9, 'Crisp and clean', 'Bright and refreshing', 'Apple, melon', 'Subtle floral and mineral notes', 'Yes'),
(10, 10, 'Light and refreshing', 'Crisp and lively', 'Citrus, peach', 'Delicate floral and mineral nuances', 'Yes'),
(11, 11, 'Medium-bodied', 'Balanced acidity', 'Stone fruit, pineapple', 'Subtle hints of flowers and minerals', 'Yes'),
(12, 12, 'Light and zesty', 'Bright and tangy', 'Citrus, tropical fruit', 'Aromatic floral and mineral complexity', 'Yes'),
(13, 13, 'Crisp and clean', 'Vibrant and refreshing', 'Apple, pear', 'Subtle floral and mineral undertones', 'Yes'),
(14, 14, 'Light and elegant', 'Lively and zingy', 'Citrus, white peach', 'Delicate floral and mineral accents', 'Yes'),
(15, 15, 'Medium-bodied', 'Balanced and bright', 'Citrus, pineapple', 'Hints of flowers and mineral complexity', 'Yes'),
(16, 16, 'Crisp and vibrant', 'Refreshing and lively', 'Green apple, pear', 'Subtle floral and mineral undertones', 'Yes'),
(17, 17, 'Light and zesty', 'Lively and tangy', 'Citrus, tropical fruit', 'Aromatic floral and mineral nuances', 'Yes'),
(18, 18, 'Crisp and clean', 'Bright and refreshing', 'Apple, melon', 'Subtle floral and mineral notes', 'Yes'),
(19, 19, 'Light and refreshing', 'Crisp and lively', 'Citrus, peach', 'Delicate floral and mineral nuances', 'Yes'),
(20, 20, 'Medium-bodied', 'Balanced acidity', 'Stone fruit, pineapple', 'Subtle hints of flowers and minerals', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `WineAvailability`
--

CREATE TABLE `WineAvailability` (
  `AvailabilityID` int(11) NOT NULL,
  `WineryID` int(11) DEFAULT NULL,
  `WineID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `WineAvailability`
--

INSERT INTO `WineAvailability` (`AvailabilityID`, `WineryID`, `WineID`) VALUES
(2063, 12, 7),
(2064, 12, 73),
(2065, 12, 12),
(2066, 12, 93),
(2067, 12, 67),
(2068, 12, 8),
(2069, 12, 69),
(2070, 12, 70),
(2071, 12, 92),
(2072, 12, 76),
(2073, 12, 11),
(2074, 12, 86),
(2075, 12, 72),
(2076, 12, 80),
(2077, 12, 79),
(2078, 12, 1),
(2079, 12, 89),
(2080, 12, 78),
(2081, 12, 75),
(2082, 12, 6),
(2083, 12, 60),
(2084, 12, 71),
(2085, 12, 85),
(2086, 12, 64),
(2087, 12, 63),
(2094, 13, 76),
(2095, 13, 85),
(2096, 13, 69),
(2097, 13, 3),
(2098, 13, 62),
(2099, 13, 7),
(2100, 13, 16),
(2101, 13, 83),
(2102, 13, 1),
(2103, 13, 14),
(2104, 13, 8),
(2105, 13, 87),
(2106, 13, 67),
(2107, 13, 78),
(2108, 13, 12),
(2109, 13, 70),
(2110, 13, 15),
(2111, 13, 68),
(2112, 13, 60),
(2113, 13, 72),
(2114, 13, 20),
(2115, 13, 18),
(2116, 13, 80),
(2117, 13, 86),
(2118, 13, 71),
(2125, 14, 84),
(2126, 14, 2),
(2127, 14, 81),
(2128, 14, 69),
(2129, 14, 63),
(2130, 14, 90),
(2131, 14, 8),
(2132, 14, 19),
(2133, 14, 14),
(2134, 14, 10),
(2135, 14, 4),
(2136, 14, 88),
(2137, 14, 80),
(2138, 14, 92),
(2139, 14, 70),
(2140, 14, 71),
(2141, 14, 17),
(2142, 14, 86),
(2143, 14, 73),
(2144, 14, 62),
(2145, 14, 68),
(2146, 14, 3),
(2147, 14, 64),
(2148, 14, 18),
(2149, 14, 83),
(2156, 15, 89),
(2157, 15, 93),
(2158, 15, 10),
(2159, 15, 77),
(2160, 15, 66),
(2161, 15, 63),
(2162, 15, 83),
(2163, 15, 85),
(2164, 15, 78),
(2165, 15, 92),
(2166, 15, 3),
(2167, 15, 60),
(2168, 15, 70),
(2169, 15, 74),
(2170, 15, 73),
(2171, 15, 4),
(2172, 15, 7),
(2173, 15, 11),
(2174, 15, 64),
(2175, 15, 86),
(2176, 15, 87),
(2177, 15, 62),
(2178, 15, 5),
(2179, 15, 76),
(2180, 15, 2),
(2187, 16, 79),
(2188, 16, 69),
(2189, 16, 83),
(2190, 16, 93),
(2191, 16, 4),
(2192, 16, 87),
(2193, 16, 68),
(2194, 16, 85),
(2195, 16, 74),
(2196, 16, 92),
(2197, 16, 6),
(2198, 16, 18),
(2199, 16, 15),
(2200, 16, 89),
(2201, 16, 84),
(2202, 16, 81),
(2203, 16, 88),
(2204, 16, 76),
(2205, 16, 90),
(2206, 16, 12),
(2207, 16, 5),
(2208, 16, 13),
(2209, 16, 11),
(2210, 16, 67),
(2211, 16, 8),
(2218, 17, 16),
(2219, 17, 66),
(2220, 17, 82),
(2221, 17, 11),
(2222, 17, 81),
(2223, 17, 68),
(2224, 17, 2),
(2225, 17, 80),
(2226, 17, 62),
(2227, 17, 18),
(2228, 17, 4),
(2229, 17, 76),
(2230, 17, 12),
(2231, 17, 69),
(2232, 17, 73),
(2233, 17, 17),
(2234, 17, 65),
(2235, 17, 5),
(2236, 17, 15),
(2237, 17, 88),
(2238, 17, 9),
(2239, 17, 91),
(2240, 17, 90),
(2241, 17, 19),
(2242, 17, 8),
(2249, 18, 90),
(2250, 18, 13),
(2251, 18, 63),
(2252, 18, 1),
(2253, 18, 70),
(2254, 18, 6),
(2255, 18, 19),
(2256, 18, 91),
(2257, 18, 61),
(2258, 18, 88),
(2259, 18, 8),
(2260, 18, 60),
(2261, 18, 75),
(2262, 18, 74),
(2263, 18, 83),
(2264, 18, 93),
(2265, 18, 69),
(2266, 18, 10),
(2267, 18, 73),
(2268, 18, 89),
(2269, 18, 62),
(2270, 18, 64),
(2271, 18, 11),
(2272, 18, 85),
(2273, 18, 9),
(2280, 19, 81),
(2281, 19, 73),
(2282, 19, 14),
(2283, 19, 20),
(2284, 19, 13),
(2285, 19, 8),
(2286, 19, 93),
(2287, 19, 15),
(2288, 19, 79),
(2289, 19, 85),
(2290, 19, 75),
(2291, 19, 4),
(2292, 19, 76),
(2293, 19, 64),
(2294, 19, 83),
(2295, 19, 82),
(2296, 19, 2),
(2297, 19, 80),
(2298, 19, 70),
(2299, 19, 84),
(2300, 19, 77),
(2301, 19, 16),
(2302, 19, 63),
(2303, 19, 12),
(2304, 19, 78),
(2311, 20, 12),
(2312, 20, 80),
(2313, 20, 13),
(2314, 20, 71),
(2315, 20, 62),
(2316, 20, 77),
(2317, 20, 14),
(2318, 20, 17),
(2319, 20, 1),
(2320, 20, 20),
(2321, 20, 81),
(2322, 20, 16),
(2323, 20, 76),
(2324, 20, 8),
(2325, 20, 74),
(2326, 20, 15),
(2327, 20, 3),
(2328, 20, 84),
(2329, 20, 69),
(2330, 20, 83),
(2331, 20, 11),
(2332, 20, 87),
(2333, 20, 7),
(2334, 20, 91),
(2335, 20, 61),
(2342, 21, 78),
(2343, 21, 60),
(2344, 21, 84),
(2345, 21, 62),
(2346, 21, 71),
(2347, 21, 93),
(2348, 21, 80),
(2349, 21, 77),
(2350, 21, 64),
(2351, 21, 9),
(2352, 21, 72),
(2353, 21, 2),
(2354, 21, 86),
(2355, 21, 4),
(2356, 21, 68),
(2357, 21, 61),
(2358, 21, 66),
(2359, 21, 20),
(2360, 21, 14),
(2361, 21, 8),
(2362, 21, 16),
(2363, 21, 70),
(2364, 21, 18),
(2365, 21, 1),
(2366, 21, 82),
(2373, 22, 77),
(2374, 22, 2),
(2375, 22, 92),
(2376, 22, 78),
(2377, 22, 66),
(2378, 22, 3),
(2379, 22, 90),
(2380, 22, 79),
(2381, 22, 18),
(2382, 22, 67),
(2383, 22, 71),
(2384, 22, 13),
(2385, 22, 14),
(2386, 22, 85),
(2387, 22, 84),
(2388, 22, 93),
(2389, 22, 87),
(2390, 22, 91),
(2391, 22, 17),
(2392, 22, 88),
(2393, 22, 1),
(2394, 22, 86),
(2395, 22, 9),
(2396, 22, 8),
(2397, 22, 15),
(2404, 23, 68),
(2405, 23, 83),
(2406, 23, 8),
(2407, 23, 16),
(2408, 23, 92),
(2409, 23, 60),
(2410, 23, 72),
(2411, 23, 17),
(2412, 23, 76),
(2413, 23, 14),
(2414, 23, 74),
(2415, 23, 80),
(2416, 23, 81),
(2417, 23, 1),
(2418, 23, 66),
(2419, 23, 11),
(2420, 23, 63),
(2421, 23, 75),
(2422, 23, 61),
(2423, 23, 2),
(2424, 23, 9),
(2425, 23, 88),
(2426, 23, 78),
(2427, 23, 62),
(2428, 23, 12),
(2435, 24, 66),
(2436, 24, 61),
(2437, 24, 3),
(2438, 24, 86),
(2439, 24, 92),
(2440, 24, 63),
(2441, 24, 75),
(2442, 24, 7),
(2443, 24, 19),
(2444, 24, 84),
(2445, 24, 65),
(2446, 24, 4),
(2447, 24, 62),
(2448, 24, 93),
(2449, 24, 11),
(2450, 24, 72),
(2451, 24, 20),
(2452, 24, 69),
(2453, 24, 71),
(2454, 24, 83),
(2455, 24, 9),
(2456, 24, 68),
(2457, 24, 91),
(2458, 24, 79),
(2459, 24, 88),
(2466, 25, 8),
(2467, 25, 18),
(2468, 25, 6),
(2469, 25, 78),
(2470, 25, 15),
(2471, 25, 76),
(2472, 25, 86),
(2473, 25, 13),
(2474, 25, 90),
(2475, 25, 10),
(2476, 25, 64),
(2477, 25, 81),
(2478, 25, 80),
(2479, 25, 70),
(2480, 25, 63),
(2481, 25, 65),
(2482, 25, 17),
(2483, 25, 3),
(2484, 25, 79),
(2485, 25, 67),
(2486, 25, 62),
(2487, 25, 72),
(2488, 25, 83),
(2489, 25, 71),
(2490, 25, 82),
(2497, 26, 20),
(2498, 26, 74),
(2499, 26, 3),
(2500, 26, 92),
(2501, 26, 11),
(2502, 26, 12),
(2503, 26, 73),
(2504, 26, 4),
(2505, 26, 66),
(2506, 26, 60),
(2507, 26, 13),
(2508, 26, 65),
(2509, 26, 1),
(2510, 26, 67),
(2511, 26, 64),
(2512, 26, 78),
(2513, 26, 16),
(2514, 26, 90),
(2515, 26, 9),
(2516, 26, 63),
(2517, 26, 87),
(2518, 26, 93),
(2519, 26, 10),
(2520, 26, 8),
(2521, 26, 79),
(2528, 27, 68),
(2529, 27, 4),
(2530, 27, 10),
(2531, 27, 69),
(2532, 27, 89),
(2533, 27, 19),
(2534, 27, 62),
(2535, 27, 63),
(2536, 27, 75),
(2537, 27, 70),
(2538, 27, 85),
(2539, 27, 20),
(2540, 27, 80),
(2541, 27, 78),
(2542, 27, 64),
(2543, 27, 74),
(2544, 27, 18),
(2545, 27, 66),
(2546, 27, 84),
(2547, 27, 65),
(2548, 27, 61),
(2549, 27, 6),
(2550, 27, 5),
(2551, 27, 72),
(2552, 27, 12),
(2559, 28, 93),
(2560, 28, 72),
(2561, 28, 16),
(2562, 28, 82),
(2563, 28, 62),
(2564, 28, 74),
(2565, 28, 69),
(2566, 28, 90),
(2567, 28, 87),
(2568, 28, 2),
(2569, 28, 88),
(2570, 28, 65),
(2571, 28, 61),
(2572, 28, 5),
(2573, 28, 84),
(2574, 28, 20),
(2575, 28, 3),
(2576, 28, 8),
(2577, 28, 13),
(2578, 28, 70),
(2579, 28, 79),
(2580, 28, 10),
(2581, 28, 71),
(2582, 28, 77),
(2583, 28, 85),
(2590, 29, 75),
(2591, 29, 69),
(2592, 29, 91),
(2593, 29, 1),
(2594, 29, 78),
(2595, 29, 2),
(2596, 29, 89),
(2597, 29, 84),
(2598, 29, 11),
(2599, 29, 13),
(2600, 29, 64),
(2601, 29, 6),
(2602, 29, 18),
(2603, 29, 72),
(2604, 29, 90),
(2605, 29, 60),
(2606, 29, 77),
(2607, 29, 20),
(2608, 29, 9),
(2609, 29, 12),
(2610, 29, 92),
(2611, 29, 19),
(2612, 29, 67),
(2613, 29, 76),
(2614, 29, 88);

-- --------------------------------------------------------

--
-- Table structure for table `Winery`
--

CREATE TABLE `Winery` (
  `WineryID` int(11) NOT NULL,
  `WineryName` varchar(255) DEFAULT NULL,
  `StreetNo` varchar(255) DEFAULT NULL,
  `StreetName` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Province` varchar(255) DEFAULT NULL,
  `PostalCode` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(255) DEFAULT NULL,
  `EmailAddress` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Website` varchar(255) DEFAULT NULL,
  `ManagerID` int(11) DEFAULT NULL
) ;

--
-- Dumping data for table `Winery`
--

INSERT INTO `Winery` (`WineryID`, `WineryName`, `StreetNo`, `StreetName`, `City`, `Province`, `PostalCode`, `PhoneNumber`, `EmailAddress`, `Description`, `Website`, `ManagerID`) VALUES
(12, 'Waterford Estate', '123', 'Main Street', 'Stellenbosch', 'Western Cape', '1234', '+27 123456789', 'info@waterfordestate.com', 'Beautiful winery offering a wide selection of wines.', 'www.waterfordestate.com', 6),
(13, 'Vergelegen Estate', '456', 'Vineyard Road', 'Somerset West', 'Western Cape', '2345', '+27 234567890', 'info@vergelegenestate.com', 'Experience the essence of luxury at our prestigious winery.', 'www.vergelegenestate.com', 7),
(14, 'Klein Roosboom Boutique Winery', '789', 'Winemaker Street', 'Durbanville', 'Western Cape', '3456', '+27 345678901', 'info@kleinroosboomwinery.com', 'Discover exceptional wines and breathtaking views at our boutique winery.', 'www.kleinroosboomwinery.com', NULL),
(15, 'Boschendal', '321', 'Wine Estate Road', 'Franschhoek', 'Western Cape', '4567', '+27 456789012', 'info@boschendal.com', 'One of South Africa\'s oldest and most picturesque wine estates.', 'www.boschendal.com', NULL),
(16, 'Groot Constantia', '654', 'Constantia Main Road', 'Cape Town', 'Western Cape', '5678', '+27 567890123', 'info@grootconstantia.co.za', 'Experience rich history and award-winning wines at our iconic estate.', 'www.grootconstantia.co.za', NULL),
(17, 'Fairview Wine and Cheese', '987', 'Paarl Main Road', 'Paarl', 'Western Cape', '6789', '+27 678901234', 'info@fairview.co.za', 'Enjoy a unique wine and cheese tasting experience at our renowned winery.', 'www.fairview.co.za', NULL),
(18, 'Spier Wine Farm', '123', 'R310 Lynedoch Road', 'Stellenbosch', 'Western Cape', '7890', '+27 789012345', 'info@spier.co.za', 'A destination in itself, offering wine, food, art, and wildlife encounters.', 'www.spier.co.za', 8),
(19, 'Jordan Wine Estate', '456', 'Stellenbosch Kloof Road', 'Stellenbosch', 'Western Cape', '8901', '+27 890123456', 'info@jordanwines.com', 'Enjoy world-class wines and breathtaking views at our family-run estate.', 'www.jordanwines.com', NULL),
(20, 'Delaire Graff Estate', '789', 'Helshoogte Pass', 'Stellenbosch', 'Western Cape', '9012', '+27 901234567', 'info@delaire.co.za', 'Indulge in luxury and sophistication at our award-winning wine estate.', 'www.delaire.co.za', 10),
(21, 'La Motte Wine Estate', '321', 'Franschhoek Main Road', 'Franschhoek', 'Western Cape', '0123', '+27 012345678', 'info@lamotte.co.za', 'Discover a rich tapestry of wine, art, and Cape Winelands heritage.', 'www.lamotte.co.za', NULL),
(22, 'Eikehof', '654', 'Winery Street', 'Stellenbosch', 'Western Cape', '2345', '+27 234567890', 'info@eikehof.com', 'Experience elegance and fine wines at our charming winery.', 'www.eikehof.com', 12),
(23, 'House of J.C. Le Roux', '987', 'Devon Valley Road', 'Stellenbosch', 'Western Cape', '3456', '+27 345678901', 'info@jcleroux.co.za', 'Celebrate sparkling wines and unforgettable moments at our famous house.', 'www.jcleroux.co.za', NULL),
(24, 'Constantia Glen', '123', 'Constantia Main Road', 'Cape Town', 'Western Cape', '4567', '+27 456789012', 'info@constantiaglen.com', 'Specializing in cool climate Bordeaux-style wines with panoramic views.', 'www.constantiaglen.com', NULL),
(25, 'Cape Point Vineyards', '456', 'Silvermine Road', 'Noordhoek', 'Western Cape', '5678', '+27 567890123', 'info@capepointvineyards.co.za', 'Renowned for producing elegant wines from the rugged coastal terroir.', 'www.capepointvineyards.co.za', NULL),
(26, 'Ambeloui', '789', 'Blumberg Drive', 'Stellenbosch', 'Western Cape', '6789', '+27 678901234', 'info@ambeloui.com', 'Discover boutique wines made with passion and artisanal craftsmanship.', 'www.ambeloui.com', NULL),
(27, 'Buitenverwachting', '321', 'Klein Constantia Road', 'Constantia', 'Western Cape', '7890', '+27 789012345', 'info@buitenverwachting.com', 'Experience fine wines and historical charm at our estate.', 'www.buitenverwachting.com', 11),
(28, 'Durbanville Hills Winery', '654', 'Tygerberg Valley Road', 'Durbanville', 'Western Cape', '8901', '+27 890123456', 'info@durbanvillehills.co.za', 'Nestled against the picturesque Tygerberg Hills, we offer exceptional wines.', 'www.durbanvillehills.co.za', NULL),
(29, 'De Grendel Wines', '987', 'Plattekloof Road', 'Panorama', 'Western Cape', '9012', '+27 901234567', 'info@degrendel.co.za', 'Explore our vineyards and enjoy the breathtaking views of Table Mountain.', 'www.degrendel.co.za', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Wines`
--

CREATE TABLE `Wines` (
  `WineID` int(11) NOT NULL,
  `AverageRating` float DEFAULT NULL,
  `WineName` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `AlcoholPercentage` float DEFAULT NULL,
  `Year` date DEFAULT NULL,
  `Vintage` varchar(255) DEFAULT NULL,
  `Type` enum('White Wine','Red wine','Sparkling Wine','Dessert Wine') DEFAULT NULL,
  `Region` varchar(255) DEFAULT NULL,
  `ImageURL` varchar(255) DEFAULT NULL,
  `Varietal` varchar(255) DEFAULT NULL,
  `WineryID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Wines`
--

INSERT INTO `Wines` (`WineID`, `AverageRating`, `WineName`, `Description`, `Price`, `AlcoholPercentage`, `Year`, `Vintage`, `Type`, `Region`, `ImageURL`, `Varietal`, `WineryID`) VALUES
(1, 4.5, 'Chardonnay', 'A rich and buttery Chardonnay with notes of tropical fruit and oak.', 80.99, 13.5, '2022-01-01', '2004', 'White Wine', 'Stellenbosch', 'https://images.vivino.com/thumbs/ApnIiXjcT5Kc33OHgNb9dA_375x500.jpg', 'Chardonnay', 24),
(2, 4.2, 'Sauvignon Blanc', 'A crisp and refreshing Sauvignon Blanc with vibrant citrus flavors.', 90.99, 12, '2023-01-01', '1997', 'White Wine', 'Franschhoek', 'https://images.vivino.com/thumbs/nC9V6L2mQQSq0s-wZLcaxw_pb_x300.png', 'Sauvignon Blanc', 19),
(3, 4, 'Riesling', 'A floral and off-dry Riesling with notes of peach and honey.', 80, 11.5, '2021-01-01', '2016', 'White Wine', 'Paarl', 'https://images.vivino.com/thumbs/L33jsYUuTMWTMy3KoqQyXg_pb_x300.png', 'Riesling', 14),
(4, 4.3, 'Gewürztraminer', 'A fragrant and aromatic Gewürztraminer with exotic spice and lychee flavors.', 90, 12.5, '2022-01-01', '2001', 'White Wine', 'Constantia', 'https://images.vivino.com/thumbs/GpcSXs2ERS6niDxoAsvESA_pb_x300.png', 'Gewürztraminer', 23),
(5, 4.1, 'Vermentino', 'A crisp and zesty Vermentino with flavors of citrus and green apple.', 190, 11.8, '2023-01-01', '1999', 'White Wine', 'Cape Point', 'https://images.vivino.com/thumbs/PBhGMcRNQ7aVnVNr7VgnWA_pb_x300.png', 'Vermentino', NULL),
(6, 4.5, 'Müller-Thurgau', 'A light and floral Müller-Thurgau with a hint of sweetness.', 80, 11.4, '2021-01-01', '1999', 'White Wine', 'Tulbagh', 'https://images.vivino.com/thumbs/ZzMKzqFqRO-6oI3ys3gGgQ_pb_x300.png', 'Müller-Thurgau', NULL),
(7, 4, 'Trebbiano', 'A crisp and dry Trebbiano with lively acidity and citrus flavors.', 80.99, 12.3, '2019-01-01', '2011', 'White Wine', 'Walker Bay', 'https://images.vivino.com/thumbs/easjTPIcS-mCQ99XoYOMgQ_pb_x300.png', 'Trebbiano', NULL),
(8, 4.2, 'Pinot Grigio', 'A light and refreshing Pinot Grigio with delicate pear and apple notes.', 90.99, 12, '2020-01-01', '2000', 'White Wine', 'Hemel-en-Aarde', 'https://images.vivino.com/thumbs/U19RXtSdRMmoAesl2CBygA_pb_x300.png', 'Pinot Grigio', NULL),
(9, 4.3, 'Viognier', 'An aromatic and full-bodied Viognier with flavors of apricot and honey.', 120, 13.2, '2018-01-01', '2009', 'White Wine', 'Swartland', 'https://images.vivino.com/thumbs/f_G1SS0eT_C6hZGGwdEZqA_pb_x300.png', 'Viognier', NULL),
(10, 4.1, 'Gruner Veltliner', 'A crisp and herbaceous Grüner Veltliner with white pepper and citrus zest.', 210.99, 12.5, '2021-01-01', '2022', 'White Wine', 'Elgin', 'https://images.vivino.com/thumbs/pU7uFKR-TAKAOQaf3Hpn2A_pb_x300.png', 'Gruner Veltliner', NULL),
(11, 4.5, 'Chenin Blanc', 'A versatile and fruit-driven Chenin Blanc with notes of pear and melon.', 410.99, 13, '2022-01-01', '1992', 'White Wine', 'Robertson', 'https://images.vivino.com/thumbs/HYVZMFigQ5qXxni7s9SpWw_pb_x300.png', 'Chenin Blanc', NULL),
(12, 4.2, 'Albariño', 'A vibrant and zesty Albariño with flavors of peach and citrus.', 80.99, 12.5, '2023-01-01', '2004', 'White Wine', 'Darling', 'https://images.vivino.com/thumbs/V5JCHLK_SxSiWxhghoQ1yQ_375x500.jpg', 'Albariño', NULL),
(13, 4, 'Marsanne', 'A full-bodied and textured Marsanne with flavors of honey and almond.', 80, 13.5, '2021-01-01', '2022', 'White Wine', 'Swartland', 'https://images.vivino.com/thumbs/1XYwrN2-SQqqJlCMSUp3tA_pb_x300.png', 'Marsanne', NULL),
(14, 4.3, 'Sémillon', 'A rich and honeyed Sémillon with flavors of lemon curd and vanilla.', 90.99, 12.8, '2022-01-01', '2006', 'White Wine', 'Stellenbosch', 'https://images.vivino.com/thumbs/Yt464jw0QS-ugF7ZQEbE2Q_pb_x300.png', 'Sémillon', NULL),
(15, 4.1, 'Picpoul Blanc', 'A crisp and mineral-driven Picpoul Blanc with vibrant acidity and citrus notes.', 80, 11.9, '2023-01-01', '2009', 'White Wine', 'Paarl', 'https://images.vivino.com/thumbs/5kJTu3dMQUCEtBy3zIhrKA_pb_x300.png', 'Picpoul Blanc', NULL),
(16, 4.5, 'Verdelho', 'A tropical and medium-bodied Verdelho with flavors of pineapple and mango.', 400, 13.2, '2022-01-01', '2004', 'White Wine', 'Franschhoek', 'https://images.vivino.com/thumbs/2Uw98KdRSdGsqxCvpXxyOQ_375x500.jpg', 'Verdelho', NULL),
(17, 4.2, 'Torrontés', 'An aromatic and floral Torrontés with notes of rose petals and lychee.', 90.99, 12.5, '2023-01-01', '2002', 'White Wine', 'Swartland', 'https://images.vivino.com/thumbs/Q8MlhaRDTbaYh6Ydnr__iQ_pb_x300.png', 'Torrontés', NULL),
(18, 4, 'Colombard', 'A crisp and unoaked Colombard with refreshing citrus and green apple flavors.', 90.99, 11.8, '2021-01-01', '2009', 'White Wine', 'Robertson', 'https://images.vivino.com/thumbs/ElcyI1YpRSes_LvNodMeSQ_pb_x300.png', 'Colombard', NULL),
(19, 4.3, 'Assyrtiko', 'A vibrant and mineral-driven Assyrtiko with flavors of lemon and sea salt.', 80, 13, '2022-01-01', '2012', 'White Wine', 'Elgin', 'https://images.vivino.com/thumbs/0667TG7qS2KsRLsShMTjAw_pb_x300.png', 'Assyrtiko', NULL),
(20, 4.1, 'Muscadet', 'A zesty and bracing Muscadet with citrus and saline notes.', 330.99, 11.5, '2023-01-01', '2013', 'White Wine', 'Walker Bay', 'https://images.vivino.com/thumbs/43se9NpdSPKkbPdGMbRV6Q_pb_x300.png', 'Muscadet', NULL),
(60, 4.5, 'Cabernet Sauvignon', 'A bold and full-bodied Cabernet Sauvignon with rich blackcurrant and cedar flavors.', 270, 14.5, '2022-01-01', '2002', 'Red wine', 'Napa Valley', 'https://images.vivino.com/thumbs/ELHDIsL6TOGR9_nfTRjC0w_pb_x300.png', 'Cabernet Sauvignon', NULL),
(61, 4.2, 'Merlot', 'A smooth and velvety Merlot with flavors of plum and chocolate.', 90, 13.8, '2023-01-01', '2016', 'Red wine', 'Bordeaux', 'https://images.vivino.com/thumbs/ng7T6hUVRpyuVKGeK5GWFg_pb_x300.png', 'Merlot', NULL),
(62, 4, 'Pinot Noir', 'An elegant and fruity Pinot Noir with notes of cherry and spice.', 340.99, 13, '2021-01-01', '2019', 'Red wine', 'Burgundy', 'https://images.vivino.com/thumbs/LA6LTYifTuySY5scwk_odg_pb_x300.png', 'Pinot Noir', NULL),
(63, 4.3, 'Syrah', 'A rich and peppery Syrah with dark fruit and smoky undertones.', 340.99, 14, '2022-01-01', '2021', 'Red wine', 'Rhône Valley', 'https://images.vivino.com/thumbs/WZ84WPUySTaZ9334znLS-Q_375x500.jpg', 'Syrah', NULL),
(64, 4.1, 'Zinfandel', 'A bold and spicy Zinfandel with flavors of blackberry and black pepper.', 80.99, 14.2, '2023-01-01', '1993', 'Red wine', 'Sonoma County', 'https://images.vivino.com/thumbs/rCirPraNRPy8PHfOlG4E2w_pb_x300.png', 'Zinfandel', NULL),
(65, 4.5, 'Malbec', 'A robust and velvety Malbec with dark fruit and chocolate notes.', 90.99, 13.5, '2022-01-01', '2009', 'Red wine', 'Mendoza', 'https://images.vivino.com/thumbs/4acI_FD8QriZh2Fx_iv_oA_pb_x300.png', 'Malbec', NULL),
(66, 4, 'Shiraz', 'A full-bodied and spicy Shiraz with blackberry and black pepper flavors.', 90, 14.5, '2021-01-01', '2008', 'Red wine', 'Barossa Valley', 'https://images.vivino.com/thumbs/3PfOzi--Qa2d7zPQGH9h6g_pb_x300.png', 'Shiraz', NULL),
(67, 4.2, 'Sangiovese', 'An elegant and structured Sangiovese with cherry and earthy undertones.', 80.99, 13.8, '2020-01-01', '1992', 'Red wine', 'Tuscany', 'https://images.vivino.com/thumbs/kB1XXwozQyKwmJfHannatg_pb_x300.png', 'Sangiovese', NULL),
(68, 4.5, 'Champagne', 'A classic and elegant Champagne with fine bubbles and notes of toasted bread and citrus.', 70.99, 12.5, '2022-01-01', '2012', 'Sparkling Wine', 'Champagne', 'https://images.vivino.com/thumbs/ElcyI1YpRSes_LvNodMeSQ_pb_x300.png', 'Champagne', NULL),
(69, 4.2, 'Prosecco', 'A lively and fruity Prosecco with aromas of apple and peach.', 310.99, 11, '2023-01-01', '1994', 'Sparkling Wine', 'Veneto', 'https://images.vivino.com/thumbs/hJIXwnDnRWmwxZOHTxGOpw_375x500.jpg', 'Prosecco', NULL),
(70, 4, 'Cava', 'A crisp and refreshing Cava with flavors of citrus and green apple.', 90, 11.5, '2021-01-01', '2009', 'Sparkling Wine', 'Penedès', 'https://images.vivino.com/thumbs/is7GpPkvSoykqEh0wv2YWg_375x500.jpg', 'Cava', NULL),
(71, 4.3, 'Crémant', 'An elegant and creamy Crémant with delicate bubbles and notes of white flowers and brioche.', 90.99, 12, '2022-01-01', '2007', 'Sparkling Wine', 'Alsace', 'https://images.vivino.com/thumbs/ooQmRipERdeq4HM4KGxlEA_pb_x300.png', 'Crémant', NULL),
(72, 4.1, 'Asti Spumante', 'A sweet and aromatic Asti Spumante with flavors of ripe peaches and honey.', 90, 7.5, '2023-01-01', '2019', 'Sparkling Wine', 'Piedmont', 'https://images.vivino.com/thumbs/ooQmRipERdeq4HM4KGxlEA_pb_x300.png', 'Asti Spumante', NULL),
(73, 4.5, 'Sekt', 'A vibrant and effervescent Sekt with citrus and floral notes.', 80.99, 11.5, '2022-01-01', '2014', 'Sparkling Wine', 'Mosel', 'https://images.vivino.com/thumbs/SCnpJk_ySUe6XS3U-lFOwQ_pb_x300.png', 'Sekt', NULL),
(74, 4, 'Lambrusco', 'A fruity and semi-sparkling Lambrusco with flavors of red berries and a hint of sweetness.', 460.99, 8.5, '2021-01-01', '1993', 'Sparkling Wine', 'Emilia-Romagna', 'https://images.vivino.com/thumbs/4RHhCzeQTsCeyCScxO0LOw_pb_x300.png', 'Lambrusco', NULL),
(75, 4.2, 'Cremant de Bourgogne', 'An elegant and creamy Crémant de Bourgogne with fine bubbles and a delicate toasty character.', 80, 12.5, '2020-01-01', '1997', 'Sparkling Wine', 'Burgundy', 'https://images.vivino.com/thumbs/SCnpJk_ySUe6XS3U-lFOwQ_pb_x300.png', 'Crémant de Bourgogne', NULL),
(76, 4.3, 'Franciacorta', 'A refined and complex Franciacorta with persistent bubbles and flavors of citrus and hazelnut.', 340.99, 12, '2019-01-01', '2018', 'Sparkling Wine', 'Lombardy', 'https://images.vivino.com/thumbs/ZiSSq-CNSXyace-BxcacjA_pb_x300.png', 'Franciacorta', NULL),
(77, 4.1, 'English Sparkling Wine', 'A high-quality English sparkling wine with fine bubbles and flavors of orchard fruits and toasted bread.', 90, 11.5, '2021-01-01', '2006', 'Sparkling Wine', 'Sussex', 'https://images.vivino.com/thumbs/dnqHnd0hSx-t14_V8uynAA_pb_x300.png', 'English Sparkling Wine', NULL),
(78, 4.5, 'Blanquette de Limoux', 'A creamy and aromatic Blanquette de Limoux with hints of green apple and toasted almonds.', 390, 12, '2022-01-01', '2019', 'Sparkling Wine', 'Languedoc-Roussillon', 'https://images.vivino.com/thumbs/RPhc1fBwT0uLKoE6_mteFQ_pb_x300.png', 'Blanquette de Limoux', NULL),
(79, 4.2, 'Trento DOC', 'A prestigious and elegant Trento DOC sparkling wine with fine bubbles and notes of bread crust and citrus.', 90, 12.5, '2023-01-01', '2021', 'Sparkling Wine', 'Trentino', 'https://images.vivino.com/thumbs/SCnpJk_ySUe6XS3U-lFOwQ_pb_x300.png', 'Trento DOC', NULL),
(80, 4, 'Sekt Trocken', 'A dry and refreshing Sekt Trocken with lively acidity and flavors of green apple and lemon.', 80, 11.5, '2021-01-01', '1991', 'Sparkling Wine', 'Rheingau', 'https://images.vivino.com/thumbs/RqFtSGpgTlKL1VwkBjccxA_pb_x300.png', 'Sekt Trocken', NULL),
(81, 4.3, 'Cremant de Loire', 'A vibrant and fruity Crémant de Loire with fine bubbles and aromas of citrus and white flowers.', 70, 12, '2022-01-01', '2000', 'Sparkling Wine', 'Loire Valley', 'https://images.vivino.com/thumbs/uDMfPG10R1efm5H1do--Ow_pb_x300.png', 'Crémant de Loire', NULL),
(82, 4.1, 'Sekt Rosé', 'A refreshing and fruity Sekt Rosé with delicate bubbles and notes of strawberries and raspberries.', 90.99, 11, '2023-01-01', '2005', 'Sparkling Wine', 'Pfalz', 'https://images.vivino.com/thumbs/4RHhCzeQTsCeyCScxO0LOw_pb_x300.png', 'Sekt Rosé', NULL),
(83, 4.4, 'Cava Rosado', 'A lively and expressive Cava Rosado with vibrant pink color and flavors of red berries and citrus.', 270, 11.5, '2022-01-01', '1999', 'Sparkling Wine', 'Catalonia', 'https://images.vivino.com/thumbs/GPvEr_IUSKS1CDhhsY1ySg_pb_x300.png', 'Cava Rosado', NULL),
(84, 4.4, 'Sauternes', 'A luscious and honeyed Sauternes with flavors of apricot, honey, and botrytis.', 70, 13.5, '2010-01-01', '1992', 'Dessert Wine', 'Bordeaux', 'https://images.vivino.com/thumbs/D1Mf1fYnRnageFjtfLXdFg_pb_x300.png', 'Sauternes', NULL),
(85, 4.3, 'Port', 'A rich and fortified Port with intense flavors of dark fruits, chocolate, and spices.', 80, 20, '2005-01-01', '2003', 'Dessert Wine', 'Douro Valley', 'https://images.vivino.com/thumbs/GPvEr_IUSKS1CDhhsY1ySg_pb_x300.png', 'Port', NULL),
(86, 4.2, 'Tokaji Aszú', 'A complex and sweet Tokaji Aszú with flavors of dried fruits, caramel, and botrytis.', 90.99, 11, '2008-01-01', '2016', 'Dessert Wine', 'Tokaj', 'https://images.vivino.com/thumbs/KOrKiHVjSlm4khPkAfU6yQ_pb_x300.png', 'Tokaji Aszú', NULL),
(87, 4.1, 'Icewine', 'A luxurious and concentrated Icewine with intense sweetness and flavors of ripe fruits and honey.', 90, 9.5, '2012-01-01', '2014', 'Dessert Wine', 'Niagara Peninsula', 'https://images.vivino.com/thumbs/AIWJqsLoSIyz0HO4de1llA_pb_x300.png', 'Icewine', NULL),
(88, 4, 'Moscato d\'Asti', 'A light and effervescent Moscato d\'Asti with floral aromas and sweet peach flavors.', 90.99, 5.5, '2015-01-01', '1998', 'Dessert Wine', 'Piedmont', 'https://images.vivino.com/thumbs/k_UetHZ3Q2SMqUsliefGYQ_pb_x300.png', 'Moscato d\'Asti', NULL),
(89, 4.5, 'Pedro Ximénez', 'A rich and syrupy Pedro Ximénez with intense flavors of raisins, toffee, and caramel.', 80, 15, '2000-01-01', '2022', 'Dessert Wine', 'Andalusia', 'https://images.vivino.com/thumbs/L2ZTpFlDR2yMHe1-GA90Jw_pb_x300.png', 'Pedro Ximénez', NULL),
(90, 4.3, 'Banyuls', 'A fortified Banyuls with notes of dark fruits, chocolate, and spices, and a touch of Mediterranean herbs.', 80, 16, '2009-01-01', '1997', 'Dessert Wine', 'Languedoc-Roussillon', 'https://images.vivino.com/thumbs/k_UetHZ3Q2SMqUsliefGYQ_pb_x300.png', 'Banyuls', NULL),
(91, 4.2, 'Late Harvest Riesling', 'A sweet and aromatic Late Harvest Riesling with flavors of ripe peaches, honey, and petrol.', 80, 9, '2011-01-01', '1992', 'Dessert Wine', 'Mosel', 'https://images.vivino.com/thumbs/2H0CXyXZQKe4o_qX5WiN-w_pb_x300.png', 'Late Harvest Riesling', NULL),
(92, 4.1, 'Muscat de Beaumes-de-Venise', 'An aromatic and floral Muscat de Beaumes-de-Venise with flavors of orange blossom, apricot, and honey.', 80, 15.5, '2007-01-01', '2014', 'Dessert Wine', 'Rhône Valley', 'https://images.vivino.com/thumbs/k_UetHZ3Q2SMqUsliefGYQ_pb_x300.png', 'Muscat de Beaumes-de-Venise', NULL),
(93, 4, 'Vin Santo', 'A nutty and oxidized Vin Santo with flavors of dried fruits, toasted almonds, and honey.', 80, 15, '2003-01-01', '2004', 'Dessert Wine', 'Tuscany', 'https://images.vivino.com/thumbs/D1Mf1fYnRnageFjtfLXdFg_pb_x300.png', 'Vin Santo', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Wine_Grape_Varieties`
--

CREATE TABLE `Wine_Grape_Varieties` (
  `WineID` int(11) NOT NULL,
  `VarietyID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `DessertWine`
--
ALTER TABLE `DessertWine`
  ADD PRIMARY KEY (`DessertWineID`),
  ADD KEY `WineID` (`WineID`);

--
-- Indexes for table `Grape_Varieties`
--
ALTER TABLE `Grape_Varieties`
  ADD PRIMARY KEY (`VarietyID`);

--
-- Indexes for table `Manager`
--
ALTER TABLE `Manager`
  ADD PRIMARY KEY (`ManagerID`);

--
-- Indexes for table `Rating`
--
ALTER TABLE `Rating`
  ADD PRIMARY KEY (`RatingID`),
  ADD KEY `WineID` (`WineID`),
  ADD KEY `TouristID` (`TouristID`);

--
-- Indexes for table `RedWine`
--
ALTER TABLE `RedWine`
  ADD PRIMARY KEY (`RedWineID`),
  ADD KEY `WineID` (`WineID`);

--
-- Indexes for table `Shops`
--
ALTER TABLE `Shops`
  ADD PRIMARY KEY (`ShopID`);

--
-- Indexes for table `SparklingWine`
--
ALTER TABLE `SparklingWine`
  ADD PRIMARY KEY (`SparklingWineID`),
  ADD KEY `WineID` (`WineID`);

--
-- Indexes for table `Tourists`
--
ALTER TABLE `Tourists`
  ADD PRIMARY KEY (`TouristID`);

--
-- Indexes for table `WhiteWine`
--
ALTER TABLE `WhiteWine`
  ADD PRIMARY KEY (`WhiteWineID`),
  ADD KEY `WineID` (`WineID`);

--
-- Indexes for table `WineAvailability`
--
ALTER TABLE `WineAvailability`
  ADD PRIMARY KEY (`AvailabilityID`),
  ADD KEY `WineryID` (`WineryID`),
  ADD KEY `WineID` (`WineID`);

--
-- Indexes for table `Winery`
--
ALTER TABLE `Winery`
  ADD PRIMARY KEY (`WineryID`),
  ADD KEY `ManagerID` (`ManagerID`);

--
-- Indexes for table `Wines`
--
ALTER TABLE `Wines`
  ADD PRIMARY KEY (`WineID`),
  ADD KEY `WineryID` (`WineryID`);

--
-- Indexes for table `Wine_Grape_Varieties`
--
ALTER TABLE `Wine_Grape_Varieties`
  ADD PRIMARY KEY (`WineID`,`VarietyID`),
  ADD KEY `VarietyID` (`VarietyID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `DessertWine`
--
ALTER TABLE `DessertWine`
  MODIFY `DessertWineID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `Manager`
--
ALTER TABLE `Manager`
  MODIFY `ManagerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `Rating`
--
ALTER TABLE `Rating`
  MODIFY `RatingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `RedWine`
--
ALTER TABLE `RedWine`
  MODIFY `RedWineID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Shops`
--
ALTER TABLE `Shops`
  MODIFY `ShopID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `SparklingWine`
--
ALTER TABLE `SparklingWine`
  MODIFY `SparklingWineID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Tourists`
--
ALTER TABLE `Tourists`
  MODIFY `TouristID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `WhiteWine`
--
ALTER TABLE `WhiteWine`
  MODIFY `WhiteWineID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `WineAvailability`
--
ALTER TABLE `WineAvailability`
  MODIFY `AvailabilityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2621;

--
-- AUTO_INCREMENT for table `Winery`
--
ALTER TABLE `Winery`
  MODIFY `WineryID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Wines`
--
ALTER TABLE `Wines`
  MODIFY `WineID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `DessertWine`
--
ALTER TABLE `DessertWine`
  ADD CONSTRAINT `DessertWine_ibfk_1` FOREIGN KEY (`WineID`) REFERENCES `Wines` (`WineID`);

--
-- Constraints for table `Rating`
--
ALTER TABLE `Rating`
  ADD CONSTRAINT `TouristID` FOREIGN KEY (`TouristID`) REFERENCES `Tourists` (`TouristID`),
  ADD CONSTRAINT `WineID` FOREIGN KEY (`WineID`) REFERENCES `Wines` (`WineID`);

--
-- Constraints for table `RedWine`
--
ALTER TABLE `RedWine`
  ADD CONSTRAINT `RedWine_ibfk_1` FOREIGN KEY (`WineID`) REFERENCES `Wines` (`WineID`);

--
-- Constraints for table `SparklingWine`
--
ALTER TABLE `SparklingWine`
  ADD CONSTRAINT `SparklingWine_ibfk_1` FOREIGN KEY (`WineID`) REFERENCES `Wines` (`WineID`);

--
-- Constraints for table `WhiteWine`
--
ALTER TABLE `WhiteWine`
  ADD CONSTRAINT `WhiteWine_ibfk_1` FOREIGN KEY (`WineID`) REFERENCES `Wines` (`WineID`);

--
-- Constraints for table `WineAvailability`
--
ALTER TABLE `WineAvailability`
  ADD CONSTRAINT `WineAvailability_ibfk_1` FOREIGN KEY (`WineryID`) REFERENCES `Winery` (`WineryID`),
  ADD CONSTRAINT `WineAvailability_ibfk_2` FOREIGN KEY (`WineID`) REFERENCES `Wines` (`WineID`);

--
-- Constraints for table `Winery`
--
ALTER TABLE `Winery`
  ADD CONSTRAINT `ManagerID` FOREIGN KEY (`ManagerID`) REFERENCES `Manager` (`ManagerID`);

--
-- Constraints for table `Wines`
--
ALTER TABLE `Wines`
  ADD CONSTRAINT `Wines_ibfk_1` FOREIGN KEY (`WineryID`) REFERENCES `Winery` (`WineryID`);

--
-- Constraints for table `Wine_Grape_Varieties`
--
ALTER TABLE `Wine_Grape_Varieties`
  ADD CONSTRAINT `Wine_Grape_Varieties_ibfk_1` FOREIGN KEY (`WineID`) REFERENCES `Wines` (`WineID`),
  ADD CONSTRAINT `Wine_Grape_Varieties_ibfk_2` FOREIGN KEY (`VarietyID`) REFERENCES `Grape_Varieties` (`VarietyID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
