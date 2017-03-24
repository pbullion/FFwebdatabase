--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: chickenbowl; Type: TABLE; Schema: public; Owner: zfozbfytjviqee
--

CREATE TABLE chickenbowl (
    idchickenbowl integer NOT NULL,
    year integer,
    team character varying(50),
    owner character varying(50),
    cb_win integer,
    cb_loss integer,
    cb_bowls integer,
    idowner integer
);


ALTER TABLE chickenbowl OWNER TO zfozbfytjviqee;

--
-- Name: chickenbowl_idchickenbowl_seq; Type: SEQUENCE; Schema: public; Owner: zfozbfytjviqee
--

CREATE SEQUENCE chickenbowl_idchickenbowl_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE chickenbowl_idchickenbowl_seq OWNER TO zfozbfytjviqee;

--
-- Name: chickenbowl_idchickenbowl_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zfozbfytjviqee
--

ALTER SEQUENCE chickenbowl_idchickenbowl_seq OWNED BY chickenbowl.idchickenbowl;


--
-- Name: owners; Type: TABLE; Schema: public; Owner: zfozbfytjviqee
--

CREATE TABLE owners (
    idowners integer NOT NULL,
    name character varying(50),
    yearstarted integer,
    yearended integer
);


ALTER TABLE owners OWNER TO zfozbfytjviqee;

--
-- Name: owners_idowners_seq; Type: SEQUENCE; Schema: public; Owner: zfozbfytjviqee
--

CREATE SEQUENCE owners_idowners_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE owners_idowners_seq OWNER TO zfozbfytjviqee;

--
-- Name: owners_idowners_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zfozbfytjviqee
--

ALTER SEQUENCE owners_idowners_seq OWNED BY owners.idowners;


--
-- Name: playoffs; Type: TABLE; Schema: public; Owner: zfozbfytjviqee
--

CREATE TABLE playoffs (
    idplayoffs integer NOT NULL,
    year integer,
    team character varying(50),
    owner character varying(50),
    playoff_win integer,
    playoff_loss integer,
    idowner integer
);


ALTER TABLE playoffs OWNER TO zfozbfytjviqee;

--
-- Name: playoffs_idplayoffs_seq; Type: SEQUENCE; Schema: public; Owner: zfozbfytjviqee
--

CREATE SEQUENCE playoffs_idplayoffs_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE playoffs_idplayoffs_seq OWNER TO zfozbfytjviqee;

--
-- Name: playoffs_idplayoffs_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zfozbfytjviqee
--

ALTER SEQUENCE playoffs_idplayoffs_seq OWNED BY playoffs.idplayoffs;


--
-- Name: schedule; Type: TABLE; Schema: public; Owner: zfozbfytjviqee
--

CREATE TABLE schedule (
    idschedule integer NOT NULL,
    year integer,
    week integer,
    teamone character varying(50),
    teamtwo character varying(50),
    teamonescore integer,
    teamtwoscore integer
);


ALTER TABLE schedule OWNER TO zfozbfytjviqee;

--
-- Name: schedule_idschedule_seq; Type: SEQUENCE; Schema: public; Owner: zfozbfytjviqee
--

CREATE SEQUENCE schedule_idschedule_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schedule_idschedule_seq OWNER TO zfozbfytjviqee;

--
-- Name: schedule_idschedule_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zfozbfytjviqee
--

ALTER SEQUENCE schedule_idschedule_seq OWNED BY schedule.idschedule;


--
-- Name: teamnames; Type: TABLE; Schema: public; Owner: zfozbfytjviqee
--

CREATE TABLE teamnames (
    idteamnames integer NOT NULL,
    teamname character varying(50),
    yearstarted integer,
    yearended integer,
    idowners integer
);


ALTER TABLE teamnames OWNER TO zfozbfytjviqee;

--
-- Name: teamnames_idteamnames_seq; Type: SEQUENCE; Schema: public; Owner: zfozbfytjviqee
--

CREATE SEQUENCE teamnames_idteamnames_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE teamnames_idteamnames_seq OWNER TO zfozbfytjviqee;

--
-- Name: teamnames_idteamnames_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zfozbfytjviqee
--

ALTER SEQUENCE teamnames_idteamnames_seq OWNED BY teamnames.idteamnames;


--
-- Name: winloss; Type: TABLE; Schema: public; Owner: zfozbfytjviqee
--

CREATE TABLE winloss (
    idwinloss integer NOT NULL,
    year integer,
    team character varying(50),
    owner character varying(50),
    points_for integer,
    wins integer,
    loss integer,
    idowners integer
);


ALTER TABLE winloss OWNER TO zfozbfytjviqee;

--
-- Name: winloss_idwinloss_seq; Type: SEQUENCE; Schema: public; Owner: zfozbfytjviqee
--

CREATE SEQUENCE winloss_idwinloss_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE winloss_idwinloss_seq OWNER TO zfozbfytjviqee;

--
-- Name: winloss_idwinloss_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zfozbfytjviqee
--

ALTER SEQUENCE winloss_idwinloss_seq OWNED BY winloss.idwinloss;


--
-- Name: chickenbowl idchickenbowl; Type: DEFAULT; Schema: public; Owner: zfozbfytjviqee
--

ALTER TABLE ONLY chickenbowl ALTER COLUMN idchickenbowl SET DEFAULT nextval('chickenbowl_idchickenbowl_seq'::regclass);


--
-- Name: owners idowners; Type: DEFAULT; Schema: public; Owner: zfozbfytjviqee
--

ALTER TABLE ONLY owners ALTER COLUMN idowners SET DEFAULT nextval('owners_idowners_seq'::regclass);


--
-- Name: playoffs idplayoffs; Type: DEFAULT; Schema: public; Owner: zfozbfytjviqee
--

ALTER TABLE ONLY playoffs ALTER COLUMN idplayoffs SET DEFAULT nextval('playoffs_idplayoffs_seq'::regclass);


--
-- Name: schedule idschedule; Type: DEFAULT; Schema: public; Owner: zfozbfytjviqee
--

ALTER TABLE ONLY schedule ALTER COLUMN idschedule SET DEFAULT nextval('schedule_idschedule_seq'::regclass);


--
-- Name: teamnames idteamnames; Type: DEFAULT; Schema: public; Owner: zfozbfytjviqee
--

ALTER TABLE ONLY teamnames ALTER COLUMN idteamnames SET DEFAULT nextval('teamnames_idteamnames_seq'::regclass);


--
-- Name: winloss idwinloss; Type: DEFAULT; Schema: public; Owner: zfozbfytjviqee
--

ALTER TABLE ONLY winloss ALTER COLUMN idwinloss SET DEFAULT nextval('winloss_idwinloss_seq'::regclass);


--
-- Data for Name: chickenbowl; Type: TABLE DATA; Schema: public; Owner: zfozbfytjviqee
--

