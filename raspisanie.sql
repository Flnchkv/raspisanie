-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 04 2023 г., 17:43
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `raspisanie`
--

-- --------------------------------------------------------

--
-- Структура таблицы `acad_group`
--

CREATE TABLE `acad_group` (
  `id_group` int NOT NULL,
  `direction` varchar(100) NOT NULL,
  `count` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `auditory`
--

CREATE TABLE `auditory` (
  `id_auditory` varchar(4) NOT NULL,
  `id_type` int NOT NULL,
  `capacity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cafedrs`
--

CREATE TABLE `cafedrs` (
  `id_cafedr` int NOT NULL,
  `school` varchar(50) NOT NULL,
  `cafedr_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `disc`
--

CREATE TABLE `disc` (
  `id_disc` int NOT NULL,
  `disc_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `hours` int NOT NULL,
  `oth` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `itog`
--

CREATE TABLE `itog` (
  `id_zan` int NOT NULL,
  `id_group` int NOT NULL,
  `id_teacher` int NOT NULL,
  `num` int NOT NULL,
  `weekday` int NOT NULL,
  `id_auditory` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `teachers`
--

CREATE TABLE `teachers` (
  `id_teacher` int NOT NULL,
  `fio` varchar(100) NOT NULL,
  `id_cafedr` int NOT NULL,
  `id_disc` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `time`
--

CREATE TABLE `time` (
  `num` int NOT NULL,
  `start` time NOT NULL,
  `finish` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `time`
--

INSERT INTO `time` (`num`, `start`, `finish`) VALUES
(1, '08:30:00', '10:00:00'),
(2, '10:10:00', '11:40:00'),
(3, '11:50:00', '13:20:00'),
(4, '13:30:00', '15:00:00'),
(5, '15:10:00', '16:40:00'),
(6, '16:50:00', '18:20:00'),
(7, '18:30:00', '20:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `type`
--

CREATE TABLE `type` (
  `id_type` int NOT NULL,
  `type` varchar(50) NOT NULL,
  `duration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `zanyatie`
--

CREATE TABLE `zanyatie` (
  `id_zan` int NOT NULL,
  `id_disc` int NOT NULL,
  `id_type` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `acad_group`
--
ALTER TABLE `acad_group`
  ADD PRIMARY KEY (`id_group`);

--
-- Индексы таблицы `auditory`
--
ALTER TABLE `auditory`
  ADD PRIMARY KEY (`id_auditory`),
  ADD KEY `id_type` (`id_type`);

--
-- Индексы таблицы `cafedrs`
--
ALTER TABLE `cafedrs`
  ADD KEY `id_cafedr_2` (`id_cafedr`);

--
-- Индексы таблицы `disc`
--
ALTER TABLE `disc`
  ADD PRIMARY KEY (`id_disc`);

--
-- Индексы таблицы `itog`
--
ALTER TABLE `itog`
  ADD KEY `id_zan` (`id_zan`,`id_group`,`id_teacher`,`num`,`id_auditory`),
  ADD KEY `id_teacher` (`id_teacher`),
  ADD KEY `id_group` (`id_group`),
  ADD KEY `num` (`num`),
  ADD KEY `id_auditory` (`id_auditory`);

--
-- Индексы таблицы `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id_teacher`),
  ADD KEY `id_cafedr` (`id_cafedr`),
  ADD KEY `id_disc` (`id_disc`);

--
-- Индексы таблицы `time`
--
ALTER TABLE `time`
  ADD PRIMARY KEY (`num`);

--
-- Индексы таблицы `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id_type`);

--
-- Индексы таблицы `zanyatie`
--
ALTER TABLE `zanyatie`
  ADD PRIMARY KEY (`id_zan`),
  ADD KEY `id_disc` (`id_disc`,`id_type`),
  ADD KEY `id_type` (`id_type`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `time`
--
ALTER TABLE `time`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `auditory`
--
ALTER TABLE `auditory`
  ADD CONSTRAINT `auditory_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `type` (`id_type`);

--
-- Ограничения внешнего ключа таблицы `cafedrs`
--
ALTER TABLE `cafedrs`
  ADD CONSTRAINT `cafedrs_ibfk_1` FOREIGN KEY (`id_cafedr`) REFERENCES `teachers` (`id_cafedr`);

--
-- Ограничения внешнего ключа таблицы `itog`
--
ALTER TABLE `itog`
  ADD CONSTRAINT `itog_ibfk_1` FOREIGN KEY (`id_teacher`) REFERENCES `teachers` (`id_teacher`),
  ADD CONSTRAINT `itog_ibfk_2` FOREIGN KEY (`id_group`) REFERENCES `acad_group` (`id_group`),
  ADD CONSTRAINT `itog_ibfk_3` FOREIGN KEY (`id_zan`) REFERENCES `zanyatie` (`id_zan`),
  ADD CONSTRAINT `itog_ibfk_4` FOREIGN KEY (`num`) REFERENCES `time` (`num`),
  ADD CONSTRAINT `itog_ibfk_5` FOREIGN KEY (`id_auditory`) REFERENCES `auditory` (`id_auditory`);

--
-- Ограничения внешнего ключа таблицы `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`id_cafedr`) REFERENCES `cafedrs` (`id_cafedr`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `teachers_ibfk_2` FOREIGN KEY (`id_disc`) REFERENCES `disc` (`id_disc`);

--
-- Ограничения внешнего ключа таблицы `zanyatie`
--
ALTER TABLE `zanyatie`
  ADD CONSTRAINT `zanyatie_ibfk_1` FOREIGN KEY (`id_disc`) REFERENCES `disc` (`id_disc`),
  ADD CONSTRAINT `zanyatie_ibfk_2` FOREIGN KEY (`id_type`) REFERENCES `auditory` (`id_type`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
