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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(20) NOT NULL,
    brightest_star character varying(20) NOT NULL,
    is_ancient boolean NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    mass_in_trillion_solar_mass numeric(5,2),
    size_in_kpc integer NOT NULL,
    constellation_id integer NOT NULL,
    type character varying(20) NOT NULL,
    is_naked_eye boolean NOT NULL
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    planet_id integer NOT NULL,
    designation character varying(20),
    orbital_period_days numeric(6,2) NOT NULL,
    radius_km integer NOT NULL
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
    name character varying(20) NOT NULL,
    alternate_name text,
    star_id integer NOT NULL,
    orbital_period_days integer NOT NULL,
    year_discovered integer
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
    name character varying(20) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_type character varying(15) NOT NULL,
    solar_mass numeric(4,1) NOT NULL,
    solar_radius numeric(4,1) NOT NULL
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Saggittarius', 'Epsilon Sagittarii', true);
INSERT INTO public.constellation VALUES (2, 'Andromeda', 'Alpheratz', true);
INSERT INTO public.constellation VALUES (3, 'Corvus', 'Gamma Corvi', true);
INSERT INTO public.constellation VALUES (4, 'Ursa Major', 'Alioth', true);
INSERT INTO public.constellation VALUES (5, 'Virgo', 'Spica', true);
INSERT INTO public.constellation VALUES (6, 'Centaurus', 'Alpha Centauri', true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1.15, 27, 1, 'SB(rs)bc', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1.50, 47, 2, 'SA(s)b', true);
INSERT INTO public.galaxy VALUES (3, 'Antennae', NULL, 150, 3, 'SB(s)m pec', false);
INSERT INTO public.galaxy VALUES (4, 'Messier 81', NULL, 29, 4, 'SA(s)ab', true);
INSERT INTO public.galaxy VALUES (5, 'Sombrebro', NULL, 29, 5, 'SA(s)a', false);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', NULL, 18, 6, 'S0 pec', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 2, 'Earth I', 27.32, 1737);
INSERT INTO public.moon VALUES (2, 'Mimas', 10, 'Saturn I', 0.94, 198);
INSERT INTO public.moon VALUES (3, 'Enceladus', 10, 'Saturn II', 1.37, 252);
INSERT INTO public.moon VALUES (4, 'Tethys', 10, 'Saturn III', 1.89, 531);
INSERT INTO public.moon VALUES (5, 'Dione', 10, 'Saturn IV', 2.74, 561);
INSERT INTO public.moon VALUES (6, 'Rhea', 10, 'Saturn V', 4.52, 763);
INSERT INTO public.moon VALUES (7, 'Titan', 10, 'Saturn VI', 15.95, 2574);
INSERT INTO public.moon VALUES (8, 'Iapetus', 10, 'Saturn VII', 79.32, 734);
INSERT INTO public.moon VALUES (9, 'Phobos', 9, 'Mars I', 0.32, 11);
INSERT INTO public.moon VALUES (10, 'Deimos', 9, 'Mars II', 1.26, 6);
INSERT INTO public.moon VALUES (11, 'Miranda', 12, 'Uranus V', 1.41, 236);
INSERT INTO public.moon VALUES (12, 'Ariel', 12, 'Uranus I', 2.52, 579);
INSERT INTO public.moon VALUES (13, 'Stephano', 12, 'Uranus XX', 677.37, 16);
INSERT INTO public.moon VALUES (14, 'Umbriel', 12, 'Uranus II', 4.41, 585);
INSERT INTO public.moon VALUES (15, 'Titania', 12, 'Uranus III', 8.71, 788);
INSERT INTO public.moon VALUES (16, 'Oberon', 12, 'Uranus IV', 13.46, 761);
INSERT INTO public.moon VALUES (17, 'Io', 8, 'Jupiter I', 1.77, 1821);
INSERT INTO public.moon VALUES (18, 'Europa', 8, 'Jupiter II', 3.55, 1561);
INSERT INTO public.moon VALUES (19, 'Ganymede', 8, 'Jupiter III', 7.15, 2634);
INSERT INTO public.moon VALUES (20, 'Calisto', 8, 'Jupiter IV', 16.69, 2410);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Saffar', 'Upsilon Andromedae b', 6, 5, 1996);
INSERT INTO public.planet VALUES (3, 'Kepler-90h', 'KOI-351.01', 1, 331, 2013);
INSERT INTO public.planet VALUES (4, 'HD 219134 c', 'HR 8832 c', 3, 7, 2015);
INSERT INTO public.planet VALUES (5, 'Gliese 357 d', NULL, 4, 56, 2019);
INSERT INTO public.planet VALUES (6, 'TRAPPIST-1b', NULL, 5, 2, 2016);
INSERT INTO public.planet VALUES (2, 'Earth', 'Gaia', 2, 5, NULL);
INSERT INTO public.planet VALUES (7, 'Mercury', NULL, 2, 88, NULL);
INSERT INTO public.planet VALUES (8, 'Jupiter', NULL, 2, 4332, 1610);
INSERT INTO public.planet VALUES (9, 'Mars', 'The Red Planet', 2, 687, 1610);
INSERT INTO public.planet VALUES (10, 'Saturn', NULL, 2, 378, 1610);
INSERT INTO public.planet VALUES (11, 'Venus', NULL, 2, 584, 1610);
INSERT INTO public.planet VALUES (12, 'Uranus', NULL, 2, 30688, 1781);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Kepler-90', 1, 'F9 IV/V', 1.2, 1.2);
INSERT INTO public.star VALUES (2, 'Sun', 1, 'G2V', 1.0, 1.0);
INSERT INTO public.star VALUES (3, 'HD 219134', 1, 'K3V', 0.8, 0.8);
INSERT INTO public.star VALUES (4, 'Gliese 357', 1, 'M2.5V', 0.4, 0.3);
INSERT INTO public.star VALUES (5, 'TRAPPIST-1', 1, 'M8V', 0.1, 0.1);
INSERT INTO public.star VALUES (6, 'Upsilon Andromedae', 1, 'F8V', 1.3, 1.5);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: moon moon_designation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_designation_key UNIQUE (designation);


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
-- Name: planet planet_alternate_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_alternate_name_key UNIQUE (alternate_name);


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
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

