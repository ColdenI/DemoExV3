CREATE TABLE public."order" (
    orderid integer NOT NULL,
    paymentmethod character varying NOT NULL,
    orderstatus character varying NOT NULL,
    datecreation date NOT NULL,
    addres character varying NOT NULL,
    paymentstatus character varying NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 17955)
-- Name: Order_OrderID_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Order_OrderID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3059 (class 0 OID 0)
-- Dependencies: 204
-- Name: Order_OrderID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Order_OrderID_seq" OWNED BY public."order".orderid;


--
-- TOC entry 213 (class 1259 OID 18015)
-- Name: orderpersonlist; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orderpersonlist (
    orderpersonlistid integer NOT NULL,
    orderid integer NOT NULL,
    personid integer NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 18013)
-- Name: PersonOsderList_PersonOrderListID_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."PersonOsderList_PersonOrderListID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3060 (class 0 OID 0)
-- Dependencies: 212
-- Name: PersonOsderList_PersonOrderListID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."PersonOsderList_PersonOrderListID_seq" OWNED BY public.orderpersonlist.orderpersonlistid;


--
-- TOC entry 203 (class 1259 OID 17946)
-- Name: person; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.person (
    personid integer NOT NULL,
    firstname character varying NOT NULL,
    lastname character varying NOT NULL,
    midlename character varying,
    personrole character varying NOT NULL
);


--
-- TOC entry 202 (class 1259 OID 17944)
-- Name: Person_PersonID_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Person_PersonID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3061 (class 0 OID 0)
-- Dependencies: 202
-- Name: Person_PersonID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Person_PersonID_seq" OWNED BY public.person.personid;


--
-- TOC entry 207 (class 1259 OID 17968)
-- Name: shift; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shift (
    shiftid integer NOT NULL,
    datestart date NOT NULL,
    dateend date NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 17966)
-- Name: Shift_ShiftID_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Shift_ShiftID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3062 (class 0 OID 0)
-- Dependencies: 206
-- Name: Shift_ShiftID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Shift_ShiftID_seq" OWNED BY public.shift.shiftid;


--
-- TOC entry 211 (class 1259 OID 17997)
-- Name: userlist; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.userlist (
    userlistid integer NOT NULL,
    userid integer NOT NULL,
    shiftid integer NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 17995)
-- Name: UserList_UserListID_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."UserList_UserListID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3063 (class 0 OID 0)
-- Dependencies: 210
-- Name: UserList_UserListID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."UserList_UserListID_seq" OWNED BY public.userlist.userlistid;


--
-- TOC entry 201 (class 1259 OID 17935)
-- Name: userrole; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.userrole (
    userroleid integer NOT NULL,
    namerole character varying NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 17933)
-- Name: UserRole_userroleid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."UserRole_userroleid_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3064 (class 0 OID 0)
-- Dependencies: 200
-- Name: UserRole_userroleid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."UserRole_userroleid_seq" OWNED BY public.userrole.userroleid;


--
-- TOC entry 209 (class 1259 OID 17976)
-- Name: user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."user" (
    userid integer NOT NULL,
    login character varying NOT NULL,
    password character varying NOT NULL,
    personid integer NOT NULL,
    userroleid integer NOT NULL,
    status character varying
);


--
-- TOC entry 208 (class 1259 OID 17974)
-- Name: User_UserID_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."User_UserID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3065 (class 0 OID 0)
-- Dependencies: 208
-- Name: User_UserID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."User_UserID_seq" OWNED BY public."user".userid;


--
-- TOC entry 2884 (class 2604 OID 17960)
-- Name: order orderid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."order" ALTER COLUMN orderid SET DEFAULT nextval('public."Order_OrderID_seq"'::regclass);


--
-- TOC entry 2888 (class 2604 OID 18018)
-- Name: orderpersonlist orderpersonlistid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderpersonlist ALTER COLUMN orderpersonlistid SET DEFAULT nextval('public."PersonOsderList_PersonOrderListID_seq"'::regclass);


--
-- TOC entry 2883 (class 2604 OID 17949)
-- Name: person personid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.person ALTER COLUMN personid SET DEFAULT nextval('public."Person_PersonID_seq"'::regclass);


--
-- TOC entry 2885 (class 2604 OID 17971)
-- Name: shift shiftid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shift ALTER COLUMN shiftid SET DEFAULT nextval('public."Shift_ShiftID_seq"'::regclass);


