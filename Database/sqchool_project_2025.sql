-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: localhost
-- Vytvořeno: Pát 21. úno 2025, 10:38
-- Verze serveru: 10.4.28-MariaDB
-- Verze PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `school_project_2025`
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
('video', 'Co znamená slovo “dyk” ve větě “Dyk jaký má šaty!”', '[\"dýka\", \"díky\", \"mužský pohlavní orgán\", \"koukej\"]', 1, 3, 'slovnik', 'https://youtu.be/Vc2XG2Uwt9w'),
('video', 'Co znamená slovo “valit” ve větě “Co borec valí?”', '[\"balit holku\", \"mluvit nesmysly\", \"balit cigaretu\", \"koulet předmět\"]', 2, 1, 'slovnik', 'https://youtu.be/XxWbqB4OW7o'),
('video', 'Co znamená slovo “more” ve větě “more tak to je crazy”', '[\"více\", \"nechápu\", \"kámo\", \"moře bez ř\"]', 3, 2, 'slovnik', 'https://youtu.be/asqvH57QA5M'),
('video', 'Co znamená pojem “hell nah” ve větě “Hell nah, to si deláš srandu.”', '[\"vůbec ne\", \"nebesky ne\", \"možná\", \"blázen\"]', 4, 0, 'slovnik\r\n', 'https://youtu.be/_AWh6T41yF4'),
('video', 'Co znamená pojem “goated” ve větě “To je mega goated hra.”', '[\"primitivní jako zvíře\", \"špatný\", \"nepovedená\", \"nejlepší ze všech\"]', 5, 3, 'slovnik', 'https://youtu.be/C4x2dfum9L0'),
('video', 'Co znamená pojem “on god” ve větě “Ta kalba byla mega fajn!” “On god!”', '[\"souhlasím\", \"ano\", \"doslova\", \"na slovo boží\"]', 6, 2, 'slovnik', 'https://youtu.be/JChJC_e0Y8A'),
('video', 'Co znamená slovo “ara” ve větě “Ara, policie!”', '[\"bacha\", \"nečum\", \"papoušek\", \"utíkej!\"]', 7, 0, 'slovnik', 'https://youtu.be/CAW-ENSK-aY'),
('video', 'Jaký význam má pojem “ghostnout” ve větě “Borec mě totálně vyghostil.”', '[\"vyděsit někoho\", \"ignorovat někoho\", \"dokouřit rychle cigaretu\", \"zapálit oblečení\"]', 8, 1, 'slovnik', 'https://youtu.be/9KHgoZYAeWg'),
('video', 'Co znamená slovo “čára” ve větě “Dáme čáru?”', '[\"lajna\", \"panák\", \"šňupací tabák\", \"dřevotříska\"]', 9, 0, 'slovnik', 'https://youtu.be/45S3Td-FEGo'),
('video', 'Jaký význam má pojem “lock in” ve větě “Já jsem se locknul in”', '[\"uzavřít se do sebe\", \"zamknout\", \"přestat myslet\", \"pořádně se soustředit\"]', 10, 3, 'slovnik', 'https://youtu.be/W5Hd_7S_PPo'),
('video', 'Jaký význam má pojem “netflix and chill” ve větě “dáme netflix and chill?”', '[\"povídání o filmech\", \"filmový večer\", \"film a po něm pohlavní styk\", \"promítání na dobrou věc\"]', 11, 2, 'slovnik', 'https://youtu.be/1zWjIm9c2hU'),
('video', 'Co znamená slovo “houska” ve větě “Pořádám housku v pátek.”', '[\"párty, kde hraje housová muzika\", \"akce u někoho doma\", \"pečivo\"]', 12, 1, 'slovnik', 'https://youtu.be/xh9xg0RLm_Y'),
('video', 'Co znamená slovo “rave” ve větě “Jdeme na rave?”', '[\"diskotéka\", \"závody\", \"drink\", \"párty\"]', 13, 0, 'slovnik', 'https://youtu.be/60AK8JhH9YQ'),
('video', 'Co znamená slovo “felit” ve větě “Je čas felit.”', '[\"uspokojovat se\", \"kouřit cigarety s přáteli\", \"jít ven\", \"přemýšlet\"]', 14, 3, 'slovnik', 'https://youtu.be/vXNhEqcZZUQ'),
('video', 'Co znamená slovo “kár” ve větě “Ty seš fakt kár!”', '[\"vůl\", \"mužský pohlavní orgán\", \"kámoš\", \"holkolap\"]', 15, 1, 'slovnik', 'https://youtu.be/yrh9qJgRies'),
('question', 'asd', '[\"中文鍵盤/中文键盘\", \"sdf\"]', 76, 0, 'asd', 'asd'),
('picture', 'Jak se jmenuje píseň, která je označována jako Rickroll?', '[\"Já miluju Minecraft\", \"We\'re no strangers to love\", \"Jede jede mašinka\", \"Never gonna give you up\"]', 77, 3, 'zabava', '/Images/Rickroll.webp'),
('picture', 'Jaký známý font, je spojován s postavou Doge?', '[\"Comic Sans\", \"Arial\", \"Roboto\", \"Lobotomio\"]', 78, 0, 'zabava', '/Images/Doge.webp'),
('picture', 'Jak se jmenuje tento meme?', '[\"LOTR dance\", \"Gandalf Sax\", \"Gandalf vibe\", \"Gandalf sex\"]', 79, 1, 'zabava', '/Images/GandalfSax.webp'),
('picture', 'Jak se jmenuje dívka, která zpívá “apple bottom jeans”?', '[\"Violet\", \"Kristýna\", \"Leontýna\", \"Jessica\"]', 80, 3, 'zabava', '/Images/AppleBottomJeans.webp'),
('picture', 'Co zahřívalo Zdenu pod kořenem?', '[\"Vzpomínky na rodinu\", \"Horká klobása z grilu\", \"Teplá moč\", \"Krtek který se o ni třel\"]', 81, 2, 'zabava', '/Images/Zdena.webp'),
('picture', 'Jakou slavnou hlášku řekl Jiří Kára na tomto snímku?', '[\"Hlavně, že máš pivo vole\", \"Ty vole zvedni to!\", \"Dělej, už jsi tady měl být 4 minuty ty magore!\", \"Hejj pod se hned Kláro!\"]', 82, 2, 'zabava', '/Images/JiriKara.webp'),
('picture', 'Jak se jmenuje tento vepř, který všem pořád volá?', '[\"Michael Addams\", \"John Pork\", \"Daddy Pig\", \"Alex Adams\"]', 83, 1, 'zabava', '/Images/JohnPork.webp'),
('picture', 'Doplňte větu “Its ______ time…', '[\"morbin\", \"clobberin,\", \"real\", \"my\"]', 84, 0, 'zabava', '/Images/ItsMorbinTime.webp'),
('picture', 'Jak se jmenuje toto dítě?', '[\"Lukas\", \"Finger\", \"Ladesh\", \"Mohamad\"]', 85, 1, 'zabava', '/Images/KidNamesFinger.webp'),
('picture', 'Které emoji vyjadřují, že je něco vtipné?', '[\"oheň a voda\", \"mrkající a smějící se emoji\", \"Brečící emoji a lebka\", \"žádná reakce\"]', 86, 2, 'zabava', '/Images/Emoji.webp'),
('question', 'WAP – co to znamená?', '[\"Wet Ass Pussy\", \"Waflová Ananasová Pizza\", \"Wi-Fi Automatický Přenašeč\", \"World Animal Protection\"]', 87, 0, 'kultura', ''),
('question', 'Co znamená KSN?', '[\"KRÁSA STŘÍDÁ NÁDHERU\", \"Každý Soused Naštvaný\", \"Křupavé Sýrové Nudle\", \"Klub Slavnostních Nindžů\"]', 88, 0, 'kultura', ''),
('question', 'Jaké džíny se nenosí?', '[\"Baggy jeans\", \"Klasické rovné džíny\", \"Skinny jeans\", \"Potrhané jeans\"]', 89, 2, 'kultura', ''),
('question', 'Co znamená baggy?', '[\"Typ sukně\", \"Volný střih\", \"Druh kabátu\", \"Rapperské oblečení\"]', 90, 1, 'kultura', ''),
('question', 'Co znamená topless?', '[\"Sportovní tílko\", \"Bez trička\", \"Dlouhý rukáv\", \"Tričko nad pupík\"]', 91, 1, 'kultura', ''),
('question', 'Co znamená, když je něco custom?', '[\"Od značky\", \"Vyrobené v továrně bez úprav\", \"Na míru\", \"Upravit si oblečení podle sebe\"]', 92, 2, 'kultura', ''),
('question', 'Jaká mapa je nejznámější ve hře CS:GO?', '[\"Italy\", \"Dust II\", \"Cache\", \"Mirage\"]', 93, 1, 'zabava', ''),
('question', 'Jak se jmenuje hlavní postava ze hry Minecraft?', '[\"Mirek\", \"Jakub\", \"Steve\", \"Ondřej\"]', 94, 2, 'zabava', ''),
('question', 'Nejznámější hláška ze hry Mortal Kombat?', '[\"Here we go again\", \"Get over here\", \"中文鍵盤/中文键盘\", \"For Demacia\"]', 95, 1, 'zabava', ''),
('question', 'V jaké hře se používá měna V-Bucks?', '[\"CS:GO\", \"Dota 2\", \"Rust\", \"Fortnite\"]', 96, 3, 'zabava', ''),
('question', 'Jaký je zvuk umírání v Robloxu?', '[\"Oof\", \"JEJDA MANE\", \"AAAAH\", \"AU\"]', 97, 0, 'zabava', '');

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
(14, 'asd', 1, 17),
(15, 'slovnik', 11, 18);

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
(3, 'asd'),
(4, 'kultura'),
(5, 'zabava');

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
(10, 'qwe', 'qwe@qwe.qwe', '$2y$12$V5k8kEDp3GtVa9aNX8nI6uLnmCu15jn83W59eZ6LUSyIOPLXqZXDS', '2025-02-17 19:10:12', 'bfca28eefb402deb5981046005b4b83a6ac2a1e1fdea5d805a74c52ea393c43e', '2025-02-20 18:21:02'),
(11, 'ert', 'ert@ert.ert', '$2y$12$K2PoAhCjpYvBmFMpWE9HIut3fTf5OhXVGBsKdfCnTIlO9ejgFbCCS', '2025-02-17 19:12:46', NULL, NULL),
(12, 'Robert&#039;); DROP TABLE score;', 'www@qqq.we', '$2y$12$2qdhfK/k3PWwY53QtDS1Z..WAem2fZmQ2K7aTwUok5CQ5/6ZG4R0a', '2025-02-19 09:45:39', NULL, NULL),
(13, '&quot;&gt;&lt;script&gt;alert(document.cookie)&lt;/script&gt;', 'q@q.q', '$2y$12$o5psXZKkWUoCsqjWw7yp8O5nOUUqzZo22IwqFENixidA3Jx34CEoi', '2025-02-19 09:48:06', NULL, NULL),
(14, 'qqq', 'qq@qq.qq', '$2y$12$jpPGNP0qHAVmifp/VP5JkOl/kPwU79F5lCRpiJK7f.5ouNvD7EviS', '2025-02-19 09:59:11', 'def3e068211a75de42e50a537220148c545d78914b78c66bee9c1932cf99f29e', '2025-02-19 08:59:21'),
(15, 'nigger', 'nigger@balls.radimjefaktcurak', '$2y$12$.GbaTUM0qcyi1TxnGzSdReOiSbCzfxDKtOjA3d496MWDXbfEGWyY2', '2025-02-20 19:28:09', '4833061a4f41b191397532678efbc8290ed0fb1508a9ea81452a4f067bcbf1a9', '2025-02-20 18:28:18');

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
  MODIFY `questionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT pro tabulku `score`
--
ALTER TABLE `score`
  MODIFY `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pro tabulku `themes`
--
ALTER TABLE `themes`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pro tabulku `users`
--
ALTER TABLE `users`
  MODIFY `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
