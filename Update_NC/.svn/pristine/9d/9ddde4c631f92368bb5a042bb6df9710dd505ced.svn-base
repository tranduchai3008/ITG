-- Function: public.inctto2(date, date, character varying, character varying)

-- DROP FUNCTION public.inctto2(date, date, character varying, character varying);

CREATE OR REPLACE FUNCTION public.inctto2(dtfrom date, dtto date, cso_ct character varying, cgio_gh character varying)
  RETURNS SETOF inctto21_return AS
$BODY$DECLARE
	r inctto21_return;
	--_stt INT:=0; 
	-- select  0 as tag,* from inctto2('2019-01-01', '2019-10-10', '', '') where so_ct ='' and ma_vt = '20387208' order by ma_vt, gio_gh
BEGIN
	DROP  TABLE IF EXISTS inctto2_temp ;
	CREATE TEMP TABLE inctto2_temp AS	
	SELECT  a.stt_rec AS stt_rec, 0 AS ln, 0 AS ln2, MAX(a.so_ct) AS so_ct, a.ma_vt AS ma_vt, max(a.dvt) AS dvt, MAX(a.he_so) AS he_so, max(a.ma_lo) AS ma_lo, 
		max(a.ma_kho) AS ma_kho, MAX(a.gio_gh) AS gio_gh, sum(a.sl_nhap_qt) AS sl_nhap_qt, sum(a.sl_xuat_qt) AS sl_xuat_qt, sum(a.sl_nhap_qt - a.sl_xuat_qt) AS sl_con_lai, 
		sum(a.sl_nhap_qt - a.sl_xuat_qt) AS so_luong, max(b.ten_vt) AS ten_vt, max(b.ten_vt2) AS ten_vt2, max(b.tk_vt) AS tk_vt, max(a.so_po) AS so_po, 
		max(a.so_do) AS so_do, max(a.so_dh) AS so_dh, ngay_dong_cont AS ngay_cont, ''::ud_ma AS so_ecis, max(a.po_khsx) as po_khsx, max(a.dau_tuan) as dau_tuan
	FROM(
		SELECT b.stt_rec AS stt_rec, 0 /*MAX(a.ln)*/ as ln, MAX(c.ln) AS ln2, MAX(trim(b.so_ct)) AS so_ct,MAX(c.ma_vt) ma_vt, MAX(c.dvt) dvt, MAX(c.he_so) he_so, 
			MAX(c.ma_lo) ma_lo, MAX(c.ma_kho) ma_kho, 
			null :: time AS gio_gh, MAX(c.so_luong) AS sl_nhap_qt, 
			0 AS sl_xuat_qt, MAX(c.so_po) so_po, MAX(so_do) so_do, MAX(c.so_dh) so_dh, ngay_dong_cont,  ''::character varying AS po_khsx, ''::character varying AS dau_tuan
		FROM --ctkhgh a left join 
			ph96 b --on a.stt_rec = b.stt_rec_dh 
			left join 
			ct96 c on b.stt_rec = c.stt_rec --a.stt_rec = c.stt_rec_dh AND a.ln_item = c.ln
			left join ctcont d
			on c.stt_rec = d.stt_rec and c.so_ecis = d.so_ecis and c.ma_noi_nhan = d.ma_noi_nhan
		WHERE --CASE WHEN  dtFROM = '19000101' THEN 1=1 else  a.ngay_phai_gh >= dtFROM END
		-- AND CASE WHEN  dtto = '19000101' THEN 1=1 else  a.ngay_phai_gh <= dtto END
		c.dong_yn = 0 and
		CASE WHEN  dtFROM = '19000101' THEN 1=1 else  b.ngay_ct >= dtFROM END
		AND CASE WHEN  dtto = '19000101' THEN 1=1 else  b.ngay_ct <= dtto END
		AND b.status <> '0'
		AND INLIST(trim(b.so_ct), cso_ct)
		GROUP BY b.stt_rec, c.ln, d.ngay_dong_cont--b.stt_rec
		-- SELECT * FrOM ph96 where stt_rec = 'A1000000014396033TO2'
		UNION ALL
		SELECT  a.stt_rec_to2 AS stt_rec, 0 AS ln, 0 AS ln2, trim(a.so_ct_to2) AS so_ct, a.ma_vt, a.dvt,a.he_so, a.ma_lo,a.ma_kho, a.gio_gh, 0 AS sl_nhap_qt,
			a.so_luong AS sl_xuat_qt, ''::character varying AS so_po, ''::character varying AS so_do, ''::character varying AS so_dh, a.ngay_cont as ngay_dong_cont,
			 ''::character varying AS po_khsx, ''::character varying AS dau_tuan
		FROM ct85 a left join ph85 b on a.stt_rec = b.stt_rec
		WHERE b.status <> '0'
		AND a.stt_rec_to2 <> ''
		AND a.stt_rec_to2 in  
			(
				select b.stt_rec
				FROM --ctkhgh a left join 
					ph96 b --on a.stt_rec = b.stt_rec_dh 
					left join 
					ct96 c on b.stt_rec = c.stt_rec --a.stt_rec = c.stt_rec_dh AND a.ln_item = c.ln
					left join ctcont d
					on c.stt_rec = d.stt_rec and c.so_ecis = d.so_ecis and c.ma_noi_nhan = d.ma_noi_nhan
				WHERE --CASE WHEN  dtFROM = '19000101' THEN 1=1 else  a.ngay_phai_gh >= dtFROM END
				-- AND CASE WHEN  dtto = '19000101' THEN 1=1 else  a.ngay_phai_gh <= dtto END
				c.dong_yn = 0 and
				CASE WHEN  dtFROM = '19000101' THEN 1=1 else  b.ngay_ct >= dtFROM END
				AND CASE WHEN  dtto = '19000101' THEN 1=1 else  b.ngay_ct <= dtto END
				AND b.status <> '0'
				AND INLIST(trim(b.so_ct), cso_ct)
		
			)
		)a LEFT JOIN dmvt b ON a.ma_vt = b.ma_vt
		GROUP BY a.stt_rec, ngay_dong_cont,  a.ma_vt
		HAVING sum(sl_nhap_qt - sl_xuat_qt) > 0;

			UPDATE inctto2_temp a 
			SET so_do = b.so_do, so_dh = b.so_dh 
			FROM ct96 b 
			WHERE a.stt_rec = b.stt_rec;

			UPDATE inctto2_temp a
			SET so_ecis = b.so_ecis
			FROM ct96 b
			WHERE a.stt_rec = b.stt_rec;

			-- UPDATE inctto2_temp a
-- 			SET ngay_cont = b.ngay_dong_cont
-- 			FROM ctcont b
-- 			WHERE a.stt_rec = b.stt_rec;

			UPDATE inctto2_temp a
			SET gio_gh = now():: ud_time;
	
	FOR r IN SELECT * FROM inctto2_temp ORDER BY ngay_cont
	LOOP
		RETURN NEXT r;
	END LOOP;
RETURN;
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.inctto2(date, date, character varying, character varying)
  OWNER TO postgres;
