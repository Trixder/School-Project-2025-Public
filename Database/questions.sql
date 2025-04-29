-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Úte 18. úno 2025, 10:00
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
  `theme` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vypisuji data pro tabulku `questions`
--

INSERT INTO `questions` (`type`, `value`, `answers`, `questionID`, `correctID`, `theme`) VALUES
('question', 'Co znamená slovo “dyk” ve větě “Dyk jaký má šaty!”', '[\"koukej\", \"díky\", \"penis\"]', 1, 0, 'gen-z'),
('question', 'Co znamená slovo “valit” ve větě “Co borec valí?”', '[\"balit holku\", \"mluvit nesmysly\", \"balit cigaretu\", \"koulet předmět\"]', 2, 1, 'gen-z'),
('question', 'Co znamená slovo “more” ve větě “more tak to je crazy”', '[\"více\", \"nechápu\", \"kámo\", \"moře bez ř\"]', 3, 2, 'gen-z'),
('question', 'Co znamená pojem “hell nah” ve větě “Hell nah, to si deláš srandu.”', '[\"vůbec ne\", \"nebesky ne\", \"možná\", \"blázen\"]', 4, 0, 'gen-z'),
('question', 'Co znamená pojem “goated” ve větě “To je mega goated hra.”', '[\"primitivní jako zvíře\", \"nejlepší ze všech\", \"nepovedený\"]', 5, 1, 'gen-z'),
('question', 'Co znamená pojem “on god” ve větě “Ta kalba byla mega fajn!” “On god!”', '[\"souhlasím\", \"ano\", \"doslova\", \"na slovo boží\"]', 6, 0, 'gen-z'),
('question', 'Co znamená slovo “ara” ve větě “Ara, policie!”', '[\"bacha\", \"nečum\", \"papoušek\", \"utíkej!\"]', 7, 0, 'gen-z'),
('question', 'Jaký význam má pojem “ghostnout” ve větě “Borec mě totálně vyghostil.”', '[\"vyděsit někoho\", \"ignorovat někoho\", \"dokouřit rychle cigaretu\", \"zapálit oblečení\"]', 8, 1, 'gen-z'),
('question', 'Co znamená slovo “čára” ve větě “Dáme čáru?”', '[\"lajna\", \"panák\", \"šňupací tabák\", \"dřevotříska\"]', 9, 1, 'gen-z'),
('question', 'Jaký význam má pojem “lock in” ve větě “Já jsem se locknul in”', '[\"pořádně se soustředit\", \"uzavřít se do sebe\", \"zamknout\", \"přestat myslet\"]', 10, 0, 'gen-z'),
('question', 'Jaký význam má pojem “netflix and chill” ve větě “dáme netflix and chill?”', '[\"povídání o filmech\", \"filmový večer\", \"film a po něm pohlavní styk\", \"promítání na dobrou věc\"]', 11, 2, 'gen-z'),
('question', 'Co znamená slovo “houska” ve větě “Pořádám houku v pátek.”', '[\"párty, kde hraje housová muzika\", \"akce u někoho doma\", \"pečivo\"]', 12, 1, 'gen-z'),
('question', 'Co znamená slovo “rave” ve větě “Jdeme na rave?”', '[\"diskotéka\", \"závody\", \"drink\"]', 13, 0, 'gen-z'),
('question', 'Co znamená slovo “felit” ve větě “Je čas felit.”', '[\"uspokojovat se\", \"kouřit cigarety s přáteli\", \"jít ven\"]', 14, 2, 'gen-z'),
('question', 'Co znamená slovo “kár” ve větě “Ty seš fakt kár!”', '[\"vůl\", \"mužský pohlavní orgán\", \"kámoš\", \"holkolap\"]', 61, 1, 'gen-z');

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`questionID`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `questions`
--
ALTER TABLE `questions`
  MODIFY `questionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
