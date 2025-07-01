--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: articles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.articles (
    uuid uuid NOT NULL,
    slug character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    content text NOT NULL,
    content_excerpt text,
    image_url character varying(255),
    author character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.articles OWNER TO postgres;

--
-- Name: cache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO postgres;

--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO postgres;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    slug character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    icon_url character varying(255),
    color character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: education; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.education (
    id bigint NOT NULL,
    name character varying(255),
    degree character varying(255),
    field_of_study character varying(255),
    start_date date,
    end_date date,
    grade numeric(5,2),
    is_current boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.education OWNER TO postgres;

--
-- Name: education_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.education_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.education_id_seq OWNER TO postgres;

--
-- Name: education_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.education_id_seq OWNED BY public.education.id;


--
-- Name: experiences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.experiences (
    id bigint NOT NULL,
    "position" character varying(255),
    company character varying(255),
    content text NOT NULL,
    start_date date,
    end_date date,
    is_current boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.experiences OWNER TO postgres;

--
-- Name: experiences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.experiences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.experiences_id_seq OWNER TO postgres;

--
-- Name: experiences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.experiences_id_seq OWNED BY public.experiences.id;


--
-- Name: exports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exports (
    id bigint NOT NULL,
    completed_at timestamp(0) without time zone,
    file_disk character varying(255) NOT NULL,
    file_name character varying(255),
    exporter character varying(255) NOT NULL,
    processed_rows integer DEFAULT 0 NOT NULL,
    total_rows integer NOT NULL,
    successful_rows integer DEFAULT 0 NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.exports OWNER TO postgres;

--
-- Name: exports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.exports_id_seq OWNER TO postgres;

--
-- Name: exports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exports_id_seq OWNED BY public.exports.id;


--
-- Name: failed_import_rows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_import_rows (
    id bigint NOT NULL,
    data json NOT NULL,
    import_id bigint NOT NULL,
    validation_error text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.failed_import_rows OWNER TO postgres;

--
-- Name: failed_import_rows_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_import_rows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_import_rows_id_seq OWNER TO postgres;

--
-- Name: failed_import_rows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_import_rows_id_seq OWNED BY public.failed_import_rows.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: imports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.imports (
    id bigint NOT NULL,
    completed_at timestamp(0) without time zone,
    file_name character varying(255) NOT NULL,
    file_path character varying(255) NOT NULL,
    importer character varying(255) NOT NULL,
    processed_rows integer DEFAULT 0 NOT NULL,
    total_rows integer NOT NULL,
    successful_rows integer DEFAULT 0 NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.imports OWNER TO postgres;

--
-- Name: imports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.imports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.imports_id_seq OWNER TO postgres;

--
-- Name: imports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.imports_id_seq OWNED BY public.imports.id;


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO postgres;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messages (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(255),
    subject character varying(255),
    message text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.messages OWNER TO postgres;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.messages_id_seq OWNER TO postgres;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    id uuid NOT NULL,
    type character varying(255) NOT NULL,
    notifiable_type character varying(255) NOT NULL,
    notifiable_id bigint NOT NULL,
    data text NOT NULL,
    read_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- Name: personal_infos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_infos (
    id bigint NOT NULL,
    key character varying(255) NOT NULL,
    value text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_infos OWNER TO postgres;

--
-- Name: personal_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personal_infos_id_seq OWNER TO postgres;

--
-- Name: personal_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_infos_id_seq OWNED BY public.personal_infos.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    id uuid NOT NULL,
    category_id bigint NOT NULL,
    slug character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    description text NOT NULL,
    description_excerpt text,
    image_url character varying(255),
    project_url character varying(255),
    github character varying(255),
    tags json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    thumbnail character varying(255),
    "order" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    id bigint NOT NULL,
    slug character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    description_excerpt text,
    image_url character varying(255),
    icon_url character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.services OWNER TO postgres;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.services_id_seq OWNER TO postgres;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: skills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skills (
    id bigint NOT NULL,
    slug character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    image_url character varying(255),
    icon_url character varying(255),
    percentage integer,
    color character varying(255),
    type character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT skills_type_check CHECK (((type)::text = ANY ((ARRAY['language'::character varying, 'coding'::character varying, 'knowledge'::character varying, 'tool'::character varying])::text[])))
);


ALTER TABLE public.skills OWNER TO postgres;

--
-- Name: skills_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.skills_id_seq OWNER TO postgres;

--
-- Name: skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skills_id_seq OWNED BY public.skills.id;


--
-- Name: tertimonials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tertimonials (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    "position" character varying(255),
    company character varying(255),
    content text NOT NULL,
    rating integer DEFAULT 5 NOT NULL,
    image_url character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.tertimonials OWNER TO postgres;

--
-- Name: tertimonials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tertimonials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tertimonials_id_seq OWNER TO postgres;

--
-- Name: tertimonials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tertimonials_id_seq OWNED BY public.tertimonials.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: education id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.education ALTER COLUMN id SET DEFAULT nextval('public.education_id_seq'::regclass);


--
-- Name: experiences id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiences ALTER COLUMN id SET DEFAULT nextval('public.experiences_id_seq'::regclass);


--
-- Name: exports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exports ALTER COLUMN id SET DEFAULT nextval('public.exports_id_seq'::regclass);


--
-- Name: failed_import_rows id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_import_rows ALTER COLUMN id SET DEFAULT nextval('public.failed_import_rows_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: imports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imports ALTER COLUMN id SET DEFAULT nextval('public.imports_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: personal_infos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_infos ALTER COLUMN id SET DEFAULT nextval('public.personal_infos_id_seq'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- Name: skills id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skills ALTER COLUMN id SET DEFAULT nextval('public.skills_id_seq'::regclass);


--
-- Name: tertimonials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tertimonials ALTER COLUMN id SET DEFAULT nextval('public.tertimonials_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.articles (uuid, slug, title, content, content_excerpt, image_url, author, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache (key, value, expiration) FROM stdin;
achmad_fatoni_cache_356a192b7913b04c54574d18c28d46e6395428ab:timer	i:1749045164;	1749045164
achmad_fatoni_cache_356a192b7913b04c54574d18c28d46e6395428ab	i:1;	1749045164
achmad_fatoni_cache_livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3:timer	i:1750310907;	1750310907
achmad_fatoni_cache_livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3	i:1;	1750310907
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, slug, name, description, icon_url, color, created_at, updated_at) FROM stdin;
1	web-apps	Web Apps	Kategori Web Development	https://i.ibb.co/1T11111/rahmat.jpg	#fca61f	2025-06-03 11:29:01	2025-06-04 14:28:52
2	graphic-design	Graphic Design	Kategori Mobile Development	https://i.ibb.co/1T11111/rahmat.jpg	#fca61f	2025-06-03 11:29:01	2025-06-04 14:29:04
\.


--
-- Data for Name: education; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.education (id, name, degree, field_of_study, start_date, end_date, grade, is_current, created_at, updated_at) FROM stdin;
2	SMK YP Fatahillah 1 KWT	High School	Teknik Instalasi Listik	2013-06-01	2015-07-30	\N	f	2025-06-04 07:05:00	2025-06-04 07:05:00
3	Universitas Banten Jaya	Bachelor	Teknik Informatika	2016-06-01	2021-07-01	3.25	f	2025-06-04 07:05:00	2025-06-04 07:05:00
\.


--
-- Data for Name: experiences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.experiences (id, "position", company, content, start_date, end_date, is_current, created_at, updated_at) FROM stdin;
6	Head of Laboratory & Computer Lecturer	Arrahman Cidadap School	<p>1. Installation, maintenance, and configuration of computer hardware and software according to TKJ<br>needs.<br>2. Routine maintenance and troubleshooting of computer systems.<br>3. Development of TKJ learning curriculum that is relevant to industrial developments.<br>4. Teaching subjects such as programming, computer networking, and information security.<br>5. Laboratory hardware and software inventory management.<br>6. Coordination with school staff and related technology suppliers.</p>	2019-01-01	2020-01-01	f	2025-06-03 17:23:48	2025-06-19 06:02:49
5	Staff Administrator	PT. Sinar Sumur Menjangan	<p>1. Creating a service offering document<br>2. Providing the documents required for taxation<br>3. Create a card design that the owner wants for his decoration business.</p>	2016-12-01	2017-12-01	f	2025-06-03 17:23:47	2025-06-19 06:03:12
7	 Staff Tax Accounting	PT. Fajar Pangan Lestari	<p>1. Accurate and detailed recording of company transactions.<br>2. Calculation of Value Added Tax (VAT) in accordance with applicable provisions.<br>3. Management and storage of company tax files in an orderly manner and in accordance with regulations.<br>4. Monthly VAT and Annual Income Tax Reporting</p>	2020-04-01	2021-08-01	f	2025-06-03 17:23:48	2025-06-19 06:03:25
8	IT Support Technician	PT. Indo Prima Perkasa	<p>1. LAN network installation and configuration for stable internet connection.<br>2. LAN network management and maintenance to ensure optimal performance.<br>3. Perform routine maintenance and troubleshoot network issues.<br>4. Hardware maintenance to ensure optimal function.<br>5. Fingerprint system management for security and access management purposes.</p>	2021-10-01	2021-12-01	f	2025-06-03 17:23:48	2025-06-19 06:03:44
9	Web Programmer	PT. Trimitra Putra Mandiri	<p>1. Analyze system requirements to design appropriate solutions.<br>2. Create a structured and efficient system flow.<br>3. Designing databases to optimally support system functionality.<br>4. Develop and code web applications using various programming languages and relevant technologies.<br>5. Perform routine maintenance and repairs on web applications to ensure optimal performance.<br>6. Deploy Applications to VPS Server using Linux Operating System</p>	2022-02-01	\N	t	2025-06-03 17:23:48	2025-06-19 06:03:57
\.


--
-- Data for Name: exports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exports (id, completed_at, file_disk, file_name, exporter, processed_rows, total_rows, successful_rows, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: failed_import_rows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_import_rows (id, data, import_id, validation_error, created_at, updated_at) FROM stdin;
1	{"name":"SMK YP Fatahillah 1 KWT","degree":"High School","field_of_study":"Teknik Instalasi Listik","start_date":"01\\/06\\/2013","end_date":"30\\/07\\/2015","grade":"-","is_current":""}	1	The end date field must be a valid date. The is current field is required.	2025-06-04 04:21:31	2025-06-04 04:21:31
2	{"name":"Universitas Banten Jaya","degree":"Bachelor","field_of_study":"Teknik Informatika","start_date":"01\\/06\\/2016","end_date":"01\\/07\\/2021","grade":"3,25","is_current":""}	1	The is current field is required.	2025-06-04 04:21:31	2025-06-04 04:21:31
3	{"name":"SMK YP Fatahillah 1 KWT","degree":"High School","field_of_study":"Teknik Instalasi Listik","start_date":"01\\/06\\/2013","end_date":"30\\/07\\/2015","grade":"-","is_current":""}	3	The end date field must be a valid date. The is current field is required.	2025-06-04 04:31:24	2025-06-04 04:31:24
4	{"name":"Universitas Banten Jaya","degree":"Bachelor","field_of_study":"Teknik Informatika","start_date":"01\\/06\\/2016","end_date":"01\\/07\\/2021","grade":"3,25","is_current":""}	3	The is current field is required.	2025-06-04 04:31:24	2025-06-04 04:31:24
5	{"name":"SMK YP Fatahillah 1 KWT","degree":"High School","field_of_study":"Teknik Instalasi Listik","start_date":"01\\/06\\/2013","end_date":"30\\/07\\/2015","grade":"-","is_current":""}	4	The end date field must be a valid date. The is current field is required.	2025-06-04 04:38:13	2025-06-04 04:38:13
6	{"name":"Universitas Banten Jaya","degree":"Bachelor","field_of_study":"Teknik Informatika","start_date":"01\\/06\\/2016","end_date":"01\\/07\\/2021","grade":"3,25","is_current":""}	4	The is current field is required.	2025-06-04 04:38:13	2025-06-04 04:38:13
7	{"name":"SMK YP Fatahillah 1 KWT","degree":"High School","field_of_study":"Teknik Instalasi Listik","start_date":"01\\/06\\/2013","end_date":"30\\/07\\/2015","grade":"-","is_current":""}	5	The end date field must be a valid date. The is current field is required.	2025-06-04 04:39:01	2025-06-04 04:39:01
8	{"name":"Universitas Banten Jaya","degree":"Bachelor","field_of_study":"Teknik Informatika","start_date":"01\\/06\\/2016","end_date":"01\\/07\\/2021","grade":"3,25","is_current":""}	5	The is current field is required.	2025-06-04 04:39:01	2025-06-04 04:39:01
9	{"name":"SMK YP Fatahillah 1 KWT","degree":"High School","field_of_study":"Teknik Instalasi Listik","start_date":"01\\/06\\/2013","end_date":"30\\/07\\/2015","grade":"-","is_current":""}	6	The end date field must be a valid date. The is current field is required.	2025-06-04 04:48:53	2025-06-04 04:48:53
10	{"name":"Universitas Banten Jaya","degree":"Bachelor","field_of_study":"Teknik Informatika","start_date":"01\\/06\\/2016","end_date":"01\\/07\\/2021","grade":"3,25","is_current":""}	6	The is current field is required.	2025-06-04 04:48:53	2025-06-04 04:48:53
11	{"name":"SMK YP Fatahillah 1 KWT","degree":"High School","field_of_study":"Teknik Instalasi Listik","start_date":"01\\/06\\/2013","end_date":"30\\/07\\/2015","grade":"-","is_current":""}	7	The end date field must be a valid date. The is current field is required.	2025-06-04 06:33:44	2025-06-04 06:33:44
12	{"name":"Universitas Banten Jaya","degree":"Bachelor","field_of_study":"Teknik Informatika","start_date":"01\\/06\\/2016","end_date":"01\\/07\\/2021","grade":"3,25","is_current":""}	7	The is current field is required.	2025-06-04 06:33:44	2025-06-04 06:33:44
13	{"name":"SMK YP Fatahillah 1 KWT","degree":"High School","field_of_study":"Teknik Instalasi Listik","start_date":"01\\/06\\/2013","end_date":"30\\/07\\/2015","grade":"-","is_current":""}	8	The end date field must be a valid date. The is current field is required.	2025-06-04 06:48:05	2025-06-04 06:48:05
14	{"name":"Universitas Banten Jaya","degree":"Bachelor","field_of_study":"Teknik Informatika","start_date":"01\\/06\\/2016","end_date":"01\\/07\\/2021","grade":"3,25","is_current":""}	8	The is current field is required.	2025-06-04 06:48:05	2025-06-04 06:48:05
15	{"name":"SMK YP Fatahillah 1 KWT","degree":"High School","field_of_study":"Teknik Instalasi Listik","start_date":"01\\/06\\/2013","end_date":"30\\/07\\/2015","grade":"-","is_current":""}	9	The end date field must be a valid date. The is current field is required.	2025-06-04 06:53:31	2025-06-04 06:53:31
16	{"name":"Universitas Banten Jaya","degree":"Bachelor","field_of_study":"Teknik Informatika","start_date":"01\\/06\\/2016","end_date":"01\\/07\\/2021","grade":"3,25","is_current":""}	9	The is current field is required.	2025-06-04 06:53:31	2025-06-04 06:53:31
17	{"name":"SMK YP Fatahillah 1 KWT","degree":"High School","field_of_study":"Teknik Instalasi Listik","start_date":"2013-06-01","end_date":"2015-07-30","grade":"-","is_current":""}	10	The is current field is required.	2025-06-04 06:54:46	2025-06-04 06:54:46
18	{"name":"Universitas Banten Jaya","degree":"Bachelor","field_of_study":"Teknik Informatika","start_date":"2016-06-01","end_date":"2021-07-01","grade":"3,25","is_current":""}	10	The is current field is required.	2025-06-04 06:54:46	2025-06-04 06:54:46
19	{"name":"SMK YP Fatahillah 1 KWT","degree":"High School","field_of_study":"Teknik Instalasi Listik","start_date":"2013-06-01","end_date":"2015-07-30","grade":"-","is_current":""}	11	The is current field is required.	2025-06-04 06:56:35	2025-06-04 06:56:35
20	{"name":"Universitas Banten Jaya","degree":"Bachelor","field_of_study":"Teknik Informatika","start_date":"2016-06-01","end_date":"2021-07-01","grade":"3,25","is_current":""}	11	The is current field is required.	2025-06-04 06:56:35	2025-06-04 06:56:35
29	{"name":"SMK YP Fatahillah 1 KWT","degree":"High School","field_of_study":"Teknik Instalasi Listik","start_date":"01\\/06\\/2013","end_date":"30\\/07\\/2015","grade":"","is_current":"FALSE"}	16	The end date field must be a valid date.	2025-06-04 07:03:58	2025-06-04 07:03:58
30	{"slug":"google-cloud-storage","name":"Google Cloud Storage","description":"","image_url":"","icon_url":"","percentage":"","color":"","type":"knowledge"}	18	The percentage field must be an integer.	2025-06-04 13:52:12	2025-06-04 13:52:12
31	{"slug":"google-drive-integration","name":"Google Drive Integration","description":"","image_url":"","icon_url":"","percentage":"","color":"","type":"knowledge"}	18	The percentage field must be an integer.	2025-06-04 13:52:12	2025-06-04 13:52:12
32	{"slug":"develop-application","name":"Develop Application","description":"","image_url":"","icon_url":"","percentage":"","color":"","type":"knowledge"}	18	The percentage field must be an integer.	2025-06-04 13:52:12	2025-06-04 13:52:12
33	{"slug":"designing-application","name":"Designing Application","description":"","image_url":"","icon_url":"","percentage":"","color":"","type":"knowledge"}	18	The percentage field must be an integer.	2025-06-04 13:52:12	2025-06-04 13:52:12
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: imports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.imports (id, completed_at, file_name, file_path, importer, processed_rows, total_rows, successful_rows, user_id, created_at, updated_at) FROM stdin;
9	2025-06-04 06:53:31	education-importer-example.csv	D:\\PROJECT TONI\\Portfolio\\resume\\storage\\app/private\\livewire-tmp/tzLJ1JwNPtn1CFDlzjT1XnlgVEo690-metaZWR1Y2F0aW9uLWltcG9ydGVyLWV4YW1wbGUuY3N2-.csv	App\\Filament\\Imports\\EducationImporter	2	2	0	1	2025-06-04 06:53:30	2025-06-04 06:53:31
1	2025-06-04 04:21:31	education-importer-example.csv	D:\\PROJECT TONI\\Portfolio\\resume\\storage\\app/private\\livewire-tmp/n63ie9xF9wP5o0EzAVNhFY4gU5VBzd-metaZWR1Y2F0aW9uLWltcG9ydGVyLWV4YW1wbGUuY3N2-.csv	App\\Filament\\Imports\\EducationImporter	2	2	0	1	2025-06-04 04:21:29	2025-06-04 04:21:31
2	\N	education-importer-example.csv	D:\\PROJECT TONI\\Portfolio\\resume\\storage\\app/private\\livewire-tmp/gcxKq8OQzViPYLulURPBMLsZIl8VUp-metaZWR1Y2F0aW9uLWltcG9ydGVyLWV4YW1wbGUuY3N2-.csv	App\\Filament\\Imports\\EducationImporter	0	2	0	1	2025-06-04 04:23:18	2025-06-04 04:23:18
3	2025-06-04 04:31:24	education-importer-example.csv	D:\\PROJECT TONI\\Portfolio\\resume\\storage\\app/private\\livewire-tmp/PpC0uR1kr9IbROn2zRByokrawlM4TI-metaZWR1Y2F0aW9uLWltcG9ydGVyLWV4YW1wbGUuY3N2-.csv	App\\Filament\\Imports\\EducationImporter	2	2	0	1	2025-06-04 04:31:24	2025-06-04 04:31:24
17	2025-06-04 07:05:00	education-importer-example.csv	D:\\PROJECT TONI\\Portfolio\\resume\\storage\\app/private\\livewire-tmp/SzS4BfXS2zm7E5yk7LgLO6jjOquszq-metaZWR1Y2F0aW9uLWltcG9ydGVyLWV4YW1wbGUuY3N2-.csv	App\\Filament\\Imports\\EducationImporter	2	2	2	1	2025-06-04 07:05:00	2025-06-04 07:05:00
4	2025-06-04 04:38:13	education-importer-example.csv	D:\\PROJECT TONI\\Portfolio\\resume\\storage\\app/private\\livewire-tmp/O5GKEPuk6lWtOO94RDk9EfYuVqjqzn-metaZWR1Y2F0aW9uLWltcG9ydGVyLWV4YW1wbGUuY3N2-.csv	App\\Filament\\Imports\\EducationImporter	2	2	0	1	2025-06-04 04:38:12	2025-06-04 04:38:13
10	2025-06-04 06:54:46	education-importer-example.csv	D:\\PROJECT TONI\\Portfolio\\resume\\storage\\app/private\\livewire-tmp/z5HxBWklD7L2Jrq8Vi55knLiRUP7wL-metaZWR1Y2F0aW9uLWltcG9ydGVyLWV4YW1wbGUuY3N2-.csv	App\\Filament\\Imports\\EducationImporter	2	2	0	1	2025-06-04 06:54:46	2025-06-04 06:54:46
5	2025-06-04 04:39:01	education-importer-example.csv	D:\\PROJECT TONI\\Portfolio\\resume\\storage\\app/private\\livewire-tmp/CEu6Cbfumvf8ERoUNwdl6iMbmCQ2N7-metaZWR1Y2F0aW9uLWltcG9ydGVyLWV4YW1wbGUuY3N2-.csv	App\\Filament\\Imports\\EducationImporter	2	2	0	1	2025-06-04 04:38:59	2025-06-04 04:39:01
6	2025-06-04 04:48:54	education-importer-example.csv	D:\\PROJECT TONI\\Portfolio\\resume\\storage\\app/private\\livewire-tmp/OZVcSS6uHvS1hlA5pUz8b0FYzrSL9j-metaZWR1Y2F0aW9uLWltcG9ydGVyLWV4YW1wbGUuY3N2-.csv	App\\Filament\\Imports\\EducationImporter	2	2	0	1	2025-06-04 04:48:51	2025-06-04 04:48:54
7	2025-06-04 06:33:44	education-importer-example.csv	D:\\PROJECT TONI\\Portfolio\\resume\\storage\\app/private\\livewire-tmp/KmNUw7FOn5RtcrGzTWx0KdYIaZM1Rw-metaZWR1Y2F0aW9uLWltcG9ydGVyLWV4YW1wbGUuY3N2-.csv	App\\Filament\\Imports\\EducationImporter	2	2	0	1	2025-06-04 06:33:43	2025-06-04 06:33:44
11	2025-06-04 06:56:35	education-importer-example.csv	D:\\PROJECT TONI\\Portfolio\\resume\\storage\\app/private\\livewire-tmp/pSEI3ZfsaGvWU8BvLyZlvPrvxNLZHi-metaZWR1Y2F0aW9uLWltcG9ydGVyLWV4YW1wbGUuY3N2-.csv	App\\Filament\\Imports\\EducationImporter	2	2	0	1	2025-06-04 06:56:35	2025-06-04 06:56:35
8	2025-06-04 06:48:05	education-importer-example.csv	D:\\PROJECT TONI\\Portfolio\\resume\\storage\\app/private\\livewire-tmp/9UyIZ1DR9sXGcc7kqFlrAN6TwOVmrJ-metaZWR1Y2F0aW9uLWltcG9ydGVyLWV4YW1wbGUuY3N2-.csv	App\\Filament\\Imports\\EducationImporter	2	2	0	1	2025-06-04 06:48:04	2025-06-04 06:48:05
15	\N	education-importer-example.csv	D:\\PROJECT TONI\\Portfolio\\resume\\storage\\app/private\\livewire-tmp/AeBk6975SPTvQDh6fUnmrtQDUA2D53-metaZWR1Y2F0aW9uLWltcG9ydGVyLWV4YW1wbGUuY3N2-.csv	App\\Filament\\Imports\\EducationImporter	0	2	0	1	2025-06-04 07:01:31	2025-06-04 07:01:31
12	\N	education-importer-example.csv	D:\\PROJECT TONI\\Portfolio\\resume\\storage\\app/private\\livewire-tmp/Ipa7J6wJlLPsrMd4s5RMd1F0ZWzJzd-metaZWR1Y2F0aW9uLWltcG9ydGVyLWV4YW1wbGUuY3N2-.csv	App\\Filament\\Imports\\EducationImporter	0	2	0	1	2025-06-04 06:57:35	2025-06-04 06:57:35
18	2025-06-04 13:52:12	skill-importer-example.csv	D:\\PROJECT TONI\\Portfolio\\resume\\storage\\app/private\\livewire-tmp/3FUosVvit5JcSyXcyi6zuiWgFfoaA2-metac2tpbGwtaW1wb3J0ZXItZXhhbXBsZS5jc3Y=-.csv	App\\Filament\\Imports\\SkillImporter	14	14	10	1	2025-06-04 13:51:48	2025-06-04 13:52:12
13	\N	education-importer-example.csv	D:\\PROJECT TONI\\Portfolio\\resume\\storage\\app/private\\livewire-tmp/duV8LfkZpa5HgYwPRFgKzgC6saNmcY-metaZWR1Y2F0aW9uLWltcG9ydGVyLWV4YW1wbGUuY3N2-.csv	App\\Filament\\Imports\\EducationImporter	0	2	0	1	2025-06-04 06:59:09	2025-06-04 06:59:09
14	\N	education-importer-example.csv	D:\\PROJECT TONI\\Portfolio\\resume\\storage\\app/private\\livewire-tmp/PBIZWxna3lHvsQZ6p7Hw7qKDxMnanF-metaZWR1Y2F0aW9uLWltcG9ydGVyLWV4YW1wbGUuY3N2-.csv	App\\Filament\\Imports\\EducationImporter	0	2	0	1	2025-06-04 07:00:46	2025-06-04 07:00:46
16	2025-06-04 07:03:58	education-importer-example.csv	D:\\PROJECT TONI\\Portfolio\\resume\\storage\\app/private\\livewire-tmp/AeBk6975SPTvQDh6fUnmrtQDUA2D53-metaZWR1Y2F0aW9uLWltcG9ydGVyLWV4YW1wbGUuY3N2-.csv	App\\Filament\\Imports\\EducationImporter	2	2	1	1	2025-06-04 07:03:57	2025-06-04 07:03:58
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
9f128fc1-a465-4d5e-8315-ddb61c8f2124		1	0	0	[]	YToyOntzOjEzOiJhbGxvd0ZhaWx1cmVzIjtiOjE7czo3OiJmaW5hbGx5IjthOjE6e2k6MDtPOjQ3OiJMYXJhdmVsXFNlcmlhbGl6YWJsZUNsb3N1cmVcU2VyaWFsaXphYmxlQ2xvc3VyZSI6MTp7czoxMjoic2VyaWFsaXphYmxlIjtPOjQ2OiJMYXJhdmVsXFNlcmlhbGl6YWJsZUNsb3N1cmVcU2VyaWFsaXplcnNcU2lnbmVkIjoyOntzOjEyOiJzZXJpYWxpemFibGUiO3M6MzY0NjoiTzo0NjoiTGFyYXZlbFxTZXJpYWxpemFibGVDbG9zdXJlXFNlcmlhbGl6ZXJzXE5hdGl2ZSI6NTp7czozOiJ1c2UiO2E6NDp7czo5OiJjb2x1bW5NYXAiO2E6Nzp7czo0OiJuYW1lIjtzOjQ6Im5hbWUiO3M6NjoiZGVncmVlIjtzOjY6ImRlZ3JlZSI7czoxNDoiZmllbGRfb2Zfc3R1ZHkiO3M6MTQ6ImZpZWxkX29mX3N0dWR5IjtzOjEwOiJzdGFydF9kYXRlIjtzOjEwOiJzdGFydF9kYXRlIjtzOjg6ImVuZF9kYXRlIjtzOjg6ImVuZF9kYXRlIjtzOjU6ImdyYWRlIjtzOjU6ImdyYWRlIjtzOjEwOiJpc19jdXJyZW50IjtzOjEwOiJpc19jdXJyZW50Ijt9czo2OiJpbXBvcnQiO086NDU6IklsbHVtaW5hdGVcQ29udHJhY3RzXERhdGFiYXNlXE1vZGVsSWRlbnRpZmllciI6NTp7czo1OiJjbGFzcyI7czozODoiRmlsYW1lbnRcQWN0aW9uc1xJbXBvcnRzXE1vZGVsc1xJbXBvcnQiO3M6MjoiaWQiO2k6MTc7czo5OiJyZWxhdGlvbnMiO2E6MDp7fXM6MTA6ImNvbm5lY3Rpb24iO3M6NToicGdzcWwiO3M6MTU6ImNvbGxlY3Rpb25DbGFzcyI7Tjt9czoxMzoiam9iQ29ubmVjdGlvbiI7TjtzOjc6Im9wdGlvbnMiO2E6MDp7fX1zOjg6ImZ1bmN0aW9uIjtzOjI5MjU6ImZ1bmN0aW9uICgpIHVzZSAoJGNvbHVtbk1hcCwgJGltcG9ydCwgJGpvYkNvbm5lY3Rpb24sICRvcHRpb25zKSB7CiAgICAgICAgICAgICAgICAgICAgJGltcG9ydC0+dG91Y2goJ2NvbXBsZXRlZF9hdCcpOwoKICAgICAgICAgICAgICAgICAgICBldmVudChuZXcgXEZpbGFtZW50XEFjdGlvbnNcSW1wb3J0c1xFdmVudHNcSW1wb3J0Q29tcGxldGVkKCRpbXBvcnQsICRjb2x1bW5NYXAsICRvcHRpb25zKSk7CgogICAgICAgICAgICAgICAgICAgIGlmICghICRpbXBvcnQtPnVzZXIgaW5zdGFuY2VvZiBcSWxsdW1pbmF0ZVxDb250cmFjdHNcQXV0aFxBdXRoZW50aWNhdGFibGUpIHsKICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuOwogICAgICAgICAgICAgICAgICAgIH0KCiAgICAgICAgICAgICAgICAgICAgJGZhaWxlZFJvd3NDb3VudCA9ICRpbXBvcnQtPmdldEZhaWxlZFJvd3NDb3VudCgpOwoKICAgICAgICAgICAgICAgICAgICBcRmlsYW1lbnRcTm90aWZpY2F0aW9uc1xOb3RpZmljYXRpb246Om1ha2UoKQogICAgICAgICAgICAgICAgICAgICAgICAtPnRpdGxlKCRpbXBvcnQtPmltcG9ydGVyOjpnZXRDb21wbGV0ZWROb3RpZmljYXRpb25UaXRsZSgkaW1wb3J0KSkKICAgICAgICAgICAgICAgICAgICAgICAgLT5ib2R5KCRpbXBvcnQtPmltcG9ydGVyOjpnZXRDb21wbGV0ZWROb3RpZmljYXRpb25Cb2R5KCRpbXBvcnQpKQogICAgICAgICAgICAgICAgICAgICAgICAtPndoZW4oCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAhICRmYWlsZWRSb3dzQ291bnQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBmbiAoXEZpbGFtZW50XE5vdGlmaWNhdGlvbnNcTm90aWZpY2F0aW9uICRub3RpZmljYXRpb24pID0+ICRub3RpZmljYXRpb24tPnN1Y2Nlc3MoKSwKICAgICAgICAgICAgICAgICAgICAgICAgKQogICAgICAgICAgICAgICAgICAgICAgICAtPndoZW4oCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAkZmFpbGVkUm93c0NvdW50ICYmICgkZmFpbGVkUm93c0NvdW50IDwgJGltcG9ydC0+dG90YWxfcm93cyksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBmbiAoXEZpbGFtZW50XE5vdGlmaWNhdGlvbnNcTm90aWZpY2F0aW9uICRub3RpZmljYXRpb24pID0+ICRub3RpZmljYXRpb24tPndhcm5pbmcoKSwKICAgICAgICAgICAgICAgICAgICAgICAgKQogICAgICAgICAgICAgICAgICAgICAgICAtPndoZW4oCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAkZmFpbGVkUm93c0NvdW50ID09PSAkaW1wb3J0LT50b3RhbF9yb3dzLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgZm4gKFxGaWxhbWVudFxOb3RpZmljYXRpb25zXE5vdGlmaWNhdGlvbiAkbm90aWZpY2F0aW9uKSA9PiAkbm90aWZpY2F0aW9uLT5kYW5nZXIoKSwKICAgICAgICAgICAgICAgICAgICAgICAgKQogICAgICAgICAgICAgICAgICAgICAgICAtPndoZW4oCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAkZmFpbGVkUm93c0NvdW50LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgZm4gKFxGaWxhbWVudFxOb3RpZmljYXRpb25zXE5vdGlmaWNhdGlvbiAkbm90aWZpY2F0aW9uKSA9PiAkbm90aWZpY2F0aW9uLT5hY3Rpb25zKFsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcRmlsYW1lbnRcTm90aWZpY2F0aW9uc1xBY3Rpb25zXEFjdGlvbjo6bWFrZSgnZG93bmxvYWRGYWlsZWRSb3dzQ3N2JykKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLT5sYWJlbCh0cmFuc19jaG9pY2UoJ2ZpbGFtZW50LWFjdGlvbnM6OmltcG9ydC5ub3RpZmljYXRpb25zLmNvbXBsZXRlZC5hY3Rpb25zLmRvd25sb2FkX2ZhaWxlZF9yb3dzX2Nzdi5sYWJlbCcsICRmYWlsZWRSb3dzQ291bnQsIFsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICdjb3VudCcgPT4gXElsbHVtaW5hdGVcU3VwcG9ydFxOdW1iZXI6OmZvcm1hdCgkZmFpbGVkUm93c0NvdW50KSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXSkpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0+Y29sb3IoJ2RhbmdlcicpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0+dXJsKHJvdXRlKCdmaWxhbWVudC5pbXBvcnRzLmZhaWxlZC1yb3dzLmRvd25sb2FkJywgWydpbXBvcnQnID0+ICRpbXBvcnRdLCBhYnNvbHV0ZTogZmFsc2UpLCBzaG91bGRPcGVuSW5OZXdUYWI6IHRydWUpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0+bWFya0FzUmVhZCgpLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgXSksCiAgICAgICAgICAgICAgICAgICAgICAgICkKICAgICAgICAgICAgICAgICAgICAgICAgLT53aGVuKAogICAgICAgICAgICAgICAgICAgICAgICAgICAgKCRqb2JDb25uZWN0aW9uID09PSAnc3luYycpIHx8CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKGJsYW5rKCRqb2JDb25uZWN0aW9uKSAmJiAoY29uZmlnKCdxdWV1ZS5kZWZhdWx0JykgPT09ICdzeW5jJykpLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgZm4gKFxGaWxhbWVudFxOb3RpZmljYXRpb25zXE5vdGlmaWNhdGlvbiAkbm90aWZpY2F0aW9uKSA9PiAkbm90aWZpY2F0aW9uCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLT5wZXJzaXN0ZW50KCkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtPnNlbmQoKSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZuIChcRmlsYW1lbnRcTm90aWZpY2F0aW9uc1xOb3RpZmljYXRpb24gJG5vdGlmaWNhdGlvbikgPT4gJG5vdGlmaWNhdGlvbi0+c2VuZFRvRGF0YWJhc2UoJGltcG9ydC0+dXNlciwgaXNFdmVudERpc3BhdGNoZWQ6IHRydWUpLAogICAgICAgICAgICAgICAgICAgICAgICApOwogICAgICAgICAgICAgICAgfSI7czo1OiJzY29wZSI7czozNjoiRmlsYW1lbnRcVGFibGVzXEFjdGlvbnNcSW1wb3J0QWN0aW9uIjtzOjQ6InRoaXMiO047czo0OiJzZWxmIjtzOjMyOiIwMDAwMDAwMDAwMDAwYTQ1MDAwMDAwMDAwMDAwMDAwMCI7fSI7czo0OiJoYXNoIjtzOjQ0OiJzNHM4bmZIWjF3UVY3bmtjM3lkOWdlTUpCYXl3cGx2ejNFYU5mbGZ1aVVZPSI7fX19fQ==	\N	1749020700	1749020700
9f13213c-ff6b-43f2-a4e9-3c17597155ed		1	0	0	[]	YToyOntzOjEzOiJhbGxvd0ZhaWx1cmVzIjtiOjE7czo3OiJmaW5hbGx5IjthOjE6e2k6MDtPOjQ3OiJMYXJhdmVsXFNlcmlhbGl6YWJsZUNsb3N1cmVcU2VyaWFsaXphYmxlQ2xvc3VyZSI6MTp7czoxMjoic2VyaWFsaXphYmxlIjtPOjQ2OiJMYXJhdmVsXFNlcmlhbGl6YWJsZUNsb3N1cmVcU2VyaWFsaXplcnNcU2lnbmVkIjoyOntzOjEyOiJzZXJpYWxpemFibGUiO3M6MzY1NDoiTzo0NjoiTGFyYXZlbFxTZXJpYWxpemFibGVDbG9zdXJlXFNlcmlhbGl6ZXJzXE5hdGl2ZSI6NTp7czozOiJ1c2UiO2E6NDp7czo5OiJjb2x1bW5NYXAiO2E6ODp7czo0OiJzbHVnIjtzOjQ6InNsdWciO3M6NDoibmFtZSI7czo0OiJuYW1lIjtzOjExOiJkZXNjcmlwdGlvbiI7czoxMToiZGVzY3JpcHRpb24iO3M6OToiaW1hZ2VfdXJsIjtzOjk6ImltYWdlX3VybCI7czo4OiJpY29uX3VybCI7czo4OiJpY29uX3VybCI7czoxMDoicGVyY2VudGFnZSI7czoxMDoicGVyY2VudGFnZSI7czo1OiJjb2xvciI7czo1OiJjb2xvciI7czo0OiJ0eXBlIjtzOjQ6InR5cGUiO31zOjY6ImltcG9ydCI7Tzo0NToiSWxsdW1pbmF0ZVxDb250cmFjdHNcRGF0YWJhc2VcTW9kZWxJZGVudGlmaWVyIjo1OntzOjU6ImNsYXNzIjtzOjM4OiJGaWxhbWVudFxBY3Rpb25zXEltcG9ydHNcTW9kZWxzXEltcG9ydCI7czoyOiJpZCI7aToxODtzOjk6InJlbGF0aW9ucyI7YTowOnt9czoxMDoiY29ubmVjdGlvbiI7czo1OiJwZ3NxbCI7czoxNToiY29sbGVjdGlvbkNsYXNzIjtOO31zOjEzOiJqb2JDb25uZWN0aW9uIjtOO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6ODoiZnVuY3Rpb24iO3M6MjkyNToiZnVuY3Rpb24gKCkgdXNlICgkY29sdW1uTWFwLCAkaW1wb3J0LCAkam9iQ29ubmVjdGlvbiwgJG9wdGlvbnMpIHsKICAgICAgICAgICAgICAgICAgICAkaW1wb3J0LT50b3VjaCgnY29tcGxldGVkX2F0Jyk7CgogICAgICAgICAgICAgICAgICAgIGV2ZW50KG5ldyBcRmlsYW1lbnRcQWN0aW9uc1xJbXBvcnRzXEV2ZW50c1xJbXBvcnRDb21wbGV0ZWQoJGltcG9ydCwgJGNvbHVtbk1hcCwgJG9wdGlvbnMpKTsKCiAgICAgICAgICAgICAgICAgICAgaWYgKCEgJGltcG9ydC0+dXNlciBpbnN0YW5jZW9mIFxJbGx1bWluYXRlXENvbnRyYWN0c1xBdXRoXEF1dGhlbnRpY2F0YWJsZSkgewogICAgICAgICAgICAgICAgICAgICAgICByZXR1cm47CiAgICAgICAgICAgICAgICAgICAgfQoKICAgICAgICAgICAgICAgICAgICAkZmFpbGVkUm93c0NvdW50ID0gJGltcG9ydC0+Z2V0RmFpbGVkUm93c0NvdW50KCk7CgogICAgICAgICAgICAgICAgICAgIFxGaWxhbWVudFxOb3RpZmljYXRpb25zXE5vdGlmaWNhdGlvbjo6bWFrZSgpCiAgICAgICAgICAgICAgICAgICAgICAgIC0+dGl0bGUoJGltcG9ydC0+aW1wb3J0ZXI6OmdldENvbXBsZXRlZE5vdGlmaWNhdGlvblRpdGxlKCRpbXBvcnQpKQogICAgICAgICAgICAgICAgICAgICAgICAtPmJvZHkoJGltcG9ydC0+aW1wb3J0ZXI6OmdldENvbXBsZXRlZE5vdGlmaWNhdGlvbkJvZHkoJGltcG9ydCkpCiAgICAgICAgICAgICAgICAgICAgICAgIC0+d2hlbigKICAgICAgICAgICAgICAgICAgICAgICAgICAgICEgJGZhaWxlZFJvd3NDb3VudCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZuIChcRmlsYW1lbnRcTm90aWZpY2F0aW9uc1xOb3RpZmljYXRpb24gJG5vdGlmaWNhdGlvbikgPT4gJG5vdGlmaWNhdGlvbi0+c3VjY2VzcygpLAogICAgICAgICAgICAgICAgICAgICAgICApCiAgICAgICAgICAgICAgICAgICAgICAgIC0+d2hlbigKICAgICAgICAgICAgICAgICAgICAgICAgICAgICRmYWlsZWRSb3dzQ291bnQgJiYgKCRmYWlsZWRSb3dzQ291bnQgPCAkaW1wb3J0LT50b3RhbF9yb3dzKSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZuIChcRmlsYW1lbnRcTm90aWZpY2F0aW9uc1xOb3RpZmljYXRpb24gJG5vdGlmaWNhdGlvbikgPT4gJG5vdGlmaWNhdGlvbi0+d2FybmluZygpLAogICAgICAgICAgICAgICAgICAgICAgICApCiAgICAgICAgICAgICAgICAgICAgICAgIC0+d2hlbigKICAgICAgICAgICAgICAgICAgICAgICAgICAgICRmYWlsZWRSb3dzQ291bnQgPT09ICRpbXBvcnQtPnRvdGFsX3Jvd3MsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBmbiAoXEZpbGFtZW50XE5vdGlmaWNhdGlvbnNcTm90aWZpY2F0aW9uICRub3RpZmljYXRpb24pID0+ICRub3RpZmljYXRpb24tPmRhbmdlcigpLAogICAgICAgICAgICAgICAgICAgICAgICApCiAgICAgICAgICAgICAgICAgICAgICAgIC0+d2hlbigKICAgICAgICAgICAgICAgICAgICAgICAgICAgICRmYWlsZWRSb3dzQ291bnQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBmbiAoXEZpbGFtZW50XE5vdGlmaWNhdGlvbnNcTm90aWZpY2F0aW9uICRub3RpZmljYXRpb24pID0+ICRub3RpZmljYXRpb24tPmFjdGlvbnMoWwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFxGaWxhbWVudFxOb3RpZmljYXRpb25zXEFjdGlvbnNcQWN0aW9uOjptYWtlKCdkb3dubG9hZEZhaWxlZFJvd3NDc3YnKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtPmxhYmVsKHRyYW5zX2Nob2ljZSgnZmlsYW1lbnQtYWN0aW9uczo6aW1wb3J0Lm5vdGlmaWNhdGlvbnMuY29tcGxldGVkLmFjdGlvbnMuZG93bmxvYWRfZmFpbGVkX3Jvd3NfY3N2LmxhYmVsJywgJGZhaWxlZFJvd3NDb3VudCwgWwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJ2NvdW50JyA9PiBcSWxsdW1pbmF0ZVxTdXBwb3J0XE51bWJlcjo6Zm9ybWF0KCRmYWlsZWRSb3dzQ291bnQpLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBdKSkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLT5jb2xvcignZGFuZ2VyJykKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLT51cmwocm91dGUoJ2ZpbGFtZW50LmltcG9ydHMuZmFpbGVkLXJvd3MuZG93bmxvYWQnLCBbJ2ltcG9ydCcgPT4gJGltcG9ydF0sIGFic29sdXRlOiBmYWxzZSksIHNob3VsZE9wZW5Jbk5ld1RhYjogdHJ1ZSkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLT5tYXJrQXNSZWFkKCksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBdKSwKICAgICAgICAgICAgICAgICAgICAgICAgKQogICAgICAgICAgICAgICAgICAgICAgICAtPndoZW4oCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAoJGpvYkNvbm5lY3Rpb24gPT09ICdzeW5jJykgfHwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoYmxhbmsoJGpvYkNvbm5lY3Rpb24pICYmIChjb25maWcoJ3F1ZXVlLmRlZmF1bHQnKSA9PT0gJ3N5bmMnKSksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBmbiAoXEZpbGFtZW50XE5vdGlmaWNhdGlvbnNcTm90aWZpY2F0aW9uICRub3RpZmljYXRpb24pID0+ICRub3RpZmljYXRpb24KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtPnBlcnNpc3RlbnQoKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0+c2VuZCgpLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgZm4gKFxGaWxhbWVudFxOb3RpZmljYXRpb25zXE5vdGlmaWNhdGlvbiAkbm90aWZpY2F0aW9uKSA9PiAkbm90aWZpY2F0aW9uLT5zZW5kVG9EYXRhYmFzZSgkaW1wb3J0LT51c2VyLCBpc0V2ZW50RGlzcGF0Y2hlZDogdHJ1ZSksCiAgICAgICAgICAgICAgICAgICAgICAgICk7CiAgICAgICAgICAgICAgICB9IjtzOjU6InNjb3BlIjtzOjM2OiJGaWxhbWVudFxUYWJsZXNcQWN0aW9uc1xJbXBvcnRBY3Rpb24iO3M6NDoidGhpcyI7TjtzOjQ6InNlbGYiO3M6MzI6IjAwMDAwMDAwMDAwMDBhYWYwMDAwMDAwMDAwMDAwMDAwIjt9IjtzOjQ6Imhhc2giO3M6NDQ6IkVqN0E4TjhiQmRIT0hLRCtTcnlJOUhOMlhuVXpFRE9rTHRoaTJ0aURQaFU9Ijt9fX19	\N	1749045108	1749045132
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.messages (id, name, email, phone, subject, message, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2025_05_27_085910_create_personal_infos_table	1
5	2025_05_27_085933_create_services_table	1
6	2025_05_27_085940_create_skills_table	1
7	2025_05_27_085947_create_categories_table	1
8	2025_05_27_085954_create_projects_table	1
9	2025_05_27_090000_create_tertimonials_table	1
10	2025_05_27_090017_create_articles_table	1
11	2025_05_27_090533_create_messages_table	1
12	2025_06_03_022431_create_notifications_table	1
13	2025_06_03_022441_create_imports_table	1
14	2025_06_03_022442_create_exports_table	1
15	2025_06_03_022443_create_failed_import_rows_table	1
16	2025_06_03_061214_add_thumbnail_projects	1
17	2025_06_03_092544_add_order_to_projects_table	1
18	2025_06_03_110931_create_education_table	1
19	2025_06_03_110940_create_experiences_table	1
20	2025_06_04_070322_alter_grade_column_on_education_table	2
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (id, type, notifiable_type, notifiable_id, data, read_at, created_at, updated_at) FROM stdin;
1a7b02e9-7c52-4587-8227-8bcaa10bc420	Filament\\Notifications\\DatabaseNotification	App\\Models\\User	1	{"actions":[{"name":"downloadFailedRowsCsv","color":"danger","event":null,"eventData":[],"dispatchDirection":false,"dispatchToComponent":null,"extraAttributes":[],"icon":null,"iconPosition":"before","iconSize":null,"isOutlined":false,"isDisabled":false,"label":"Download information about the failed rows","shouldClose":false,"shouldMarkAsRead":true,"shouldMarkAsUnread":false,"shouldOpenUrlInNewTab":true,"size":"sm","tooltip":null,"url":"\\/filament\\/imports\\/1\\/failed-rows\\/download","view":"filament-actions::link-action"}],"body":"Your education import has completed and 0 rows imported. 2 rows failed to import.","color":null,"duration":"persistent","icon":"heroicon-o-x-circle","iconColor":"danger","status":"danger","title":"Import completed","view":"filament-notifications::notification","viewData":[],"format":"filament"}	\N	2025-06-04 04:21:32	2025-06-04 04:21:32
e94f827c-05be-4d41-803f-870deaa3d643	Filament\\Notifications\\DatabaseNotification	App\\Models\\User	1	{"actions":[{"name":"downloadFailedRowsCsv","color":"danger","event":null,"eventData":[],"dispatchDirection":false,"dispatchToComponent":null,"extraAttributes":[],"icon":null,"iconPosition":"before","iconSize":null,"isOutlined":false,"isDisabled":false,"label":"Download information about the failed rows","shouldClose":false,"shouldMarkAsRead":true,"shouldMarkAsUnread":false,"shouldOpenUrlInNewTab":true,"size":"sm","tooltip":null,"url":"\\/filament\\/imports\\/3\\/failed-rows\\/download","view":"filament-actions::link-action"}],"body":"Your education import has completed and 0 rows imported. 2 rows failed to import.","color":null,"duration":"persistent","icon":"heroicon-o-x-circle","iconColor":"danger","status":"danger","title":"Import completed","view":"filament-notifications::notification","viewData":[],"format":"filament"}	\N	2025-06-04 04:31:25	2025-06-04 04:31:25
b7f83eed-dc31-4bac-8e35-0996c444a0ae	Filament\\Notifications\\DatabaseNotification	App\\Models\\User	1	{"actions":[{"name":"downloadFailedRowsCsv","color":"danger","event":null,"eventData":[],"dispatchDirection":false,"dispatchToComponent":null,"extraAttributes":[],"icon":null,"iconPosition":"before","iconSize":null,"isOutlined":false,"isDisabled":false,"label":"Download information about the failed rows","shouldClose":false,"shouldMarkAsRead":true,"shouldMarkAsUnread":false,"shouldOpenUrlInNewTab":true,"size":"sm","tooltip":null,"url":"\\/filament\\/imports\\/4\\/failed-rows\\/download","view":"filament-actions::link-action"}],"body":"Your education import has completed and 0 rows imported. 2 rows failed to import.","color":null,"duration":"persistent","icon":"heroicon-o-x-circle","iconColor":"danger","status":"danger","title":"Import completed","view":"filament-notifications::notification","viewData":[],"format":"filament"}	\N	2025-06-04 04:38:14	2025-06-04 04:38:14
514149e4-446b-4a4b-85c6-a4d5a596e843	Filament\\Notifications\\DatabaseNotification	App\\Models\\User	1	{"actions":[{"name":"downloadFailedRowsCsv","color":"danger","event":null,"eventData":[],"dispatchDirection":false,"dispatchToComponent":null,"extraAttributes":[],"icon":null,"iconPosition":"before","iconSize":null,"isOutlined":false,"isDisabled":false,"label":"Download information about the failed rows","shouldClose":false,"shouldMarkAsRead":true,"shouldMarkAsUnread":false,"shouldOpenUrlInNewTab":true,"size":"sm","tooltip":null,"url":"\\/filament\\/imports\\/5\\/failed-rows\\/download","view":"filament-actions::link-action"}],"body":"Your education import has completed and 0 rows imported. 2 rows failed to import.","color":null,"duration":"persistent","icon":"heroicon-o-x-circle","iconColor":"danger","status":"danger","title":"Import completed","view":"filament-notifications::notification","viewData":[],"format":"filament"}	\N	2025-06-04 04:39:02	2025-06-04 04:39:02
e47daeba-2490-4d14-a5e3-06f1ff5afec7	Filament\\Notifications\\DatabaseNotification	App\\Models\\User	1	{"actions":[{"name":"downloadFailedRowsCsv","color":"danger","event":null,"eventData":[],"dispatchDirection":false,"dispatchToComponent":null,"extraAttributes":[],"icon":null,"iconPosition":"before","iconSize":null,"isOutlined":false,"isDisabled":false,"label":"Download information about the failed rows","shouldClose":false,"shouldMarkAsRead":true,"shouldMarkAsUnread":false,"shouldOpenUrlInNewTab":true,"size":"sm","tooltip":null,"url":"\\/filament\\/imports\\/6\\/failed-rows\\/download","view":"filament-actions::link-action"}],"body":"Your education import has completed and 0 rows imported. 2 rows failed to import.","color":null,"duration":"persistent","icon":"heroicon-o-x-circle","iconColor":"danger","status":"danger","title":"Import completed","view":"filament-notifications::notification","viewData":[],"format":"filament"}	\N	2025-06-04 04:48:54	2025-06-04 04:48:54
2592ec02-6924-4f16-8155-b6e61bfe0121	Filament\\Notifications\\DatabaseNotification	App\\Models\\User	1	{"actions":[{"name":"downloadFailedRowsCsv","color":"danger","event":null,"eventData":[],"dispatchDirection":false,"dispatchToComponent":null,"extraAttributes":[],"icon":null,"iconPosition":"before","iconSize":null,"isOutlined":false,"isDisabled":false,"label":"Download information about the failed rows","shouldClose":false,"shouldMarkAsRead":true,"shouldMarkAsUnread":false,"shouldOpenUrlInNewTab":true,"size":"sm","tooltip":null,"url":"\\/filament\\/imports\\/7\\/failed-rows\\/download","view":"filament-actions::link-action"}],"body":"Your education import has completed and 0 rows imported. 2 rows failed to import.","color":null,"duration":"persistent","icon":"heroicon-o-x-circle","iconColor":"danger","status":"danger","title":"Import completed","view":"filament-notifications::notification","viewData":[],"format":"filament"}	\N	2025-06-04 06:33:44	2025-06-04 06:33:44
8455edc9-2e1c-49d5-aadd-9f136692e244	Filament\\Notifications\\DatabaseNotification	App\\Models\\User	1	{"actions":[{"name":"downloadFailedRowsCsv","color":"danger","event":null,"eventData":[],"dispatchDirection":false,"dispatchToComponent":null,"extraAttributes":[],"icon":null,"iconPosition":"before","iconSize":null,"isOutlined":false,"isDisabled":false,"label":"Download information about the failed rows","shouldClose":false,"shouldMarkAsRead":true,"shouldMarkAsUnread":false,"shouldOpenUrlInNewTab":true,"size":"sm","tooltip":null,"url":"\\/filament\\/imports\\/8\\/failed-rows\\/download","view":"filament-actions::link-action"}],"body":"Your education import has completed and 0 rows imported. 2 rows failed to import.","color":null,"duration":"persistent","icon":"heroicon-o-x-circle","iconColor":"danger","status":"danger","title":"Import completed","view":"filament-notifications::notification","viewData":[],"format":"filament"}	\N	2025-06-04 06:48:05	2025-06-04 06:48:05
74452ccb-edcd-4aab-93cf-0937726b78c1	Filament\\Notifications\\DatabaseNotification	App\\Models\\User	1	{"actions":[{"name":"downloadFailedRowsCsv","color":"danger","event":null,"eventData":[],"dispatchDirection":false,"dispatchToComponent":null,"extraAttributes":[],"icon":null,"iconPosition":"before","iconSize":null,"isOutlined":false,"isDisabled":false,"label":"Download information about the failed rows","shouldClose":false,"shouldMarkAsRead":true,"shouldMarkAsUnread":false,"shouldOpenUrlInNewTab":true,"size":"sm","tooltip":null,"url":"\\/filament\\/imports\\/18\\/failed-rows\\/download","view":"filament-actions::link-action"}],"body":"Your skill import has completed and 10 rows imported. 4 rows failed to import.","color":null,"duration":"persistent","icon":"heroicon-o-exclamation-circle","iconColor":"warning","status":"warning","title":"Import completed","view":"filament-notifications::notification","viewData":[],"format":"filament"}	\N	2025-06-04 13:52:12	2025-06-04 13:52:12
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: personal_infos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_infos (id, key, value, created_at, updated_at) FROM stdin;
1	name	"Achmad Fatoni"	2025-05-28 01:29:09	2025-05-28 01:29:09
2	title	"Web Developer|IT Support|System Analyst|Network Engineer"	2025-05-28 01:29:09	2025-06-02 06:47:10
3	description	"Experienced Web Programmer with expertise in system analysis, design,<br> and maintenance. Proven experience as an IT Support Technician, Tax Accountant, and Computer Teacher. Excellent skills in programming, network security, and hardware management."	2025-06-02 07:01:13	2025-06-02 07:01:13
5	linkedin	"https:\\/\\/www.linkedin.com\\/in\\/2ahmadfatoni0\\/"	2025-05-28 01:29:09	2025-05-28 01:29:09
6	github	"https:\\/\\/github.com\\/inotechno"	2025-05-28 01:29:09	2025-05-28 01:29:09
7	twitter	null	2025-05-28 01:29:09	2025-05-28 01:29:09
8	instagram	"https:\\/\\/www.instagram.com\\/20ahmadfatoni08\\/"	2025-05-28 01:29:10	2025-05-28 01:29:10
9	facebook	null	2025-05-28 01:29:10	2025-05-28 01:29:10
10	youtube	null	2025-05-28 01:29:10	2025-05-28 01:29:10
11	whatsapp	"https:\\/\\/api.whatsapp.com\\/send?phone=6289676490971"	2025-05-28 01:29:10	2025-05-28 01:29:10
12	telegram	null	2025-05-28 01:29:10	2025-05-28 01:29:10
13	website	"https:\\/\\/inotechno.my.id"	2025-05-28 01:29:10	2025-05-28 01:29:10
15	date_of_birth	"1997-08-20"	2025-05-28 01:29:10	2025-05-28 01:29:10
16	place_of_birth	"Serang, Indonesia"	2025-05-28 01:29:10	2025-05-28 01:29:10
17	nationality	"Indonesian"	2025-05-28 01:29:10	2025-05-28 01:29:10
18	religion	"Islam"	2025-05-28 01:29:10	2025-05-28 01:29:10
19	marital_status	"Married"	2025-05-28 01:29:11	2025-05-28 01:29:11
4	image_url	"http:\\/\\/localhost:8000\\/images\\/136di_GBAL7BuncZHMiS2AmeHYbf1NGv1.png"	2025-05-28 01:29:09	2025-06-03 16:27:15
14	gender	"Male"	2025-05-28 01:29:10	2025-06-10 02:55:22
20	color_number	2	\N	\N
21	dark_mode	"true"	\N	2025-06-10 03:48:04
22	map	"<iframe src=\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3966.748235347556!2d106.15830717478248!3d-6.164461660413638!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e4221ee93ddacdd%3A0xeed0680f1c5f23d0!2sUnicorn%20Gift%20(Toko%20Buket%2FSouvenir)!5e0!3m2!1sid!2sid!4v1749540211532!5m2!1sid!2sid\\" width=\\"100%\\" height=\\"300\\" style=\\"border:0;\\" allowfullscreen=\\"\\" loading=\\"lazy\\" referrerpolicy=\\"no-referrer-when-downgrade\\"><\\/iframe>"	\N	2025-06-10 07:32:47
23	phone	6289676490971	\N	\N
24	email	"2ahmadfatoni0@gmail.com"	\N	2025-06-10 07:40:18
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (id, category_id, slug, title, description, description_excerpt, image_url, project_url, github, tags, created_at, updated_at, thumbnail, "order") FROM stdin;
0197345d-802d-716b-8610-9c02fe1bb029	1	bukuzilla	Bukuzilla	<h1>Aplikasi Bukubesar Akuntansi</h1><p>Aplikasi ini merupakan sistem akuntansi yang dibangun menggunakan CodeIgniter 3 dan MySQL. Aplikasi ini dirancang untuk mengelola transaksi dan menghasilkan laporan bukubesar. Terdapat tiga peran akses: General Ledger, Chief Accounting, dan Karyawan.</p><h2>Fitur</h2><ol><li><strong>Company Profile Perusahaan</strong>: Menampilkan informasi profil perusahaan.</li><li><strong>Master Account</strong>: Manajemen akun-akun dalam sistem.</li><li><strong>Daftar Users</strong>: Pendaftaran dan manajemen pengguna aplikasi.</li><li><strong>Daftar Transaksi Jurnal</strong>: Menampilkan daftar transaksi jurnal yang telah dilakukan.</li><li><strong>Tambah Jurnal Transaksi</strong>: Membuat transaksi jurnal baru.</li><li><strong>Inquiry Ledger</strong>: Melihat dan menelusuri buku besar.</li><li><strong>Periksa Kesalahan Transaksi</strong>: Memeriksa kesalahan dalam transaksi.</li><li><strong>Posting Transaksi</strong>: Melakukan posting transaksi ke dalam buku besar.</li><li><strong>Saldo Awal</strong>: Menyimpan dan mengelola saldo awal akun.</li></ol><h2>Screenshot</h2><h3>1. Company Profile Perusahaan<figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:932,&quot;href&quot;:&quot;https://github.com/inotechno/bukuzilla/blob/main/screenshot/CompanyProfile.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/bukuzilla/raw/main/screenshot/CompanyProfile.png&quot;,&quot;width&quot;:1917}" data-trix-content-type="image" data-trix-attributes="{&quot;caption&quot;:&quot;company profile&quot;}" class="attachment attachment--preview"><a href="https://github.com/inotechno/bukuzilla/blob/main/screenshot/CompanyProfile.png"><img src="https://github.com/inotechno/bukuzilla/raw/main/screenshot/CompanyProfile.png" width="1917" height="932"><figcaption class="attachment__caption attachment__caption--edited">company profile</figcaption></a></figure>2. Master Account<figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:935,&quot;href&quot;:&quot;https://github.com/inotechno/bukuzilla/blob/main/screenshot/MasterAccount.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/bukuzilla/raw/main/screenshot/MasterAccount.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" data-trix-attributes="{&quot;caption&quot;:&quot;master-account&quot;}" class="attachment attachment--preview"><a href="https://github.com/inotechno/bukuzilla/blob/main/screenshot/MasterAccount.png"><img src="https://github.com/inotechno/bukuzilla/raw/main/screenshot/MasterAccount.png" width="1920" height="935"><figcaption class="attachment__caption attachment__caption--edited">master-account</figcaption></a></figure>3. Daftar Users<figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:932,&quot;href&quot;:&quot;https://github.com/inotechno/bukuzilla/blob/main/screenshot/Users.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/bukuzilla/raw/main/screenshot/Users.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" data-trix-attributes="{&quot;caption&quot;:&quot;daftar-users&quot;}" class="attachment attachment--preview"><a href="https://github.com/inotechno/bukuzilla/blob/main/screenshot/Users.png"><img src="https://github.com/inotechno/bukuzilla/raw/main/screenshot/Users.png" width="1920" height="932"><figcaption class="attachment__caption attachment__caption--edited">daftar-users</figcaption></a></figure>4. Daftar Transaksi Jurnal<figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:936,&quot;href&quot;:&quot;https://github.com/inotechno/bukuzilla/blob/main/screenshot/TransaksiJurnal.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/bukuzilla/raw/main/screenshot/TransaksiJurnal.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" data-trix-attributes="{&quot;caption&quot;:&quot;transaksi-jurnal&quot;}" class="attachment attachment--preview"><a href="https://github.com/inotechno/bukuzilla/blob/main/screenshot/TransaksiJurnal.png"><img src="https://github.com/inotechno/bukuzilla/raw/main/screenshot/TransaksiJurnal.png" width="1920" height="936"><figcaption class="attachment__caption attachment__caption--edited">transaksi-jurnal</figcaption></a></figure>5. Tambah Jurnal Transaksi<figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:937,&quot;href&quot;:&quot;https://github.com/inotechno/bukuzilla/blob/main/screenshot/AddJurnal.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/bukuzilla/raw/main/screenshot/AddJurnal.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" data-trix-attributes="{&quot;caption&quot;:&quot;add-jurnal-transaksi&quot;}" class="attachment attachment--preview"><a href="https://github.com/inotechno/bukuzilla/blob/main/screenshot/AddJurnal.png"><img src="https://github.com/inotechno/bukuzilla/raw/main/screenshot/AddJurnal.png" width="1920" height="937"><figcaption class="attachment__caption attachment__caption--edited">add-jurnal-transaksi</figcaption></a></figure>6. Inquiry Ledger<figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:936,&quot;href&quot;:&quot;https://github.com/inotechno/bukuzilla/blob/main/screenshot/InquiryLedger.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/bukuzilla/raw/main/screenshot/InquiryLedger.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" data-trix-attributes="{&quot;caption&quot;:&quot;inquiry-ledger&quot;}" class="attachment attachment--preview"><a href="https://github.com/inotechno/bukuzilla/blob/main/screenshot/InquiryLedger.png"><img src="https://github.com/inotechno/bukuzilla/raw/main/screenshot/InquiryLedger.png" width="1920" height="936"><figcaption class="attachment__caption attachment__caption--edited">inquiry-ledger</figcaption></a></figure>7. Periksa Kesalahan Transaksi<figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:932,&quot;href&quot;:&quot;https://github.com/inotechno/bukuzilla/blob/main/screenshot/PeriksaTransaksi.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/bukuzilla/raw/main/screenshot/PeriksaTransaksi.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" data-trix-attributes="{&quot;caption&quot;:&quot;check-balance-transaction&quot;}" class="attachment attachment--preview"><a href="https://github.com/inotechno/bukuzilla/blob/main/screenshot/PeriksaTransaksi.png"><img src="https://github.com/inotechno/bukuzilla/raw/main/screenshot/PeriksaTransaksi.png" width="1920" height="932"><figcaption class="attachment__caption attachment__caption--edited">check-balance-transaction</figcaption></a></figure>8. Posting Transaksi<figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:937,&quot;href&quot;:&quot;https://github.com/inotechno/bukuzilla/blob/main/screenshot/PostingTransaksi.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/bukuzilla/raw/main/screenshot/PostingTransaksi.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" data-trix-attributes="{&quot;caption&quot;:&quot;posting-transaction&quot;}" class="attachment attachment--preview"><a href="https://github.com/inotechno/bukuzilla/blob/main/screenshot/PostingTransaksi.png"><img src="https://github.com/inotechno/bukuzilla/raw/main/screenshot/PostingTransaksi.png" width="1920" height="937"><figcaption class="attachment__caption attachment__caption--edited">posting-transaction</figcaption></a></figure>9. Saldo Awal<figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:932,&quot;href&quot;:&quot;https://github.com/inotechno/bukuzilla/blob/main/screenshot/SaldoAwal.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/bukuzilla/raw/main/screenshot/SaldoAwal.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" data-trix-attributes="{&quot;caption&quot;:&quot;saldo awal&quot;}" class="attachment attachment--preview"><a href="https://github.com/inotechno/bukuzilla/blob/main/screenshot/SaldoAwal.png"><img src="https://github.com/inotechno/bukuzilla/raw/main/screenshot/SaldoAwal.png" width="1920" height="932"><figcaption class="attachment__caption attachment__caption--edited">saldo awal</figcaption></a></figure>Role Akses</h3><ol><li><strong>General Ledger</strong></li><li><strong>Chief Accounting</strong></li><li><strong>Karyawan</strong></li></ol><h2>Instalasi</h2><ol><li>Clone repositori ini: git clone https://github.com/inotechno/bukuzilla.git</li><li>Impor struktur database dari bukuzilla.sql.</li><li>Konfigurasi file application/config/database.php untuk pengaturan koneksi database.</li></ol><p><br></p>	<p>BukuZilla merupakan aplikasi buku besar akuntansi yang dibangun menggunakan codeigniter 3.</p>	projects/01JWT5V00YM75ZN30C1XJP95Z6.png	\N	https://github.com/inotechno/bukuzilla	["codeigniter","jquery","accounting","ledger"]	2025-06-03 11:29:01	2025-06-03 11:29:01	projects/01JWT5V00YM75ZN30C1XJP95Z6.png	2
019734a9-fb9f-7209-8e41-c39ff2035f0f	1	silink	SILINK	<h1>SILINK - Sistem Informasi Lingkungan</h1><p>SILINK adalah aplikasi open source yang dikembangkan menggunakan CodeIgniter 3 dan MySQL. Aplikasi ini dirancang untuk mengelola data administrasi lingkungan dengan berbagai fitur yang mencakup aspek beragam seperti keluarga, keuangan, pemuda, penduduk, inventaris warga, dan lainnya. Aplikasi ini memiliki tiga peran akses: Admin, Pemuda, dan Warga.</p><h2>Fitur</h2><ol><li><strong>Dashboard</strong>: Ringkasan visual dari statistik dan informasi penting.</li><li><strong>Data Keluarga</strong>: Manajemen data keluarga warga.</li><li><strong>Data Keuangan</strong>: Perekaman dan pelacakan data keuangan.</li><li><strong>Data Pemuda</strong>: Informasi dan aktivitas pemuda di lingkungan.</li><li><strong>Data Penduduk</strong>: Data individu tentang penduduk.</li><li><strong>Inventaris Warga</strong>: Pencatatan dan pengelolaan inventaris warga.</li><li><strong>Pengaturan Aplikasi</strong>: Konfigurasi dan pengaturan aplikasi.</li><li><strong>Register Warga</strong>: Pendaftaran dan manajemen data warga.</li><li><strong>Sumbangan Warga</strong>: Penerimaan dan pencatatan sumbangan dari warga.</li><li><strong>Daftar Kegiatan dan Tambah Kegiatan</strong>: Pencatatan dan pengelolaan kegiatan di lingkungan.</li></ol><h2>Role Akses</h2><ol><li><strong>Admin</strong>: Akses penuh ke semua fitur aplikasi.</li><li><strong>Pemuda</strong>: Akses terbatas sesuai dengan kebutuhan pemuda.</li><li><strong>Warga</strong>: Akses terbatas sesuai dengan kebutuhan warga.</li></ol><h2>Screenshot</h2><h3>1. Dashboard<figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:932,&quot;href&quot;:&quot;https://github.com/inotechno/silink/blob/Main/screenshot/dashboard.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/silink/raw/Main/screenshot/dashboard.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" class="attachment attachment--preview"><a href="https://github.com/inotechno/silink/blob/Main/screenshot/dashboard.png"><img src="https://github.com/inotechno/silink/raw/Main/screenshot/dashboard.png" width="1920" height="932"><figcaption class="attachment__caption"></figcaption></a></figure>2. Data Keluarga<figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:932,&quot;href&quot;:&quot;https://github.com/inotechno/silink/blob/Main/screenshot/data_keluarga.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/silink/raw/Main/screenshot/data_keluarga.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" class="attachment attachment--preview"><a href="https://github.com/inotechno/silink/blob/Main/screenshot/data_keluarga.png"><img src="https://github.com/inotechno/silink/raw/Main/screenshot/data_keluarga.png" width="1920" height="932"><figcaption class="attachment__caption"></figcaption></a></figure>3. Data Keuangan</h3><p><figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:933,&quot;href&quot;:&quot;https://github.com/inotechno/silink/blob/Main/screenshot/data_keuangan.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/silink/raw/Main/screenshot/data_keuangan.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" class="attachment attachment--preview"><a href="https://github.com/inotechno/silink/blob/Main/screenshot/data_keuangan.png"><img src="https://github.com/inotechno/silink/raw/Main/screenshot/data_keuangan.png" width="1920" height="933"><figcaption class="attachment__caption"></figcaption></a></figure></p><h3>4. Data Pemuda<figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:933,&quot;href&quot;:&quot;https://github.com/inotechno/silink/blob/Main/screenshot/data_pemuda.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/silink/raw/Main/screenshot/data_pemuda.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" class="attachment attachment--preview"><a href="https://github.com/inotechno/silink/blob/Main/screenshot/data_pemuda.png"><img src="https://github.com/inotechno/silink/raw/Main/screenshot/data_pemuda.png" width="1920" height="933"><figcaption class="attachment__caption"></figcaption></a></figure>5. Data Penduduk<figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:931,&quot;href&quot;:&quot;https://github.com/inotechno/silink/blob/Main/screenshot/data_penduduk.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/silink/raw/Main/screenshot/data_penduduk.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" class="attachment attachment--preview"><a href="https://github.com/inotechno/silink/blob/Main/screenshot/data_penduduk.png"><img src="https://github.com/inotechno/silink/raw/Main/screenshot/data_penduduk.png" width="1920" height="931"><figcaption class="attachment__caption"></figcaption></a></figure>6. Inventaris Warga<figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:933,&quot;href&quot;:&quot;https://github.com/inotechno/silink/blob/Main/screenshot/inventaris_warga.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/silink/raw/Main/screenshot/inventaris_warga.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" class="attachment attachment--preview"><a href="https://github.com/inotechno/silink/blob/Main/screenshot/inventaris_warga.png"><img src="https://github.com/inotechno/silink/raw/Main/screenshot/inventaris_warga.png" width="1920" height="933"><figcaption class="attachment__caption"></figcaption></a></figure>7. Pengaturan Aplikasi<figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;href&quot;:&quot;https://github.com/inotechno/silink/blob/Main/screenshot/pengaturan_aplikasi.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/silink/raw/Main/screenshot/pengaturan_aplikasi.png&quot;}" data-trix-content-type="image" class="attachment attachment--preview"><a href="https://github.com/inotechno/silink/blob/Main/screenshot/pengaturan_aplikasi.png"><img src="https://github.com/inotechno/silink/raw/Main/screenshot/pengaturan_aplikasi.png"><figcaption class="attachment__caption"></figcaption></a></figure>8. Register Warga<figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:937,&quot;href&quot;:&quot;https://github.com/inotechno/silink/blob/Main/screenshot/register_warga.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/silink/raw/Main/screenshot/register_warga.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" class="attachment attachment--preview"><a href="https://github.com/inotechno/silink/blob/Main/screenshot/register_warga.png"><img src="https://github.com/inotechno/silink/raw/Main/screenshot/register_warga.png" width="1920" height="937"><figcaption class="attachment__caption"></figcaption></a></figure>9. Sumbangan Warga<figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:931,&quot;href&quot;:&quot;https://github.com/inotechno/silink/blob/Main/screenshot/sumbangan_warga.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/silink/raw/Main/screenshot/sumbangan_warga.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" class="attachment attachment--preview"><a href="https://github.com/inotechno/silink/blob/Main/screenshot/sumbangan_warga.png"><img src="https://github.com/inotechno/silink/raw/Main/screenshot/sumbangan_warga.png" width="1920" height="931"><figcaption class="attachment__caption"></figcaption></a></figure>10. Daftar Kegiatan dan Tambah Kegiatan<figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:937,&quot;href&quot;:&quot;https://github.com/inotechno/silink/blob/Main/screenshot/tambah_kegiatan.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/silink/raw/Main/screenshot/tambah_kegiatan.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" class="attachment attachment--preview"><a href="https://github.com/inotechno/silink/blob/Main/screenshot/tambah_kegiatan.png"><img src="https://github.com/inotechno/silink/raw/Main/screenshot/tambah_kegiatan.png" width="1920" height="937"><figcaption class="attachment__caption"></figcaption></a></figure>Instalasi</h3><ol><li>Clone repositori ini: git clone https://github.com/inotechno/silink.git</li><li>Impor struktur database dari silink.sql.</li><li>Konfigurasi file application/config/database.php untuk pengaturan koneksi database.</li></ol><p><br></p>	<p>SILINK merupakan aplikasi yang digunakan untuk mengelola Data di linkungan anda.</p>	projects/01JWTAKYWCYYVQ7TVXW3F53Y40.png	\N	https://github.com/inotechno/silink	["codeigniter 3","html","css","jquery","sistem informasi"]	2025-06-03 11:29:01	2025-06-04 14:28:03	projects/01JWTAKYWCYYVQ7TVXW3F53Y40.png	3
0197149c-63de-7382-bc30-5b2364865ff9	1	psikotesdaring	Psikotes Daring	<h3>🧠 <strong>Psikotes Daring</strong></h3><p><strong>Platform Psikotes Online: Tes Kepribadian, IQ, Minat &amp; Bakat</strong></p><p><strong>Deskripsi:</strong><br>Psikotes Daring adalah aplikasi berbasis web yang dirancang untuk menyelenggarakan tes psikologis secara online, mencakup tes kepribadian, IQ, serta minat dan bakat. Platform ini ditujukan untuk umum, perusahaan, sekolah, universitas, dan lembaga psikologi yang membutuhkan sistem ujian daring yang stabil, cepat, dan akurat.</p><p><strong>Teknologi yang Digunakan:</strong></p><ul><li><strong>Backend:</strong> CodeIgniter 3 (PHP)</li><li><strong>Database:</strong> MySQL</li><li><strong>Frontend:</strong> jQuery, AJAX</li><li><strong>Performance:</strong> Redis untuk caching dan session handling</li><li><strong>Deployment:</strong> Nginx, Linux Server (Debian/Ubuntu), Load Balancing untuk skala tinggi</li><li><strong>Keamanan &amp; Skalabilitas:</strong> Didesain dengan arsitektur scalable &amp; secure, mendukung banyak peserta ujian secara bersamaan</li></ul><p><strong>Fitur Unggulan:</strong></p><ul><li>Autentikasi pengguna &amp; role manajemen</li><li>Hasil &amp; laporan skor otomatis (grafik dan interpretasi)</li><li>Multi-session dan anti-cheating logic</li><li>Real-time analytics dan monitoring</li><li>Summary Report</li><li>Hidden Cam Record</li></ul><p><figure data-trix-attachment="{&quot;contentType&quot;:&quot;image/png&quot;,&quot;filename&quot;:&quot;image.png&quot;,&quot;filesize&quot;:252599,&quot;height&quot;:725,&quot;href&quot;:&quot;http://localhost:8000/storage/6vJ7vPh0EXYv1bNepnDja67z9GnSPeyNzizZyFOp.png&quot;,&quot;url&quot;:&quot;http://localhost:8000/storage/6vJ7vPh0EXYv1bNepnDja67z9GnSPeyNzizZyFOp.png&quot;,&quot;width&quot;:1413}" data-trix-content-type="image/png" data-trix-attributes="{&quot;presentation&quot;:&quot;gallery&quot;}" class="attachment attachment--preview attachment--png"><a href="http://localhost:8000/storage/6vJ7vPh0EXYv1bNepnDja67z9GnSPeyNzizZyFOp.png"><img src="http://localhost:8000/storage/6vJ7vPh0EXYv1bNepnDja67z9GnSPeyNzizZyFOp.png" width="1413" height="725"><figcaption class="attachment__caption"><span class="attachment__name">image.png</span> <span class="attachment__size">246.68 KB</span></figcaption></a></figure><strong>Kontribusi Saya:</strong><br>Saya mengembangkan seluruh sistem dari awal, mencakup desain database, arsitektur backend, frontend interaktif, hingga optimasi performa di level server. Sistem ini telah digunakan dalam berbagai simulasi ujian dan pelaksanaan tes oleh klien institusi pendidikan.</p><p><br><br></p><p><br></p>	<p>&nbsp;Psikotes Daring merupakan platform untuk tes kepribadian, IQ, Minat &amp; Bakat&nbsp;</p>	projects/01JWT8212W7KDG1CSQ1GQRATQP.png	https://psikotesdaring.com	https://github.com/rumahaplikasi/psikotesdaring	["codeigniter","html","css","bootstrap"]	2025-06-03 11:29:01	2025-06-03 11:29:01	projects/01JWT8212W7KDG1CSQ1GQRATQP.png	1
01973512-22fb-70f0-a9e8-eb35732d4231	1	e-budget	E-Budget	<h1>E-Budget App</h1><p>E-Budget App adalah aplikasi manajemen pengeluaran perusahaan yang memudahkan pengelolaan pengajuan advance dan expense. Aplikasi ini dirancang untuk mempermudah proses manajemen keuangan perusahaan dengan memberikan akses terpisah untuk tiga peran utama: Admin, Karyawan, dan Direktur.</p><h2>Fitur Utama</h2><ul><li><strong>Pengajuan Advance:</strong> Karyawan dapat mengajukan advance untuk keperluan tertentu.</li><li><strong>Pengajuan Expense:</strong> Karyawan dapat mengajukan pengeluaran dan melampirkan bukti-bukti yang diperlukan.</li><li><strong>Manajemen Approval:</strong> Admin dan Direktur memiliki hak untuk menyetujui atau menolak pengajuan.</li><li><strong>Histori Pengajuan:</strong> Riwayat lengkap pengajuan dan statusnya.</li><li><strong>Peran Berbeda:</strong> Admin, Karyawan, dan Direktur memiliki hak akses yang berbeda sesuai peran masing-masing.</li></ul><h2>Tautan Lampiran</h2><h2>Administrator<figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:935,&quot;href&quot;:&quot;https://github.com/inotechno/e-budget/blob/Main/screenshot/Administrator/Dashboard.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/e-budget/raw/Main/screenshot/Administrator/Dashboard.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" class="attachment attachment--preview"><a href="https://github.com/inotechno/e-budget/blob/Main/screenshot/Administrator/Dashboard.png"><img src="https://github.com/inotechno/e-budget/raw/Main/screenshot/Administrator/Dashboard.png" width="1920" height="935"><figcaption class="attachment__caption"></figcaption></a></figure><figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:933,&quot;href&quot;:&quot;https://github.com/inotechno/e-budget/blob/Main/screenshot/Administrator/PengajuanAdvance.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/e-budget/raw/Main/screenshot/Administrator/PengajuanAdvance.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" class="attachment attachment--preview"><a href="https://github.com/inotechno/e-budget/blob/Main/screenshot/Administrator/PengajuanAdvance.png"><img src="https://github.com/inotechno/e-budget/raw/Main/screenshot/Administrator/PengajuanAdvance.png" width="1920" height="933"><figcaption class="attachment__caption"></figcaption></a></figure> \\ <figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:933,&quot;href&quot;:&quot;https://github.com/inotechno/e-budget/blob/Main/screenshot/Administrator/DaftarKaryawan.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/e-budget/raw/Main/screenshot/Administrator/DaftarKaryawan.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" class="attachment attachment--preview"><a href="https://github.com/inotechno/e-budget/blob/Main/screenshot/Administrator/DaftarKaryawan.png"><img src="https://github.com/inotechno/e-budget/raw/Main/screenshot/Administrator/DaftarKaryawan.png" width="1920" height="933"><figcaption class="attachment__caption"></figcaption></a></figure> <figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:937,&quot;href&quot;:&quot;https://github.com/inotechno/e-budget/blob/Main/screenshot/Administrator/Setting.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/e-budget/raw/Main/screenshot/Administrator/Setting.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" class="attachment attachment--preview"><a href="https://github.com/inotechno/e-budget/blob/Main/screenshot/Administrator/Setting.png"><img src="https://github.com/inotechno/e-budget/raw/Main/screenshot/Administrator/Setting.png" width="1920" height="937"><figcaption class="attachment__caption"></figcaption></a></figure> <figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:931,&quot;href&quot;:&quot;https://github.com/inotechno/e-budget/blob/Main/screenshot/Direktur/BukuBesar.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/e-budget/raw/Main/screenshot/Direktur/BukuBesar.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" class="attachment attachment--preview"><a href="https://github.com/inotechno/e-budget/blob/Main/screenshot/Direktur/BukuBesar.png"><img src="https://github.com/inotechno/e-budget/raw/Main/screenshot/Direktur/BukuBesar.png" width="1920" height="931"><figcaption class="attachment__caption"></figcaption></a></figure>Direktur<figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:931,&quot;href&quot;:&quot;https://github.com/inotechno/e-budget/blob/Main/screenshot/Direktur/Dashboard.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/e-budget/raw/Main/screenshot/Direktur/Dashboard.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" class="attachment attachment--preview"><a href="https://github.com/inotechno/e-budget/blob/Main/screenshot/Direktur/Dashboard.png"><img src="https://github.com/inotechno/e-budget/raw/Main/screenshot/Direktur/Dashboard.png" width="1920" height="931"><figcaption class="attachment__caption"></figcaption></a></figure><figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:933,&quot;href&quot;:&quot;https://github.com/inotechno/e-budget/blob/Main/screenshot/Direktur/PengajuanAdvance.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/e-budget/raw/Main/screenshot/Direktur/PengajuanAdvance.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" class="attachment attachment--preview"><a href="https://github.com/inotechno/e-budget/blob/Main/screenshot/Direktur/PengajuanAdvance.png"><img src="https://github.com/inotechno/e-budget/raw/Main/screenshot/Direktur/PengajuanAdvance.png" width="1920" height="933"><figcaption class="attachment__caption"></figcaption></a></figure> <figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:932,&quot;href&quot;:&quot;https://github.com/inotechno/e-budget/blob/Main/screenshot/Direktur/PengajuanExpanse.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/e-budget/raw/Main/screenshot/Direktur/PengajuanExpanse.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" class="attachment attachment--preview"><a href="https://github.com/inotechno/e-budget/blob/Main/screenshot/Direktur/PengajuanExpanse.png"><img src="https://github.com/inotechno/e-budget/raw/Main/screenshot/Direktur/PengajuanExpanse.png" width="1920" height="932"><figcaption class="attachment__caption"></figcaption></a></figure> <figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:936,&quot;href&quot;:&quot;https://github.com/inotechno/e-budget/blob/Main/screenshot/Direktur/DaftarKaryawan.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/e-budget/raw/Main/screenshot/Direktur/DaftarKaryawan.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" class="attachment attachment--preview"><a href="https://github.com/inotechno/e-budget/blob/Main/screenshot/Direktur/DaftarKaryawan.png"><img src="https://github.com/inotechno/e-budget/raw/Main/screenshot/Direktur/DaftarKaryawan.png" width="1920" height="936"><figcaption class="attachment__caption"></figcaption></a></figure> <figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:931,&quot;href&quot;:&quot;https://github.com/inotechno/e-budget/blob/Main/screenshot/Direktur/BukuBesar.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/e-budget/raw/Main/screenshot/Direktur/BukuBesar.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" class="attachment attachment--preview"><a href="https://github.com/inotechno/e-budget/blob/Main/screenshot/Direktur/BukuBesar.png"><img src="https://github.com/inotechno/e-budget/raw/Main/screenshot/Direktur/BukuBesar.png" width="1920" height="931"><figcaption class="attachment__caption"></figcaption></a></figure>Karyawan<figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:927,&quot;href&quot;:&quot;https://github.com/inotechno/e-budget/blob/Main/screenshot/Karyawan/Dashboard.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/e-budget/raw/Main/screenshot/Karyawan/Dashboard.png&quot;,&quot;width&quot;:1918}" data-trix-content-type="image" class="attachment attachment--preview"><a href="https://github.com/inotechno/e-budget/blob/Main/screenshot/Karyawan/Dashboard.png"><img src="https://github.com/inotechno/e-budget/raw/Main/screenshot/Karyawan/Dashboard.png" width="1918" height="927"><figcaption class="attachment__caption"></figcaption></a></figure> <figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:933,&quot;href&quot;:&quot;https://github.com/inotechno/e-budget/blob/Main/screenshot/Karyawan/PengajuanAdvance.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/e-budget/raw/Main/screenshot/Karyawan/PengajuanAdvance.png&quot;,&quot;width&quot;:1918}" data-trix-content-type="image" class="attachment attachment--preview"><a href="https://github.com/inotechno/e-budget/blob/Main/screenshot/Karyawan/PengajuanAdvance.png"><img src="https://github.com/inotechno/e-budget/raw/Main/screenshot/Karyawan/PengajuanAdvance.png" width="1918" height="933"><figcaption class="attachment__caption"></figcaption></a></figure> <figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:933,&quot;href&quot;:&quot;https://github.com/inotechno/e-budget/blob/Main/screenshot/Karyawan/PengajuanExpanse.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/e-budget/raw/Main/screenshot/Karyawan/PengajuanExpanse.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" class="attachment attachment--preview"><a href="https://github.com/inotechno/e-budget/blob/Main/screenshot/Karyawan/PengajuanExpanse.png"><img src="https://github.com/inotechno/e-budget/raw/Main/screenshot/Karyawan/PengajuanExpanse.png" width="1920" height="933"><figcaption class="attachment__caption"></figcaption></a></figure> <figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:932,&quot;href&quot;:&quot;https://github.com/inotechno/e-budget/blob/Main/screenshot/Karyawan/Profil.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/e-budget/raw/Main/screenshot/Karyawan/Profil.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" class="attachment attachment--preview"><a href="https://github.com/inotechno/e-budget/blob/Main/screenshot/Karyawan/Profil.png"><img src="https://github.com/inotechno/e-budget/raw/Main/screenshot/Karyawan/Profil.png" width="1920" height="932"><figcaption class="attachment__caption"></figcaption></a></figure>Panduan Penggunaan</h2><ol><li>Clone repositori ini: git clone https://github.com/inotechno/e-budget.git</li><li>Impor struktur database dari folder database.</li><li>Konfigurasi file application/config/database.php untuk peng</li></ol><p><br></p>	<p>E-Budget App adalah aplikasi manajemen pengeluaran perusahaan yang memudahkan pengelolaan pengajuan advance dan expense.</p>	projects/01JWTH48N5HMBB2PH20RJ997ZV.png	\N	https://github.com/inotechno/e-budget	["codeigniter 3","jquery"]	2025-06-03 11:29:01	2025-06-03 11:29:01	projects/01JWTH48N5HMBB2PH20RJ997ZV.png	4
01973518-07de-70d4-89da-4701bcce180f	1	spk-kontruksi	SPK Kontruksi	<h1>Aplikasi Sistem Pendukung Keputusan Konstruksi Jalan (SPK-Konstruksi-Jalan)</h1><p>Aplikasi ini bertujuan untuk mendukung pengambilan keputusan dalam menentukan konstruksi jalan mana yang akan diprioritaskan. Dengan menggunakan metode Sistem Pendukung Keputusan (SPK), aplikasi ini membantu menganalisis dan memberikan rekomendasi berdasarkan kriteria tertentu.</p><h2>Fitur</h2><ol><li><strong>Dashboard</strong>: Ringkasan visual dari statistik dan informasi penting.</li><li><strong>Master Data Jalan</strong>: Manajemen data mengenai jalan yang akan dibangun.</li><li><strong>Master Data Kriteria</strong>: Pengelolaan kriteria yang digunakan untuk evaluasi.</li><li><strong>Master Data User</strong>: Manajemen pengguna aplikasi.</li><li><strong>Table LHR</strong>: Tabel hasil penilaian kriteria.</li><li><strong>Normalisasi</strong>: Proses normalisasi nilai kriteria.</li><li><strong>Nilai Alternatif</strong>: Penilaian alternatif berdasarkan kriteria.</li><li><strong>Nilai Preferensi</strong>: Penentuan nilai preferensi untuk setiap alternatif.</li></ol><h2>Screenshot</h2><h3>1. Dashboard<figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:933,&quot;href&quot;:&quot;https://github.com/inotechno/spk-kontruksi/blob/main/screenshots/dashboard.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/spk-kontruksi/raw/main/screenshots/dashboard.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" class="attachment attachment--preview"><a href="https://github.com/inotechno/spk-kontruksi/blob/main/screenshots/dashboard.png"><img src="https://github.com/inotechno/spk-kontruksi/raw/main/screenshots/dashboard.png" width="1920" height="933"><figcaption class="attachment__caption"></figcaption></a></figure></h3><h3>2. Master Data Jalan<figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:936,&quot;href&quot;:&quot;https://github.com/inotechno/spk-kontruksi/blob/main/screenshots/master_data_jalan.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/spk-kontruksi/raw/main/screenshots/master_data_jalan.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" class="attachment attachment--preview"><a href="https://github.com/inotechno/spk-kontruksi/blob/main/screenshots/master_data_jalan.png"><img src="https://github.com/inotechno/spk-kontruksi/raw/main/screenshots/master_data_jalan.png" width="1920" height="936"><figcaption class="attachment__caption"></figcaption></a></figure>3. Master Data Kriteria<figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:932,&quot;href&quot;:&quot;https://github.com/inotechno/spk-kontruksi/blob/main/screenshots/master_data_kriteria.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/spk-kontruksi/raw/main/screenshots/master_data_kriteria.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" class="attachment attachment--preview"><a href="https://github.com/inotechno/spk-kontruksi/blob/main/screenshots/master_data_kriteria.png"><img src="https://github.com/inotechno/spk-kontruksi/raw/main/screenshots/master_data_kriteria.png" width="1920" height="932"><figcaption class="attachment__caption"></figcaption></a></figure></h3><h3>4. Master Data User<figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:932,&quot;href&quot;:&quot;https://github.com/inotechno/spk-kontruksi/blob/main/screenshots/master_data_users.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/spk-kontruksi/raw/main/screenshots/master_data_users.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" class="attachment attachment--preview"><a href="https://github.com/inotechno/spk-kontruksi/blob/main/screenshots/master_data_users.png"><img src="https://github.com/inotechno/spk-kontruksi/raw/main/screenshots/master_data_users.png" width="1920" height="932"><figcaption class="attachment__caption"></figcaption></a></figure>5. Table LHR<figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:937,&quot;href&quot;:&quot;https://github.com/inotechno/spk-kontruksi/blob/main/screenshots/table_lhr.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/spk-kontruksi/raw/main/screenshots/table_lhr.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" class="attachment attachment--preview"><a href="https://github.com/inotechno/spk-kontruksi/blob/main/screenshots/table_lhr.png"><img src="https://github.com/inotechno/spk-kontruksi/raw/main/screenshots/table_lhr.png" width="1920" height="937"><figcaption class="attachment__caption"></figcaption></a></figure>6. Normalisasi<figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:936,&quot;href&quot;:&quot;https://github.com/inotechno/spk-kontruksi/blob/main/screenshots/normalisasi.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/spk-kontruksi/raw/main/screenshots/normalisasi.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" class="attachment attachment--preview"><a href="https://github.com/inotechno/spk-kontruksi/blob/main/screenshots/normalisasi.png"><img src="https://github.com/inotechno/spk-kontruksi/raw/main/screenshots/normalisasi.png" width="1920" height="936"><figcaption class="attachment__caption"></figcaption></a></figure>7. Nilai Alternatif<figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:933,&quot;href&quot;:&quot;https://github.com/inotechno/spk-kontruksi/blob/main/screenshots/nilai_alternatif.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/spk-kontruksi/raw/main/screenshots/nilai_alternatif.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" class="attachment attachment--preview"><a href="https://github.com/inotechno/spk-kontruksi/blob/main/screenshots/nilai_alternatif.png"><img src="https://github.com/inotechno/spk-kontruksi/raw/main/screenshots/nilai_alternatif.png" width="1920" height="933"><figcaption class="attachment__caption"></figcaption></a></figure>8. Nilai Preferensi<figure data-trix-attachment="{&quot;contentType&quot;:&quot;image&quot;,&quot;height&quot;:932,&quot;href&quot;:&quot;https://github.com/inotechno/spk-kontruksi/blob/main/screenshots/nilai_preferensi.png&quot;,&quot;url&quot;:&quot;https://github.com/inotechno/spk-kontruksi/raw/main/screenshots/nilai_preferensi.png&quot;,&quot;width&quot;:1920}" data-trix-content-type="image" class="attachment attachment--preview"><a href="https://github.com/inotechno/spk-kontruksi/blob/main/screenshots/nilai_preferensi.png"><img src="https://github.com/inotechno/spk-kontruksi/raw/main/screenshots/nilai_preferensi.png" width="1920" height="932"><figcaption class="attachment__caption"></figcaption></a></figure>Instalasi</h3><ol><li>Clone repositori ini: git clone https://github.com/inotechno/spk-konstruksi-jalan.git</li><li>Impor struktur database dari puprtesis.sql.</li><li>Konfigurasi file application/config/database.php untuk pengaturan koneksi database.</li></ol>	<p>Aplikasi ini bertujuan untuk mendukung pengambilan keputusan dalam menentukan konstruksi jalan mana yang akan diprioritaskan.</p>	projects/01JWTHG1YDNZTFQ8BSCRRED2NP.png	\N	https://github.com/inotechno/spk-kontruksi	["codeigniter 3","spk","jquery","admin-lte"]	2025-06-03 11:29:01	2025-06-03 11:29:01	projects/01JWTHG1YDNZTFQ8BSCRRED2NP.png	5
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (id, slug, name, description, description_excerpt, image_url, icon_url, created_at, updated_at) FROM stdin;
1	web-development	Web Development	As a Web Developer, I have experience building responsive and efficient websites and web applications. Using technologies such as HTML, CSS, JavaScript, and frameworks like Codeigniter, Next JS and Laravel, I help create digital solutions that meet business needs.	Building responsive and efficient websites using modern technologies like Codeigniter and Laravel.	services/01JWVC2Y20R9TPC64VZ5PDKJ6X.svg	services/01JWVC2Y2QWX3T7VRX3QCG2HHD.svg	2025-05-28 01:29:11	2025-06-03 17:05:38
2	graphic-designer	Graphic Designer	As a Graphic Designer, I am experienced in using Corel Draw and Photoshop to create visually appealing and effective designs. My expertise includes creating logos, brochures, posters, and other promotional materials that align with the client\\'s identity and needs.	Creating compelling visual designs using Corel Draw and Photoshop for branding and promotional needs.	services/01JWVC3PAD4QVE4DJE38Q3BP7D.svg	services/01JWVC3PAZZ0B46V18341TTSNC.svg	2025-05-28 09:15:36	2025-06-03 17:06:03
3	network-technician	Network Technician	As a Network Technician, I specialize in setting up and maintaining LAN networks, router configuration, cable crimping, and computer installation. I focus on ensuring that the network runs smoothly, securely, and reliably, as well as performing troubleshooting and hardware maintenance.	Handling LAN setup, router configuration, and maintaining stable network connectivity.	services/01JWVC4BT0XDPPC7FKAMQEG8DY.svg	services/01JWVC4BT4FVJN93JGB8NVCPDA.svg	2025-05-28 09:23:08	2025-06-03 17:06:25
4	system-analyst	System Analyst	As a System Analyst, I am skilled in analyzing and designing efficient information systems to meet business needs. I work with technical teams to identify user requirements and design appropriate technology solutions, as well as testing and implementing systems that align with the company’s objectives.	Analyzing business needs and designing efficient and purpose-driven information systems.	services/01JWVC53A0G50C68EWC7WS61Z7.svg	services/01JWVC53AE50GA6SJPH3GSYEFG.svg	2025-05-28 09:23:53	2025-06-03 17:06:49
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
L6DfxAPYmpyVluU4oeH1d9NF4BpTEirdD9GPZrFK	1	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	YTo3OntzOjY6Il90b2tlbiI7czo0MDoielFkeWdBOElvOExFdm1adVlDRXVld3ZwMHl5Mk9JckpGYjQyTldkRCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQ0OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYWRtaW5pc3RyYXRvci9wcm9qZWN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMiRTVUFpQW9YdXV2WkxiVHFrek1NWm8ueXFMZnprMmplZ0lPMUd5VUFEeEt0cFgzYy5JTDhkTyI7czo4OiJmaWxhbWVudCI7YTowOnt9fQ==	1750314613
WFYjgs1JrWQtHzehyBq77sBtLH7jT7jfnssqy4gs	1	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	YTo2OntzOjY6Il90b2tlbiI7czo0MDoiQmpmWXRkbHJqQzQ2MnlkVFJaalFJa2t4SnNwOTdKNTVtU3FPOWhWUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbmlzdHJhdG9yL3Byb2plY3RzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEyJFNVQWlBb1h1dXZaTGJUcWt6TU1aby55cUxmemsyamVnSU8xR3lVQUR4S3RwWDNjLklMOGRPIjtzOjg6ImZpbGFtZW50IjthOjA6e319	1750309890
fWCWHO1Bp7L3KHE2u36uljQn4IRTEZ6Uk5lhiaOI	1	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	YTo1OntzOjY6Il90b2tlbiI7czo0MDoibnBWZm1ZUmxvbEN4RTZyZU52anNEZk5NdnRMZjB3cVExOGpGOTMwbyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEyJFNVQWlBb1h1dXZaTGJUcWt6TU1aby55cUxmemsyamVnSU8xR3lVQUR4S3RwWDNjLklMOGRPIjtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozNToiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2FkbWluaXN0cmF0b3IiO319	1751291942
\.


--
-- Data for Name: skills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skills (id, slug, name, description, image_url, icon_url, percentage, color, type, created_at, updated_at) FROM stdin;
1	laravel	Laravel		https://i.ibb.co/1T11111/rahmat.jpg	skills/01JWR7HBXBBX8MF9XSJ5JT4AR3.png	90	#0501d1	coding	2025-05-28 01:29:11	2025-06-02 15:02:01
2	codeigniter	Codeigniter		https://i.ibb.co/1T11111/rahmat.jpg	skills/01JWR7JC20N3X01DYVGBXP5YZK.png	95	#fca61f	coding	2025-05-28 01:29:11	2025-06-02 11:48:58
3	livewire	Livewire		https://i.ibb.co/1T11111/rahmat.jpg	skills/01JWR7KAV8306A8AKEND1QWMX6.svg	85	#1ecefc	coding	2025-05-28 01:29:11	2025-06-02 11:49:29
4	jquery	jQuery			skills/01JWR7M9PGXAJWDR75HC7DDX1Q.png	95	#f2ff00	coding	2025-05-28 07:47:13	2025-06-02 15:02:27
5	next-js	Next JS			skills/01JWR7NC1DFNR25K03VV4J5PBB.png	50	#3a9686	coding	2025-06-02 11:50:36	2025-06-02 11:50:36
6	bootstrap	Bootstrap			skills/01JWR7PE5HJ0PRY831ZAGM83ZY.png	95	#2231b8	coding	2025-06-02 11:51:11	2025-06-02 11:51:11
7	nginx	Nginx			skills/01JWR7QAK9FSP42MS9PJYFNG2H.png	80	#701e1e	tool	2025-06-02 11:51:40	2025-06-02 11:51:40
8	linux	Linux			skills/01JWR7RPXBZ76JXKGWKY3400MW.png	85	#226921	tool	2025-06-02 11:52:25	2025-06-02 11:52:25
10	mysql	MySQL			skills/01JWRHWFDXM82ANHJD27H9J2RQ.png	80	#ffffff	tool	2025-06-02 14:49:14	2025-06-02 15:03:11
11	google-cloud	Google Cloud			skills/01JWRHY7ZQPVYGB304EYEK48BV.png	75	#f5f18e	tool	2025-06-02 14:50:12	2025-06-02 14:50:12
12	aws-ec2	AWS EC2			skills/01JWRHZHV05W8PKHAE6PDYGMMV.svg	65	#8687db	tool	2025-06-02 14:50:55	2025-06-02 14:50:55
13	postgresql	PostgreSQL			skills/01JWRJ1FKFA64BHNFYMMGM6GMA.png	75	#edeb00	tool	2025-06-02 14:51:58	2025-06-02 14:51:58
14	wordpress	Wordpress			skills/01JWRJEZ3NTQY35CCVF1VR4WK1.png	80	#84d482	coding	2025-06-02 14:55:02	2025-06-02 15:03:25
15	redis	Redis			skills/01JWRJYQ985NYQWPWJXTYB3HJG.webp	70	#f0f0f0	tool	2025-06-02 15:07:57	2025-06-02 15:07:57
16	corel-draw	Corel Draw			skills/01JWRK28XX8ASE7HG16DAN32KE.png	85	#53b6bd	tool	2025-06-02 15:09:53	2025-06-02 15:09:53
17	photoshop	Photoshop			skills/01JWRK37BENF49V6GWZ4DZFWCN.png	75	#ff0000	tool	2025-06-02 15:10:24	2025-06-02 15:10:24
18	filament	Filament			skills/01JWRKCESVGTQ46ZFJCYVN1P3X.avif	75	#faff00	coding	2025-06-02 15:15:27	2025-06-02 15:15:27
19	docker	Docker			skills/01JWRKGPY10D901X21CY4F0YP6.webp	65	#b50505	tool	2025-06-02 15:17:15	2025-06-02 15:17:55
20	github	Github			skills/01JWRKVPAAN9C8Q40KE1SC95SJ.png	85	#d1d1d1	tool	2025-06-02 15:23:46	2025-06-02 15:23:46
21	gitlab	Gitlab			skills/01JWRKWK0BETRXYGSJYJZSXRXB.webp	70	#000000	tool	2025-06-02 15:24:15	2025-06-02 15:24:15
22	networking	Networking	\N	\N	\N	80	#258d9c	knowledge	2025-06-04 13:36:15	2025-06-04 13:36:15
23	website-hosting	Website Hosting	\N	\N	\N	90	\N	knowledge	2025-06-04 13:52:12	2025-06-04 13:52:12
24	create-logo-design	Create Logo Design	\N	\N	\N	80	\N	knowledge	2025-06-04 13:52:12	2025-06-04 13:52:12
25	seo-website	SEO Website	\N	\N	\N	75	\N	knowledge	2025-06-04 13:52:12	2025-06-04 13:52:12
26	load-balancing	Load Balancing App	\N	\N	\N	75	\N	knowledge	2025-06-04 13:52:12	2025-06-04 13:52:12
27	deploy-app-to-vps	Deploy App to VPS	\N	\N	\N	85	\N	knowledge	2025-06-04 13:52:12	2025-06-04 13:52:12
28	email-hosting	Email Hosting	\N	\N	\N	85	\N	knowledge	2025-06-04 13:52:12	2025-06-04 13:52:12
29	payment-gateway-integration	Payment Gateway Integration	\N	\N	\N	85	\N	knowledge	2025-06-04 13:52:12	2025-06-04 13:52:12
30	uml-diagram	UML Diagram	\N	\N	\N	80	\N	knowledge	2025-06-04 13:52:12	2025-06-04 13:52:12
31	computer-installation	Computer Installation	\N	\N	\N	95	\N	knowledge	2025-06-04 13:52:12	2025-06-04 13:52:12
32	router-configuration	Router Configuration	\N	\N	\N	85	\N	knowledge	2025-06-04 13:52:12	2025-06-04 13:52:12
\.


--
-- Data for Name: tertimonials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tertimonials (id, name, "position", company, content, rating, image_url, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
1	Achmad Fatoni	2ahmadfatoni0@gmail.com	2025-06-03 11:29:00	$2y$12$SUAiAoXuuvZLbTqkzMMZo.yqLfzk2jegIO1GyUADxKtpX3c.IL8dO	rc6dyT11oUo2EDJj8APgmUcwRH6l47SA4M8bDY2CgsRjv2ZuwxuUBTGivRS5	2025-06-03 11:29:00	2025-06-03 11:29:00
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 3, true);


--
-- Name: education_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.education_id_seq', 3, true);


--
-- Name: experiences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.experiences_id_seq', 9, true);


--
-- Name: exports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exports_id_seq', 1, false);


--
-- Name: failed_import_rows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_import_rows_id_seq', 33, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: imports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.imports_id_seq', 18, true);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 313, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.messages_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 20, true);


--
-- Name: personal_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_infos_id_seq', 3, true);


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.services_id_seq', 1, false);


--
-- Name: skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skills_id_seq', 32, true);


--
-- Name: tertimonials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tertimonials_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: articles articles_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_slug_unique UNIQUE (slug);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: categories categories_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_slug_unique UNIQUE (slug);


--
-- Name: education education_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.education
    ADD CONSTRAINT education_pkey PRIMARY KEY (id);


--
-- Name: experiences experiences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiences
    ADD CONSTRAINT experiences_pkey PRIMARY KEY (id);


--
-- Name: exports exports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exports
    ADD CONSTRAINT exports_pkey PRIMARY KEY (id);


--
-- Name: failed_import_rows failed_import_rows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_import_rows
    ADD CONSTRAINT failed_import_rows_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: imports imports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imports
    ADD CONSTRAINT imports_pkey PRIMARY KEY (id);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: personal_infos personal_infos_key_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_infos
    ADD CONSTRAINT personal_infos_key_unique UNIQUE (key);


--
-- Name: personal_infos personal_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_infos
    ADD CONSTRAINT personal_infos_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: projects projects_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_slug_unique UNIQUE (slug);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: services services_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_slug_unique UNIQUE (slug);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: skills skills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skills
    ADD CONSTRAINT skills_pkey PRIMARY KEY (id);


--
-- Name: skills skills_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skills
    ADD CONSTRAINT skills_slug_unique UNIQUE (slug);


--
-- Name: tertimonials tertimonials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tertimonials
    ADD CONSTRAINT tertimonials_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: notifications_notifiable_type_notifiable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_notifiable_type_notifiable_id_index ON public.notifications USING btree (notifiable_type, notifiable_id);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: exports exports_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exports
    ADD CONSTRAINT exports_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: failed_import_rows failed_import_rows_import_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_import_rows
    ADD CONSTRAINT failed_import_rows_import_id_foreign FOREIGN KEY (import_id) REFERENCES public.imports(id) ON DELETE CASCADE;


--
-- Name: imports imports_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imports
    ADD CONSTRAINT imports_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: projects projects_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

