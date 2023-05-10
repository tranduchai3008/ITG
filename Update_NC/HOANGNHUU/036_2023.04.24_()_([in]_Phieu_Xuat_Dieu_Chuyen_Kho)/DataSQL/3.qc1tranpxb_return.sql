-- Type: public.qc1tranpxb_return

 DROP TYPE public.qc1tranpxb_return cascade;

CREATE TYPE public.qc1tranpxb_return AS
   (stt_rec public.ud_stt_rec,
    ln smallint,
    ln2 smallint,
    so_ct public.ud_so_ct,
    ma_vt public.ud_ma,
    dvt character varying,
    ten_vt character varying,
    tk_vt character varying,
    tk_gv character varying,
    ma_kho character varying,
    gia_nt public.ud_float,
    he_so public.ud_float,
    sl_nhap_qt public.ud_float,
    sl_xuat_qt public.ud_float,
    sl_con_lai public.ud_float,
    so_luong public.ud_float,
    so_luong1 public.ud_float,
    po_khsx character varying,
    dau_tuan character varying);
ALTER TYPE public.qc1tranpxb_return
  OWNER TO postgres;
