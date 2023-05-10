-- Table: public.phqc4

-- DROP TABLE public.phqc4;

CREATE TABLE public.phqc4
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
  ong_ba ud_ten,
  dia_chi ud_char128,
  dien_thoai ud_char128,
  dien_giai ud_char128 NOT NULL,
  ma_nv ud_ma,
  ngay_danh_gia ud_ngay,
  ma_vt ud_ma,
  diem ud_smallint,
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
  CONSTRAINT phqc4_pkey PRIMARY KEY (stt_rec)
)
WITH (
  OIDS=TRUE
);
ALTER TABLE public.phqc4
  OWNER TO postgres;
  
select create_schema_info();
select createdbcolumns();