--
-- TOC entry 2886 (class 2604 OID 17979)
-- Name: user userid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user" ALTER COLUMN userid SET DEFAULT nextval('public."User_UserID_seq"'::regclass);


--
-- TOC entry 2887 (class 2604 OID 18000)
-- Name: userlist userlistid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.userlist ALTER COLUMN userlistid SET DEFAULT nextval('public."UserList_UserListID_seq"'::regclass);


--
-- TOC entry 2882 (class 2604 OID 17938)
-- Name: userrole userroleid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.userrole ALTER COLUMN userroleid SET DEFAULT nextval('public."UserRole_userroleid_seq"'::regclass);


--
-- TOC entry 3044 (class 0 OID 17957)
-- Dependencies: 205
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."order" VALUES (1, 'наличные', 'готовится', '2023-06-06', 'Россия, г. Тамбов, Социалистическая ул., д. 6', 'принят');
INSERT INTO public."order" VALUES (2, 'наличные', 'готов', '2023-06-07', 'Россия, г. Ангарск, Комсомольская ул., д. 13', 'оплачен');
INSERT INTO public."order" VALUES (3, 'ипотека', 'готовится', '2023-06-08', 'Россия, г. Щёлково, Центральная ул., д. 5', 'принят');
INSERT INTO public."order" VALUES (4, 'ипотека', 'готов', '2023-06-09', 'Россия, г. Петропавловск-Камчатский, Вокзальная ул., д. 10', 'оплачен');
INSERT INTO public."order" VALUES (5, 'наличные', 'готов', '2023-06-10', 'Россия, г. Самара, Цветочная ул., д. 21', 'принят');


--
-- TOC entry 3052 (class 0 OID 18015)
-- Dependencies: 213
-- Data for Name: orderpersonlist; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3042 (class 0 OID 17946)
-- Dependencies: 203
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.person VALUES (1, 'Николай', 'Селиванов', 'Даниилович', 'Пользователь');
INSERT INTO public.person VALUES (2, 'Никита', 'Афанасьев', 'Львович', 'Пользователь');
INSERT INTO public.person VALUES (3, 'Мария', 'Кириллова', 'Львовна', 'Пользователь');
INSERT INTO public.person VALUES (4, 'Анна', 'Савина', 'Серафимовна', 'Пользователь');
INSERT INTO public.person VALUES (5, 'Алиса', 'Зайцева', 'Адамовна', 'Пользователь');
INSERT INTO public.person VALUES (6, 'Степан', 'Фадеев', 'Романович', 'Пользователь');
INSERT INTO public.person VALUES (7, 'Ева', 'Яковлева', 'Максимовна', 'Пользователь');
INSERT INTO public.person VALUES (8, 'Станислав', 'Зиновьев', 'Демидович', 'Пользователь');
INSERT INTO public.person VALUES (9, 'Андрей', 'Корнев', 'Ильич', 'Пользователь');
INSERT INTO public.person VALUES (10, 'Иван', 'Кондрашов', 'Даниилович', 'Пользователь');
INSERT INTO public.person VALUES (11, 'Александр', 'Ульянов', 'Даниилович', 'Клиент');
INSERT INTO public.person VALUES (12, 'Милана', 'Карпова', 'Вячеславовна', 'Клиент');
INSERT INTO public.person VALUES (13, 'Иван', 'Коротков', 'Иванович', 'Клиент');
INSERT INTO public.person VALUES (14, 'София', 'Черная', 'Марковна', 'Клиент');
INSERT INTO public.person VALUES (15, 'Сафия', 'Дементьева', 'Матвеевна', 'Клиент');


--
-- TOC entry 3046 (class 0 OID 17968)
-- Dependencies: 207
-- Data for Name: shift; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3048 (class 0 OID 17976)
-- Dependencies: 209
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."user" VALUES (1, 'rubies', 'cmjcFvB3cI', 1, 2, NULL);
INSERT INTO public."user" VALUES (2, 'windle', '2PAUAd0gMZ', 2, 1, NULL);
INSERT INTO public."user" VALUES (3, 'improv', 'bcFFGU16f6', 3, 1, NULL);
INSERT INTO public."user" VALUES (4, 'moving', 'A8HPZz9HTG', 4, 2, NULL);
INSERT INTO public."user" VALUES (5, 'bellum', 'ZjXm3JW7RJ', 5, 3, NULL);
INSERT INTO public."user" VALUES (6, 'siller', 'dVMfx1VMFF', 6, 3, NULL);
INSERT INTO public."user" VALUES (7, 'ragman', '25Y9oOkwHn', 7, 2, NULL);
INSERT INTO public."user" VALUES (8, 'fautor', 'RJ41C0qynP', 8, 3, NULL);
INSERT INTO public."user" VALUES (9, 'coated', '8g2FubQVZH', 9, 3, NULL);
INSERT INTO public."user" VALUES (10, 'fiches', 'LO1qRB42GP', 10, 1, NULL);


