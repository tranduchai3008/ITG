-- Function: public.poctpo1b(date, date, character varying, character varying, character varying)

-- DROP FUNCTION public.poctpo1b(date, date, character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION public.poctpo1b(dtfrom date, dtto date, cso_ct character varying, cma_kh character varying, cma_dvcs character varying)
  RETURNS SETOF poctpo1b_return AS
$BODY$DECLARE
	r poctpo1b_return;
	--_stt INT:=0; select * from ctkhnh
BEGIN
FOR r IN 	
	select a.stt_rec as stt_rec, a.ln as ln, a.ln2, a.so_ct as so_ct, a.ma_vt as ma_vt, max(a.dvt) as dvt, MAX(a.he_so) as he_so, 
		max(a.ma_kho) as ma_kho, a.ngay_de_nghi_nh as ngay_de_nghi_nh, sum(a.sl_nhap_qt) as sl_nhap_qt, sum(a.sl_xuat_qt) as sl_xuat_qt, 
		sum(a.sl_nhap_qt - a.sl_xuat_qt) as sl_con_lai, sum(a.sl_nhap_qt - a.sl_xuat_qt) as so_luong, max(b.ten_vt) as ten_vt, max(b.ten_vt2) as ten_vt2, 
		max(b.tk_vt) as tk_vt, max(a.loai_vt_xuat) as loai_vt_xuat, max(a.gia_nt) as gia_nt, max(a.tk_thue_nk) as tk_thue_nk, max(a.ma_thue_nk) as ma_thue_nk,
		max(a.thue_suat_nk) as thue_suat_nk, max(a.muc_dich_sd) as muc_dich_sd , max(a.dien_giai)as dien_giai, max(a.dau_tuan) as dau_tuan, max(a.qc_yn) qc_yn , 
		max(a.so_ct_dhb)as so_ct_dhb, max(po_khsx) po_khsx
	from(
		select a.stt_rec as stt_rec, c.ln, a.ln as ln2, trim(a.so_ct) as so_ct, a.ma_vt, c.dvt, c.he_so, c.ma_kho, a.ngay_de_nghi_nh, a.so_luong  as sl_nhap_qt, 
			0 as sl_xuat_qt, c.gia_mua_nt as gia_nt, c.loai_vt_xuat as loai_vt_xuat, c.tk_thue_nk as tk_thue_nk, c.ma_thue_nk as ma_thue_nk, 
			c.thue_suat_nk as thue_suat_nk, c.muc_dich_sd as muc_dich_sd , c.dien_giai as dien_giai, c.dau_tuan, c.qc_yn , c.so_ct_dhb, c.po_khsx
		from ctkhnh a left join ph94 b on a.stt_rec = b.stt_rec left join ct94 c on a.stt_rec = c.stt_rec and a.ln_item = c.ln
		where Case when  dtfrom = '19000101' then 1=1 else  a.ngay_de_nghi_nh >= dtfrom END
			and Case when  dtto = '19000101' then 1=1 else  a.ngay_de_nghi_nh <= dtto END
			and b.status in('2','3')
			and INLIST(trim(b.so_ct), cso_ct)
			and INLIST(b.ma_kh, cma_kh)
			and INLIST(b.ma_dvcs, cma_dvcs)
		UNION ALL
		select  a.stt_rec_po1 as stt_rec, a.ln_po1 as ln, a.ln_po12 as ln2, trim(a.so_ct_po1) as so_ct, a.ma_vt, a.dvt, a.he_so, a.ma_kho, a.ngay_de_nghi_nh, 
			0 as sl_nhap_qt, a.so_luong as sl_xuat_qt, 0::ud_float as gia_nt, a.loai_vt_xuat as loai_vt_xuat, ''::character varying as tk_thue_nk, 
			''::character varying as ma_thue_nk, 0::ud_float as thue_suat_nk, ''::character varying as muc_dich_sd , ''::character varying as dien_giai, ''::character varying as dau_tuan, 0::integer as qc_yn, a.so_ct_dhb, a.po_khsx
		from ct77 a left join ph77 b on a.stt_rec = b.stt_rec 
		where b.status <> '0'
			and a.stt_rec_po1 <> ''
			and INLIST(b.ma_kh, cma_kh)
			and a.stt_rec_po1 IN(select stt_rec from ctkhnh where exists(select 1 from ph94 where ctkhnh.stt_rec = ph94.stt_rec and status in('2','3') and INLIST(trim(so_ct), cso_ct) and INLIST(ma_kh, cma_kh) and INLIST(ma_dvcs, cma_dvcs)) and Case when  dtfrom = '19000101' then 1=1 else  ngay_de_nghi_nh >= dtfrom END
			and Case when  dtto = '19000101' then 1=1 else  ngay_de_nghi_nh <= dtto END)
		)a LEFT JOIN dmvt b ON a.ma_vt = b.ma_vt
	GROUP BY a.ln2, a.stt_rec, a.ln,a.so_ct, a.ma_vt, a.ngay_de_nghi_nh
	HAVING sum(sl_nhap_qt - sl_xuat_qt) > 0

LOOP
	RETURN NEXT r;
END LOOP;
RETURN;
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.poctpo1b(date, date, character varying, character varying, character varying)
  OWNER TO postgres;
