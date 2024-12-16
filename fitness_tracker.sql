--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: goals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.goals (
    goal_id integer NOT NULL,
    user_id integer,
    goal_type character varying(50),
    target_value numeric(10,2),
    start_date date,
    end_date date
);


ALTER TABLE public.goals OWNER TO postgres;

--
-- Name: goals_goal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.goals_goal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.goals_goal_id_seq OWNER TO postgres;

--
-- Name: goals_goal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.goals_goal_id_seq OWNED BY public.goals.goal_id;


--
-- Name: meals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.meals (
    meal_id integer NOT NULL,
    plan_id integer,
    meal_name character varying(100),
    calories integer,
    protein numeric(5,2),
    carbs numeric(5,2),
    fats numeric(5,2)
);


ALTER TABLE public.meals OWNER TO postgres;

--
-- Name: meals_meal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.meals_meal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.meals_meal_id_seq OWNER TO postgres;

--
-- Name: meals_meal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.meals_meal_id_seq OWNED BY public.meals.meal_id;


--
-- Name: nutrition_plans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nutrition_plans (
    plan_id integer NOT NULL,
    user_id integer,
    plan_name character varying(100),
    daily_calorie_goal integer,
    start_date date,
    end_date date
);


ALTER TABLE public.nutrition_plans OWNER TO postgres;

--
-- Name: nutrition_plans_plan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nutrition_plans_plan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nutrition_plans_plan_id_seq OWNER TO postgres;

--
-- Name: nutrition_plans_plan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nutrition_plans_plan_id_seq OWNED BY public.nutrition_plans.plan_id;


--
-- Name: progress_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.progress_logs (
    log_id integer NOT NULL,
    user_id integer,
    workout_id integer,
    date date NOT NULL,
    duration integer,
    calories_burned integer,
    weight_logged numeric(5,1)
);


ALTER TABLE public.progress_logs OWNER TO postgres;

--
-- Name: progress_logs_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.progress_logs_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.progress_logs_log_id_seq OWNER TO postgres;

--
-- Name: progress_logs_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.progress_logs_log_id_seq OWNED BY public.progress_logs.log_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(100) NOT NULL,
    date_of_birth date,
    gender character varying(10),
    height numeric(4,1),
    weight numeric(5,1)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: workouts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.workouts (
    workout_id integer NOT NULL,
    name character varying(100) NOT NULL,
    category character varying(50),
    duration integer,
    calories_burned integer
);


ALTER TABLE public.workouts OWNER TO postgres;

--
-- Name: workouts_workout_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.workouts_workout_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.workouts_workout_id_seq OWNER TO postgres;

--
-- Name: workouts_workout_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.workouts_workout_id_seq OWNED BY public.workouts.workout_id;


--
-- Name: goals goal_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goals ALTER COLUMN goal_id SET DEFAULT nextval('public.goals_goal_id_seq'::regclass);


--
-- Name: meals meal_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meals ALTER COLUMN meal_id SET DEFAULT nextval('public.meals_meal_id_seq'::regclass);


--
-- Name: nutrition_plans plan_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nutrition_plans ALTER COLUMN plan_id SET DEFAULT nextval('public.nutrition_plans_plan_id_seq'::regclass);


--
-- Name: progress_logs log_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.progress_logs ALTER COLUMN log_id SET DEFAULT nextval('public.progress_logs_log_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: workouts workout_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workouts ALTER COLUMN workout_id SET DEFAULT nextval('public.workouts_workout_id_seq'::regclass);


--
-- Data for Name: goals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.goals (goal_id, user_id, goal_type, target_value, start_date, end_date) FROM stdin;
1	1	Weight Loss	70.00	2024-01-01	2024-06-01
2	2	Muscle Gain	80.00	2024-02-01	2024-08-01
3	3	Distance Running	10.00	2024-03-01	2024-07-01
\.


--
-- Data for Name: meals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.meals (meal_id, plan_id, meal_name, calories, protein, carbs, fats) FROM stdin;
1	1	Grilled Chicken Salad	300	25.00	10.00	8.00
2	1	Protein Shake	200	20.00	5.00	5.00
3	2	Steak with Sweet Potatoes	600	45.00	50.00	20.00
4	3	Pasta with Vegetables	500	15.00	70.00	10.00
\.


--
-- Data for Name: nutrition_plans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nutrition_plans (plan_id, user_id, plan_name, daily_calorie_goal, start_date, end_date) FROM stdin;
1	1	Weight Loss Plan	1500	2024-01-01	2024-06-01
2	2	Muscle Building Diet	2500	2024-02-01	2024-08-01
3	3	Marathon Prep Diet	2000	2024-03-01	2024-07-01
\.


--
-- Data for Name: progress_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.progress_logs (log_id, user_id, workout_id, date, duration, calories_burned, weight_logged) FROM stdin;
1	1	1	2024-01-02	30	300	74.8
2	1	2	2024-01-03	45	400	74.5
3	2	3	2024-02-10	60	200	64.8
4	3	4	2024-03-05	50	450	58.0
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, first_name, last_name, email, date_of_birth, gender, height, weight) FROM stdin;
1	John	Doe	john.doe@example.com	1990-01-01	Male	180.5	75.3
2	Jane	Smith	jane.smith@example.com	1985-05-15	Female	165.0	65.0
3	Alice	Brown	alice.brown@example.com	1992-08-22	Female	170.2	58.5
\.


