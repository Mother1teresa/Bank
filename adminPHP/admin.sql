-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 19 2024 г., 17:37
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
-- База данных: `admin`
--

-- --------------------------------------------------------

--
-- Структура таблицы `productsForbusiness`
--

CREATE TABLE `productsForbusiness` (
  `id` int UNSIGNED NOT NULL,
  `productsTitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `productsImage` varchar(255) NOT NULL,
  `backgclass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `productsForbusiness`
--

INSERT INTO `productsForbusiness` (`id`, `productsTitle`, `productsImage`, `backgclass`) VALUES
(1, 'Бесплатная регистрация бизнеса', '/src/img/main/pc.png', '.gray'),
(2, 'Сервис проверки контрагентов', '/src/img/main/document.png', '.blue'),
(3, 'Корпоративная карта с увеличенным лимитом', '/src/img/main/cred-card.png', '.purple');

-- --------------------------------------------------------

--
-- Структура таблицы `tariffs`
--

CREATE TABLE `tariffs` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `pestitle` varchar(255) NOT NULL,
  `pedesc` varchar(255) NOT NULL,
  `frtTitle` varchar(255) NOT NULL,
  `frDesc` varchar(255) NOT NULL,
  `prtitle` varchar(255) NOT NULL,
  `prdesc` varchar(255) NOT NULL,
  `prText` varchar(255) NOT NULL,
  `paTitle` varchar(255) NOT NULL,
  `paDes` varchar(255) NOT NULL,
  `paText` varchar(255) NOT NULL,
  `caDeTitle` varchar(255) NOT NULL,
  `caDesc` varchar(255) NOT NULL,
  `caDeText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `caWTille` varchar(255) NOT NULL,
  `caWDesc` varchar(255) NOT NULL,
  `caWText` varchar(255) NOT NULL,
  `posTitle` varchar(255) NOT NULL,
  `posDesc` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `tariffs`
--

INSERT INTO `tariffs` (`id`, `title`, `description`, `pestitle`, `pedesc`, `frtTitle`, `frDesc`, `prtitle`, `prdesc`, `prText`, `paTitle`, `paDes`, `paText`, `caDeTitle`, `caDesc`, `caDeText`, `caWTille`, `caWDesc`, `caWText`, `posTitle`, `posDesc`, `image`) VALUES
(1, 'Оптимум +', 'Подходит для клиентов с торговым эквайрингом — комиссия от 1,3% без привязки к оборотам. Бесплатные переводы на счета физлиц до 300 000 ₽ — далее от 1,7%', '1 690 ₽/мес', 'обслуживание', 'Бесплатно', '15 переводов бизнесу, далее — 50 ₽', 'Платежи физ. лицам', 'Далее от 1,7% от суммы', '', 'Платежи юр.лицам', 'Бесплатно', 'В другие банки 15 платежей/мес бесплатно - далее 50₽ за платёж', 'Внесение наличных', 'Бесплатно до 100 000 ₽', 'Далее 0,2% от суммы', 'Снятие наличных', 'до 3 млн. ₽ 1,2% от суммы', 'В сторонних банках 1,5% от суммы', 'POS-терминал', '490 ₽ при оборотах до 200 000₽', '/src/img/main/termen.png'),
(2, 'Эксперт', 'Тариф без лишних условий — эквайринг 1% вне зависимости от вида деятельности', 'от 1% от суммы', 'комиссия за зачисление на счёт', 'Бесплатно', 'переводы физлицам — бесплатно до 1 млн ₽', 'Платежи физ. лицам', 'Бесплатно до 1 000 000 ₽/мес', 'Далее от 3% от суммы', 'Платежи юр.лицам', 'Бесплатно', '', 'Внесение наличных', 'Бесплатно', '', 'Снятие наличных', 'Бесплатно до 1 000 000 ₽', 'Далее 2,5% от суммы В сторонних банках 0,5% до 1 000 000₽ - далее 1,5% от суммы', 'POS-терминал', '1490 ₽ при оборотах до 200 000₽', '/src/img/main/bg.png'),
(3, 'Бизнес старт', 'Подходит тем, у кого сезонный бизнес или кто только начинает работу с банком. Переводы на счета физлиц до 300 000 рублей — бесплатно, далее комиссия от 1,7% за перевод', '0 ₽/мес', 'обслуживание', 'Бесплатно', '3 перевода бизнесу, далее — 199 ₽', 'Платежи физ. лицам', 'Бесплатно до 300 000 ₽/мес', '', 'Платежи юр.лицам', '3 платежа/мес бесплатно', 'Далее 199 ₽ за платёж', 'Внесение наличных', '0,2% от суммы', 'Через устройства самообслуживания с использованием бизнес-карты', 'Снятие наличных', 'до 3 млн. ₽ 1,2% от суммы', 'В сторонних банках 1,5% от суммы', 'POS-терминал', '1500 ₽ при оборотах до 50 000 ₽', '/src/img/main/start.png'),
(4, 'Развивая бизнес', 'Подходит для клиентов с большим количеством платежей на счета физлиц. Переводы на счета физлиц до 500 000 ₽ —бесплатно, далее комиссия от 1,7% за перевод', '490 ₽/мес', 'обслуживание', 'Бесплатно', '6 переводов бизнесу, далее — 100 ₽', 'Платежи физ. лицам', 'Бесплатно до 500 000 ₽/мес', 'Далее от 1,7% от суммы', 'Платежи юр.лицам', '6 платежей/мес бесплатно', 'Далее 100₽ за платёж', 'Внесение наличных', '0,3% до 100 000 ₽', 'Далее 0,25% от суммы', 'Снятие наличных', 'до 3 млн. ₽ 1,2% от суммы', 'В сторонних банках 1,5% от суммы', 'POS-терминал', '1500 ₽ при оборотах до 50 000 ₽', '/src/img/main/time.png');

-- --------------------------------------------------------

--
-- Структура таблицы `UsefulINformation`
--

CREATE TABLE `UsefulINformation` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `UsefulINformation`
--

INSERT INTO `UsefulINformation` (`id`, `title`, `description`) VALUES
(1, 'Для чего нужен расчётный счёт', 'В соответствии с существующими требованиями законодательства все расчёты между организациями, сумма которых превышает 100 000 ₽, должны проводиться только в безналичной форме. Именно поэтому ведение бизнеса сегодня практически всегда предполагает открытие расчётного счёта'),
(2, 'Бесплатные услуги', 'Открытие счёта в рублях РФ\r\nОткрытие второго или последующего счёта в рублях РФ\r\nОбслуживание счёта в иностранной валюте\r\nУдостоверение документов (Устава, прочих документов), оформление (заверение) карточки образцов подписей и оттиска печати\r\nПлатёжные поручения внутри банка с использованием\r\nДистанционной банковской системы');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `productsForbusiness`
--
ALTER TABLE `productsForbusiness`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tariffs`
--
ALTER TABLE `tariffs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `UsefulINformation`
--
ALTER TABLE `UsefulINformation`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `productsForbusiness`
--
ALTER TABLE `productsForbusiness`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `tariffs`
--
ALTER TABLE `tariffs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `UsefulINformation`
--
ALTER TABLE `UsefulINformation`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