COPY chickenbowl (idchickenbowl, year, team, owner, cb_win, cb_loss, cb_bowls, idowner) FROM stdin;
162w	2014	Goosecocks Goosedick	Jonathan Meier	0	0	0	7
163	2014	Fearless Freaks	Zane Grant	0	0	0	14
164	2014	Fatty Larkins	Brian Broussard	0	0	0	13
165	2014	Jerkoff Stalefish	Dustin Williams	0	0	0	6
166	2014	Doom Deep	Mandeep Rangi	0	0	0	15
167	2014	Kiss A Ditka Tip	Jake Smith	0	0	0	16
168	2014	Mama's Dildo's	Doug Sartin	0	0	0	11
169	2014	Big Day Ray	Ray Medalla	0	0	0	0
170	2014	Draft Punk	Caleb Jones	1	1	0	12
171	2014	Urine Trouble	Patrick Bullion	1	0	0	8
172	2014	Class Acts	Cody Guidry	0	2	0	9
173	2014	Cleveland Steamers	Eddie Capistran	1	0	0	10
174	2015	Urine Trouble	Patrick Bullion	0	0	0	8
175	2015	Snake n Eggs	Jake Smith	0	0	0	16
176	2015	Satan's Cemetery	Dustin Williams	0	0	0	6
177	2015	Fatty Larkins	Brian Broussard	0	0	0	13
178	2015	Fearless Freaks	Zane Grant	0	0	0	14
179	2015	Class Acts	Cody Guidry	0	0	0	9
180	2015	Draft Punk	Caleb Jones	1	1	0	12
181	2015	Goose Bois	Jonathan Meier	1	0	0	7
182	2015	Cleveland Steamers	Eddie Capistran	1	1	0	10
183	2015	Ray Ray Watt	Ray Medalla	1	0	0	0
184	2015	Doom Deep	Mandeep Rangi	1	1	1	15
185	2015	Kutabare Pikachu	Doug Sartin	0	2	1	11
186	2016	Fort Wenty	Caleb Jones	0	0	0	12
187	2016	Jerkoff Stalefish	Dustin Williams	0	0	0	6
188	2016	Baphomet Bois	Jonathan Meier	0	0	0	7
189	2016	Forever Salty	Doug Sartin	0	0	0	11
190	2016	Doom Deep	Mandeep Rangi	0	0	0	15
191	2016	Fatty Larkins	Brian Broussard	0	0	0	13
192	2016	Snake n Eggs	Jake Smith	1	0	0	16
193	2016	Circumcised Mosquitos	Eddie Capistran	1	1	0	10
194	2016	Fearless Freaks	Zane Grant	0	1	1	14
195	2016	Urine Trouble	Patrick Bullion	1	1	0	8
196	2016	Class Acts	Cody Guidry	1	0	0	9
197	2016	Soggy Playbooks	Jason Vredenburgh	0	1	1	17
\.


--
-- Name: chickenbowl_idchickenbowl_seq; Type: SEQUENCE SET; Schema: public; Owner: zfozbfytjviqee
--

SELECT pg_catalog.setval('chickenbowl_idchickenbowl_seq', 1, false);


--
-- Data for Name: owners; Type: TABLE DATA; Schema: public; Owner: zfozbfytjviqee
--

COPY owners (idowners, name, yearstarted, yearended) FROM stdin;
1	Kevin Colten	2011	2013
2	Hogan Allcorn	2011	2011
3	Timothy Obrein	2011	2011
4	Canaan Davis	2012	2012
5	Ray Medalla	2014	2015
6	Dustin Williams	2011	\N
7	Jonathan Meier	2011	\N
8	Patrick Bullion	2011	\N
9	Cody Guidry	2011	\N
10	Eddie Capistran	2011	\N
11	Doug Sartin	2011	\N
12	Caleb Jones	2011	\N
13	Brian Broussard	2012	\N
14	Zane Grant	2012	\N
15	Mandeep Rangi	2012	\N
16	Jake Smith	2013	\N
17	Jason Vredenburgh	2016	\N
\.


--
-- Name: owners_idowners_seq; Type: SEQUENCE SET; Schema: public; Owner: zfozbfytjviqee
--

SELECT pg_catalog.setval('owners_idowners_seq', 1, false);


--
-- Data for Name: playoffs; Type: TABLE DATA; Schema: public; Owner: zfozbfytjviqee
--

COPY playoffs (idplayoffs, year, team, owner, playoff_win, playoff_loss, idowner) FROM stdin;
128	2011	409 Circumcisers	Dustin Williams	0	1	6
129	2011	Goosecocks Goosedick	Jonathan Meier	2	0	7
130	2011	Urine Trouble	Patrick Bullion	2	1	8
131	2011	Class Acts	Cody Guidry	0	1	9
132	2011	Cleveland Steamers	Eddie Capistran	0	1	10
133	2011	Saltwater Cowboys	Doug Sartin	0	0	11
134	2011	Pen Island	Kevin Colten	0	0	1
135	2011	Perkis Power	Hogan Allcorn	0	0	2
136	2011	Team O'Brein	Timothy O'Brein	0	0	3
137	2011	Raging American Boners	Caleb Jones	0	0	12
138	2012	Fatty Larkins	Brian Broussard	0	1	13
139	2012	Saltwater Cowboys	Doug Sartin	0	1	11
140	2012	Pen Island	Kevin Colten	0	1	1
141	2012	Urine Trouble	Patrick Bullion	2	1	8
142	2012	Fearless Freaks	Zane Grant	3	0	14
143	2012	The Sasquatches	Dustin Williams	0	1	6
144	2012	Sandusky's Tight Ends	Caleb Jones	0	0	12
145	2012	Goosecocks Goosedick	Jonathan Meier	0	0	7
146	2012	Cleveland Steamers	Eddie Capistran	0	0	10
147	2012	Class Acts	Cody Guidry	0	0	9
148	2012	Dr. Deep	Mandeep Rangi	0	0	15
149	2012	The Phil Connors	Canaan Davis	0	0	4
150	2013	Fatty Larkins	Brian Broussard	0	1	13
151	2013	Pen Island	Kevin Colten	0	1	1
152	2013	Jerkoff Stalefish	Dustin Williams	3	0	6
153	2013	Saltwater Cowboys	Doug Sartin	0	1	11
154	2013	Cleveland Steamers	Eddie Capistran	2	1	10
155	2013	Yake Myth	Jake Smith	0	1	16
156	2013	Goosecocks Goosedick	Jonathan Meier	0	0	7
157	2013	Fearless Freaks	Zane Grant	0	0	14
158	2013	Class Acts	Cody Guidry	0	0	9
159	2013	Doom Deep	Mandeep Rangi	0	0	15
160	2013	Abraham Lynksys	Caleb Jones	0	0	12
161	2013	Urine Trouble	Patrick Bullion	0	0	8
162	2014	Goosecocks Goosedick	Jonathan Meier	0	1	7
163	2014	Fearless Freaks	Zane Grant	1	1	14
164	2014	Fatty Larkins	Brian Broussard	3	0	13
165	2014	Jerkoff Stalefish	Dustin Williams	0	1	6
166	2014	Doom Deep	Mandeep Rangi	2	1	15
167	2014	Kiss A Ditka Tip	Jake Smith	0	1	16
168	2014	Mama's Dildo's	Doug Sartin	0	1	11
169	2014	Big Day Ray	Ray Medalla	1	1	5
170	2014	Draft Punk	Caleb Jones	0	0	12
171	2014	Urine Trouble	Patrick Bullion	0	0	8
172	2014	Class Acts	Cody Guidry	0	0	9
173	2014	Cleveland Steamers	Eddie Capistran	0	0	10
174	2015	Urine Trouble	Patrick Bullion	0	1	8
175	2015	Snake n Eggs	Jake Smith	1	1	16
176	2015	Satan's Cemetery	Dustin Williams	0	1	6
177	2015	Fatty Larkins	Brian Broussard	3	0	13
178	2015	Fearless Freaks	Zane Grant	0	1	14
179	2015	Class Acts	Cody Guidry	1	1	9
180	2015	Draft Punk	Caleb Jones	0	0	12
181	2015	Goose Bois	Jonathan Meier	0	0	7
182	2015	Cleveland Steamers	Eddie Capistran	0	0	10
183	2015	Ray Ray Watt	Ray Medalla	0	0	5
184	2015	Doom Deep	Mandeep Rangi	0	0	15
185	2015	Kutabare Pikachu	Doug Sartin	0	0	11
186	2016	Fort Wenty	Caleb Jones	0	1	12
187	2016	Jerkoff Stalefish	Dustin Williams	0	0	6
188	2016	Baphomet Bois	Jonathan Meier	2	0	7
189	2016	Forever Salty	Doug Sartin	0	1	11
190	2016	Doom Deep	Mandeep Rangi	0	1	15
191	2016	Fatty Larkins	Brian Broussard	2	0	13
192	2016	Snake n Eggs	Jake Smith	0	0	16
193	2016	Circumcised Mosquitos	Eddie Capistran	0	0	10
194	2016	Fearless Freaks	Zane Grant	0	0	14
195	2016	Urine Trouble	Patrick Bullion	0	0	8
196	2016	Class Acts	Cody Guidry	0	0	9
197	2016	Soggy Playbooks	Jason Vredenburgh	0	0	17
198	2017	Fort Wenty	Caleb Jones	0	0	12
199	2017	Jerkoff Stalefish	Dustin Williams	0	1	6
200	2017	Baphomet Bois	Jonathan Meier	0	1	7
201	2017	Forever Salty	Doug Sartin	0	1	11
202	2017	Doom Deep	Mandeep Rangi	0	0	15
203	2017	Fatty Larkins	Brian Broussard	0	1	13
204	2017	Snake n Eggs	Jake Smith	0	1	16
205	2017	Circumcised Mosquitos	Eddie Capistran	0	0	10
206	2017	Fearless Freaks	Zane Grant	0	0	14
207	2017	Urine Trouble	Patrick Bullion	0	0	8
208	2017	Class Acts	Cody Guidry	0	0	9
209	2017	Soggy Playbooks	Jason Vredenburgh	0	0	17
\.


