--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    galaxy_type character varying(45) NOT NULL,
    distance_from_earth_in_km numeric(18,2) NOT NULL,
    number_of_stars integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: milkyway; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.milkyway (
    star_id integer NOT NULL,
    name character varying(45),
    milkyway_id integer NOT NULL
);


ALTER TABLE public.milkyway OWNER TO freecodecamp;

--
-- Name: milkyway_milkyway_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.milkyway_milkyway_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.milkyway_milkyway_id_seq OWNER TO freecodecamp;

--
-- Name: milkyway_milkyway_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.milkyway_milkyway_id_seq OWNED BY public.milkyway.milkyway_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(45) NOT NULL,
    orbital_period integer,
    diameter_in_kms integer,
    planet_id integer DEFAULT 3 NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(45) NOT NULL,
    radius integer,
    part_of_milky_way boolean NOT NULL,
    distance_from_star_in_km numeric(20,2),
    description text,
    star_id integer DEFAULT 2 NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(45) NOT NULL,
    spectral_type integer,
    solar_mass_in_au numeric(20,2),
    part_of_milky_way boolean,
    galaxy_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: milkyway milkyway_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.milkyway ALTER COLUMN milkyway_id SET DEFAULT nextval('public.milkyway_milkyway_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.galaxy (galaxy_id, name, galaxy_type, distance_from_earth_in_km, number_of_stars) FROM stdin;
1	Milky Way	Spiral	2500000000.00	250000000
2	Andromeda	Spiral	2537000000.00	1000000000
3	Triangulum	Spiral	3000000000.00	40000000
4	Whirlpool	Spiral	2300000000.00	100000000
5	Sombrero	Lenticular	3110000000.00	80000000
6	Large Magellanic	Irregular	160000000.00	30000000
7	Small Magellanic	Irregular	200000000.00	7000000
8	Black Eye	Elliptical	1720000000.00	80000000
\.


--
-- Data for Name: milkyway; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.milkyway (star_id, name, milkyway_id) FROM stdin;
1	Andromeda Galaxy	1
2	Whirlpool Galaxy	2
3	Sombrero Galaxy	3
4	Cartwheel Galaxy	4
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.moon (moon_id, name, orbital_period, diameter_in_kms, planet_id) FROM stdin;
1	Luna	27	3474	3
2	Europa	85	3122	3
3	Ganymede	172	5262	3
4	Io	42	3643	3
5	Callisto	16	4821	3
6	Titan	16	5150	3
7	Rhea	4	1528	3
8	Triton	165	2706	3
9	Titania	8	1578	3
10	Oberon	13	1524	3
11	Umbriel	10	1169	3
12	Miranda	5	472	3
13	Phobos	0	22	3
14	Deimos	1	12	3
15	Enceladus	33	504	3
16	Dione	3	1124	3
17	Mimas	22	396	3
18	Iapetus	79	1469	3
19	Haumea	4	1632	3
20	Makemake	9	1420	3
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.planet (planet_id, name, radius, part_of_milky_way, distance_from_star_in_km, description, star_id) FROM stdin;
1	Mercury	2440	t	57900000.00	\N	2
2	Venus	6052	t	108200000.00	\N	2
3	Earth	6371	t	149600000.00	\N	2
4	Mars	3389	t	227900000.00	\N	2
5	Jupiter	69911	t	778500000.00	\N	2
6	Saturn	58232	t	1429000000.00	\N	2
7	Uranus	25362	t	2871000000.00	\N	2
8	Neptune	24622	t	4495000000.00	\N	2
9	Proxima Centauri b	7000	f	7500000.00	\N	2
10	Kepler-452b	9200	f	150000000.00	\N	2
11	Gliese 581g	5000	f	20000000.00	\N	2
12	TRAPPIST-1d	3000	f	5000000.00	\N	2
13	GJ 1214 b	10000	f	20000000.00	\N	2
14	HD 209458 b	1430	f	7000000.00	\N	2
15	Kepler-186f	7300	f	100000000.00	\N	2
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.star (star_id, name, spectral_type, solar_mass_in_au, part_of_milky_way, galaxy_id) FROM stdin;
1	HD 1234	4	1.30	t	1
2	GX-2009	7	0.15	t	1
3	Alpha Zeta	2	3.20	t	1
4	Star M451	5	1.25	t	1
5	ZQ-88	6	0.85	t	1
6	HD 9837	3	1.95	t	1
7	Beta-87	8	0.09	f	1
8	KR-203	1	19.50	f	1
9	Tau-7	5	0.92	t	1
10	RX-22	9	0.07	f	1
\.


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: milkyway_milkyway_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.milkyway_milkyway_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: milkyway milkyway_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.milkyway
    ADD CONSTRAINT milkyway_pkey PRIMARY KEY (milkyway_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: milkyway unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.milkyway
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: milkyway milkyway_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.milkyway
    ADD CONSTRAINT milkyway_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

