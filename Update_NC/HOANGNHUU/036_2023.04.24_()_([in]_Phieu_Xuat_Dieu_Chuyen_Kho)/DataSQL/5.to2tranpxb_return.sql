﻿-- Type: public.to2tranpxb_return

 DROP TYPE public.to2tranpxb_return cascade;

CREATE TYPE public.to2tranpxb_return AS
   (stt_rec public.ud_stt_rec,
    ln smallint,
    ln2 smallint,
    so_ct public.ud_so_ct,
    ma_vt public.ud_ma,
    dvt character varying,
    he_so public.ud_float,
    ma_lo public.ud_ma,
    ma_kho public.ud_ma,
    gio_gh public.ud_time,
    sl_nhap_qt public.ud_float,
    sl_xuat_qt public.ud_float,
    sl_con_lai public.ud_float,
    so_luong public.ud_float,
    ten_vt public.ud_ten,
    ten_vt2 public.ud_ten,
    tk_vt character varying,
    so_po character varying,
    so_do character varying,
    ma_vi_tri_kh character varying,
    po_khsx character varying,
    dau_tuan character varying);
ALTER TYPE public.to2tranpxb_return
  OWNER TO postgres;
