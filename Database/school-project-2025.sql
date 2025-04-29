-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Čtv 20. úno 2025, 13:22
-- Verze serveru: 10.4.32-MariaDB
-- Verze PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `school-project-2025`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `questions`
--

CREATE TABLE `questions` (
  `type` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `answers` longtext NOT NULL CHECK (json_valid(`answers`)),
  `questionID` int(11) NOT NULL,
  `correctID` int(11) NOT NULL,
  `theme` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vypisuji data pro tabulku `questions`
--

INSERT INTO `questions` (`type`, `value`, `answers`, `questionID`, `correctID`, `theme`, `url`) VALUES
('video', 'Co znamená slovo “dyk” ve větě “Dyk jaký má šaty!”', '[\"dýka\", \"díky\", \"mužský pohlavní orgán\", \"koukej\"]', 1, 3, 'slovnik', ''),
('video', 'Co znamená slovo “valit” ve větě “Co borec valí?”', '[\"balit holku\", \"mluvit nesmysly\", \"balit cigaretu\", \"koulet předmět\"]', 2, 1, 'slovnik', ''),
('video', 'Co znamená slovo “more” ve větě “more tak to je crazy”', '[\"více\", \"nechápu\", \"kámo\", \"moře bez ř\"]', 3, 2, 'slovnik', ''),
('video', 'Co znamená pojem “hell nah” ve větě “Hell nah, to si deláš srandu.”', '[\"vůbec ne\", \"nebesky ne\", \"možná\", \"blázen\"]', 4, 0, 'slovnik\r\n', ''),
('video', 'Co znamená pojem “goated” ve větě “To je mega goated hra.”', '[\"primitivní jako zvíře\", \"špatný\", \"nepovedená\", \"nejlepší ze všech\"]', 5, 3, 'slovnik', ''),
('video', 'Co znamená pojem “on god” ve větě “Ta kalba byla mega fajn!” “On god!”', '[\"souhlasím\", \"ano\", \"doslova\", \"na slovo boží\"]', 6, 2, 'slovnik', ''),
('video', 'Co znamená slovo “ara” ve větě “Ara, policie!”', '[\"bacha\", \"nečum\", \"papoušek\", \"utíkej!\"]', 7, 0, 'slovnik', ''),
('video', 'Jaký význam má pojem “ghostnout” ve větě “Borec mě totálně vyghostil.”', '[\"vyděsit někoho\", \"ignorovat někoho\", \"dokouřit rychle cigaretu\", \"zapálit oblečení\"]', 8, 1, 'slovnik', ''),
('video', 'Co znamená slovo “čára” ve větě “Dáme čáru?”', '[\"lajna\", \"panák\", \"šňupací tabák\", \"dřevotříska\"]', 9, 0, 'slovnik', ''),
('video', 'Jaký význam má pojem “lock in” ve větě “Já jsem se locknul in”', '[\"uzavřít se do sebe\", \"zamknout\", \"přestat myslet\", \"pořádně se soustředit\"]', 10, 3, 'slovnik', ''),
('video', 'Jaký význam má pojem “netflix and chill” ve větě “dáme netflix and chill?”', '[\"povídání o filmech\", \"filmový večer\", \"film a po něm pohlavní styk\", \"promítání na dobrou věc\"]', 11, 2, 'slovnik', ''),
('video', 'Co znamená slovo “houska” ve větě “Pořádám houku v pátek.”', '[\"párty, kde hraje housová muzika\", \"akce u někoho doma\", \"pečivo\"]', 12, 1, 'slovnik', ''),
('video', 'Co znamená slovo “rave” ve větě “Jdeme na rave?”', '[\"diskotéka\", \"závody\", \"drink\", \"párty\"]', 13, 0, 'slovnik', ''),
('video', 'Co znamená slovo “felit” ve větě “Je čas felit.”', '[\"uspokojovat se\", \"kouřit cigarety s přáteli\", \"jít ven\", \"přemýšlet\"]', 14, 3, 'slovnik', ''),
('video', 'Co znamená slovo “kár” ve větě “Ty seš fakt kár!”', '[\"vůl\", \"mužský pohlavní orgán\", \"kámoš\", \"holkolap\"]', 15, 1, 'slovnik', ''),
('question', 'asd', '[\"中文鍵盤/中文键盘\", \"sdf\"]', 76, 0, 'asd', 'asd');

-- --------------------------------------------------------

--
-- Struktura tabulky `score`
--

CREATE TABLE `score` (
  `userID` int(10) UNSIGNED NOT NULL,
  `Theme` varchar(255) NOT NULL,
  `Score` int(11) NOT NULL,
  `Id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `score`
--

INSERT INTO `score` (`userID`, `Theme`, `Score`, `Id`) VALUES
(14, 'gen-z', 7, 16),
(14, 'asd', 1, 17);

-- --------------------------------------------------------

--
-- Struktura tabulky `themes`
--

CREATE TABLE `themes` (
  `Id` int(11) NOT NULL,
  `Theme` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `themes`
--

INSERT INTO `themes` (`Id`, `Theme`) VALUES
(1, 'slovnik'),
(2, 'testing'),
(3, 'asd');

-- --------------------------------------------------------

--
-- Struktura tabulky `users`
--

CREATE TABLE `users` (
  `Id` int(10) UNSIGNED NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Creation` datetime NOT NULL DEFAULT current_timestamp(),
  `Token` varchar(255) DEFAULT NULL,
  `TokenCreation` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `users`
--

INSERT INTO `users` (`Id`, `Username`, `Email`, `Password`, `Creation`, `Token`, `TokenCreation`) VALUES
(10, 'qwe', 'qwe@qwe.qwe', '$2y$12$V5k8kEDp3GtVa9aNX8nI6uLnmCu15jn83W59eZ6LUSyIOPLXqZXDS', '2025-02-17 19:10:12', 'e844baf0cc83a77bac40c18e7a7155f7e4cff5d7e64f064bac54f923b2522346', '2025-02-20 12:03:49'),
(11, 'ert', 'ert@ert.ert', '$2y$12$K2PoAhCjpYvBmFMpWE9HIut3fTf5OhXVGBsKdfCnTIlO9ejgFbCCS', '2025-02-17 19:12:46', NULL, NULL),
(12, 'Robert&#039;); DROP TABLE score;', 'www@qqq.we', '$2y$12$2qdhfK/k3PWwY53QtDS1Z..WAem2fZmQ2K7aTwUok5CQ5/6ZG4R0a', '2025-02-19 09:45:39', NULL, NULL),
(13, '&quot;&gt;&lt;script&gt;alert(document.cookie)&lt;/script&gt;', 'q@q.q', '$2y$12$o5psXZKkWUoCsqjWw7yp8O5nOUUqzZo22IwqFENixidA3Jx34CEoi', '2025-02-19 09:48:06', NULL, NULL),
(14, 'qqq', 'qq@qq.qq', '$2y$12$jpPGNP0qHAVmifp/VP5JkOl/kPwU79F5lCRpiJK7f.5ouNvD7EviS', '2025-02-19 09:59:11', 'def3e068211a75de42e50a537220148c545d78914b78c66bee9c1932cf99f29e', '2025-02-19 08:59:21');

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`questionID`);

--
-- Indexy pro tabulku `score`
--
ALTER TABLE `score`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `userID` (`userID`);

--
-- Indexy pro tabulku `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`Id`);

--
-- Indexy pro tabulku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `questions`
--
ALTER TABLE `questions`
  MODIFY `questionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT pro tabulku `score`
--
ALTER TABLE `score`
  MODIFY `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pro tabulku `themes`
--
ALTER TABLE `themes`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pro tabulku `users`
--
ALTER TABLE `users`
  MODIFY `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `score`
--
ALTER TABLE `score`
  ADD CONSTRAINT `score_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
