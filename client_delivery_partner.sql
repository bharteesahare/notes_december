--
-- PostgreSQL database dump
--

-- Dumped from database version 13.10
-- Dumped by pg_dump version 13.12 (Ubuntu 13.12-1.pgdg20.04+1)

-- Started on 2023-10-19 11:41:42 IST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = on;

DROP DATABASE "DbSpace";
--
-- TOC entry 4076 (class 1262 OID 16402)
-- Name: DbSpace; Type: DATABASE; Schema: -; Owner: HSMaster
--

CREATE DATABASE "DbSpace" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


ALTER DATABASE "DbSpace" OWNER TO "HSMaster";

\connect "DbSpace"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = on;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 248 (class 1259 OID 17613)
-- Name: client_delivery_partners; Type: TABLE; Schema: public; Owner: HSMaster
--

CREATE TABLE public.client_delivery_partners (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    delivery_partner_id bigint NOT NULL,
    status integer DEFAULT 0
);


ALTER TABLE public.client_delivery_partners OWNER TO "HSMaster";

--
-- TOC entry 247 (class 1259 OID 17611)
-- Name: client_delivery_partners_id_seq; Type: SEQUENCE; Schema: public; Owner: HSMaster
--

CREATE SEQUENCE public.client_delivery_partners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_delivery_partners_id_seq OWNER TO "HSMaster";

--
-- TOC entry 4077 (class 0 OID 0)
-- Dependencies: 247
-- Name: client_delivery_partners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: HSMaster
--

ALTER SEQUENCE public.client_delivery_partners_id_seq OWNED BY public.client_delivery_partners.id;


--
-- TOC entry 3930 (class 2604 OID 17616)
-- Name: client_delivery_partners id; Type: DEFAULT; Schema: public; Owner: HSMaster
--

ALTER TABLE ONLY public.client_delivery_partners ALTER COLUMN id SET DEFAULT nextval('public.client_delivery_partners_id_seq'::regclass);


--
-- TOC entry 4070 (class 0 OID 17613)
-- Dependencies: 248
-- Data for Name: client_delivery_partners; Type: TABLE DATA; Schema: public; Owner: HSMaster
--

INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (424, 52, 4, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (1198, 52, 8, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (16141, 128, 2, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (702, 44, 7, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (982, 66, 1, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (983, 66, 2, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (985, 66, 4, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (987, 66, 7, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (988, 66, 8, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (1023, 44, 8, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (367, 45, 1, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (16142, 128, 4, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (372, 45, 7, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (421, 52, 1, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (1206, 94, 1, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (1207, 94, 2, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (1209, 94, 4, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (1211, 94, 7, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (1212, 94, 8, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (1213, 112, 1, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (1214, 112, 2, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (1216, 112, 4, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (1218, 112, 7, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (1219, 112, 8, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (16144, 128, 7, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (16145, 128, 8, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (16140, 128, 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (18258, 92, 1, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (18259, 92, 2, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (4, 21, 4, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (3564, 122, 1, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (3565, 122, 2, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (3566, 122, 4, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (3568, 122, 7, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (3569, 122, 8, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (15396, 70, 1, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (15397, 70, 2, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (15398, 70, 4, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (15400, 70, 7, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (15401, 70, 8, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (15474, 124, 1, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (15475, 124, 2, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (15476, 124, 4, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (15478, 124, 7, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (15479, 124, 8, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (370, 45, 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (697, 44, 1, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (25633, 46, 2, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (18260, 92, 4, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (18262, 92, 7, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (700, 44, 4, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (698, 44, 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (1100, 45, 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (17257, 125, 2, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (17258, 125, 4, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (17260, 125, 7, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (17261, 125, 8, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (17724, 137, 1, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (17725, 137, 2, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (17726, 137, 4, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (17728, 137, 7, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (17729, 137, 8, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (15970, 127, 7, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (17958, 141, 1, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (17959, 141, 2, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (17960, 141, 4, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (17962, 141, 7, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (18263, 92, 8, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (18270, 142, 1, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (18271, 142, 2, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (18272, 142, 4, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (18274, 142, 7, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (18275, 142, 8, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (22404, 143, 1, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (1009, 21, 8, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (23731, 144, 2, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (1, 21, 1, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (368, 45, 2, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (2, 21, 2, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (22405, 143, 2, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (22406, 143, 4, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (22408, 143, 7, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (22409, 143, 8, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (23732, 144, 4, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (23734, 144, 7, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (23735, 144, 8, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (23730, 144, 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (15967, 127, 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (422, 52, 2, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (25634, 46, 4, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (25636, 46, 7, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (25637, 46, 8, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (25644, 156, 1, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (25645, 156, 2, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (25646, 156, 4, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (25648, 156, 7, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (15968, 127, 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (17256, 125, 1, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (15971, 127, 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (15966, 127, 1, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (25632, 46, 1, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (426, 52, 7, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (17963, 141, 8, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (6, 21, 7, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (25649, 156, 8, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (25694, 96, 4, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (49912, 169, 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (25697, 96, 8, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (25692, 96, 1, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (26436, 160, 1, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (26437, 160, 2, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (26438, 160, 4, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (26440, 160, 7, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (26441, 160, 8, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (26874, 161, 1, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (26875, 161, 2, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (26876, 161, 4, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (26878, 161, 7, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (26879, 161, 8, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (28344, 134, 1, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (28345, 134, 2, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (28346, 134, 4, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (28348, 134, 7, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (28349, 134, 8, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (29106, 163, 1, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (29107, 163, 2, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (29108, 163, 4, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (29110, 163, 7, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (29111, 163, 8, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (32448, 166, 1, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (32449, 166, 2, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (32450, 166, 4, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (32452, 166, 7, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (32453, 166, 8, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (25696, 96, 7, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (25693, 96, 2, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (49908, 169, 2, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (49909, 169, 4, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (49911, 169, 7, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (49913, 169, 1, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (57424, 171, 8, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (57425, 171, 1, 0) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (57420, 171, 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (57423, 171, 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.client_delivery_partners (id, user_id, delivery_partner_id, status) VALUES (57421, 171, 4, 1) ON CONFLICT DO NOTHING;


--
-- TOC entry 4078 (class 0 OID 0)
-- Dependencies: 247
-- Name: client_delivery_partners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: HSMaster
--

SELECT pg_catalog.setval('public.client_delivery_partners_id_seq', 62881, true);


--
-- TOC entry 3933 (class 2606 OID 17619)
-- Name: client_delivery_partners client_delivery_partners_pkey; Type: CONSTRAINT; Schema: public; Owner: HSMaster
--

ALTER TABLE ONLY public.client_delivery_partners
    ADD CONSTRAINT client_delivery_partners_pkey PRIMARY KEY (id);


--
-- TOC entry 3934 (class 1259 OID 17631)
-- Name: index_client_delivery_partners_on_delivery_partner_id; Type: INDEX; Schema: public; Owner: HSMaster
--

CREATE INDEX index_client_delivery_partners_on_delivery_partner_id ON public.client_delivery_partners USING btree (delivery_partner_id);


--
-- TOC entry 3935 (class 1259 OID 17630)
-- Name: index_client_delivery_partners_on_user_id; Type: INDEX; Schema: public; Owner: HSMaster
--

CREATE INDEX index_client_delivery_partners_on_user_id ON public.client_delivery_partners USING btree (user_id);


--
-- TOC entry 3936 (class 1259 OID 17632)
-- Name: user_id_and_delivery_partner_id; Type: INDEX; Schema: public; Owner: HSMaster
--

CREATE UNIQUE INDEX user_id_and_delivery_partner_id ON public.client_delivery_partners USING btree (user_id, delivery_partner_id);


--
-- TOC entry 3937 (class 2606 OID 17620)
-- Name: client_delivery_partners fk_rails_5fe29a3e81; Type: FK CONSTRAINT; Schema: public; Owner: HSMaster
--

ALTER TABLE ONLY public.client_delivery_partners
    ADD CONSTRAINT fk_rails_5fe29a3e81 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3938 (class 2606 OID 17625)
-- Name: client_delivery_partners fk_rails_c9cfc8f1f1; Type: FK CONSTRAINT; Schema: public; Owner: HSMaster
--

ALTER TABLE ONLY public.client_delivery_partners
    ADD CONSTRAINT fk_rails_c9cfc8f1f1 FOREIGN KEY (delivery_partner_id) REFERENCES public.delivery_partners(id);


-- Completed on 2023-10-19 11:41:46 IST

--
-- PostgreSQL database dump complete
--

