-- Function: public.to2tranpxb(date, date, character varying, character varying, character varying, character varying)

-- DROP FUNCTION public.to2tranpxb(date, date, character varying, character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION public.to2tranpxb(dtfrom date, dtto date, cso_ct character varying, cgio_gh character varying, cma_kh character varying, cma_vi_tri_kh character varying)
  RETURNS SETOF to2tranpxb_return AS
$BODY$DECLARE
	r TO2TranPXB_return;
	--_stt INT:=0; 
BEGIN
FOR r IN 	
	select a.stt_rec as stt_rec, a.ln as ln, a.ln2 as ln2, a.so_ct as so_ct, a.ma_vt as ma_vt, max(a.dvt) as dvt, MAX(a.he_so) as he_so, max(a.ma_lo) as ma_lo, 
		max(a.ma_kho) as ma_kho, a.gio_gh as gio_gh, sum(a.sl_nhap_qt) as sl_nhap_qt, sum(a.sl_xuat_qt) as sl_xuat_qt, sum(a.sl_nhap_qt - a.sl_xuat_qt) as sl_con_lai, 
		sum(a.sl_nhap_qt - a.sl_xuat_qt) as so_luong, max(b.ten_vt) as ten_vt, max(b.ten_vt2) as ten_vt2, max(b.tk_vt) as tk_vt, max(a.so_po) as so_po, 
		max(a.so_do) as so_do, max(a.ma_vi_tri_kh) as ma_vi_tri_kh, max(c.po_khsx) as po_khsx, max(c.dau_tuan) as dau_tuan
	from(
		select a.stt_rec as stt_rec, a.ln, c.ln as ln2, trim(a.so_ct) as so_ct,a.ma_vt, c.dvt, c.he_so, c.ma_lo, c.ma_kho, a.gio_gh, a.so_luong  as sl_nhap_qt, 
			0 as sl_xuat_qt, a.so_po, a.so_do, a.ma_vi_tri_kh as ma_vi_tri_kh, c.po_khsx, c.dau_tuan
		from ctkhgh a left join ph96 b on a.stt_rec = b.stt_rec left join ct96 c on a.stt_rec = c.stt_rec and a.ln_item = c.ln
		where c.dong_yn = 0 and Case when  dtfrom = '19000101' then 1=1 else  b.ngay_gh >= dtfrom END
		and Case when  dtto = '19000101' then 1=1 else  b.ngay_gh <= dtto END
		and b.status = '3'
		and b.loai_gh = '2'
		and INLIST(b.ma_kh, cma_kh)
		and INLIST(a.ma_vi_tri_kh, cma_vi_tri_kh)
		and b.so_ct like '%'|| cso_ct ||'%'
		and case when cgio_gh = '00:00:00' then 1=1 else a.gio_gh = cgio_gh::ud_time end
		UNION ALL
		select  a.stt_rec_to2b as stt_rec, a.ln_to2b as ln, a.ln_to2b_2 as ln2, trim(a.so_ct_to2b) as so_ct, a.ma_vt, a.dvt,a.he_so, a.ma_lo,a.ma_kho, 
			a.gio_gh, 0 as sl_nhap_qt, a.so_luong as sl_xuat_qt, ''::character varying as so_po, ''::character varying as so_do, ''::character varying as ma_vi_tri_kh,
			''::character varying as po_khsx, ''::character varying as dau_tuan
		from ct85 a left join ph85 b on a.stt_rec = b.stt_rec 
		where b.status <> '0'
		and a.stt_rec_to2b <> ''
		and case when cgio_gh = '00:00:00' then 1=1 else a.gio_gh = cgio_gh::ud_time end
		and a.stt_rec_to2b in
			(
				select ctkhgh.stt_rec
				from ctkhgh ctkhgh left join ph96 ph96 on ctkhgh.stt_rec = ph96.stt_rec left join ct96 ct96 on ctkhgh.stt_rec = ct96.stt_rec and ctkhgh.ln_item = ct96.ln
				where ct96.dong_yn = 0 and Case when  dtfrom = '19000101' then 1=1 else  ph96.ngay_gh >= dtfrom END
				and Case when  dtto = '19000101' then 1=1 else  ph96.ngay_gh <= dtto END
				and ph96.status = '3'
				and ph96.loai_gh = '2'
				and INLIST(ph96.ma_kh, cma_kh)
				and INLIST(ctkhgh.ma_vi_tri_kh, cma_vi_tri_kh)
				and ph96.so_ct like '%'|| cso_ct ||'%'
				and case when cgio_gh = '00:00:00' then 1=1 else ctkhgh.gio_gh = cgio_gh::ud_time end
				--and a.stt_rec_to2b = ctkhgh.stt_rec
			)
		)a LEFT JOIN dmvt b ON a.ma_vt = b.ma_vt
	GROUP BY a.stt_rec, a.ln, a.ln2, a.so_ct, a.ma_vt,a.gio_gh
	HAVING sum(sl_nhap_qt - sl_xuat_qt) > 0
LOOP
	RETURN NEXT r;
END LOOP;
RETURN;
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.to2tranpxb(date, date, character varying, character varying, character varying, character varying)
  OWNER TO postgres;
