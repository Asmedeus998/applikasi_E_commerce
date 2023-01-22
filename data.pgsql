--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

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
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: skripsi
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO skripsi;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: skripsi
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO skripsi;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skripsi
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: skripsi
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO skripsi;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: skripsi
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO skripsi;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skripsi
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: skripsi
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO skripsi;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: skripsi
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO skripsi;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skripsi
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: skripsi
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO skripsi;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: skripsi
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO skripsi;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skripsi
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: skripsi
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO skripsi;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: skripsi
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO skripsi;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skripsi
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: skripsi
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO skripsi;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: skripsi
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO skripsi;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: skripsi
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO skripsi;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skripsi
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: skripsi
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO skripsi;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skripsi
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: skripsi
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO skripsi;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: skripsi
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO skripsi;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skripsi
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: skripsi
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO skripsi;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: skripsi
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO skripsi;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skripsi
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: skripsi
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO skripsi;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: skripsi
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO skripsi;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skripsi
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: skripsi
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO skripsi;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: skripsi
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO skripsi;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skripsi
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: skripsi
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO skripsi;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: skripsi
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO skripsi;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: skripsi
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO skripsi;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skripsi
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: skripsi
--

CREATE TABLE public.socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO skripsi;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: skripsi
--

CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO skripsi;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skripsi
--

ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: skripsi
--

CREATE TABLE public.socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO skripsi;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: skripsi
--

CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO skripsi;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skripsi
--

ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: skripsi
--

CREATE TABLE public.socialaccount_socialapp_sites (
    id integer NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO skripsi;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: skripsi
--

CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_sites_id_seq OWNER TO skripsi;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skripsi
--

ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: skripsi
--

CREATE TABLE public.socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO skripsi;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: skripsi
--

CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO skripsi;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skripsi
--

ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;


--
-- Name: store_category; Type: TABLE; Schema: public; Owner: skripsi
--

CREATE TABLE public.store_category (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE public.store_category OWNER TO skripsi;

--
-- Name: store_category_id_seq; Type: SEQUENCE; Schema: public; Owner: skripsi
--

CREATE SEQUENCE public.store_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_category_id_seq OWNER TO skripsi;

--
-- Name: store_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skripsi
--

ALTER SEQUENCE public.store_category_id_seq OWNED BY public.store_category.id;


--
-- Name: store_customer; Type: TABLE; Schema: public; Owner: skripsi
--

CREATE TABLE public.store_customer (
    id integer NOT NULL,
    name character varying(200),
    email character varying(200) NOT NULL,
    address character varying(100),
    foto character varying(100),
    role character varying(20),
    user_id integer
);


ALTER TABLE public.store_customer OWNER TO skripsi;

--
-- Name: store_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: skripsi
--

CREATE SEQUENCE public.store_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_customer_id_seq OWNER TO skripsi;

--
-- Name: store_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skripsi
--

ALTER SEQUENCE public.store_customer_id_seq OWNED BY public.store_customer.id;


--
-- Name: store_order; Type: TABLE; Schema: public; Owner: skripsi
--

CREATE TABLE public.store_order (
    id integer NOT NULL,
    transaction_id character varying(100),
    date_ordered timestamp with time zone NOT NULL,
    complete boolean NOT NULL,
    customer_id integer
);


ALTER TABLE public.store_order OWNER TO skripsi;

--
-- Name: store_order_id_seq; Type: SEQUENCE; Schema: public; Owner: skripsi
--

CREATE SEQUENCE public.store_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_order_id_seq OWNER TO skripsi;

--
-- Name: store_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skripsi
--

ALTER SEQUENCE public.store_order_id_seq OWNED BY public.store_order.id;


--
-- Name: store_orderitem; Type: TABLE; Schema: public; Owner: skripsi
--

CREATE TABLE public.store_orderitem (
    id integer NOT NULL,
    quantity integer,
    date_added timestamp with time zone NOT NULL,
    order_id integer,
    product_id integer
);


ALTER TABLE public.store_orderitem OWNER TO skripsi;

--
-- Name: store_orderitem_id_seq; Type: SEQUENCE; Schema: public; Owner: skripsi
--

CREATE SEQUENCE public.store_orderitem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_orderitem_id_seq OWNER TO skripsi;

--
-- Name: store_orderitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skripsi
--

ALTER SEQUENCE public.store_orderitem_id_seq OWNED BY public.store_orderitem.id;


--
-- Name: store_product; Type: TABLE; Schema: public; Owner: skripsi
--

CREATE TABLE public.store_product (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    price double precision NOT NULL,
    digital boolean,
    image character varying(100),
    category_id integer
);


ALTER TABLE public.store_product OWNER TO skripsi;

--
-- Name: store_product_id_seq; Type: SEQUENCE; Schema: public; Owner: skripsi
--

CREATE SEQUENCE public.store_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_product_id_seq OWNER TO skripsi;

--
-- Name: store_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skripsi
--

ALTER SEQUENCE public.store_product_id_seq OWNED BY public.store_product.id;


--
-- Name: store_shippingaddress; Type: TABLE; Schema: public; Owner: skripsi
--

CREATE TABLE public.store_shippingaddress (
    id integer NOT NULL,
    address character varying(200) NOT NULL,
    city character varying(200) NOT NULL,
    state character varying(200) NOT NULL,
    zipcode character varying(200) NOT NULL,
    date_added timestamp with time zone NOT NULL,
    customer_id integer,
    order_id integer
);


ALTER TABLE public.store_shippingaddress OWNER TO skripsi;

--
-- Name: store_shippingaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: skripsi
--

CREATE SEQUENCE public.store_shippingaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_shippingaddress_id_seq OWNER TO skripsi;

--
-- Name: store_shippingaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: skripsi
--

ALTER SEQUENCE public.store_shippingaddress_id_seq OWNED BY public.store_shippingaddress.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: socialaccount_socialaccount id; Type: DEFAULT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: socialaccount_socialapp id; Type: DEFAULT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);


--
-- Name: socialaccount_socialapp_sites id; Type: DEFAULT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: socialaccount_socialtoken id; Type: DEFAULT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);


