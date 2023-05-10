-- Function: public.inctto2c(date, date, character varying, character varying, character varying, character varying)

-- DROP FUNCTION public.inctto2c(date, date, character varying, character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION public.inctto2c(dtfrom date, dtto date, cso_ct character varying, cma_kh character varying, cma_dvcs character varying, cso_ecis character varying)
  RETURNS SETOF inctto2c_return AS
$BODY$DECLARE
	r inctto2c_return;
	--_stt INT:=0; select tk_dt, tk_gv, tk_ck, tk_thue from dmvt select tk_thue from ct81
	-- select * from inctto2c('20191003', '20191003', '01-1910-00001', '', '', 'ECIS9547')
BEGIN
DROP TABLE IF EXISTS tmp;
	CREATE TEMP TABLE tmp AS
	select a.stt_rec as stt_rec, a.ln as ln, MAX(ln2) as ln2, MAX(a.so_ct) as so_ct, max(a.ngay_ct) as ngay_ct, MAX(a.ma_vt) as ma_vt, max(a.dvt) as dvt, NULL, MAX(a.he_so) as he_so,
		max(a.ma_lo) as ma_lo, max(a.ma_kho) as ma_kho, sum(a.sl_nhap_qt) as sl_nhap_qt, sum(a.sl_xuat_qt) as sl_xuat_qt, sum(a.sl_nhap_qt - a.sl_xuat_qt) as sl_con_lai, 
		sum(a.sl_nhap_qt - a.sl_xuat_qt) as so_luong, ''::character varying ten_vt, ''::character varying ten_vt2, ''::character varying tk_vt, ''::character varying stt_rec_dh, 
		''::character varying so_dh, 0::ud_smallint ln_dh, max(a.loai_vt_xuat) as loai_vt_xuat, ''::character varying tk_dt, ''::character varying tk_gv, max(a.gia_nt) as gia_nt, 
		max(a.ma_ck) as ma_ck, max(a.pt_ck) as pt_ck, max(a.ma_thue) as ma_thue, max(a.thue_suat) as thue_suat, ''::character varying tk_ck, max(a.tk_thue) as tk_thue,
		max(a.ma_line) as ma_line, 0::ud_float as gia_nt2, ''::character varying so_po, max(a.so_ecis) as so_ecis, max(a.ma_noi_nhan) as ma_noi_nhan
	from(
		select a.stt_rec as stt_rec, a.ln, c.ln as ln2, a.so_ct, a.ngay_ct, a.ma_vt, a.dvt, a.gio_gh, a.he_so, a.ma_lo, a.ma_kho, a.so_luong  as sl_nhap_qt, 
			0 as sl_xuat_qt, a.loai_vt_xuat as loai_vt_xuat, a.gia_nt, a.ma_ck, a.pt_ck, a.ma_thue, a.thue_suat, ''::character varying as tk_thue, '' as ma_line,
			c.so_ecis as so_ecis, a.ma_noi_nhan
		from ct96 a left join ph96 b on a.stt_rec = b.stt_rec 
			left join ctcont c on a.stt_rec = c.stt_rec and a.ma_noi_nhan = c.ma_noi_nhan and a.so_ecis = c.so_ecis
		where a.dong_yn = 0 
			and Case when  dtfrom = '1900-01-01' then 1=1 else  b.ngay_ct >= dtfrom END 
			and Case when  dtto = '1900-01-01' then 1=1 else  b.ngay_ct <= dtto END
			and b.status in('1','2')		
			and case when cso_ct <> '' then b.so_ct = any(string_to_array(cso_ct, ',')) else 1 = 1 end 
			and case when cma_kh <> '' then b.ma_kh = any(string_to_array(cma_kh, ',')) else 1 = 1 end 
			and case when cma_dvcs <> '' then b.ma_dvcs = any(string_to_array(cma_dvcs, ',')) else 1 = 1 end 
			and c.so_ecis like '%'||cso_ecis||'%'
			
		UNION ALL
		select  a.stt_rec_vc as stt_rec, a.ln_vc as ln, a.ln_vc2 as ln2, a.so_lenh_vc as so_ct, '1900-01-01'::ud_ngay as ngay_ct, a.ma_vt, a.dvt, null AS gio_gh, a.he_so, a.ma_lo,
			a.ma_kho, 0 as sl_nhap_qt, a.so_luong as sl_xuat_qt, a.loai_vt_xuat as loai_vt_xuat, 0::ud_float as gia_nt, ''::character varying as ma_ck, 
			0::ud_float as pt_ck, ''::character varying as ma_thue, 0::ud_float as thue_suat, a.tk_thue as tk_thue, '' as ma_line, 
			b.so_ecis, ''::character varying as ma_noi_nhan
		from ct81 a left join ph81 b on a.stt_rec = b.stt_rec
		where b.status <> '0'
			and a.stt_rec_vc <> ''
			and b.so_ecis like '%'||cso_ecis||'%'
		)a 
	GROUP BY a.stt_rec, a.ln, a.so_ecis
	HAVING sum(sl_nhap_qt - sl_xuat_qt) > 0;
	
	update tmp a set ten_vt = b.ten_vt, ten_vt2 = b.ten_vt2, tk_vt = b.tk_vt, tk_dt = b.tk_dt, tk_gv = b.tk_gv,
		tk_ck = b.tk_ck
	from dmvt b 
	where a.ma_vt = b.ma_vt;
	
	update tmp a set stt_rec_dh = b.stt_rec_dh, so_dh = b.so_dh, ln_dh = b.ln_dh, so_po = b.so_po
	from ct96 b 
	where a.stt_rec = b.stt_rec 
		and a.ln = b.ln	;
	
	---lay gia tu don hang
	update tmp a set gia_nt2 = (SELECT c.gia_nt2 from ct64 c where c.stt_rec = a.stt_rec_dh and c.ln = a.ln_dh) where a.stt_rec_dh <> '';
	update tmp a set gia_nt2 = b.gia_nt2 from (SELECT c.stt_rec, c.ma_vt, c.ln, d.so_po, c.gia_nt2 from ct64 c left join ph64 d on c.stt_rec = d.stt_rec ) b 
							where a.so_po <> '' and a.stt_rec_dh = b.stt_rec and a.ln_dh = b.ln and a.ma_vt = b.ma_vt and a.so_po = b.so_po;
	update tmp a set ma_ck = (SELECT c.ma_ck from ct64 c where c.stt_rec = a.stt_rec_dh and c.ln = a.ln_dh) where a.stt_rec_dh <> '';
	update tmp a set ma_ck = b.ma_ck from (SELECT c.stt_rec, c.ma_vt, c.ln, d.so_po, c.ma_ck from ct64 c left join ph64 d on c.stt_rec = d.stt_rec ) b 
							where a.so_po <> '' and a.stt_rec_dh = b.stt_rec and a.ln_dh = b.ln and a.ma_vt = b.ma_vt and a.so_po = b.so_po;
	update tmp a set ma_thue = (SELECT c.ma_thue from ct64 c where c.stt_rec = a.stt_rec_dh and c.ln = a.ln_dh) where a.stt_rec_dh <> '';
	update tmp a set ma_thue = b.ma_thue from (SELECT c.stt_rec, c.ma_vt, c.ln, d.so_po, c.ma_thue from ct64 c left join ph64 d on c.stt_rec = d.stt_rec ) b 
							where a.so_po <> '' and a.stt_rec_dh = b.stt_rec and a.ln_dh = b.ln and a.ma_vt = b.ma_vt and a.so_po = b.so_po;
	update tmp a set pt_ck = (SELECT c.pt_ck from ct64 c where c.stt_rec = a.stt_rec_dh and c.ln = a.ln_dh) where a.stt_rec_dh <> '';
	update tmp a set pt_ck = b.pt_ck from (SELECT c.stt_rec, c.ma_vt, c.ln, d.so_po, c.pt_ck from ct64 c left join ph64 d on c.stt_rec = d.stt_rec ) b 
							where a.so_po <> '' and a.stt_rec_dh = b.stt_rec and a.ln_dh = b.ln and a.ma_vt = b.ma_vt and a.so_po = b.so_po;
	update tmp a set thue_suat = (SELECT c.thue_suat from ct64 c where c.stt_rec = a.stt_rec_dh and c.ln = a.ln_dh) where a.stt_rec_dh <> '';
	update tmp a set thue_suat = b.thue_suat from (SELECT c.stt_rec, c.ma_vt, c.ln, d.so_po, c.thue_suat from ct64 c left join ph64 d on c.stt_rec = d.stt_rec ) b 
							where a.so_po <> '' and a.stt_rec_dh = b.stt_rec and a.ln_dh = b.ln and a.ma_vt = b.ma_vt and a.so_po = b.so_po;
	
	FOR r IN select * from tmp 
	LOOP
		RETURN NEXT r;
	END LOOP;
	RETURN;
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.inctto2c(date, date, character varying, character varying, character varying, character varying)
  OWNER TO postgres;
 -- select 0 as tag, a.* from inctto2c('2023-03-01', '2023-04-17', '', 'IK-QT002', '01', '') a order by a.so_ct
