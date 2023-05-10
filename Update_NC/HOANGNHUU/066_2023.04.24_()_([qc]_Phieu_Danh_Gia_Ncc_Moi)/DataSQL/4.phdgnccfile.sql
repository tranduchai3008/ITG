-- Table: phdgnccfile

-- DROP TABLE phdgnccfile;

CREATE TABLE phdgnccfile
(
  stt_rec character varying NOT NULL DEFAULT ''::character varying,
  filename character varying NOT NULL DEFAULT ''::character varying,
  filebin bytea,
  CONSTRAINT phdgnccfile_pkey PRIMARY KEY (stt_rec)
)
WITH (
  OIDS=TRUE
);
ALTER TABLE phdgnccfile
  OWNER TO postgres;
GRANT ALL ON TABLE phdgnccfile TO postgres;
select create_schema_info();
select createdbcolumns();

