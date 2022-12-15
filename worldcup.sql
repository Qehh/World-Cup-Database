CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(50) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);



CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);

INSERT INTO public.games VALUES (1, 2018, 'Final', 1, 3, 4, 2);
INSERT INTO public.games VALUES (2, 2018, 'Third Place', 2, 6, 2, 0);
INSERT INTO public.games VALUES (3, 2018, 'Semi-Final', 3, 6, 2, 1);
INSERT INTO public.games VALUES (4, 2018, 'Semi-Final', 1, 2, 1, 0);
INSERT INTO public.games VALUES (5, 2018, 'Quarter-Final', 3, 14, 3, 2);
INSERT INTO public.games VALUES (6, 2018, 'Quarter-Final', 6, 10, 2, 0);
INSERT INTO public.games VALUES (7, 2018, 'Quarter-Final', 2, 12, 2, 1);
INSERT INTO public.games VALUES (8, 2018, 'Quarter-Final', 1, 15, 2, 0);
INSERT INTO public.games VALUES (9, 2018, 'Eighth-Final', 6, 26, 2, 1);
INSERT INTO public.games VALUES (10, 2018, 'Eighth-Final', 10, 84, 1, 0);
INSERT INTO public.games VALUES (11, 2018, 'Eighth-Final', 2, 86, 3, 2);
INSERT INTO public.games VALUES (12, 2018, 'Eighth-Final', 12, 88, 2, 0);
INSERT INTO public.games VALUES (13, 2018, 'Eighth-Final', 3, 90, 2, 1);
INSERT INTO public.games VALUES (14, 2018, 'Eighth-Final', 14, 92, 2, 1);
INSERT INTO public.games VALUES (15, 2018, 'Eighth-Final', 15, 94, 2, 1);
INSERT INTO public.games VALUES (16, 2018, 'Eighth-Final', 1, 19, 4, 3);
INSERT INTO public.games VALUES (17, 2014, 'Final', 17, 19, 1, 0);
INSERT INTO public.games VALUES (18, 2014, 'Third Place', 18, 12, 3, 0);
INSERT INTO public.games VALUES (19, 2014, 'Semi-Final', 19, 18, 1, 0);
INSERT INTO public.games VALUES (20, 2014, 'Semi-Final', 17, 12, 7, 1);
INSERT INTO public.games VALUES (21, 2014, 'Quarter-Final', 18, 30, 1, 0);
INSERT INTO public.games VALUES (22, 2014, 'Quarter-Final', 19, 2, 1, 0);
INSERT INTO public.games VALUES (23, 2014, 'Quarter-Final', 12, 26, 2, 1);
INSERT INTO public.games VALUES (24, 2014, 'Quarter-Final', 17, 1, 1, 0);
INSERT INTO public.games VALUES (25, 2014, 'Eighth-Final', 12, 114, 2, 1);
INSERT INTO public.games VALUES (26, 2014, 'Eighth-Final', 26, 15, 2, 0);
INSERT INTO public.games VALUES (27, 2014, 'Eighth-Final', 1, 118, 2, 0);
INSERT INTO public.games VALUES (28, 2014, 'Eighth-Final', 17, 120, 2, 1);
INSERT INTO public.games VALUES (29, 2014, 'Eighth-Final', 18, 88, 2, 1);
INSERT INTO public.games VALUES (30, 2014, 'Eighth-Final', 30, 124, 2, 1);
INSERT INTO public.games VALUES (31, 2014, 'Eighth-Final', 19, 84, 1, 0);
INSERT INTO public.games VALUES (32, 2014, 'Eighth-Final', 2, 128, 2, 1);


INSERT INTO public.teams VALUES (1, 'France');
INSERT INTO public.teams VALUES (2, 'Belgium');
INSERT INTO public.teams VALUES (3, 'Croatia');
INSERT INTO public.teams VALUES (6, 'England');
INSERT INTO public.teams VALUES (10, 'Sweden');
INSERT INTO public.teams VALUES (12, 'Brazil');
INSERT INTO public.teams VALUES (14, 'Russia');
INSERT INTO public.teams VALUES (15, 'Uruguay');
INSERT INTO public.teams VALUES (17, 'Germany');
INSERT INTO public.teams VALUES (18, 'Netherlands');
INSERT INTO public.teams VALUES (19, 'Argentina');
INSERT INTO public.teams VALUES (26, 'Colombia');
INSERT INTO public.teams VALUES (30, 'Costa Rica');
INSERT INTO public.teams VALUES (84, 'Switzerland');
INSERT INTO public.teams VALUES (86, 'Japan');
INSERT INTO public.teams VALUES (88, 'Mexico');
INSERT INTO public.teams VALUES (90, 'Denmark');
INSERT INTO public.teams VALUES (92, 'Spain');
INSERT INTO public.teams VALUES (94, 'Portugal');
INSERT INTO public.teams VALUES (114, 'Chile');
INSERT INTO public.teams VALUES (118, 'Nigeria');
INSERT INTO public.teams VALUES (120, 'Algeria');
INSERT INTO public.teams VALUES (124, 'Greece');
INSERT INTO public.teams VALUES (128, 'United States');


SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


SELECT pg_catalog.setval('public.teams_team_id_seq', 512, true);


ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


ALTER TABLE ONLY public.games
    ADD CONSTRAINT opponent_id FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


ALTER TABLE ONLY public.games
    ADD CONSTRAINT winner_id FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);



