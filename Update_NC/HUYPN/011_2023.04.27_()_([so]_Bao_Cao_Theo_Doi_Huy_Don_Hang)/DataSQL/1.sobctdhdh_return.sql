-- Type: public.sobctdhdh_return

-- DROP TYPE public.sobctdhdh_return CASCADE;

CREATE TYPE public.sobctdhdh_return AS
   (sysorder public.ud_smallint,
    systotal public.ud_smallint,
    sysprint public.ud_smallint,
    ma_kh public.ud_ma,
    ten_kh public.ud_ten,
    so_po character varying,
    ma_vt public.ud_ma,
    ten_vt public.ud_ten,
    rcv public.ud_ma,
    orig_date public.ud_ngay,
    rcvd_date public.ud_ngay,
    plan_date public.ud_ngay,
    dvt public.ud_dvt,
    status character varying,
    so_luong public.ud_float,
    chenh_lech public.ud_float,
    so_lan public.ud_smallint,
    stt_rec ud_stt_rec,
    ln ud_smallint);
ALTER TYPE public.sobctdhdh_return
  OWNER TO postgres;