--
-- TOC entry 3050 (class 0 OID 17997)
-- Dependencies: 211
-- Data for Name: userlist; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3040 (class 0 OID 17935)
-- Dependencies: 201
-- Data for Name: userrole; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.userrole VALUES (1, 'Администратор');
INSERT INTO public.userrole VALUES (2, 'Риелтор');
INSERT INTO public.userrole VALUES (3, 'Юрист');


--
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 204
-- Name: Order_OrderID_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Order_OrderID_seq"', 5, true);


--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 212
-- Name: PersonOsderList_PersonOrderListID_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."PersonOsderList_PersonOrderListID_seq"', 1, false);


--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 202
-- Name: Person_PersonID_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Person_PersonID_seq"', 15, true);


--
-- TOC entry 3069 (class 0 OID 0)
-- Dependencies: 206
-- Name: Shift_ShiftID_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Shift_ShiftID_seq"', 1, false);


--
-- TOC entry 3070 (class 0 OID 0)
-- Dependencies: 210
-- Name: UserList_UserListID_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."UserList_UserListID_seq"', 1, false);


--
-- TOC entry 3071 (class 0 OID 0)
-- Dependencies: 200
-- Name: UserRole_userroleid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."UserRole_userroleid_seq"', 3, true);


--
-- TOC entry 3072 (class 0 OID 0)
-- Dependencies: 208
-- Name: User_UserID_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."User_UserID_seq"', 10, true);


--
-- TOC entry 2894 (class 2606 OID 17965)
-- Name: order order_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pk PRIMARY KEY (orderid);


--
-- TOC entry 2902 (class 2606 OID 18020)
-- Name: orderpersonlist orderpersonlist_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderpersonlist
    ADD CONSTRAINT orderpersonlist_pk PRIMARY KEY (orderpersonlistid);


--
-- TOC entry 2892 (class 2606 OID 17954)
-- Name: person person_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pk PRIMARY KEY (personid);


--
-- TOC entry 2896 (class 2606 OID 17973)
-- Name: shift shift_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shift
    ADD CONSTRAINT shift_pk PRIMARY KEY (shiftid);


--
-- TOC entry 2898 (class 2606 OID 17984)
-- Name: user user_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pk PRIMARY KEY (userid);


--
-- TOC entry 2900 (class 2606 OID 18002)
-- Name: userlist userlist_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.userlist
    ADD CONSTRAINT userlist_pk PRIMARY KEY (userlistid);


--
-- TOC entry 2890 (class 2606 OID 17943)
-- Name: userrole userrole_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.userrole
    ADD CONSTRAINT userrole_pk PRIMARY KEY (userroleid);


--
-- TOC entry 2907 (class 2606 OID 18021)
-- Name: orderpersonlist PersonOsderList___fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderpersonlist
    ADD CONSTRAINT "PersonOsderList___fk" FOREIGN KEY (orderid) REFERENCES public."order"(orderid);


--
-- TOC entry 2908 (class 2606 OID 18026)
-- Name: orderpersonlist PersonOsderList___fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderpersonlist
    ADD CONSTRAINT "PersonOsderList___fk2" FOREIGN KEY (personid) REFERENCES public.person(personid);


--
-- TOC entry 2905 (class 2606 OID 18003)
-- Name: userlist UserList___fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.userlist
    ADD CONSTRAINT "UserList___fk" FOREIGN KEY (userid) REFERENCES public."user"(userid);


--
-- TOC entry 2906 (class 2606 OID 18008)
-- Name: userlist UserList___fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.userlist
    ADD CONSTRAINT "UserList___fk2" FOREIGN KEY (shiftid) REFERENCES public.shift(shiftid);


--
-- TOC entry 2903 (class 2606 OID 17985)
-- Name: user User___fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "User___fk" FOREIGN KEY (personid) REFERENCES public.person(personid);


--
-- TOC entry 2904 (class 2606 OID 17990)
-- Name: user User___fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "User___fk2" FOREIGN KEY (userroleid) REFERENCES public.userrole(userroleid);


-- Completed on 2024-02-26 15:58:33

--
-- PostgreSQL database dump complete
--