--
-- Name: store_category id; Type: DEFAULT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.store_category ALTER COLUMN id SET DEFAULT nextval('public.store_category_id_seq'::regclass);


--
-- Name: store_customer id; Type: DEFAULT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.store_customer ALTER COLUMN id SET DEFAULT nextval('public.store_customer_id_seq'::regclass);


--
-- Name: store_order id; Type: DEFAULT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.store_order ALTER COLUMN id SET DEFAULT nextval('public.store_order_id_seq'::regclass);


--
-- Name: store_orderitem id; Type: DEFAULT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.store_orderitem ALTER COLUMN id SET DEFAULT nextval('public.store_orderitem_id_seq'::regclass);


--
-- Name: store_product id; Type: DEFAULT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.store_product ALTER COLUMN id SET DEFAULT nextval('public.store_product_id_seq'::regclass);


--
-- Name: store_shippingaddress id; Type: DEFAULT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.store_shippingaddress ALTER COLUMN id SET DEFAULT nextval('public.store_shippingaddress_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: skripsi
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
1	buyer@buyer.com	t	t	1
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: skripsi
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: skripsi
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: skripsi
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: skripsi
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add category	7	add_category
26	Can change category	7	change_category
27	Can delete category	7	delete_category
28	Can view category	7	view_category
29	Can add Customer	8	add_customer
30	Can change Customer	8	change_customer
31	Can delete Customer	8	delete_customer
32	Can view Customer	8	view_customer
33	Can add order	9	add_order
34	Can change order	9	change_order
35	Can delete order	9	delete_order
36	Can view order	9	view_order
37	Can add shipping address	10	add_shippingaddress
38	Can change shipping address	10	change_shippingaddress
39	Can delete shipping address	10	delete_shippingaddress
40	Can view shipping address	10	view_shippingaddress
41	Can add product	11	add_product
42	Can change product	11	change_product
43	Can delete product	11	delete_product
44	Can view product	11	view_product
45	Can add order item	12	add_orderitem
46	Can change order item	12	change_orderitem
47	Can delete order item	12	delete_orderitem
48	Can view order item	12	view_orderitem
49	Can add site	13	add_site
50	Can change site	13	change_site
51	Can delete site	13	delete_site
52	Can view site	13	view_site
53	Can add email address	14	add_emailaddress
54	Can change email address	14	change_emailaddress
55	Can delete email address	14	delete_emailaddress
56	Can view email address	14	view_emailaddress
57	Can add email confirmation	15	add_emailconfirmation
58	Can change email confirmation	15	change_emailconfirmation
59	Can delete email confirmation	15	delete_emailconfirmation
60	Can view email confirmation	15	view_emailconfirmation
61	Can add social account	16	add_socialaccount
62	Can change social account	16	change_socialaccount
63	Can delete social account	16	delete_socialaccount
64	Can view social account	16	view_socialaccount
65	Can add social application	17	add_socialapp
66	Can change social application	17	change_socialapp
67	Can delete social application	17	delete_socialapp
68	Can view social application	17	view_socialapp
69	Can add social application token	18	add_socialtoken
70	Can change social application token	18	change_socialtoken
71	Can delete social application token	18	delete_socialtoken
72	Can view social application token	18	view_socialtoken
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: skripsi
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
3	pbkdf2_sha256$150000$8UVXJCKFWCIr$on6rsvO40Wkte8qPa8Wk2E9GZH1DhxGnVZVtiwCG5jQ=	\N	f	buyer2				f	t	2023-01-14 23:44:22.181167+08
1	pbkdf2_sha256$150000$kStcrVNdtdIT$5cHOZnVBGhgXzsmk5iA4UaK7l+QNC+FYUD7H8R46/8I=	2023-01-18 22:07:19.116787+08	f	buyer			buyer@buyer.com	f	t	2023-01-11 16:18:37.82932+08
2	pbkdf2_sha256$150000$hJ6qcdtq2FmA$xPyuxknvpX5VNPrTIcesRQFjl1tMMBTDlG4ta1vMURo=	2023-01-18 23:36:58.123664+08	t	admin				t	t	2023-01-11 16:28:50.071334+08
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: skripsi
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: skripsi
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: skripsi
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2023-01-11 16:29:15.071489+08	1	buyer name	3		8	2
2	2023-01-11 16:45:16.976581+08	2	admin	1	[{"added": {}}]	8	2
3	2023-01-11 17:20:13.833501+08	3	temp buyer	1	[{"added": {}}]	8	2
4	2023-01-11 17:26:11.608325+08	1	Laptop	1	[{"added": {}}]	11	2
5	2023-01-11 17:43:24.843236+08	2	test	1	[{"added": {}}]	11	2
6	2023-01-11 17:43:41.204478+08	3	lol	1	[{"added": {}}]	11	2
7	2023-01-11 19:03:51.157695+08	2	2	3		9	2
8	2023-01-11 19:04:16.493926+08	1	OrderItem object (1)	1	[{"added": {}}]	12	2
9	2023-01-14 23:22:18.9273+08	1	OrderItem object (1)	2	[{"changed": {"fields": ["quantity"]}}]	12	2
10	2023-01-14 23:40:54.576204+08	4	4	1	[{"added": {}}]	9	2
11	2023-01-14 23:41:18.361446+08	2	OrderItem object (2)	1	[{"added": {}}]	12	2
12	2023-01-14 23:41:49.9583+08	2	OrderItem object (2)	2	[{"changed": {"fields": ["order"]}}]	12	2
13	2023-01-14 23:42:32.210556+08	4	4	3		9	2
14	2023-01-14 23:42:32.215544+08	3	3	3		9	2
15	2023-01-14 23:42:54.889503+08	2	OrderItem object (2)	3		12	2
16	2023-01-14 23:42:54.896483+08	1	OrderItem object (1)	3		12	2
17	2023-01-14 23:43:17.873942+08	3	OrderItem object (3)	1	[{"added": {}}]	12	2
18	2023-01-14 23:43:33.434906+08	4	OrderItem object (4)	1	[{"added": {}}]	12	2
19	2023-01-14 23:44:22.294934+08	3	buyer2	1	[{"added": {}}]	4	2
20	2023-01-14 23:44:40.407667+08	4	buyer2	1	[{"added": {}}]	8	2
21	2023-01-14 23:46:04.086823+08	6	6	1	[{"added": {}}]	9	2
22	2023-01-14 23:46:28.493764+08	5	OrderItem object (5)	1	[{"added": {}}]	12	2
23	2023-01-15 00:46:32.703272+08	3	OrderItem object (3)	3		12	2
24	2023-01-17 02:06:15.903314+08	3	lol	2	[{"changed": {"fields": ["digital"]}}]	11	2
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: skripsi
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	store	category
8	store	customer
9	store	order
10	store	shippingaddress
11	store	product
12	store	orderitem
13	sites	site
14	account	emailaddress
15	account	emailconfirmation
16	socialaccount	socialaccount
17	socialaccount	socialapp
18	socialaccount	socialtoken
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: skripsi
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2023-01-11 16:18:08.558318+08
2	auth	0001_initial	2023-01-11 16:18:08.620153+08
3	account	0001_initial	2023-01-11 16:18:08.702932+08
4	account	0002_email_max_length	2023-01-11 16:18:08.765766+08
5	admin	0001_initial	2023-01-11 16:18:08.803663+08
6	admin	0002_logentry_remove_auto_add	2023-01-11 16:18:08.840565+08
7	admin	0003_logentry_add_action_flag_choices	2023-01-11 16:18:08.865498+08
8	contenttypes	0002_remove_content_type_name	2023-01-11 16:18:08.920351+08
9	auth	0002_alter_permission_name_max_length	2023-01-11 16:18:08.934313+08
10	auth	0003_alter_user_email_max_length	2023-01-11 16:18:08.958248+08
11	auth	0004_alter_user_username_opts	2023-01-11 16:18:08.98817+08
12	auth	0005_alter_user_last_login_null	2023-01-11 16:18:09.0141+08
13	auth	0006_require_contenttypes_0002	2023-01-11 16:18:09.019086+08
14	auth	0007_alter_validators_add_error_messages	2023-01-11 16:18:09.04402+08
15	auth	0008_alter_user_username_max_length	2023-01-11 16:18:09.074937+08
16	auth	0009_alter_user_last_name_max_length	2023-01-11 16:18:09.102862+08
17	auth	0010_alter_group_name_max_length	2023-01-11 16:18:09.132782+08
18	auth	0011_update_proxy_permissions	2023-01-11 16:18:09.155722+08
19	sessions	0001_initial	2023-01-11 16:18:09.172677+08
20	sites	0001_initial	2023-01-11 16:18:09.191625+08
21	sites	0002_alter_domain_unique	2023-01-11 16:18:09.207584+08
22	socialaccount	0001_initial	2023-01-11 16:18:09.342221+08
23	socialaccount	0002_token_max_lengths	2023-01-11 16:18:09.394082+08
24	socialaccount	0003_extra_data_default_dict	2023-01-11 16:18:09.409044+08
25	store	0001_initial	2023-01-11 16:18:09.54069+08
26	store	0002_auto_20230111_1918	2023-01-11 19:20:32.302609+08
27	store	0003_auto_20230111_1928	2023-01-11 19:28:49.075525+08
28	store	0004_auto_20230117_0112	2023-01-17 01:12:25.167837+08
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: skripsi
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
6e8yq9r8yze5zwlyefjszmdbreb2mxia	MjMyNmEzNDYyNTBjZDkzMjhmZDk4NjU2YzJlNjEyNjQzYWUyM2NlODp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsImFjY291bnRfdXNlciI6IjEiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmI1NzI0ZDJjZjEzMGQ3ZjljMGI1M2FmZmJmOTk5NWY3MGRjZDhlYSIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2023-01-25 16:18:55.839987+08
11jr6emrfi5tuq51x7sib3hb0p4s6haw	NWI3MDgxMzg2MzZiN2M0YmM2MjdmM2Y2OGUwOTUzZTA0NjJkZjc3Njp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjN2Y5MjIwNGU3ZmY2MTQ3YjU3N2U0ZjBlOGViZTNhNGUwYmYwNGY2In0=	2023-01-25 16:28:52.492718+08
iafjxj4inc8nr9v5u8o6wxb9dmvfg3sh	MTY5ZjE5NDI3OTgyZGU2NzQwMGI5MWU2MDRiZmZkMjkyYzgxODM3NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYjU3MjRkMmNmMTMwZDdmOWMwYjUzYWZmYmY5OTk1ZjcwZGNkOGVhIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==	2023-01-25 17:24:33.851495+08
ex7zo6dh17lc96h1yrbm68x5tbtysib4	NWI3MDgxMzg2MzZiN2M0YmM2MjdmM2Y2OGUwOTUzZTA0NjJkZjc3Njp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjN2Y5MjIwNGU3ZmY2MTQ3YjU3N2U0ZjBlOGViZTNhNGUwYmYwNGY2In0=	2023-01-25 19:03:35.389552+08
bgtqdkc3qwdoo5j4wbjvumz2aho8r9qh	NWI3MDgxMzg2MzZiN2M0YmM2MjdmM2Y2OGUwOTUzZTA0NjJkZjc3Njp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjN2Y5MjIwNGU3ZmY2MTQ3YjU3N2U0ZjBlOGViZTNhNGUwYmYwNGY2In0=	2023-01-26 21:56:52.752689+08
suprjnlvzc25b7m8ebo3hokbp5ebi5i2	MTY5ZjE5NDI3OTgyZGU2NzQwMGI5MWU2MDRiZmZkMjkyYzgxODM3NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYjU3MjRkMmNmMTMwZDdmOWMwYjUzYWZmYmY5OTk1ZjcwZGNkOGVhIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==	2023-01-27 00:56:15.042225+08
sdp25xto0vscaua9b1427g9klg2wctpv	NWI3MDgxMzg2MzZiN2M0YmM2MjdmM2Y2OGUwOTUzZTA0NjJkZjc3Njp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjN2Y5MjIwNGU3ZmY2MTQ3YjU3N2U0ZjBlOGViZTNhNGUwYmYwNGY2In0=	2023-01-28 23:09:19.854159+08
5kfbyujbo9p8jmzuthrzrwbrv1jus7jo	MTY5ZjE5NDI3OTgyZGU2NzQwMGI5MWU2MDRiZmZkMjkyYzgxODM3NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYjU3MjRkMmNmMTMwZDdmOWMwYjUzYWZmYmY5OTk1ZjcwZGNkOGVhIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==	2023-01-31 00:33:17.979762+08
x7tybkanx0749xy6ts8ocw4pq9phd10g	MTY5ZjE5NDI3OTgyZGU2NzQwMGI5MWU2MDRiZmZkMjkyYzgxODM3NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYjU3MjRkMmNmMTMwZDdmOWMwYjUzYWZmYmY5OTk1ZjcwZGNkOGVhIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==	2023-02-01 01:46:36.837512+08
revlhkghna4fpbqwq3i54okpqzzafjjb	MTY5ZjE5NDI3OTgyZGU2NzQwMGI5MWU2MDRiZmZkMjkyYzgxODM3NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYjU3MjRkMmNmMTMwZDdmOWMwYjUzYWZmYmY5OTk1ZjcwZGNkOGVhIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==	2023-02-01 22:07:19.1549+08
xiklj77hd4vzt29m06xknuieoasg7jcj	NWI3MDgxMzg2MzZiN2M0YmM2MjdmM2Y2OGUwOTUzZTA0NjJkZjc3Njp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjN2Y5MjIwNGU3ZmY2MTQ3YjU3N2U0ZjBlOGViZTNhNGUwYmYwNGY2In0=	2023-02-01 23:36:58.128647+08
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: skripsi
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: skripsi
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: skripsi
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: skripsi
--

COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: skripsi
--

COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
\.


--
-- Data for Name: store_category; Type: TABLE DATA; Schema: public; Owner: skripsi
--

COPY public.store_category (id, name, slug) FROM stdin;
\.


--
-- Data for Name: store_customer; Type: TABLE DATA; Schema: public; Owner: skripsi
--

COPY public.store_customer (id, name, email, address, foto, role, user_id) FROM stdin;
2	admin	admin@admin.com	admin address		buyer	2
3	temp buyer	buyer@buyer.com	buyer address		buyer	1
4	buyer2	buyer@buyer.com	test		buyer	3
7	test	testing@email.com	\N		\N	\N
\.


--
-- Data for Name: store_order; Type: TABLE DATA; Schema: public; Owner: skripsi
--

COPY public.store_order (id, transaction_id, date_ordered, complete, customer_id) FROM stdin;
6	buyer2	2023-01-14 23:46:04.084831+08	f	4
5	1673802788.220335	2023-01-14 23:42:58.85981+08	t	3
7	1673803461.359169	2023-01-16 01:17:03.766058+08	t	3
8	1673804518.244768	2023-01-16 01:41:58.352479+08	t	7
9	1673883291.192689	2023-01-16 23:34:37.701863+08	t	3
10	1673886873.64182	2023-01-16 23:34:53.654583+08	t	3
11	1673886945.93648	2023-01-17 00:34:52.300869+08	t	3
12	1673888259.621088	2023-01-17 00:56:22.368128+08	t	3
13	1673888757.895294	2023-01-17 01:00:10.637544+08	t	3
14	1673888854.945332	2023-01-17 01:07:13.78254+08	t	3
15	1673890340.939052	2023-01-17 01:09:43.800018+08	t	3
16	1673890496.34368	2023-01-17 01:34:40.479034+08	t	3
17	1673892148.842382	2023-01-17 01:35:02.67394+08	t	3
18	1673892399.436841	2023-01-17 02:06:20.030697+08	t	3
19	1673893352.238598	2023-01-17 02:06:47.880254+08	t	3
20	1673893410.17702	2023-01-17 02:22:40.228407+08	t	3
21	\N	2023-01-17 02:23:36.673372+08	f	3
\.


--
-- Data for Name: store_orderitem; Type: TABLE DATA; Schema: public; Owner: skripsi
--

COPY public.store_orderitem (id, quantity, date_added, order_id, product_id) FROM stdin;
16	1	2023-01-17 00:56:30.220639+08	12	1
17	1	2023-01-17 00:56:39.389531+08	12	3
18	1	2023-01-17 01:05:18.881221+08	13	1
5	1	2023-01-14 23:46:28.492766+08	6	3
19	1	2023-01-17 01:07:16.38127+08	14	1
20	1	2023-01-17 01:32:05.665222+08	15	1
21	1	2023-01-17 01:34:42.66011+08	16	2
22	1	2023-01-17 02:02:13.248897+08	17	1
23	1	2023-01-17 02:06:25.80188+08	18	3
24	1	2023-01-17 02:14:18.787186+08	19	1
25	1	2023-01-17 02:22:17.229221+08	19	3
26	1	2023-01-17 02:23:18.070963+08	20	3
27	2	2023-01-17 02:25:34.535074+08	21	1
4	5	2023-01-14 23:43:33.433908+08	5	2
6	0	2023-01-15 00:08:16.46538+08	5	3
7	4	2023-01-15 00:46:45.832972+08	5	1
8	1	2023-01-16 01:23:30.788368+08	7	2
9	1	2023-01-16 01:23:32.748274+08	7	3
10	1	2023-01-16 01:41:58.355471+08	8	2
11	3	2023-01-16 01:41:58.359464+08	8	3
12	1	2023-01-16 23:34:40.812753+08	9	2
13	1	2023-01-16 23:34:43.061135+08	9	1
14	1	2023-01-17 00:33:22.935113+08	10	1
15	1	2023-01-17 00:33:25.348854+08	10	2
\.


--
-- Data for Name: store_product; Type: TABLE DATA; Schema: public; Owner: skripsi
--

COPY public.store_product (id, name, price, digital, image, category_id) FROM stdin;
1	Laptop	1500	f	Acer_predator_15_LNnArBl.jpg	\N
2	test	1000	f	Nvidia-RTX-2080-1372439263.jpg	\N
3	lol	3000	t	TSV_gaming_mouse.jpg	\N
\.


--
-- Data for Name: store_shippingaddress; Type: TABLE DATA; Schema: public; Owner: skripsi
--

COPY public.store_shippingaddress (id, address, city, state, zipcode, date_added, customer_id, order_id) FROM stdin;
1	sad	sad	sad	sad	2023-01-17 01:34:56.470316+08	3	16
2	willen	willen	willen	willen	2023-01-17 02:23:30.297003+08	3	20
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skripsi
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, true);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skripsi
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skripsi
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skripsi
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skripsi
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 72, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skripsi
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skripsi
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skripsi
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skripsi
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 24, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skripsi
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 18, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skripsi
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 28, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skripsi
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skripsi
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skripsi
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skripsi
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 1, false);


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skripsi
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 1, false);


