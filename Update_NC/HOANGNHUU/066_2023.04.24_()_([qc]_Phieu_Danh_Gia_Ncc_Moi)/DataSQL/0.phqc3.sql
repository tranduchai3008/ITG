-- Table: public.phqc3

-- DROP TABLE public.phqc3;

CREATE TABLE public.phqc3
(
  ma_dvcs ud_ma NOT NULL,
  stt_rec ud_stt_rec NOT NULL,
  ma_ct ud_ma_ct NOT NULL,
  ma_gd ud_smallint NOT NULL,
  ngay_ct ud_ngay NOT NULL,
  ngay_lct ud_ngay NOT NULL,
  so_ct ud_so_ct NOT NULL,
  ma_kh ud_ma,
  ten_kh ud_ten,
  nguoi_lh ud_ten,
  dia_chi ud_char128,
  dien_thoai ud_char128,
  dien_giai ud_char128 NOT NULL,
  ma_nv_dg ud_ma,
  ngay_dg ud_ngay,
  ma_vt ud_ma,
  diem_dg ud_smallint,
  dinh_kem_file text,
  ma_nt ud_ma_nt NOT NULL,
  ty_gia ud_float NOT NULL,
  date0 ud_ngay NOT NULL,
  time0 ud_time NOT NULL,
  user_id0 ud_smallint NOT NULL,
  status ud_status NOT NULL,
  date2 ud_ngay NOT NULL,
  time2 ud_time NOT NULL,
  user_id2 ud_smallint NOT NULL,
  CONSTRAINT phqc3_pkey PRIMARY KEY (stt_rec)
)
WITH (
  OIDS=TRUE
);
ALTER TABLE public.phqc3
  OWNER TO postgres;
  
select create_schema_info();
select createdbcolumns();