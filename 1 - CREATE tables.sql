-- Table: public.location

-- DROP TABLE IF EXISTS public.location;

CREATE TABLE IF NOT EXISTS public.location
(
    id integer NOT NULL DEFAULT nextval('location_id_seq'::regclass),
    city character varying COLLATE pg_catalog."default" NOT NULL,
    state character varying COLLATE pg_catalog."default" NOT NULL,
    country character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT location_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.location
    OWNER to postgres;


-- Table: public.person

-- DROP TABLE IF EXISTS public.person;

CREATE TABLE IF NOT EXISTS public.person
(
    id integer NOT NULL DEFAULT nextval('person_id_seq'::regclass),
    "firstName" character varying COLLATE pg_catalog."default" NOT NULL,
    "lastName" character varying COLLATE pg_catalog."default" NOT NULL,
    age integer NOT NULL,
    location_id integer NOT NULL,
    CONSTRAINT person_pkey PRIMARY KEY (id),
    CONSTRAINT location_id FOREIGN KEY (location_id)
        REFERENCES public.location (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.person
    OWNER to postgres;
	
	
-- Table: public.interest

-- DROP TABLE IF EXISTS public.interest;

CREATE TABLE IF NOT EXISTS public.interest
(
    id integer NOT NULL DEFAULT nextval('interest_id_seq'::regclass),
    title character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT interest_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.interest
    OWNER to postgres;
	
	
-- Table: public.person_interest

-- DROP TABLE IF EXISTS public.person_interest;

CREATE TABLE IF NOT EXISTS public.person_interest
(
    person_id integer,
    interest_id integer,
    CONSTRAINT interest_id FOREIGN KEY (interest_id)
        REFERENCES public.interest (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
        NOT VALID,
    CONSTRAINT person_id FOREIGN KEY (person_id)
        REFERENCES public.person (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.person_interest
    OWNER to postgres;