--
-- Name: store_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skripsi
--

SELECT pg_catalog.setval('public.store_category_id_seq', 1, false);


--
-- Name: store_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skripsi
--

SELECT pg_catalog.setval('public.store_customer_id_seq', 7, true);


--
-- Name: store_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skripsi
--

SELECT pg_catalog.setval('public.store_order_id_seq', 21, true);


--
-- Name: store_orderitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skripsi
--

SELECT pg_catalog.setval('public.store_orderitem_id_seq', 27, true);


--
-- Name: store_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skripsi
--

SELECT pg_catalog.setval('public.store_product_id_seq', 3, true);


--
-- Name: store_shippingaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: skripsi
--

SELECT pg_catalog.setval('public.store_shippingaddress_id_seq', 2, true);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_provider_uid_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialapp socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: store_category store_category_pkey; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.store_category
    ADD CONSTRAINT store_category_pkey PRIMARY KEY (id);


--
-- Name: store_category store_category_slug_key; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.store_category
    ADD CONSTRAINT store_category_slug_key UNIQUE (slug);


--
-- Name: store_customer store_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.store_customer
    ADD CONSTRAINT store_customer_pkey PRIMARY KEY (id);


--
-- Name: store_customer store_customer_user_id_key; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.store_customer
    ADD CONSTRAINT store_customer_user_id_key UNIQUE (user_id);


