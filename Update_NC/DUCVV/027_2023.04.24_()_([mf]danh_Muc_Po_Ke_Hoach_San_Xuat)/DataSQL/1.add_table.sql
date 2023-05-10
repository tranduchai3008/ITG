-- Table: public.dmpokhsx

-- DROP TABLE public.dmpokhsx;

CREATE TABLE public.dmpokhsx
(
  po_khsx ud_ma NOT NULL,
  ten_khsx ud_char256 NOT NULL,
  ten_khsx2 ud_char256 ,
  ghi_chu ud_memo,
  date0 ud_ngay,
  time0 ud_time,
  user_id0 ud_smallint,
  status ud_status,
  date2 ud_ngay,
  time2 ud_time,
  user_id2 ud_smallint,
  CONSTRAINT dmpokhsx_pkey PRIMARY KEY (po_khsx)
)
WITH (
  OIDS=TRUE
);
ALTER TABLE public.dmpokhsx
  OWNER TO postgres;

select create_schema_info();
select createdbcolumns();