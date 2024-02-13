-- Table: public.people

-- DROP TABLE IF EXISTS public.people;

CREATE TABLE IF NOT EXISTS public.people
(
    id integer NOT NULL DEFAULT nextval('people_id_seq'::regclass),
    "firstName" character varying COLLATE pg_catalog."default" NOT NULL,
    "lastName" character varying COLLATE pg_catalog."default" NOT NULL,
    age integer NOT NULL,
    location_id integer NOT NULL,
    CONSTRAINT people_pkey PRIMARY KEY (id),
    CONSTRAINT location_id FOREIGN KEY (location_id)
        REFERENCES public.location (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.people
    OWNER to postgres;