--
-- Name: store_order store_order_pkey; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.store_order
    ADD CONSTRAINT store_order_pkey PRIMARY KEY (id);


--
-- Name: store_orderitem store_orderitem_pkey; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.store_orderitem
    ADD CONSTRAINT store_orderitem_pkey PRIMARY KEY (id);


--
-- Name: store_product store_product_pkey; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.store_product
    ADD CONSTRAINT store_product_pkey PRIMARY KEY (id);


--
-- Name: store_shippingaddress store_shippingaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.store_shippingaddress
    ADD CONSTRAINT store_shippingaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: skripsi
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: skripsi
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: skripsi
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: skripsi
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: skripsi
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: skripsi
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: skripsi
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: skripsi
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: skripsi
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: skripsi
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: skripsi
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: skripsi
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: skripsi
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: skripsi
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: skripsi
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: skripsi
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: skripsi
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: skripsi
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: socialaccount_socialaccount_user_id_8146e70c; Type: INDEX; Schema: public; Owner: skripsi
--

CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_site_id_2579dee5; Type: INDEX; Schema: public; Owner: skripsi
--

CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_97fb6e7d; Type: INDEX; Schema: public; Owner: skripsi
--

CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_account_id_951f210e; Type: INDEX; Schema: public; Owner: skripsi
--

CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_app_id_636a42d7; Type: INDEX; Schema: public; Owner: skripsi
--

CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);


--
-- Name: store_category_slug_2d349264_like; Type: INDEX; Schema: public; Owner: skripsi
--

CREATE INDEX store_category_slug_2d349264_like ON public.store_category USING btree (slug varchar_pattern_ops);


--
-- Name: store_order_customer_id_13d6d43e; Type: INDEX; Schema: public; Owner: skripsi
--

CREATE INDEX store_order_customer_id_13d6d43e ON public.store_order USING btree (customer_id);


--
-- Name: store_orderitem_order_id_acf8722d; Type: INDEX; Schema: public; Owner: skripsi
--

CREATE INDEX store_orderitem_order_id_acf8722d ON public.store_orderitem USING btree (order_id);


--
-- Name: store_orderitem_product_id_f2b098d4; Type: INDEX; Schema: public; Owner: skripsi
--

CREATE INDEX store_orderitem_product_id_f2b098d4 ON public.store_orderitem USING btree (product_id);


--
-- Name: store_product_category_id_574bae65; Type: INDEX; Schema: public; Owner: skripsi
--

CREATE INDEX store_product_category_id_574bae65 ON public.store_product USING btree (category_id);


--
-- Name: store_shippingaddress_customer_id_66e362a6; Type: INDEX; Schema: public; Owner: skripsi
--