--
-- Name: playoffs_idplayoffs_seq; Type: SEQUENCE SET; Schema: public; Owner: zfozbfytjviqee
--

SELECT pg_catalog.setval('playoffs_idplayoffs_seq', 1, false);


--
-- Data for Name: schedule; Type: TABLE DATA; Schema: public; Owner: zfozbfytjviqee
--

COPY schedule (idschedule, year, week, teamone, teamtwo, teamonescore, teamtwoscore) FROM stdin;
128	2011	1	Patrick Bullion	Eddie Capistran	94	91
129	2011	1	Cody Guidry	Caleb Jones	118	117
130	2011	1	Dustin Williams	Kevin Colten	135	76
131	2011	1	Jonathan Meier	Doug Sartin	70	68
132	2011	1	Hogan Allcorn	Timothy O'Brien	91	87
133	2011	2	Cody Guidry	Kevin Colten	120	95
134	2011	2	Eddie Capistran	Jonathan Meier	82	69
135	2011	2	Patrick Bullion	Timothy O'Brien	90	50
136	2011	2	Caleb Jones	Doug Sartin	123	68
137	2011	2	Dustin Williams	Hogan Allcorn	125	95
138	2011	3	Jonathan Meier	Timothy O'Brien	72	42
139	2011	3	Doug Sartin	Cody Guidry	102	100
140	2011	3	Kevin Colten	Hogan Allcorn	118	78
141	2011	3	Eddie Capistran	Caleb Jones	115	47
142	2011	3	Dustin Williams	Patrick Bullion	110	80
143	2011	4	Doug Sartin	Hogan Allcorn	102	84
144	2011	4	Caleb Jones	Jonathan Meier	120	109
145	2011	4	Dustin Williams	Timothy O'Brien	126	62
146	2011	4	Cody Guidry	Eddie Capistran	114	64
147	2011	4	Patrick Bullion	Kevin Colten	123	119
148	2011	5	Dustin Williams	Caleb Jones	137	93
149	2011	5	Eddie Capistran	Doug Sartin	105	69
150	2011	5	Patrick Bullion	Hogan Allcorn	106	75
151	2011	5	Cody Guidry	Jonathan Meier	84	68
152	2011	5	Kevin Colten	Timothy O'Brien	97	70
153	2011	6	Patrick Bullion	Cody Guidry	115	84
154	2011	6	Jonathan Meier	Kevin Colten	78	59
155	2011	6	Doug Sartin	Timothy O'Brien	96	82
156	2011	6	Hogan Allcorn	Caleb Jones	113	84
157	2011	6	Dustin Williams	Eddie Capistran	100	53
158	2011	7	Jonathan Meier	Patrick Bullion	123	93
159	2011	7	Kevin Colten	Doug Sartin	80	61
160	2011	7	Timothy O'Brien	Caleb Jones	72	70
161	2011	7	Hogan Allcorn	Eddie Capistran	71	52
162	2011	7	Dustin Williams	Cody Guidry	134	94
163	2011	8	Doug Sartin	Patrick Bullion	94	82
164	2011	8	Kevin Colten	Caleb Jones	113	34
165	2011	8	Timothy O'Brien	Eddie Capistran	106	80
166	2011	8	Cody Guidry	Hogan Allcorn	104	96
167	2011	8	Jonathan Meier	Dustin Williams	101	89
168	2011	9	Patrick Bullion	Caleb Jones	93	81
169	2011	9	Doug Sartin	Eddie Capistran	70	70
170	2011	9	Dustin Williams	Kevin Colten	103	86
171	2011	9	Jonathan Meier	Cody Guidry	139	95
172	2011	9	Timothy O'Brien	Hogan Allcorn	85	74
173	2011	10	Eddie Capistran	Kevin Colten	83	82
174	2011	10	Cody Guidry	Caleb Jones	141	79
175	2011	10	Patrick Bullion	Timothy O'Brien	110	87
176	2011	10	Jonathan Meier	Doug Sartin	88	63
177	2011	10	Dustin Williams	Hogan Allcorn	87	52
178	2011	11	Cody Guidry	Timothy O'Brien	71	64
179	2011	11	Eddie Capistran	Jonathan Meier	105	99
180	2011	11	Hogan Allcorn	Kevin Colten	77	67
181	2011	11	Doug Sartin	Caleb Jones	92	49
182	2011	11	Dustin Williams	Patrick Bullion	86	72
183	2011	12	Jonathan Meier	Hogan Allcorn	75	70
184	2011	12	Cody Guidry	Doug Sartin	116	97
185	2011	12	Dustin Williams	Timothy O'Brien	122	70
186	2011	12	Eddie Capistran	Caleb Jones	108	71
187	2011	12	Kevin Colten	Patrick Bullion	86	77
188	2011	13	Dustin Williams	Doug Sartin	118	109
189	2011	13	Jonathan Meier	Caleb Jones	105	64
190	2011	13	Patrick Bullion	Hogan Allcorn	62	56
191	2011	13	Eddie Capistran	Cody Guidry	111	86
192	2011	13	Kevin Colten	Timothy O'Brien	109	76
193	2012	1	Caleb Jones	Eddie Capistran	99	94
194	2012	1	Canaan Davis	Patrick Bullion	113	111
195	2012	1	Jonathan Meier	Cody Guidry	97	95
196	2012	1	Doug Sartin	Mandeep Rangi	105	100
197	2012	1	Brian Broussard	Kevin Colten	111	73
198	2012	1	Zane Grant	Dustin Williams	88	83
199	2012	2	Patrick Bullion	Eddie Capistran	93	75
200	2012	2	Caleb Jones	Canaan Davis	71	61
201	2012	2	Doug Sartin	Cody Guidry	120	106
202	2012	2	Jonathan Meier	Mandeep Rangi	115	95
203	2012	2	Dustin Williams	Kevin Colten	92	63
204	2012	2	Brian Broussard	Zane Grant	100	89
205	2012	3	Eddie Capistran	Canaan Davis	86	73
206	2012	3	Patrick Bullion	Caleb Jones	100	64
207	2012	3	Cody Guidry	Mandeep Rangi	103	70
208	2012	3	Doug Sartin	Jonathan Meier	112	60
209	2012	3	Kevin Colten	Zane Grant	125	96
210	2012	3	Dustin Williams	Brian Broussard	74	72
211	2012	4	Caleb Jones	Eddie Capistran	108	103
212	2012	4	Patrick Bullion	Canaan Davis	88	78
213	2012	4	Cody Guidry	Kevin Colten	116	93
214	2012	4	Brian Broussard	Jonathan Meier	93	76
215	2012	4	Doug Sartin	Dustin Williams	107	81
216	2012	4	Mandeep Rangi	Zane Grant	90	82
217	2012	5	Eddie Capistran	Patrick Bullion	90	81
218	2012	5	Caleb Jones	Canaan Davis	90	59
219	2012	5	Jonathan Meier	Kevin Colten	100	80
220	2012	5	Brian Broussard	Doug Sartin	104	96
221	2012	5	Dustin Williams	Mandeep Rangi	99	89
222	2012	5	Zane Grant	Cody Guidry	94	92
223	2012	6	Canaan Davis	Eddie Capistran	97	94
224	2012	6	Patrick Bullion	Caleb Jones	122	80
225	2012	6	Kevin Colten	Doug Sartin	115	104
226	2012	6	Mandeep Rangi	Brian Broussard	87	64
227	2012	6	Dustin Williams	Cody Guidry	102	62
228	2012	6	Zane Grant	Jonathan Meier	93	92
229	2012	7	Eddie Capistran	Caleb Jones	107	80
230	2012	7	Patrick Bullion	Canaan Davis	122	84
231	2012	7	Mandeep Rangi	Kevin Colten	82	64
232	2012	7	Brian Broussard	Cody Guidry	100	73
233	2012	7	Jonathan Meier	Dustin Williams	122	44
234	2012	7	Zane Grant	Doug Sartin	112	83
235	2012	8	Cody Guidry	Jonathan Meier	118	94
236	2012	8	Doug Sartin	Mandeep Rangi	93	80
237	2012	8	Kevin Colten	Eddie Capistran	92	70
238	2012	8	Brian Broussard	Caleb Jones	97	55
239	2012	8	Dustin Williams	Patrick Bullion	97	90
240	2012	8	Canaan Davis	Zane Grant	78	64
241	2012	9	Doug Sartin	Cody Guidry	108	51
242	2012	9	Mandeep Rangi	Jonathan Meier	109	60
243	2012	9	Kevin Colten	Caleb Jones	84	83
244	2012	9	Brian Broussard	Patrick Bullion	185	119
245	2012	9	Canaan Davis	Dustin Williams	91	82
246	2012	9	Zane Grant	Eddie Capistran	87	78
247	2012	10	Cody Guidry	Mandeep Rangi	106	91
248	2012	10	Doug Sartin	Jonathan Meier	101	48
249	2012	10	Kevin Colten	Patrick Bullion	86	76
250	2012	10	Brian Broussard	Canaan Davis	107	96
251	2012	10	Eddie Capistran	Dustin Williams	111	93
252	2012	10	Zane Grant	Caleb Jones	116	63
253	2012	11	Jonathan Meier	Cody Guidry	151	79
254	2012	11	Doug Sartin	Mandeep Rangi	68	65
255	2012	11	Kevin Colten	Canaan Davis	91	66
256	2012	11	Brian Broussard	Eddie Capistran	91	87
257	2012	11	Dustin Williams	Caleb Jones	81	71
258	2012	11	Patrick Bullion	Zane Grant	108	94
259	2012	12	Kevin Colten	Brian Broussard	124	105
260	2012	12	Zane Grant	Dustin Williams	93	79
261	2012	12	Cody Guidry	Eddie Capistran	83	78
262	2012	12	Caleb Jones	Jonathan Meier	106	81
263	2012	12	Patrick Bullion	Doug Sartin	109	82
264	2012	12	Mandeep Rangi	Canaan Davis	106	102
265	2012	13	Kevin Colten	Brian Broussard	113	101
266	2012	13	Dustin Williams	Zane Grant	102	97
267	2012	13	Caleb Jones	Cody Guidry	105	73
268	2012	13	Jonathan Meier	Patrick Bullion	105	84
269	2012	13	Doug Sartin	Canaan Davis	71	71
270	2012	13	Eddie Capistran	Mandeep Rangi	97	92
271	2013	1	Eddie Capistran	Caleb Jones	127	78
272	2013	1	Jake Smith	Patrick Bullion	106	105
273	2013	1	Jonathan Meier	Cody Guidry	130	68
274	2013	1	Doug Sartin	Mandeep Rangi	137	77
275	2013	1	Kevin Colten	Brian Broussard	128	81
276	2013	1	Dustin Williams	Zane Grant	119	78
277	2013	2	Eddie Capistran	Patrick Bullion	87	82
278	2013	2	Jake Smith	Caleb Jones	101	95
279	2013	2	Doug Sartin	Cody Guidry	94	64
280	2013	2	Jonathan Meier	Mandeep Rangi	106	82
281	2013	2	Kevin Colten	Dustin Williams	118	92
282	2013	2	Brian Broussard	Zane Grant	98	90
283	2013	3	Eddie Capistran	Jake Smith	119	82
284	2013	3	Caleb Jones	Patrick Bullion	113	65
285	2013	3	Mandeep Rangi	Cody Guidry	92	76
286	2013	3	Doug Sartin	Jonathan Meier	83	58
287	2013	3	Kevin Colten	Zane Grant	103	59
288	2013	3	Dustin Williams	Brian Broussard	80	76
289	2013	4	Eddie Capistran	Caleb Jones	98	87
290	2013	4	Jake Smith	Patrick Bullion	83	72
291	2013	4	Kevin Colten	Cody Guidry	97	80
292	2013	4	Brian Broussard	Jonathan Meier	138	75
293	2013	4	Doug Sartin	Dustin Williams	110	101
294	2013	4	Zane Grant	Mandeep Rangi	133	71
295	2013	5	Eddie Capistran	Patrick Bullion	94	91
296	2013	5	Jake Smith	Caleb Jones	111	78
297	2013	5	Kevin Colten	Jonathan Meier	113	86
298	2013	5	Brian Broussard	Doug Sartin	105	95
299	2013	5	Dustin Williams	Mandeep Rangi	112	45
300	2013	5	Cody Guidry	Zane Grant	115	73
301	2013	6	Jake Smith	Eddie Capistran	115	110
302	2013	6	Caleb Jones	Patrick Bullion	91	53
303	2013	6	Doug Sartin	Kevin Colten	85	57
304	2013	6	Brian Broussard	Mandeep Rangi	109	74
305	2013	6	Dustin Williams	Cody Guidry	109	63
306	2013	6	Zane Grant	Jonathan Meier	77	67
307	2013	7	Eddie Capistran	Caleb Jones	100	66
308	2013	7	Patrick Bullion	Jake Smith	89	60
309	2013	7	Kevin Colten	Mandeep Rangi	71	45
310	2013	7	Brian Broussard	Cody Guidry	132	81
311	2013	7	Dustin Williams	Jonathan Meier	83	71
312	2013	7	Doug Sartin	Zane Grant	113	83
313	2013	8	Jonathan Meier	Cody Guidry	105	87
314	2013	8	Doug Sartin	Mandeep Rangi	102	42
315	2013	8	Kevin Colten	Eddie Capistran	94	90
316	2013	8	Brian Broussard	Caleb Jones	110	93
317	2013	8	Patrick Bullion	Dustin Williams	90	67
318	2013	8	Jake Smith	Zane Grant	102	94
319	2013	9	Cody Guidry	Doug Sartin	107	94
320	2013	9	Jonathan Meier	Mandeep Rangi	79	67
321	2013	9	Kevin Colten	Caleb Jones	106	95
322	2013	9	Brian Broussard	Patrick Bullion	78	65
323	2013	9	Dustin Williams	Jake Smith	121	83
324	2013	9	Eddie Capistran	Zane Grant	84	75
325	2013	10	Mandeep Rangi	Cody Guidry	80	77
326	2013	10	Doug Sartin	Jonathan Meier	93	90
327	2013	10	Kevin Colten	Patrick Bullion	104	69
328	2013	10	Jake Smith	Brian Broussard	102	81
329	2013	10	Dustin Williams	Eddie Capistran	87	74
330	2013	10	Zane Grant	Caleb Jones	90	72
331	2013	11	Jonathan Meier	Cody Guidry	107	58
332	2013	11	Mandeep Rangi	Doug Sartin	95	55
333	2013	11	Kevin Colten	Jake Smith	101	62
334	2013	11	Brian Broussard	Eddie Capistran	125	89
335	2013	11	Dustin Williams	Caleb Jones	120	53
336	2013	11	Zane Grant	Patrick Bullion	97	44
337	2013	12	Brian Broussard	Kevin Colten	106	100
338	2013	12	Dustin Williams	Zane Grant	73	66
339	2013	12	Eddie Capistran	Cody Guidry	91	61
340	2013	12	Jonathan Meier	Caleb Jones	85	54
341	2013	12	Doug Sartin	Patrick Bullion	107	40
342	2013	12	Jake Smith	Mandeep Rangi	76	73
343	2013	13	Brian Broussard	Kevin Colten	155	83
344	2013	13	Dustin Williams	Zane Grant	90	75
345	2013	13	Cody Guidry	Caleb Jones	100	54
346	2013	13	Jonathan Meier	Patrick Bullion	91	76
347	2013	13	Jake Smith	Doug Sartin	97	93
348	2013	13	Eddie Capistran	Mandeep Rangi	92	71
349	2014	1	Eddie Capistran	Cody Guidry	94	82
350	2014	1	Jonathan Meier	Ray Medalla	90	88
351	2014	1	Jake Smith	Doug Sartin	119	81
352	2014	1	Caleb Jones	Mandeep Rangi	91	76
353	2014	1	Patrick Bullion	Zane Grant	92	76
354	2014	1	Dustin Williams	Brian Broussard	120	94
355	2014	2	Jonathan Meier	Eddie Capistran	93	72
356	2014	2	Cody Guidry	Doug Sartin	104	74
357	2014	2	Caleb Jones	Ray Medalla	89	78
358	2014	2	Patrick Bullion	Jake Smith	112	111
359	2014	2	Mandeep Rangi	Brian Broussard	115	102
360	2014	2	Zane Grant	Dustin Williams	85	71
361	2014	3	Doug Sartin	Eddie Capistran	72	48
362	2014	3	Jonathan Meier	Caleb Jones	107	58
363	2014	3	Patrick Bullion	Cody Guidry	101	70
364	2014	3	Ray Medalla	Brian Broussard	86	83
365	2014	3	Jake Smith	Dustin Williams	123	71
366	2014	3	Zane Grant	Mandeep Rangi	95	76
367	2014	4	Caleb Jones	Eddie Capistran	87	79
368	2014	4	Doug Sartin	Patrick Bullion	111	84
369	2014	4	Jonathan Meier	Brian Broussard	111	73
370	2014	4	Cody Guidry	Dustin Williams	106	100
371	2014	4	Zane Grant	Ray Medalla	120	64
372	2014	4	Jake Smith	Mandeep Rangi	77	73
373	2014	5	Eddie Capistran	Patrick Bullion	82	72
374	2014	5	Brian Broussard	Caleb Jones	144	90
375	2014	5	Doug Sartin	Dustin Williams	97	94
376	2014	5	Jonathan Meier	Zane Grant	87	69
377	2014	5	Cody Guidry	Mandeep Rangi	79	65
378	2014	5	Ray Medalla	Jake Smith	105	83
379	2014	6	Brian Broussard	Eddie Capistran	121	79
380	2014	6	Dustin Williams	Patrick Bullion	101	92
381	2014	6	Zane Grant	Caleb Jones	93	59
382	2014	6	Mandeep Rangi	Doug Sartin	95	79
383	2014	6	Jonathan Meier	Jake Smith	109	87
384	2014	6	Cody Guidry	Ray Medalla	88	87
385	2014	7	Dustin Williams	Eddie Capistran	115	102
386	2014	7	Brian Broussard	Zane Grant	114	89
387	2014	7	Mandeep Rangi	Patrick Bullion	99	92
388	2014	7	Jake Smith	Caleb Jones	61	54
389	2014	7	Ray Medalla	Doug Sartin	75	61
390	2014	7	Cody Guidry	Jonathan Meier	95	84
391	2014	8	Zane Grant	Eddie Capistran	110	98
392	2014	8	Dustin Williams	Mandeep Rangi	105	97
393	2014	8	Brian Broussard	Jake Smith	142	92
394	2014	8	Ray Medalla	Patrick Bullion	142	87
395	2014	8	Caleb Jones	Cody Guidry	81	69
396	2014	8	Jonathan Meier	Doug Sartin	89	83
397	2014	9	Mandeep Rangi	Eddie Capistran	91	74
398	2014	9	Jake Smith	Zane Grant	127	74
399	2014	9	Ray Medalla	Dustin Williams	97	82
400	2014	9	Brian Broussard	Cody Guidry	99	93
401	2014	9	Patrick Bullion	Jonathan Meier	100	64
402	2014	9	Caleb Jones	Doug Sartin	83	83
403	2014	10	Eddie Capistran	Jake Smith	104	94
404	2014	10	Mandeep Rangi	Ray Medalla	137	82
405	2014	10	Zane Grant	Cody Guidry	95	80
406	2014	10	Dustin Williams	Jonathan Meier	105	100
407	2014	10	Doug Sartin	Brian Broussard	93	93
408	2014	10	Patrick Bullion	Caleb Jones	120	60
409	2014	11	Ray Medalla	Eddie Capistran	86	72
410	2014	11	Jake Smith	Cody Guidry	84	80
411	2014	11	Mandeep Rangi	Jonathan Meier	88	75
412	2014	11	Doug Sartin	Zane Grant	94	67
413	2014	11	Dustin Williams	Caleb Jones	129	43
414	2014	11	Brian Broussard	Patrick Bullion	103	70
415	2014	12	Eddie Capistran	Cody Guidry	109	69
416	2014	12	Jonathan Meier	Ray Medalla	94	91
417	2014	12	Doug Sartin	Jake Smith	84	65
418	2014	12	Mandeep Rangi	Caleb Jones	134	77
419	2014	12	Zane Grant	Patrick Bullion	102	87
420	2014	12	Dustin Williams	Brian Broussard	126	116
421	2014	13	Jonathan Meier	Eddie Capistran	111	78
422	2014	13	Doug Sartin	Cody Guidry	122	105
423	2014	13	Caleb Jones	Ray Medalla	72	66
424	2014	13	Jake Smith	Patrick Bullion	125	92
425	2014	13	Brian Broussard	Mandeep Rangi	118	112
426	2014	13	Zane Grant	Dustin Williams	113	90
427	2015	1	Cody Guidry	Eddie Capistran	106	104
428	2015	1	Jonathan Meier	Ray Medalla	99	72
429	2015	1	Jake Smith	Doug Sartin	92	84
430	2015	1	Mandeep Rangi	Caleb Jones	112	81
431	2015	1	Zane Grant	Patrick Bullion	118	69
432	2015	1	Brian Broussard	Dustin Williams	113	68
433	2015	2	Eddie Capistran	Jonathan Meier	116	96
434	2015	2	Cody Guidry	Doug Sartin	115	83
435	2015	2	Ray Medalla	Caleb Jones	91	80
436	2015	2	Jake Smith	Patrick Bullion	101	99
437	2015	2	Mandeep Rangi	Brian Broussard	86	43
438	2015	2	Dustin Williams	Zane Grant	102	73
439	2015	3	Eddie Capistran	Doug Sartin	99	87
440	2015	3	Caleb Jones	Jonathan Meier	83	79
441	2015	3	Patrick Bullion	Cody Guidry	137	92
442	2015	3	Ray Medalla	Brian Broussard	126	107
443	2015	3	Dustin Williams	Jake Smith	144	90
444	2015	3	Zane Grant	Mandeep Rangi	109	76
445	2015	4	Caleb Jones	Eddie Capistran	97	81
446	2015	4	Patrick Bullion	Doug Sartin	57	54
447	2015	4	Brian Broussard	Jonathan Meier	109	72
448	2015	4	Dustin Williams	Cody Guidry	90	86
449	2015	4	Zane Grant	Ray Medalla	111	64
450	2015	4	Jake Smith	Mandeep Rangi	83	68
451	2015	5	Patrick Bullion	Eddie Capistran	93	81
452	2015	5	Brian Broussard	Caleb Jones	116	100
453	2015	5	Dustin Williams	Doug Sartin	95	67
454	2015	5	Jonathan Meier	Zane Grant	126	96
455	2015	5	Cody Guidry	Mandeep Rangi	97	50
456	2015	5	Jake Smith	Ray Medalla	101	79
457	2015	6	Brian Broussard	Eddie Capistran	120	84
458	2015	6	Dustin Williams	Patrick Bullion	116	94
459	2015	6	Zane Grant	Caleb Jones	116	108
460	2015	6	Mandeep Rangi	Doug Sartin	101	60
461	2015	6	Jake Smith	Jonathan Meier	98	92
462	2015	6	Cody Guidry	Ray Medalla	75	63
463	2015	7	Dustin Williams	Eddie Capistran	103	101
464	2015	7	Brian Broussard	Zane Grant	106	88
465	2015	7	Patrick Bullion	Mandeep Rangi	103	92
466	2015	7	Caleb Jones	Jake Smith	90	87
467	2015	7	Ray Medalla	Doug Sartin	86	65
468	2015	7	Jonathan Meier	Cody Guidry	146	66
469	2015	8	Eddie Capistran	Zane Grant	102	74
470	2015	8	Mandeep Rangi	Dustin Williams	96	72
471	2015	8	Jake Smith	Brian Broussard	148	85
472	2015	8	Patrick Bullion	Ray Medalla	92	79
473	2015	8	Caleb Jones	Cody Guidry	69	54
474	2015	8	Doug Sartin	Jonathan Meier	111	96
475	2015	9	Eddie Capistran	Mandeep Rangi	151	98
476	2015	9	Jake Smith	Zane Grant	85	51
477	2015	9	Ray Medalla	Dustin Williams	90	48
478	2015	9	Cody Guidry	Brian Broussard	125	110
479	2015	9	Patrick Bullion	Jonathan Meier	112	92
480	2015	9	Caleb Jones	Doug Sartin	81	59
481	2015	10	Jake Smith	Eddie Capistran	106	64
482	2015	10	Ray Medalla	Mandeep Rangi	80	70
483	2015	10	Zane Grant	Cody Guidry	91	78
484	2015	10	Jonathan Meier	Dustin Williams	106	95
485	2015	10	Brian Broussard	Doug Sartin	95	83
486	2015	10	Patrick Bullion	Caleb Jones	121	77
487	2015	11	Eddie Capistran	Ray Medalla	87	80
488	2015	11	Cody Guidry	Jake Smith	97	75
489	2015	11	Jonathan Meier	Mandeep Rangi	89	78
490	2015	11	Zane Grant	Doug Sartin	92	86
491	2015	11	Caleb Jones	Dustin Williams	89	50
492	2015	11	Patrick Bullion	Brian Broussard	92	57
493	2015	12	Cody Guidry	Eddie Capistran	94	80
494	2015	12	Jonathan Meier	Ray Medalla	131	66
495	2015	12	Doug Sartin	Jake Smith	93	61
496	2015	12	Caleb Jones	Mandeep Rangi	83	60
497	2015	12	Zane Grant	Patrick Bullion	102	98
498	2015	12	Dustin Williams	Brian Broussard	108	83
499	2015	13	Eddie Capistran	Jonathan Meier	119	116
500	2015	13	Doug Sartin	Cody Guidry	84	82
501	2015	13	Ray Medalla	Caleb Jones	100	80
502	2015	13	Patrick Bullion	Jake Smith	104	79
503	2015	13	Brian Broussard	Mandeep Rangi	160	119
504	2015	13	Dustin Williams	Zane Grant	85	83
505	2016	1	Jake Smith	Patrick Bullion	105	84
506	2016	1	Jonathan Meier	Doug Sartin	124	94
507	2016	1	Dustin Williams	Jason Vredenburgh	121	116
508	2016	1	Cody Guidry	Zane Grant	141	90
509	2016	1	Brian Broussard	Mandeep Rangi	124	110
510	2016	1	Caleb Jones	Eddie Capistran	134	122
511	2016	2	Jake Smith	Jonathan Meier	121	97
512	2016	2	Jason Vredenburgh	Patrick Bullion	116	109
513	2016	2	Doug Sartin	Cody Guidry	106	79
514	2016	2	Dustin Williams	Brian Broussard	130	98
515	2016	2	Zane Grant	Eddie Capistran	101	79
516	2016	2	Mandeep Rangi	Caleb Jones	158	100
517	2016	3	Jason Vredenburgh	Jake Smith	144	64
518	2016	3	Cody Guidry	Jonathan Meier	97	91
519	2016	3	Brian Broussard	Patrick Bullion	158	119
520	2016	3	Eddie Capistran	Doug Sartin	144	95
521	2016	3	Caleb Jones	Dustin Williams	123	103
522	2016	3	Mandeep Rangi	Zane Grant	87	75
523	2016	4	Jake Smith	Cody Guidry	100	67
524	2016	4	Brian Broussard	Jason Vredenburgh	135	111
525	2016	4	Jonathan Meier	Eddie Capistran	74	68
526	2016	4	Caleb Jones	Patrick Bullion	119	98
527	2016	4	Mandeep Rangi	Doug Sartin	140	112
528	2016	4	Zane Grant	Dustin Williams	115	98
529	2016	5	Brian Broussard	Jake Smith	126	119
530	2016	5	Cody Guidry	Eddie Capistran	111	106
531	2016	5	Caleb Jones	Jason Vredenburgh	116	88
532	2016	5	Jonathan Meier	Mandeep Rangi	128	87
533	2016	5	Patrick Bullion	Patrick Bullion	93	61
534	2016	5	Doug Sartin	Dustin Williams	102	100
535	2016	6	Eddie Capistran	Jake Smith	94	91
536	2016	6	Caleb Jones	Brian Broussard	134	118
537	2016	6	Mandeep Rangi	Cody Guidry	123	85
538	2016	6	Zane Grant	Jason Vredenburgh	93	79
539	2016	6	Jonathan Meier	Dustin Williams	148	74
540	2016	6	Patrick Bullion	Doug Sartin	113	110
541	2016	7	Caleb Jones	Jake Smith	83	36
542	2016	7	Eddie Capistran	Mandeep Rangi	111	82
543	2016	7	Zane Grant	Brian Broussard	145	110
544	2016	7	Dustin Williams	Cody Guidry	131	117
545	2016	7	Jason Vredenburgh	Doug Sartin	110	97
546	2016	7	Jonathan Meier	Patrick Bullion	118	98
547	2016	8	Mandeep Rangi	Jake Smith	86	82
548	2016	8	Caleb Jones	Zane Grant	109	83
549	2016	8	Dustin Williams	Eddie Capistran	117	96
550	2016	8	Brian Broussard	Doug Sartin	104	96
551	2016	8	Patrick Bullion	Cody Guidry	126	102
552	2016	8	Jason Vredenburgh	Jonathan Meier	104	102
553	2016	9	Jake Smith	Zane Grant	101	100
554	2016	9	Dustin Williams	Mandeep Rangi	130	122
555	2016	9	Caleb Jones	Doug Sartin	122	102
556	2016	9	Eddie Capistran	Patrick Bullion	83	78
557	2016	9	Jonathan Meier	Brian Broussard	98	92
558	2016	9	Cody Guidry	Jason Vredenburgh	124	97
559	2016	10	Dustin Williams	Jake Smith	115	102
560	2016	10	Doug Sartin	Zane Grant	114	91
561	2016	10	Patrick Bullion	Mandeep Rangi	110	93
562	2016	10	Caleb Jones	Jonathan Meier	117	89
563	2016	10	Eddie Capistran	Jason Vredenburgh	126	95
564	2016	10	Cody Guidry	Brian Broussard	102	92
565	2016	11	Doug Sartin	Jake Smith	103	89
566	2016	11	Patrick Bullion	Dustin Williams	129	120
567	2016	11	Jonathan Meier	Zane Grant	98	96
568	2016	11	Mandeep Rangi	Jason Vredenburgh	110	99
569	2016	11	Caleb Jones	Cody Guidry	101	96
570	2016	11	Brian Broussard	Eddie Capistran	122	84
571	2016	12	Jake Smith	Patrick Bullion	98	95
572	2016	12	Doug Sartin	Jonathan Meier	102	72
573	2016	12	Dustin Williams	Jason Vredenburgh	129	115
574	2016	12	Zane Grant	Cody Guidry	82	76
575	2016	12	Mandeep Rangi	Brian Broussard	119	114
576	2016	12	Caleb Jones	Eddie Capistran	142	91
577	2016	13	Jake Smith	Jonathan Meier	106	95
578	2016	13	Patrick Bullion	Jason Vredenburgh	127	105
579	2016	13	Doug Sartin	Cody Guidry	107	96
580	2016	13	Dustin Williams	Brian Broussard	115	91
581	2016	13	Eddie Capistran	Zane Grant	106	85
582	2016	13	Caleb Jones	Mandeep Rangi	116	86
\.


