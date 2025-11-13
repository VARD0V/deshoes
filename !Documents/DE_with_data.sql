-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Хост: MySQL-8.4
-- Время создания: Окт 16 2025 г., 18:52
-- Версия сервера: 8.4.4
-- Версия PHP: 8.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `DE_shoes`
--

-- --------------------------------------------------------

--
-- Структура таблицы `gender_shoes`
--

CREATE TABLE `gender_shoes` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `gender_shoes`
--

INSERT INTO `gender_shoes` (`id`, `name`) VALUES
(1, 'Женская обувь'),
(2, 'Мужская обувь');

-- --------------------------------------------------------

--
-- Структура таблицы `manufacturers`
--

CREATE TABLE `manufacturers` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `manufacturers`
--

INSERT INTO `manufacturers` (`id`, `name`) VALUES
(1, 'Kari'),
(2, 'Marco Tozzi'),
(3, 'Рос'),
(4, 'Alessio Nesca'),
(5, 'Rieker'),
(6, 'CROSBY');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `date_delivery` date DEFAULT NULL,
  `point` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `code` int DEFAULT NULL,
  `status_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `product_id`, `amount`, `date_order`, `date_delivery`, `point`, `user_id`, `code`, `status_id`) VALUES
(1, 1, 2, '2025-02-27', '2025-04-20', 1, 4, 901, 1),
(2, 3, 1, '2022-09-28', '2025-04-21', 11, 1, 902, 1),
(3, 5, 10, '2025-03-21', '2025-04-22', 2, 2, 903, 1),
(4, 7, 5, '2025-02-20', '2025-04-23', 11, 3, 904, 1),
(5, 2, 2, '2025-03-17', '2025-04-24', 2, 4, 905, 1),
(6, 4, 1, '2025-03-01', '2025-04-25', 15, 1, 906, 1),
(7, 6, 10, '2025-02-28', '2025-04-26', 3, 2, 907, 1),
(8, 8, 4, '2025-03-31', '2025-04-27', 19, 3, 908, 2),
(9, 9, 5, '2025-04-02', '2025-04-28', 5, 4, 909, 2),
(10, 11, 5, '2025-04-03', '2025-04-29', 19, 4, 910, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `points`
--

CREATE TABLE `points` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `points`
--

INSERT INTO `points` (`id`, `name`) VALUES
(1, '420151, г. Лесной, ул. Вишневая, 32'),
(2, '125061, г. Лесной, ул. Подгорная, 8'),
(3, '630370, г. Лесной, ул. Шоссейная, 24'),
(4, '400562, г. Лесной, ул. Зеленая, 32'),
(5, '614510, г. Лесной, ул. Маяковского, 47'),
(6, '410542, г. Лесной, ул. Светлая, 46'),
(7, '620839, г. Лесной, ул. Цветочная, 8'),
(8, '443890, г. Лесной, ул. Коммунистическая, 1'),
(9, '603379, г. Лесной, ул. Спортивная, 46'),
(10, '603721, г. Лесной, ул. Гоголя, 41'),
(11, '410172, г. Лесной, ул. Северная, 13'),
(12, '614611, г. Лесной, ул. Молодежная, 50'),
(13, '454311, г.Лесной, ул. Новая, 19'),
(14, '660007, г.Лесной, ул. Октябрьская, 19'),
(15, '603036, г. Лесной, ул. Садовая, 4'),
(16, '394060, г.Лесной, ул. Фрунзе, 43'),
(17, '410661, г. Лесной, ул. Школьная, 50'),
(18, '625590, г. Лесной, ул. Коммунистическая, 20'),
(19, '625683, г. Лесной, ул. 8 Марта'),
(20, '450983, г.Лесной, ул. Комсомольская, 26'),
(21, '394782, г. Лесной, ул. Чехова, 3'),
(22, '603002, г. Лесной, ул. Дзержинского, 28'),
(23, '450558, г. Лесной, ул. Набережная, 30'),
(24, '344288, г. Лесной, ул. Чехова, 1'),
(25, '614164, г.Лесной,  ул. Степная, 30'),
(26, '394242, г. Лесной, ул. Коммунистическая, 43'),
(27, '660540, г. Лесной, ул. Солнечная, 25'),
(28, '125837, г. Лесной, ул. Шоссейная, 40'),
(29, '125703, г. Лесной, ул. Партизанская, 49'),
(30, '625283, г. Лесной, ул. Победы, 46'),
(31, '614753, г. Лесной, ул. Полевая, 35'),
(32, '426030, г. Лесной, ул. Маяковского, 44'),
(33, '450375, г. Лесной ул. Клубная, 44'),
(34, '625560, г. Лесной, ул. Некрасова, 12'),
(35, '630201, г. Лесной, ул. Комсомольская, 17'),
(36, '190949, г. Лесной, ул. Мичурина, 26');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `articul` varchar(255) DEFAULT NULL,
  `type_product` int DEFAULT NULL,
  `unit` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `supplier` int DEFAULT NULL,
  `manufacturer` int DEFAULT NULL,
  `type_gender_shoes` int DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `articul`, `type_product`, `unit`, `price`, `supplier`, `manufacturer`, `type_gender_shoes`, `discount`, `amount`, `description`, `photo`) VALUES
(1, 'А112Т4', 1, 1, 4990, 1, 1, 1, 3, 6, 'Женские Ботинки демисезонные kari', '1.jpg'),
(2, 'F635R4', 1, 1, 3244, 2, 2, 1, 2, 13, 'Ботинки Marco Tozzi женские демисезонные, размер 39, цвет бежевый', '2.jpg'),
(3, 'H782T5', 2, 1, 4499, 1, 1, 2, 4, 5, 'Туфли kari мужские классика MYZ21AW-450A, размер 43, цвет: черный', '3.jpg'),
(4, 'G783F5', 1, 1, 5900, 1, 3, 2, 2, 8, 'Мужские ботинки Рос-Обувь кожаные с натуральным мехом', '4.jpg'),
(5, 'J384T6', 1, 1, 3800, 2, 5, 2, 2, 16, 'B3430/14 Полуботинки мужские Rieker', '5.jpg'),
(6, 'D572U8', 3, 1, 4100, 2, 3, 2, 3, 6, '129615-4 Кроссовки мужские', '6.jpg'),
(7, 'F572H7', 2, 1, 2700, 1, 2, 1, 2, 14, 'Туфли Marco Tozzi женские летние, размер 39, цвет черный', '7.jpg'),
(8, 'D329H3', 4, 1, 1890, 2, 4, 1, 4, 4, 'Полуботинки Alessio Nesca женские 3-30797-47, размер 37, цвет: бордовый', '8.jpg'),
(9, 'B320R5', 2, 1, 4300, 1, 5, 1, 2, 6, 'Туфли Rieker женские демисезонные, размер 41, цвет коричневый', '9.jpg'),
(10, 'G432E4', 2, 1, 2800, 1, 1, 1, 3, 15, 'Туфли kari женские TR-YR-413017, размер 37, цвет: черный', '10.jpg'),
(11, 'S213E3', 4, 1, 2156, 2, 6, 2, 3, 6, '407700/01-01 Полуботинки мужские CROSBY', ''),
(12, 'E482R4', 4, 1, 1800, 1, 1, 1, 2, 14, 'Полуботинки kari женские MYZ20S-149, размер 41, цвет: черный', ''),
(13, 'S634B5', 5, 1, 5500, 2, 6, 2, 3, 0, 'Кеды Caprice мужские демисезонные, размер 42, цвет черный', ''),
(14, 'K345R4', 4, 1, 2100, 2, 6, 2, 2, 3, '407700/01-02 Полуботинки мужские CROSBY', ''),
(15, 'O754F4', 2, 1, 5400, 2, 5, 1, 4, 18, 'Туфли женские демисезонные Rieker артикул 55073-68/37', ''),
(16, 'G531F4', 1, 1, 6600, 1, 1, 1, 12, 9, 'Ботинки женские зимние ROMER арт. 893167-01 Черный', ''),
(17, 'J542F5', 6, 1, 500, 1, 1, 2, 13, 0, 'Тапочки мужские Арт.70701-55-67син р.41', ''),
(18, 'B431R5', 1, 1, 2700, 2, 5, 2, 2, 5, 'Мужские кожаные ботинки/мужские ботинки', ''),
(19, 'P764G4', 2, 1, 6800, 1, 6, 1, 15, 15, 'Туфли женские, ARGO, размер 38', ''),
(20, 'C436G5', 1, 1, 10200, 1, 4, 1, 15, 9, 'Ботинки женские, ARGO, размер 40', ''),
(21, 'F427R5', 1, 1, 11800, 2, 5, 1, 15, 11, 'Ботинки на молнии с декоративной пряжкой FRAU', ''),
(22, 'N457T5', 4, 1, 4600, 1, 6, 1, 3, 13, 'Полуботинки Ботинки черные зимние, мех', ''),
(23, 'D364R4', 2, 1, 12400, 1, 1, 1, 16, 5, 'Туфли Luiza Belly женские Kate-lazo черные из натуральной замши', ''),
(24, 'S326R5', 6, 1, 9900, 2, 6, 2, 17, 15, 'Мужские кожаные тапочки \"Профиль С.Дали\" ', ''),
(25, 'L754R4', 4, 1, 1700, 1, 1, 1, 2, 7, 'Полуботинки kari женские WB2020SS-26, размер 38, цвет: черный', ''),
(26, 'M542T5', 3, 1, 2800, 2, 5, 2, 18, 3, 'Кроссовки мужские TOFA', ''),
(27, 'D268G5', 2, 1, 4399, 2, 5, 1, 3, 12, 'Туфли Rieker женские демисезонные, размер 36, цвет коричневый', ''),
(28, 'T324F5', 7, 1, 4699, 1, 6, 1, 2, 5, 'Сапоги замша Цвет: синий', ''),
(29, 'K358H6', 6, 1, 599, 1, 5, 2, 20, 2, 'Тапочки мужские син р.41', ''),
(30, 'H535R5', 1, 1, 2300, 2, 5, 1, 2, 7, 'Женские Ботинки демисезонные', '');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'Администратор'),
(2, 'Менеджер'),
(3, 'Авторизированный клиент');

-- --------------------------------------------------------

--
-- Структура таблицы `statuses`
--

CREATE TABLE `statuses` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `statuses`
--

INSERT INTO `statuses` (`id`, `name`) VALUES
(1, 'Завершен'),
(2, 'Новый');

-- --------------------------------------------------------

--
-- Структура таблицы `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`) VALUES
(1, 'Kari'),
(2, 'Обувь для вас');

-- --------------------------------------------------------

--
-- Структура таблицы `type_products`
--

CREATE TABLE `type_products` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `type_products`
--

INSERT INTO `type_products` (`id`, `name`) VALUES
(1, 'Ботинки'),
(2, 'Туфли'),
(3, 'Кроссовки'),
(4, 'Полуботинки'),
(5, 'Кеды'),
(6, 'Тапочки'),
(7, 'Сапоги');

-- --------------------------------------------------------

--
-- Структура таблицы `units`
--

CREATE TABLE `units` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `units`
--

INSERT INTO `units` (`id`, `name`) VALUES
(1, 'шт.');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `role_id` int DEFAULT NULL,
  `fio` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `role_id`, `fio`, `email`, `password`) VALUES
(1, 1, 'Никифорова Весения Николаевна', '94d5ous@gmail.com', 'uzWC67'),
(2, 1, 'Сазонов Руслан Германович', 'uth4iz@mail.com', '2L6KZG'),
(3, 1, 'Одинцов Серафим Артёмович', 'yzls62@outlook.com', 'JlFRCZ'),
(4, 2, 'Степанов Михаил Артёмович', '1diph5e@tutanota.com', '8ntwUp'),
(5, 2, 'Ворсин Петр Евгеньевич', 'tjde7c@yahoo.com', 'YOyhfR'),
(6, 2, 'Старикова Елена Павловна', 'wpmrc3do@tutanota.com', 'RSbvHv'),
(7, 3, 'Михайлюк Анна Вячеславовна', '5d4zbu@tutanota.com', 'rwVDh9'),
(8, 3, 'Ситдикова Елена Анатольевна', 'ptec8ym@yahoo.com', 'LdNyos'),
(9, 3, 'Ворсин Петр Евгеньевич', '1qz4kw@mail.com', 'gynQMT'),
(10, 3, 'Старикова Елена Павловна', '4np6se@mail.com', 'AtnDjr');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `gender_shoes`
--
ALTER TABLE `gender_shoes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `orders_index_0` (`product_id`),
  ADD KEY `orders_index_1` (`point`),
  ADD KEY `orders_index_2` (`user_id`),
  ADD KEY `orders_index_3` (`status_id`);

--
-- Индексы таблицы `points`
--
ALTER TABLE `points`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `products_index_0` (`type_product`),
  ADD KEY `products_index_1` (`unit`),
  ADD KEY `products_index_2` (`supplier`),
  ADD KEY `products_index_3` (`manufacturer`),
  ADD KEY `products_index_4` (`type_gender_shoes`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `users_index_0` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `gender_shoes`
--
ALTER TABLE `gender_shoes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `points`
--
ALTER TABLE `points`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `units`
--
ALTER TABLE `units`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`point`) REFERENCES `points` (`id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`type_product`) REFERENCES `type_products` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`type_gender_shoes`) REFERENCES `gender_shoes` (`id`),
  ADD CONSTRAINT `products_ibfk_3` FOREIGN KEY (`manufacturer`) REFERENCES `manufacturers` (`id`),
  ADD CONSTRAINT `products_ibfk_4` FOREIGN KEY (`supplier`) REFERENCES `suppliers` (`id`),
  ADD CONSTRAINT `products_ibfk_5` FOREIGN KEY (`unit`) REFERENCES `units` (`id`);

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
