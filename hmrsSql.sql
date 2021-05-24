--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

-- Started on 2021-05-24 13:26:05

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
-- TOC entry 214 (class 1259 OID 16682)
-- Name: job_positions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_positions (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.job_positions OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16680)
-- Name: JobPositions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.job_positions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."JobPositions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 212 (class 1259 OID 16670)
-- Name: user_verifications_with_system; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_verifications_with_system (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "isConfirmed" boolean NOT NULL,
    "confirmationDate" date NOT NULL
);


ALTER TABLE public.user_verifications_with_system OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16668)
-- Name: UserVerificationsWithSystem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.user_verifications_with_system ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."UserVerificationsWithSystem_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 208 (class 1259 OID 16646)
-- Name: verification_codes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.verification_codes (
    id integer NOT NULL,
    "verificationCode" character varying(36) NOT NULL,
    "createDate" date NOT NULL,
    "userId" integer NOT NULL
);


ALTER TABLE public.verification_codes OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16644)
-- Name: VerificationsCodes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.verification_codes ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."VerificationsCodes_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 203 (class 1259 OID 16600)
-- Name: empoyers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empoyers (
    "userId" integer NOT NULL,
    "companyName" character varying(255) NOT NULL,
    "webSite" character varying(100) NOT NULL
);


ALTER TABLE public.empoyers OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16711)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16583)
-- Name: job_seekers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_seekers (
    "userId" integer NOT NULL,
    "firstName" character varying(50) NOT NULL,
    "lastName" character varying(50) NOT NULL,
    "dateOfBirth" date NOT NULL,
    "nationalityId" character varying(11) NOT NULL
);


ALTER TABLE public.job_seekers OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16612)
-- Name: phone_numbers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.phone_numbers (
    id integer NOT NULL,
    "empoyerId" integer NOT NULL,
    "phoneNumber" character varying(15) NOT NULL
);


ALTER TABLE public.phone_numbers OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16610)
-- Name: phoneNumbers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.phone_numbers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."phoneNumbers_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 206 (class 1259 OID 16624)
-- Name: system_workers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_workers (
    "userId" integer NOT NULL,
    "firstName" character varying(50) NOT NULL,
    "lastName" character varying(50) NOT NULL
);


ALTER TABLE public.system_workers OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16658)
-- Name: user_verifications_with_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_verifications_with_code (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "isConfirmed" boolean NOT NULL,
    "confirmationDate" date NOT NULL,
    "verificationCodeId" integer NOT NULL
);


ALTER TABLE public.user_verifications_with_code OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16656)
-- Name: userVerificationsWithCode_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.user_verifications_with_code ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."userVerificationsWithCode_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 200 (class 1259 OID 16564)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    password character varying(80) NOT NULL,
    email character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16588)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 2914 (class 2606 OID 16688)
-- Name: job_positions JobPositions_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_positions
    ADD CONSTRAINT "JobPositions_name_key" UNIQUE (name);


--
-- TOC entry 2916 (class 2606 OID 16686)
-- Name: job_positions JobPositions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_positions
    ADD CONSTRAINT "JobPositions_pkey" PRIMARY KEY (id);


--
-- TOC entry 2912 (class 2606 OID 16674)
-- Name: user_verifications_with_system UserVerificationsWithSystem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_verifications_with_system
    ADD CONSTRAINT "UserVerificationsWithSystem_pkey" PRIMARY KEY (id);


--
-- TOC entry 2908 (class 2606 OID 16650)
-- Name: verification_codes VerificationsCodes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verification_codes
    ADD CONSTRAINT "VerificationsCodes_pkey" PRIMARY KEY (id);


--
-- TOC entry 2900 (class 2606 OID 16604)
-- Name: empoyers empoyers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empoyers
    ADD CONSTRAINT empoyers_pkey PRIMARY KEY ("userId");


--
-- TOC entry 2898 (class 2606 OID 16587)
-- Name: job_seekers jobSeekers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_seekers
    ADD CONSTRAINT "jobSeekers_pkey" PRIMARY KEY ("userId");


--
-- TOC entry 2902 (class 2606 OID 16618)
-- Name: phone_numbers phoneNumbers_phoneNumber_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone_numbers
    ADD CONSTRAINT "phoneNumbers_phoneNumber_key" UNIQUE ("phoneNumber");


--
-- TOC entry 2904 (class 2606 OID 16616)
-- Name: phone_numbers phoneNumbers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone_numbers
    ADD CONSTRAINT "phoneNumbers_pkey" PRIMARY KEY (id);


--
-- TOC entry 2906 (class 2606 OID 16628)
-- Name: system_workers systemWorkers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_workers
    ADD CONSTRAINT "systemWorkers_pkey" PRIMARY KEY ("userId");


--
-- TOC entry 2910 (class 2606 OID 16662)
-- Name: user_verifications_with_code userVerificationsWithCode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_verifications_with_code
    ADD CONSTRAINT "userVerificationsWithCode_pkey" PRIMARY KEY (id);


--
-- TOC entry 2896 (class 2606 OID 16571)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2922 (class 2606 OID 16701)
-- Name: user_verifications_with_code UserVerificationsWithCode_verificationCodeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_verifications_with_code
    ADD CONSTRAINT "UserVerificationsWithCode_verificationCodeId_fkey" FOREIGN KEY ("verificationCodeId") REFERENCES public.verification_codes(id);


--
-- TOC entry 2924 (class 2606 OID 16675)
-- Name: user_verifications_with_system UserVerificationsWithSystem_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_verifications_with_system
    ADD CONSTRAINT "UserVerificationsWithSystem_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- TOC entry 2921 (class 2606 OID 16651)
-- Name: verification_codes VerificationsCodes_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verification_codes
    ADD CONSTRAINT "VerificationsCodes_id_fkey" FOREIGN KEY (id) REFERENCES public.users(id);


--
-- TOC entry 2918 (class 2606 OID 16605)
-- Name: empoyers empoyers_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empoyers
    ADD CONSTRAINT "empoyers_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- TOC entry 2917 (class 2606 OID 16595)
-- Name: job_seekers jobSeekers_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_seekers
    ADD CONSTRAINT "jobSeekers_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- TOC entry 2919 (class 2606 OID 16619)
-- Name: phone_numbers phoneNumbers_empoyerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone_numbers
    ADD CONSTRAINT "phoneNumbers_empoyerId_fkey" FOREIGN KEY ("empoyerId") REFERENCES public.empoyers("userId");


--
-- TOC entry 2920 (class 2606 OID 16629)
-- Name: system_workers systemWorkers_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_workers
    ADD CONSTRAINT "systemWorkers_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- TOC entry 2923 (class 2606 OID 16663)
-- Name: user_verifications_with_code userVerificationsWithCode_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_verifications_with_code
    ADD CONSTRAINT "userVerificationsWithCode_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


-- Completed on 2021-05-24 13:26:05

--
-- PostgreSQL database dump complete
--

