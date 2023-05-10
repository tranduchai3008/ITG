-- Function: public.qc1tranpxb(character varying, date, date, character varying, character varying)

-- DROP FUNCTION public.qc1tranpxb(character varying, date, date, character varying, character varying);

CREATE OR REPLACE FUNCTION public.qc1tranpxb(cma_dvcs character varying, dtfrom date, dtto date, cso_ct character varying, cma_kh character varying)
  RETURNS SETOF qc1tranpxb_return AS
$BODY$DECLARE
	r qc1tranpxb_return;
	--_stt INT:=0;
BEGIN

FOR r IN 	
	SELECT a.stt_rec, a.ln, a.ln2, a.so_ct, a.ma_vt, max(a.dvt) as dvt, max(b.ten_vt) as ten_vt, max(b.tk_vt) as tk_vt, max(b.tk_gv) as tk_gv, max(a.ma_kho) as ma_kho, 
		max(a.gia_nt) as gia_nt, max(a.he_so) as he_so, sum(a.sl_nhap_qt) as sl_nhap_qt, sum(a.sl_xuat_qt) as sl_xuat_qt, sum(a.sl_nhap_qt - a.sl_xuat_qt) as sl_con_lai,
		sum(a.sl_nhap_qt - a.sl_xuat_qt) as so_luong, sum(a.so_luong1) as so_luong1, max(a.po_khsx) as po_khsx, max(a.dau_tuan) as dau_tuan
	FROM ( 
		SELECT a.stt_rec, a.ln, a.ln as ln2, trim(a.so_ct) as so_ct, a.ma_vt, a.ma_kho as ma_kho, a.gia_nt as gia_nt, a.he_so as he_so, a.sl_nhap as sl_nhap_qt, 
			0::ud_float as sl_xuat_qt, a.dvt, a.so_luong_nhap1 as so_luong1,  a.po_khsx as po_khsx, a.dau_tuan as dau_tuan
		FROM ctqc a --left join ctlo b on a.stt_rec = b.stt_rec and a.ln = b.ln_item 
		left join phqc c on a.stt_rec = c.stt_rec
			WHERE 1=1 --(a.ket_qua_qc = 1 or a.ket_qua_qc = 3)
			and Case when  dtfrom = '19000101' then 1=1 else  c.ngay_ct >= dtfrom END
			and Case when  dtto = '19000101' then 1=1 else  c.ngay_ct <= dtto END
			and INLIST(trim(c.so_ct), cso_ct)
			and c.status <> '0'
			and INLIST(c.ma_dvcs, cma_dvcs)
		UNION all
		SELECT a.stt_rec_qc1 as stt_rec, a.ln_qc1 as ln, a.ln_qc1 as ln2,trim(a.so_ct_qc1) as so_ct, a.ma_vt, '' as ma_kho, (a.gia_nt*0) as gia_nt, (a.he_so *0) as he_so, 
			0::ud_float as sl_nhap_qt, a.so_luong as sl_xuat_qt, ''::character varying as dvt, - a.so_luong1 as so_luong1, 
			 ''::character varying as po_khsx,  ''::character varying as dau_tuan
		FROM ct85 a left join ph85 b on a.stt_rec = b.stt_rec
			where b.status <> '0'
			and a.stt_rec_qc1 <> ''
			and INLIST(b.ma_dvcs, cma_dvcs)
		)a  LEFT JOIN dmvt b ON a.ma_vt = b.ma_vt
		GROUP BY a.stt_rec, a.ln, a.ln2, a.so_ct, a.ma_vt
		HAVING sum(sl_nhap_qt - sl_xuat_qt) > 0
LOOP
	RETURN NEXT r; 
END LOOP;
RETURN;
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.qc1tranpxb(character varying, date, date, character varying, character varying)
  OWNER TO postgres;
