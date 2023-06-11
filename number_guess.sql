--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games_history; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games_history (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    date_played timestamp without time zone DEFAULT now() NOT NULL,
    number_of_guesses integer NOT NULL
);


ALTER TABLE public.games_history OWNER TO freecodecamp;

--
-- Name: games_history_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_history_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_history_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_history_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_history_game_id_seq OWNED BY public.games_history.game_id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_user_id_seq OWNER TO freecodecamp;

--
-- Name: players_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_user_id_seq OWNED BY public.players.user_id;


--
-- Name: games_history game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games_history ALTER COLUMN game_id SET DEFAULT nextval('public.games_history_game_id_seq'::regclass);


--
-- Name: players user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN user_id SET DEFAULT nextval('public.players_user_id_seq'::regclass);


--
-- Data for Name: games_history; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games_history VALUES (1, 1, '2023-06-11 18:43:32.418621', 925);
INSERT INTO public.games_history VALUES (2, 1, '2023-06-11 18:43:32.722194', 84);
INSERT INTO public.games_history VALUES (3, 2, '2023-06-11 18:43:33.01109', 253);
INSERT INTO public.games_history VALUES (4, 2, '2023-06-11 18:43:33.340539', 353);
INSERT INTO public.games_history VALUES (5, 1, '2023-06-11 18:43:33.732673', 703);
INSERT INTO public.games_history VALUES (6, 1, '2023-06-11 18:43:34.03683', 227);
INSERT INTO public.games_history VALUES (7, 1, '2023-06-11 18:43:34.416328', 757);
INSERT INTO public.games_history VALUES (8, 3, '2023-06-11 18:47:02.536488', 750);
INSERT INTO public.games_history VALUES (9, 3, '2023-06-11 18:47:02.933218', 604);
INSERT INTO public.games_history VALUES (10, 4, '2023-06-11 18:47:03.243614', 559);
INSERT INTO public.games_history VALUES (11, 4, '2023-06-11 18:47:03.606325', 529);
INSERT INTO public.games_history VALUES (12, 3, '2023-06-11 18:47:03.926404', 201);
INSERT INTO public.games_history VALUES (13, 3, '2023-06-11 18:47:04.285065', 403);
INSERT INTO public.games_history VALUES (14, 3, '2023-06-11 18:47:04.677326', 555);
INSERT INTO public.games_history VALUES (15, 5, '2023-06-11 18:48:37.945144', 11);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (1, 'user_1686509011992');
INSERT INTO public.players VALUES (2, 'user_1686509011991');
INSERT INTO public.players VALUES (3, 'user_1686509222147');
INSERT INTO public.players VALUES (4, 'user_1686509222146');
INSERT INTO public.players VALUES (5, 'Naruto');


--
-- Name: games_history_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_history_game_id_seq', 15, true);


--
-- Name: players_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_user_id_seq', 5, true);


--
-- Name: games_history games_history_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games_history
    ADD CONSTRAINT games_history_pkey PRIMARY KEY (game_id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (user_id);


--
-- Name: players players_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_username_key UNIQUE (username);


--
-- Name: games_history games_history_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games_history
    ADD CONSTRAINT games_history_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.players(user_id);


--
-- PostgreSQL database dump complete
--

