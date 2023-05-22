--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: shortUrl; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."shortUrl" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "shortUrlDone" text,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: shortUrl_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."shortUrl_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shortUrl_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."shortUrl_id_seq" OWNED BY public."shortUrl".id;


--
-- Name: url; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.url (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "urlBase" text,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: url_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.url_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: url_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.url_id_seq OWNED BY public.url.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "urlsBase" text,
    "shortUrls" text,
    "visitCount" integer DEFAULT 0,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: user_urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_urls (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "urlsId" integer,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: user_urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_urls_id_seq OWNED BY public.user_urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    token text,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: shortUrl id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."shortUrl" ALTER COLUMN id SET DEFAULT nextval('public."shortUrl_id_seq"'::regclass);


--
-- Name: url id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.url ALTER COLUMN id SET DEFAULT nextval('public.url_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: user_urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_urls ALTER COLUMN id SET DEFAULT nextval('public.user_urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: shortUrl; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."shortUrl" VALUES (1, 1, 'Xtzncs_Y', '2023-05-20 14:40:52.766661');
INSERT INTO public."shortUrl" VALUES (2, 2, 'rgYolj3E', '2023-05-22 10:47:00.095938');
INSERT INTO public."shortUrl" VALUES (3, 2, '0f9PUfI8', '2023-05-22 10:48:24.975739');
INSERT INTO public."shortUrl" VALUES (4, 2, '6ub6Ih8c', '2023-05-22 10:48:32.963191');


--
-- Data for Name: url; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.url VALUES (1, 1, 'https://youtube.com.br', '2023-05-20 14:40:52.761291');
INSERT INTO public.url VALUES (2, 2, 'https://www.google.com.br', '2023-05-22 10:47:00.090999');
INSERT INTO public.url VALUES (3, 2, 'https://www.youtube.com.br', '2023-05-22 10:48:24.972536');
INSERT INTO public.url VALUES (4, 2, 'https://www.facebook.com.br', '2023-05-22 10:48:32.960621');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (3, 2, 'https://www.youtube.com.br', '0f9PUfI8', 1, '2023-05-22 10:48:24.977031');
INSERT INTO public.urls VALUES (4, 2, 'https://www.facebook.com.br', '6ub6Ih8c', 4, '2023-05-22 10:48:32.964213');


--
-- Data for Name: user_urls; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'João', 'joao@driven.com.br', '$2b$10$jEoKVhO.Gms8mBG1vUcQdOA9apE68o0/0xRVQmsd/D6fIsJc.euYK', 'f7656019-324b-465d-8539-3f784879846a', '2023-05-20 14:40:15.031544');
INSERT INTO public.users VALUES (2, 'Gabriel', 'g@g.com.br', '$2b$10$7F9q6G.T1kDctcDmfjHrUOaJA8G9ax1rtzmNhCisLX2uf7pRE/.t2', 'f90e748f-e195-4f62-8e9e-8e54b1d27aac', '2023-05-22 10:45:16.024504');


--
-- Name: shortUrl_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."shortUrl_id_seq"', 4, true);


--
-- Name: url_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.url_id_seq', 4, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 4, true);


--
-- Name: user_urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_urls_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: shortUrl shortUrl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."shortUrl"
    ADD CONSTRAINT "shortUrl_pkey" PRIMARY KEY (id);


--
-- Name: shortUrl shortUrl_shortUrlDone_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."shortUrl"
    ADD CONSTRAINT "shortUrl_shortUrlDone_key" UNIQUE ("shortUrlDone");


--
-- Name: url url_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.url
    ADD CONSTRAINT url_pkey PRIMARY KEY (id);


--
-- Name: url url_urlBase_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.url
    ADD CONSTRAINT "url_urlBase_key" UNIQUE ("urlBase");


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: urls urls_shortUrls_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_shortUrls_key" UNIQUE ("shortUrls");


--
-- Name: user_urls user_urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_urls
    ADD CONSTRAINT user_urls_pkey PRIMARY KEY (id);


--
-- Name: user_urls user_urls_urlsId_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_urls
    ADD CONSTRAINT "user_urls_urlsId_key" UNIQUE ("urlsId");


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_token_key UNIQUE (token);


--
-- PostgreSQL database dump complete
--