--
-- Name: schedule_idschedule_seq; Type: SEQUENCE SET; Schema: public; Owner: zfozbfytjviqee
--

SELECT pg_catalog.setval('schedule_idschedule_seq', 1, false);


--
-- Data for Name: teamnames; Type: TABLE DATA; Schema: public; Owner: zfozbfytjviqee
--

COPY teamnames (idteamnames, teamname, yearstarted, yearended, idowners) FROM stdin;
128	409 Circumcisers	2011	2011	6
129	Goosecocks Goosedick	2011	2014	7
130	Urine Trouble	2011	\N	8
131	Class Acts	2011	\N	9
132	Cleveland Steamers	2011	2015	10
133	Saltwater Cowboys	2011	2013	11
134	Pen Island	2011	2013	1
135	Perkis Power	2011	2011	2
136	Team Obrein	2011	2011	3
137	Raging American Boners	2011	2011	12
138	Fatty Larkins	2012	\N	13
139	Fearless Freaks	2012	\N	14
140	The Sasquatches	2012	2012	6
141	Sandusky's Tight Ends	2012	2012	12
142	Dr. Deep	2012	2012	15
143	The Phil Connors	2012	2012	4
144	Yake Myth	2013	2013	16
145	Doom Deep	2013	\N	15
146	Abraham Lynksys	2013	2013	12
147	Kiss A Ditka Tip	2014	2014	16
148	Mama's Dildo's	2014	2014	11
149	Big Day Ray	2014	2014	5
150	Draft Punk	2014	2015	12
151	Goose Bois	2015	2015	7
152	Ray Ray Watt	2015	2015	5
153	Kutabare Pikachu	2015	2015	11
154	Fort Wenty	2016	\N	12
155	Baphomet Bois	2016	\N	7
156	Forever Salty	2016	\N	11
157	Snake n Eggs	2015	\N	16
158	Circumcised Mosquitos	2016	\N	10
159	Soggy Playbooks	2016	\N	17
160	Satan's Cemetery	2015	2015	6
161	Jerkoff Stalefish	2013	2014	6
162	Jerkoff Stalefish 2.0	2016	\N	6
\.