CREATE INDEX store_shippingaddress_customer_id_66e362a6 ON public.store_shippingaddress USING btree (customer_id);


--
-- Name: store_shippingaddress_order_id_e6decfbb; Type: INDEX; Schema: public; Owner: skripsi
--

CREATE INDEX store_shippingaddress_order_id_e6decfbb ON public.store_shippingaddress USING btree (order_id);


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_account_id_951f210e_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_account_id_951f210e_fk_socialacc FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_app_id_636a42d7_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_app_id_636a42d7_fk_socialacc FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_site_id_2579dee5_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc FOREIGN KEY (socialapp_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_customer store_customer_user_id_04276401_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.store_customer
    ADD CONSTRAINT store_customer_user_id_04276401_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_order store_order_customer_id_13d6d43e_fk_store_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.store_order
    ADD CONSTRAINT store_order_customer_id_13d6d43e_fk_store_customer_id FOREIGN KEY (customer_id) REFERENCES public.store_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_orderitem store_orderitem_order_id_acf8722d_fk_store_order_id; Type: FK CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.store_orderitem
    ADD CONSTRAINT store_orderitem_order_id_acf8722d_fk_store_order_id FOREIGN KEY (order_id) REFERENCES public.store_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_orderitem store_orderitem_product_id_f2b098d4_fk_store_product_id; Type: FK CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.store_orderitem
    ADD CONSTRAINT store_orderitem_product_id_f2b098d4_fk_store_product_id FOREIGN KEY (product_id) REFERENCES public.store_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_product store_product_category_id_574bae65_fk_store_category_id; Type: FK CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.store_product
    ADD CONSTRAINT store_product_category_id_574bae65_fk_store_category_id FOREIGN KEY (category_id) REFERENCES public.store_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_shippingaddress store_shippingaddress_customer_id_66e362a6_fk_store_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.store_shippingaddress
    ADD CONSTRAINT store_shippingaddress_customer_id_66e362a6_fk_store_customer_id FOREIGN KEY (customer_id) REFERENCES public.store_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_shippingaddress store_shippingaddress_order_id_e6decfbb_fk_store_order_id; Type: FK CONSTRAINT; Schema: public; Owner: skripsi
--

ALTER TABLE ONLY public.store_shippingaddress
    ADD CONSTRAINT store_shippingaddress_order_id_e6decfbb_fk_store_order_id FOREIGN KEY (order_id) REFERENCES public.store_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

