-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Sze 23. 09:58
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
(6, '2024-01-12', 2.5, 100, 1, 1, 1),
(7, '2024-02-10', 1.9, 200, 2, 2, 0),
(8, '2024-06-15', 3.2, 300, 4, 3, 1),
(9, '2024-07-10', 1.8, 400, 5, 4, 1),
(10, '2024-04-29', 2, 250, 1, 5, 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `bettors`
--

CREATE TABLE `bettors` (
  `BettorsID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Balance` int(11) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `JoinDate` date NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT 1,
  `Role` enum('Bettor','Organizer','Admin') NOT NULL DEFAULT 'Bettor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `bettors`
--

INSERT INTO `bettors` (`BettorsID`, `Username`, `Balance`, `Email`, `JoinDate`, `IsActive`, `Role`) VALUES
(1, 'johnDoe', 500, 'johndoe@example.com', '2022-06-15', 1, 'Bettor'),
(2, 'janeSmith', 1500, 'janesmith@example.com', '2021-12-05', 1, 'Organizer'),
(3, 'adminUser', 0, 'admin@example.com', '2020-08-25', 1, 'Admin'),
(4, 'peterParker', 800, 'peterp@example.com', '2023-01-11', 1, 'Bettor'),
(5, 'maryJane', 1200, 'maryj@example.com', '2021-10-20', 0, 'Bettor');

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
(1, 'World Cup Final', '2024-07-15', 'Football', 'Qatar'),
(2, 'Super Bowl LVIII', '2024-02-11', 'American Football', 'Las Vegas, USA'),
(3, 'NBA Finals Game 7', '2024-06-16', 'Basketball', 'Los Angeles, USA'),
(4, 'Wimbledon Final', '2024-07-14', 'Tennis', 'London, UK'),
(5, 'UFC 300', '2024-05-06', 'MMA', 'Las Vegas, USA');

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
  MODIFY `BetsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `bettors`
--
ALTER TABLE `bettors`
  MODIFY `BettorsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `events`
--
ALTER TABLE `events`
  MODIFY `EventID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