--
-- Name: teamnames_idteamnames_seq; Type: SEQUENCE SET; Schema: public; Owner: zfozbfytjviqee
--

SELECT pg_catalog.setval('teamnames_idteamnames_seq', 1, false);


--
-- Data for Name: winloss; Type: TABLE DATA; Schema: public; Owner: zfozbfytjviqee
--

COPY winloss (idwinloss, year, team, owner, points_for, wins, loss, idowners) FROM stdin;
1	2011	409 Circumcisers	Dustin Williams	1472	12	1	6
2	2011	Goosecocks Goosedick	Jonathan Meier	1196	9	4	7
3	2011	Urine Trouble	Patrick Bullion	1197	8	5	8
4	2011	Class Acts	Cody Guidry	1327	8	5	9
5	2011	Cleveland Steamers	Eddie Capistran	1119	7	6	10
6	2011	Saltwater Cowboys	Doug Sartin	1091	6	7	11
7	2011	Pen Island	Kevin Colten	1187	6	7	1
8	2011	Perkis Power	Hogan Allcorn	1032	4	9	2
9	2011	Team O'Brein	Timothy O'Brein	953	3	10	3
10	2011	Raging American Boners	Caleb Jones	1032	2	11	12
11	2012	Fatty Larkins	Brian Broussard	1329	9	4	13
12	2012	Saltwater Cowboys	Doug Sartin	1251	9	4	11
13	2012	Pen Island	Kevin Colten	1204	8	5	1
14	2012	Urine Trouble	Patrick Bullion	1302	7	6	8
15	2012	Fearless Freaks	Zane Grant	1204	7	6	14
16	2012	The Sasquatches	Dustin Williams	1109	7	6	6
17	2012	Sandusky's Tight Ends	Caleb Jones	1074	6	7	12
18	2012	Goosecocks Goosedick	Jonathan Meier	1201	6	7	7
19	2012	Cleveland Steamers	Eddie Capistran	1168	5	8	10
20	2012	Class Acts	Cody Guidry	1158	5	8	9
21	2012	Dr. Deep	Mandeep Rangi	1154	5	8	15
22	2012	The Phil Connors	Canaan Davis	1069	4	9	4
23	2013	Fatty Larkins	Brian Broussard	1394	10	3	13
24	2013	Pen Island	Kevin Colten	1275	10	3	1
25	2013	Jerkoff Stalefish	Dustin Williams	1254	10	3	6
26	2013	Saltwater Cowboys	Doug Sartin	1260	9	4	11
27	2013	Cleveland Steamers	Eddie Capistran	1254	9	4	10
28	2013	Yake Myth	Jake Smith	1178	9	4	16
29	2013	Goosecocks Goosedick	Jonathan Meier	1150	7	6	7
30	2013	Fearless Freaks	Zane Grant	1089	4	9	14
31	2013	Class Acts	Cody Guidry	1035	3	10	9
32	2013	Doom Deep	Mandeep Rangi	913	3	10	15
33	2013	Abraham Lynksys	Caleb Jones	1030	2	11	12
34	2013	Urine Trouble	Patrick Bullion	939	2	11	8
35	2014	Goosecocks Goosedick	Jonathan Meier	1212	9	4	7
36	2014	Fearless Freaks	Zane Grant	1187	8	5	14
37	2014	Fatty Larkins	Brian Broussard	1403	7	6	13
38	2014	Jerkoff Stalefish	Dustin Williams	1309	7	6	6
39	2014	Doom Deep	Mandeep Rangi	1259	7	6	15
40	2014	Kiss A Ditka Tip	Jake Smith	1249	7	6	16
41	2014	Mama's Dildo's	Doug Sartin	1133	7	6	11
42	2014	Big Day Ray	Ray Medalla	1132	6	7	5
43	2014	Draft Punk	Caleb Jones	943	6	7	12
44	2014	Urine Trouble	Patrick Bullion	1200	5	8	8
45	2014	Class Acts	Cody Guidry	1121	5	8	9
46	2014	Cleveland Steamers	Eddie Capistran	1090	4	9	10
47	2015	Urine Trouble	Patrick Bullion	1270	9	4	8
48	2015	Snake n Eggs	Jake Smith	1207	8	5	16
49	2015	Satan's Cemetery	Dustin Williams	1176	8	5	6
50	2015	Fatty Larkins	Brian Broussard	1303	7	6	13
51	2015	Fearless Freaks	Zane Grant	1203	7	6	14
52	2015	Class Acts	Cody Guidry	1166	7	6	9
53	2015	Draft Punk	Caleb Jones	1119	7	6	12
54	2015	Goose Bois	Jonathan Meier	1340	6	7	7
55	2015	Cleveland Steamers	Eddie Capistran	1269	6	7	10
56	2015	Ray Ray Watt	Ray Medalla	1076	6	7	5
57	2015	Doom Deep	Mandeep Rangi	1104	4	9	15
58	2015	Kutabare Pikachu	Doug Sartin	1014	3	10	11
59	2016	Fort Wenty	Caleb Jones	1516	12	1	12
60	2016	Jerkoff Stalefish	Dustin Williams	1483	8	5	6
61	2016	Baphomet Bois	Jonathan Meier	1334	7	6	7
62	2016	Forever Salty	Doug Sartin	1342	7	6	11
63	2016	Doom Deep	Mandeep Rangi	1400	7	6	15
64	2016	Fatty Larkins	Brian Broussard	1484	6	7	13
65	2016	Snake n Eggs	Jake Smith	1214	6	7	16
66	2016	Circumcised Mosquitos	Eddie Capistran	1311	6	7	10
67	2016	Fearless Freaks	Zane Grant	1217	5	8	14
68	2016	Urine Trouble	Patrick Bullion	1376	5	8	8
69	2016	Class Acts	Cody Guidry	1294	5	8	9
70	2016	Soggy Playbooks	Jason Vredenburgh	1379	4	9	17
\.


