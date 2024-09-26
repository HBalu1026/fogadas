-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Sze 26. 10:06
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `fogadasok`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `bets`
--

CREATE TABLE `bets` (
  `BetsID` int(11) NOT NULL,
  `BetDate` date NOT NULL,
  `Odds` float NOT NULL,
  `Amount` int(11) NOT NULL,
  `BettorsID` int(11) NOT NULL,
  `EventID` int(11) NOT NULL,
  `Status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `bets`
--

INSERT INTO `bets` (`BetsID`, `BetDate`, `Odds`, `Amount`, `BettorsID`, `EventID`, `Status`) VALUES
(1, '2024-09-01', 2.1, 100, 1, 1, 1),
(2, '2024-09-02', 3, 200, 2, 2, 1),
(3, '2024-09-03', 1.5, 150, 3, 3, 1),
(4, '2024-09-04', 2.8, 250, 4, 4, 1),
(5, '2024-09-05', 4, 100, 5, 5, 1),
(6, '2024-09-06', 3.5, 300, 1, 6, 1),
(7, '2024-09-07', 1.9, 75, 2, 7, 1),
(8, '2024-09-08', 2.7, 50, 3, 8, 0),
(9, '2024-09-09', 5.5, 120, 4, 9, 1),
(10, '2024-09-10', 1.2, 400, 5, 10, 1),
(11, '2024-09-11', 2, 200, 6, 1, 1),
(12, '2024-09-12', 4.5, 150, 7, 2, 1),
(13, '2024-09-13', 3, 250, 8, 3, 1),
(14, '2024-09-14', 1.6, 100, 9, 4, 1),
(15, '2024-09-15', 2.4, 350, 10, 5, 0),
(16, '2024-09-16', 3.2, 100, 1, 6, 1),
(17, '2024-09-17', 5, 80, 2, 7, 1),
(18, '2024-09-18', 2.9, 60, 3, 8, 1),
(19, '2024-09-19', 1.3, 500, 4, 9, 1),
(20, '2024-09-20', 4.1, 90, 5, 10, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `bettors`
--

CREATE TABLE `bettors` (
  `BettorsID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Balance` int(11) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `JoinDate` date NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `bettors`
--

INSERT INTO `bettors` (`BettorsID`, `Username`, `Password`, `Balance`, `Email`, `JoinDate`, `IsActive`) VALUES
(1, 'theGambler87', 'hashed_password1', 2500, 'gambler87@example.com', '2022-05-15', 1),
(2, 'LuckyLuke', 'hashed_password2', 3000, 'luckyluke@example.com', '2021-12-20', 1),
(3, 'BettingMaster', 'hashed_password3', 1500, 'masterbettor@example.com', '2023-06-10', 1),
(4, 'RiskyBusiness', 'hashed_password4', 800, 'riskybiz@example.com', '2022-11-01', 1),
(5, 'BettyTheBest', 'hashed_password5', 1200, 'betty@example.com', '2023-01-30', 1),
(6, 'StrategicSally', 'hashed_password6', 3500, 'sallystrategies@example.com', '2020-08-15', 1),
(7, 'HighRollerMike', 'hashed_password7', 5000, 'mikehighroller@example.com', '2019-09-25', 1),
(8, 'CautiousCarl', 'hashed_password8', 1000, 'carlcautious@example.com', '2021-02-28', 1),
(9, 'WittyWanda', 'hashed_password9', 2200, 'wanda@example.com', '2023-03-05', 0),
(10, 'JamesTheAnalyst', 'hashed_password10', 1800, 'jamesanalyst@example.com', '2023-07-20', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `events`
--

CREATE TABLE `events` (
  `EventID` int(11) NOT NULL,
  `EventName` varchar(100) NOT NULL,
  `EventDate` date NOT NULL,
  `Category` varchar(50) NOT NULL,
  `Location` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `events`
--

INSERT INTO `events` (`EventID`, `EventName`, `EventDate`, `Category`, `Location`) VALUES
(1, 'Champions League Final', '2024-06-01', 'Football', 'Wembley Stadium'),
(2, 'NBA Finals Game 1', '2024-06-05', 'Basketball', 'Staples Center'),
(3, 'Wimbledon Men\'s Final', '2024-07-14', 'Tennis', 'Wimbledon'),
(4, 'UFC 300 Main Event', '2024-07-20', 'MMA', 'T-Mobile Arena'),
(5, 'The Masters Golf Tournament', '2024-04-11', 'Golf', 'Augusta National Golf Club'),
(6, 'Super Bowl LVIII', '2024-02-11', 'American Football', 'Allegiant Stadium'),
(7, 'Formula 1 Monaco Grand Prix', '2024-05-26', 'Motorsport', 'Monaco'),
(8, 'World Series Game 1', '2024-10-24', 'Baseball', 'Globe Life Field'),
(9, 'Rugby World Cup Final', '2024-10-28', 'Rugby', 'Stade de France'),
(10, 'MLS Cup Final', '2024-11-05', 'Soccer', 'Mercedes-Benz Stadium');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `bets`
--
ALTER TABLE `bets`
  ADD PRIMARY KEY (`BetsID`),
  ADD KEY `BettorsID` (`BettorsID`),
  ADD KEY `EventID` (`EventID`);

--
-- A tábla indexei `bettors`
--
ALTER TABLE `bettors`
  ADD PRIMARY KEY (`BettorsID`);

--
-- A tábla indexei `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`EventID`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `bets`
--
ALTER TABLE `bets`
  MODIFY `BetsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `bettors`
--
ALTER TABLE `bettors`
  MODIFY `BettorsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `events`
--
ALTER TABLE `events`
  MODIFY `EventID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `bets`
--
ALTER TABLE `bets`
  ADD CONSTRAINT `bets_ibfk_1` FOREIGN KEY (`BettorsID`) REFERENCES `bettors` (`BettorsID`),
  ADD CONSTRAINT `bets_ibfk_2` FOREIGN KEY (`EventID`) REFERENCES `events` (`EventID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
