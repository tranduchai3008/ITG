-- Type: public.mfctpd1c_return

 DROP TYPE public.mfctpd1c_return cascade;

CREATE TYPE public.mfctpd1c_return AS
   (tag smallint,
    stt_rec public.ud_stt_rec,
    ln smallint,
    ln_item smallint,
    so_ct public.ud_so_ct,
    ngay_ct public.ud_ngay,
    ma_vt public.ud_ma,
    dvt character varying,
    he_so public.ud_float,
    ma_kho public.ud_ma,
    sl_nhap_qt public.ud_float,
    sl_xuat_qt public.ud_float,
    sl_con_lai public.ud_float,
    so_luong public.ud_float,
    ten_vt public.ud_ten,
    tk_vt character varying,
    ma_thao_tac public.ud_ma,
    ten_thao_tac character varying,
    po_khsx character varying,
    dau_tuan character varying);
ALTER TYPE public.mfctpd1c_return
  OWNER TO postgres;