--
-- Name: winloss_idwinloss_seq; Type: SEQUENCE SET; Schema: public; Owner: zfozbfytjviqee
--

SELECT pg_catalog.setval('winloss_idwinloss_seq', 1, false);


--
-- Name: chickenbowl chickenbowl_pkey; Type: CONSTRAINT; Schema: public; Owner: zfozbfytjviqee
--

ALTER TABLE ONLY chickenbowl
    ADD CONSTRAINT chickenbowl_pkey PRIMARY KEY (idchickenbowl);


--
-- Name: owners owners_pkey; Type: CONSTRAINT; Schema: public; Owner: zfozbfytjviqee
--

ALTER TABLE ONLY owners
    ADD CONSTRAINT owners_pkey PRIMARY KEY (idowners);


--
-- Name: playoffs playoffs_pkey; Type: CONSTRAINT; Schema: public; Owner: zfozbfytjviqee
--

ALTER TABLE ONLY playoffs
    ADD CONSTRAINT playoffs_pkey PRIMARY KEY (idplayoffs);


--
-- Name: schedule schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: zfozbfytjviqee
--

ALTER TABLE ONLY schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (idschedule);


--
-- Name: teamnames teamnames_pkey; Type: CONSTRAINT; Schema: public; Owner: zfozbfytjviqee
--

ALTER TABLE ONLY teamnames
    ADD CONSTRAINT teamnames_pkey PRIMARY KEY (idteamnames);


--
-- Name: winloss winloss_pkey; Type: CONSTRAINT; Schema: public; Owner: zfozbfytjviqee
--

ALTER TABLE ONLY winloss
    ADD CONSTRAINT winloss_pkey PRIMARY KEY (idwinloss);


--
-- Name: public; Type: ACL; Schema: -; Owner: zfozbfytjviqee
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO zfozbfytjviqee;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: plpgsql; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON LANGUAGE plpgsql TO zfozbfytjviqee;


--
-- PostgreSQL database dump complete
--