--
-- Data for Name: workouts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.workouts (workout_id, name, category, duration, calories_burned) FROM stdin;
1	Morning Run	Cardio	30	300
2	Strength Training	Strength	45	400
3	Yoga Session	Flexibility	60	200
4	Cycling	Cardio	50	450
\.


--
-- Name: goals_goal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.goals_goal_id_seq', 3, true);


--
-- Name: meals_meal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.meals_meal_id_seq', 4, true);


--
-- Name: nutrition_plans_plan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nutrition_plans_plan_id_seq', 3, true);


--
-- Name: progress_logs_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.progress_logs_log_id_seq', 4, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 3, true);


--
-- Name: workouts_workout_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.workouts_workout_id_seq', 4, true);


--
-- Name: goals goals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goals
    ADD CONSTRAINT goals_pkey PRIMARY KEY (goal_id);


--
-- Name: meals meals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meals
    ADD CONSTRAINT meals_pkey PRIMARY KEY (meal_id);


--
-- Name: nutrition_plans nutrition_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nutrition_plans
    ADD CONSTRAINT nutrition_plans_pkey PRIMARY KEY (plan_id);


--
-- Name: progress_logs progress_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.progress_logs
    ADD CONSTRAINT progress_logs_pkey PRIMARY KEY (log_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: workouts workouts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workouts
    ADD CONSTRAINT workouts_pkey PRIMARY KEY (workout_id);


--
-- Name: idx_goals_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_goals_user_id ON public.goals USING btree (user_id);


--
-- Name: idx_nutrition_plans_start_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_nutrition_plans_start_date ON public.nutrition_plans USING btree (start_date);


--
-- Name: idx_nutrition_plans_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_nutrition_plans_user_id ON public.nutrition_plans USING btree (user_id);


--
-- Name: idx_progress_logs_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_progress_logs_date ON public.progress_logs USING btree (date);


--
-- Name: idx_progress_logs_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_progress_logs_user_id ON public.progress_logs USING btree (user_id);


--
-- Name: idx_progress_logs_workout_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_progress_logs_workout_id ON public.progress_logs USING btree (workout_id);


--
-- Name: idx_users_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_email ON public.users USING btree (email);


--
-- Name: goals goals_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goals
    ADD CONSTRAINT goals_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: meals meals_plan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meals
    ADD CONSTRAINT meals_plan_id_fkey FOREIGN KEY (plan_id) REFERENCES public.nutrition_plans(plan_id) ON DELETE CASCADE;


--
-- Name: nutrition_plans nutrition_plans_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nutrition_plans
    ADD CONSTRAINT nutrition_plans_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: progress_logs progress_logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.progress_logs
    ADD CONSTRAINT progress_logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: progress_logs progress_logs_workout_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.progress_logs
    ADD CONSTRAINT progress_logs_workout_id_fkey FOREIGN KEY (workout_id) REFERENCES public.workouts(workout_id) ON DELETE SET NULL;


--
-- Name: TABLE goals; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.goals TO admin;
GRANT SELECT,INSERT,UPDATE ON TABLE public.goals TO user_role;
GRANT SELECT ON TABLE public.goals TO readonly;


--
-- Name: TABLE meals; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.meals TO admin;
GRANT SELECT,INSERT,UPDATE ON TABLE public.meals TO user_role;
GRANT SELECT ON TABLE public.meals TO readonly;


--
-- Name: TABLE nutrition_plans; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.nutrition_plans TO admin;
GRANT SELECT,INSERT,UPDATE ON TABLE public.nutrition_plans TO user_role;
GRANT SELECT ON TABLE public.nutrition_plans TO readonly;


--
-- Name: TABLE progress_logs; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.progress_logs TO admin;
GRANT SELECT,INSERT,UPDATE ON TABLE public.progress_logs TO user_role;
GRANT SELECT ON TABLE public.progress_logs TO readonly;


--
-- Name: TABLE users; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.users TO admin;
GRANT SELECT,INSERT,UPDATE ON TABLE public.users TO user_role;
GRANT SELECT ON TABLE public.users TO readonly;


--
-- Name: COLUMN users.first_name; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT(first_name) ON TABLE public.users TO user_role;


--
-- Name: COLUMN users.last_name; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT(last_name) ON TABLE public.users TO user_role;


--
-- Name: COLUMN users.email; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT(email) ON TABLE public.users TO user_role;


--
-- Name: TABLE workouts; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.workouts TO admin;
GRANT SELECT,INSERT,UPDATE ON TABLE public.workouts TO user_role;
GRANT SELECT ON TABLE public.workouts TO readonly;


--
-- Name: COLUMN workouts.name; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT(name) ON TABLE public.workouts TO user_role;


--
-- Name: COLUMN workouts.category; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT(category) ON TABLE public.workouts TO user_role;


--
-- Name: COLUMN workouts.duration; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT(duration) ON TABLE public.workouts TO user_role;


--
-- PostgreSQL database dump complete
--

