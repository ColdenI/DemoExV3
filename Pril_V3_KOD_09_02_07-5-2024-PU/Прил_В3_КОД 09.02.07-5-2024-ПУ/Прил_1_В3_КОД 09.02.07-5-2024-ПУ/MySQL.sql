--
-- База данных: `user48`
--

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--
USE `demo_ex_v3`;
CREATE TABLE `order` (
  `orderid` int(11) NOT NULL,
  `orderstatus` varchar(50) NOT NULL,
  `paymentstatus` varchar(50) NOT NULL,
  `paymentmethod` varchar(50) NOT NULL,
  `datecreation` date NOT NULL,
  `addres` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`orderid`, `orderstatus`, `paymentstatus`, `paymentmethod`, `datecreation`, `addres`) VALUES
(1, 'готовится', 'принят', 'наличные', '2023-06-06', 'Россия, г. Тамбов, Социалистическая ул., д. 6'),
(2, 'готов', 'оплачен', 'наличные', '2023-06-07', 'Россия, г. Ангарск, Комсомольская ул., д. 13'),
(3, 'готовится', 'принят', 'ипотека', '2023-06-08', 'Россия, г. Щёлково, Центральная ул., д. 5'),
(4, 'готов', 'оплачен', 'ипотека', '2023-06-09', 'Россия, г. Петропавловск-Камчатский, Вокзальная ул'),
(5, 'готов', 'принят', 'наличные', '2023-06-10', 'Россия, г. Самара, Цветочная ул., д. 21');

-- --------------------------------------------------------

--
-- Структура таблицы `orderpersonlist`
--

CREATE TABLE `orderpersonlist` (
  `orderuserlistid` int(11) NOT NULL,
  `personrid` int(11) NOT NULL,
  `orderid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `person`
--

CREATE TABLE `person` (
  `personid` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `personrole` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Дамп данных таблицы `person`
--

INSERT INTO `person` (`personid`, `firstname`, `lastname`, `middlename`, `personrole`) VALUES
(1, 'Николай', 'Селиванов', 'Даниилович', 'Пользователь'),
(2, 'Никита', 'Афанасьев', 'Львович', 'Пользователь'),
(3, 'Мария', 'Кириллова', 'Львовна', 'Пользователь'),
(4, 'Анна', 'Савина', 'Серафимовна', 'Пользователь'),
(5, 'Алиса', 'Зайцева', 'Адамовна', 'Пользователь'),
(6, 'Степан', 'Фадеев', 'Романович', 'Пользователь'),
(7, 'Ева', 'Яковлева', 'Максимовна', 'Пользователь'),
(8, 'Станислав', 'Зиновьев', 'Демидович', 'Пользователь'),
(9, 'Андрей', 'Корнев', 'Ильич', 'Пользователь'),
(10, 'Иван', 'Кондрашов', 'Даниилович', 'Пользователь'),
(11, 'Александр', 'Ульянов', 'Даниилович', 'Клиент'),
(12, 'Милана', 'Карпова', 'Вячеславовна', 'Клиент'),
(13, 'Иван', 'Коротков', 'Иванович', 'Клиент'),
(14, 'София', 'Черная', 'Марковна', 'Клиент'),
(15, 'Сафия', 'Дементьева', 'Матвеевна', 'Клиент');

-- --------------------------------------------------------

--
-- Структура таблицы `shift`
--

CREATE TABLE `shift` (
  `shiftid` int(11) NOT NULL,
  `datestart` date NOT NULL,
  `dateend` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `userroleid` int(11) NOT NULL,
  `personid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`userid`, `login`, `password`, `status`, `userroleid`, `personid`) VALUES
(1, 'rubies', 'cmjcFvB3cI', NULL, 2, 1),
(2, 'windle', '2PAUAd0gMZ', NULL, 1, 2),
(3, 'improv', 'bcFFGU16f6', NULL, 1, 3),
(4, 'moving', 'A8HPZz9HTG', NULL, 2, 4),
(5, 'bellum', 'ZjXm3JW7RJ', NULL, 3, 5),
(6, 'siller', 'dVMfx1VMFF', NULL, 3, 6),
(7, 'ragman', '25Y9oOkwHn', NULL, 2, 7),
(8, 'fautor', 'RJ41C0qynP', NULL, 3, 8),
(9, 'coated', '8g2FubQVZH', NULL, 3, 9),
(10, 'fiches', 'LO1qRB42GP', NULL, 1, 10);

-- --------------------------------------------------------

--
-- Структура таблицы `userlist`
--

CREATE TABLE `userlist` (
  `userlistid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `shiftid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `userrole`
--

CREATE TABLE `userrole` (
  `userroleid` int(11) NOT NULL,
  `namerole` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Дамп данных таблицы `userrole`
--

INSERT INTO `userrole` (`userroleid`, `namerole`) VALUES
(1, 'Администратор'),
(2, 'Риелтор'),
(3, 'Юрист');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`orderid`);

--
-- Индексы таблицы `orderpersonlist`
--
ALTER TABLE `orderpersonlist`
  ADD PRIMARY KEY (`orderuserlistid`),
  ADD KEY `orderpersonlist___fk` (`personrid`),
  ADD KEY `orderpersonlist___fk_2` (`orderid`);

--
-- Индексы таблицы `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`personid`);

--
-- Индексы таблицы `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`shiftid`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `user___fk` (`userroleid`),
  ADD KEY `user___fk_2` (`personid`);

--
-- Индексы таблицы `userlist`
--
ALTER TABLE `userlist`
  ADD PRIMARY KEY (`userlistid`),
  ADD KEY `userlist___fk` (`userid`),
  ADD KEY `userlist___fk2` (`shiftid`);

--
-- Индексы таблицы `userrole`
--
ALTER TABLE `userrole`
  ADD PRIMARY KEY (`userroleid`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `orderid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `orderpersonlist`
--
ALTER TABLE `orderpersonlist`
  MODIFY `orderuserlistid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `person`
--
ALTER TABLE `person`
  MODIFY `personid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `shift`
--
ALTER TABLE `shift`
  MODIFY `shiftid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `userlist`
--
ALTER TABLE `userlist`
  MODIFY `userlistid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `userrole`
--
ALTER TABLE `userrole`
  MODIFY `userroleid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `orderpersonlist`
--
ALTER TABLE `orderpersonlist`
  ADD CONSTRAINT `orderpersonlist___fk` FOREIGN KEY (`personrid`) REFERENCES `person` (`personid`),
  ADD CONSTRAINT `orderpersonlist___fk_2` FOREIGN KEY (`orderid`) REFERENCES `order` (`orderid`);

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user___fk` FOREIGN KEY (`userroleid`) REFERENCES `userrole` (`userroleid`),
  ADD CONSTRAINT `user___fk_2` FOREIGN KEY (`personid`) REFERENCES `person` (`personid`);

--
-- Ограничения внешнего ключа таблицы `userlist`
--
ALTER TABLE `userlist`
  ADD CONSTRAINT `userlist___fk` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  ADD CONSTRAINT `userlist___fk2` FOREIGN KEY (`shiftid`) REFERENCES `shift` (`shiftid`);
COMMIT;
