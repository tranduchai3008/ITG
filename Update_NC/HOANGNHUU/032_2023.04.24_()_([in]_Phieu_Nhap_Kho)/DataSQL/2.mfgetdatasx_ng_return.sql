-- Type: public.mfgetdatasx_ng_return

 DROP TYPE public.mfgetdatasx_ng_return cascade;

CREATE TYPE public.mfgetdatasx_ng_return AS
   (tag public.ud_smallint,
    stt_rec public.ud_stt_rec,
    so_ct public.ud_so_ct,
    ngay_ct public.ud_ngay,
    ma_vt public.ud_ma,
    ten_vt public.ud_ten,
    dvt character varying,
    he_so public.ud_float,
    ma_vv character varying,
    so_luong_pd1 public.ud_float,
    sl_nhap_qt public.ud_float,
    sl_xuat_qt public.ud_float,
    so_luong public.ud_float,
    dien_giai character varying,
    ma_kho_vt character varying,
    ma_thao_tac character varying,
    po_khsx character varying,
    dau_tuan character varying);
ALTER TYPE public.mfgetdatasx_ng_return
  OWNER TO postgres;
