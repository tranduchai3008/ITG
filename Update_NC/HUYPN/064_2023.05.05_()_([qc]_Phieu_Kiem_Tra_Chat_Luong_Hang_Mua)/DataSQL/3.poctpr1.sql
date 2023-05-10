-- Function: public.poctpr1(date, date, character varying, character varying)

-- DROP FUNCTION public.poctpr1(date, date, character varying, character varying);

CREATE OR REPLACE FUNCTION public.poctpr1(dtfrom date, dtto date, cma_dvcs character varying, cma_kh character varying)
  RETURNS SETOF poctpr1_return AS
$BODY$DECLARE
	r poctpr1_return;
	--_stt INT:=0;
	-- SELECT * from poctpr1('2023-01-01', '2023-05-05', '', '')
BEGIN
FOR r IN 	
	select a.stt_rec as stt_rec, a.ln as ln, MAX(a.so_ct) as so_ct, a.ma_vt as ma_vt, max(a.dvt) as dvt, MAX(a.he_so) as he_so, max(a.ma_lo) as ma_lo, max(a.ma_kho) as ma_kho, sum(a.sl_nhap_qt) as sl_nhap_qt,
		sum(a.sl_xuat_qt) as sl_xuat_qt, sum(a.sl_nhap_qt - a.sl_xuat_qt) as sl_con_lai, sum(a.sl_nhap_qt - a.sl_xuat_qt) as so_luong, max(b.ten_vt) as ten_vt, 
		max(b.ten_vt2) as ten_vt2, max(b.tk_vt) as tk_vt,max(a.ma_vv) as ma_vv,max(a.loai_vt_xuat) as loai_vt_xuat, a.stt_rec_dh as stt_rec_dh, a.so_dh as so_dh, 
		a.ln_dh as ln_dh, sum(a.so_luong1) as so_luong1, max(a.muc_dich_sd) as muc_dich_sd, max(po_khsx) po_khsx, max(dau_tuan) dau_tuan
	from(
		select a.stt_rec as stt_rec, a.ln, a.so_ct,a.ma_vt, a.dvt, a.he_so,a.ma_lo, a.ma_kho, a.so_luong  as sl_nhap_qt, 0 as sl_xuat_qt,a.ma_vv as ma_vv,
			0 as loai_vt_xuat, a.stt_rec_dh as stt_rec_dh, a.so_dh as so_dh, a.ln_dh as ln_dh, a.so_luong1 as so_luong1, a.muc_dich_sd as muc_dich_sd,
			po_khsx po_khsx, dau_tuan dau_tuan
		from ct77 a left join ph77 b on a.stt_rec = b.stt_rec 
				left join dmkho c on a.ma_kho = c.ma_kho 
				left join dmvt d on a.ma_vt = d.ma_vt
		where Case when  dtfrom = '19000101' then 1=1 else  b.ngay_ct >= dtfrom END
		and Case when  dtto = '19000101' then 1=1 else  b.ngay_ct <= dtto END
		and INLIST(b.ma_dvcs, cma_dvcs)
		and INLIST(b.ma_kh, cma_kh)
		--and cho_qc = 1
		and d.qc_yn = 1
		and b.status <> '0'
		
		UNION ALL

		select  a.stt_rec as stt_rec, a.ln_item as ln, a.so_ct as so_ct, a.ma_vt, a.dvt, a.he_so, a.ma_lo, a.ma_kho, 0 as sl_nhap_qt, 0 as sl_xuat_qt,
			''::character varying as ma_vv, 0 as loai_vt_xuat, ''::character varying as stt_rec_dh, ''::character varying as so_dh, 0 as ln_dh, 	
			0 as so_luong1, ''::character varying as muc_dich_sd, ''::character varying as po_khsx, ''::character varying as dau_tuan
		from ctlo a left join ct77 b on a.stt_rec = b.stt_rec and ln_item = b.ln 
		where a.ma_ct = 'PR1'
		
		union all

		select  a.stt_rec_pr1 as stt_rec, a.ln_pr1 as ln, a.so_ct_pr1 as so_ct, a.ma_vt, a.dvt,a.he_so, a.ma_lo,a.ma_kho, 0 as sl_nhap_qt, a.so_luong_qc as sl_xuat_qt,
			ma_vv,loai_vt_xuat, a.stt_rec_dh as stt_rec_dh, a.so_dh as so_dh, a.ln_dh as ln_dh, -a.so_luong_qc2 as so_luong1, ''::character varying as muc_dich_sd,
			''::character varying as po_khsx, ''::character varying as dau_tuan
		from ctqc a left join phqc b on a.stt_rec = b.stt_rec 
		where b.status <> '0'
		and a.stt_rec_pr1 <> ''
	)a LEFT JOIN dmvt b ON a.ma_vt = b.ma_vt
	GROUP BY a.stt_rec, a.ln,a.so_ct, a.ma_vt, a.stt_rec_dh, a.so_dh, a.ln_dh
	HAVING sum(sl_nhap_qt - sl_xuat_qt) > 0
LOOP
	RETURN NEXT r;
END LOOP;
RETURN;
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.poctpr1(date, date, character varying, character varying)
  OWNER TO postgres;
