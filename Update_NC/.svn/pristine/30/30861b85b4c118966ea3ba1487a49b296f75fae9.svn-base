-- Function: public.sobk12(character varying)

-- DROP FUNCTION public.sobk12(character varying);

CREATE OR REPLACE FUNCTION public.sobk12(_where character varying)
  RETURNS SETOF sobk12_return AS
$BODY$DECLARE	
	r sobk12_return;  
	strSQL character varying; 
BEGIN
	-- SELECT * FROM sobk12('1=1')
	
	DROP TABLE IF EXISTS sobk12_tmp;
	
	strSQL	:=	'CREATE TEMP TABLE sobk12_tmp AS
		SELECT 5 :: ud_smallint AS sysorder, 1 :: ud_smallint AS sysprint, 1 :: ud_smallint AS systotal,
		ct70.ma_vt, ct70.dvt, ct70.sl_nhap, ct70.sl_xuat, ct70.gia_nt2, ct70.tien_nt2, ct70.tien_nt_x, ct70.tien_nt_n, ct70.thue_nt, ct70.ck_nt, ct70.gia_nt, ct70.gia2,
		ct70.tien2, ct70.tien_xuat, ct70.tien_nhap, ct70.thue, ct70.ck, ct70.gia, ct70.ma_nx, ct70.ma_kho, ct70.ma_vv, ct70.ma_ct, 
		ct70.dien_giai, ct70.dien_giai AS dien_giai2, ct70.stt_rec, ct70.ln, ct70.ngay_ct, 
		trim(ct70.so_ct) as so_ct, ct70.tien2 - ct70.ck + ct70.thue as pt, ct70.tien_nt2 - ct70.ck_nt + ct70.thue_nt as pt_nt, ct70.sl_nhap + ct70.sl_xuat as so_luong, 
		ct70.tien_nhap + ct70.tien_xuat as tien, ct70.tien_nt_n + ct70.tien_nt_x as tien_nt, dmkh.ma_kh, dmkh.ten_kh as ten_kh, dmkh.ten_kh2 as ten_kh2, 
		dmvt.ten_vt as ten_vt, dmvt.ten_vt2 as ten_vt2, ct81.ma_vi_tri_kh as mau_hd, ph81.so_seri, ph81.so_hd,
		to_char(ct70.ngay_ct, ''yyyymmdd'') || trim(ct70.so_ct) || ct70.stt_rec as rp_group, ph81.ma_nt, ph81.ty_gia, ct81.gio_gh, ct81.sl_duyet as sl_duyet,
		(ct81.sl_duyet * ct81.gia_nt2) as tien2_closing, (ct81.sl_duyet * ct81.gia_nt2 * ct81.thue_suat) / 100 as thue_closing, 
		(ct81.sl_duyet * ct81.gia_nt2 * ct81.pt_ck) / 100 as ck_closing, 
		((ct81.sl_duyet * ct81.gia_nt2) - ((ct81.sl_duyet * ct81.gia_nt2 * ct81.pt_ck) / 100) + ((ct81.sl_duyet * ct81.gia_nt2 * ct81.thue_suat) / 100)) as pt_closing,
		ct81.so_po as so_po , dmvt.model as model, ph81.so_ecis
	FROM ct70 ct70  LEFT JOIN dmkh dmkh ON ct70.ma_kh = dmkh.ma_kh  
	LEFT JOIN dmvt dmvt ON ct70.ma_vt = dmvt.ma_vt  
	LEFT JOIN ph81 ph81 ON ct70.stt_rec = ph81.stt_rec  
	LEFT JOIN dmkho dmkho ON ct70.ma_kho = dmkho.ma_kho 
	LEFT JOIN ct81 ct81 ON ct70.stt_rec = ct81.stt_rec AND ct70.ln = ct81.ln
	WHERE '|| _where;
	-- RAISE NOTICE 'strSQL = %', strSQL;
	EXECUTE strSQL;
	update sobk12_tmp a set mau_hd = b.ten_vi_tri_kh from dmvitrikh b where a.mau_hd = b.ma_vi_tri_kh and a.ma_kh = b.ma_kh;
	
	INSERT INTO sobk12_tmp
	SELECT 3 :: ud_smallint AS sysorder, 1 :: ud_smallint AS sysprint, 0 :: ud_smallint AS systotal,
		MAX(ma_kh) ma_vt, '' dvt, SUM(sl_nhap), SUM(sl_xuat), 0 gia_nt2, SUM(tien_nt2), SUM(tien_nt_x), SUM(tien_nt_n), SUM(thue_nt), SUM(ck_nt), 0 gia_nt, 0 gia2,
		SUM(tien2), SUM(tien_xuat), SUM(tien_nhap), SUM(thue), SUM(ck), 0 gia, '' ma_nx, '' ma_kho, '' ma_vv, MAX(ma_ct), 
		MAX(dien_giai), MAX(dien_giai2), stt_rec, 0 ln, MAX(ngay_ct), 
		MAX(so_ct), SUM(pt), SUM(pt_nt), SUM(so_luong), 
		SUM(tien), SUM(tien_nt), MAX(ma_kh), MAX(ten_kh), MAX(ten_kh2), 
		MAX(ten_kh) ten_vt, MAX(ten_kh2) ten_vt2, max(mau_hd), MAX(so_seri), MAX(so_hd),
		to_char(MAX(ngay_ct), 'yyyymmdd') || MAX(so_ct) || stt_rec as rp_group, max(ma_nt) as ma_nt, max(ty_gia) as ty_gia, max(gio_gh) as gio_gh,
		sum(sl_duyet) as sl_duyet, sum(tien2_closing) as tien2_closing, sum(thue_closing) as thue_closing, sum(ck_closing) as ck_closing, sum(pt_closing) as pt_closing, 
		null as so_po
	FROM sobk12_tmp WHERE systotal = 1
	GROUP BY stt_rec;

	INSERT INTO sobk12_tmp
	SELECT 1 :: ud_smallint AS sysorder, 1 :: ud_smallint AS sysprint, 0 :: ud_smallint AS systotal,
		'' ma_vt, '' dvt,NULL, NULL, NULL gia_nt2, NULL, NULL, NULL, NULL, NULL, NULL gia_nt, NULL gia2,
		NULL, NULL, NULL, NULL, NULL, NULL gia, '' ma_nx, '' ma_kho, '' ma_vv, '', 
		'', '', '' stt_rec, NULL ln, NULL, 
		'', NULL, NULL, NULL, 
		NULL, NULL,'', '', '', 
		'' ten_vt, '' ten_vt2, '', '', '',
		'' as rp_group, '' as ma_nt, null as ty_gia, null as gio_gh,
		NULL sl_duyet, null tien2_closing, null thue_closing, null ck_closing, null pt_closing, null so_po;

	INSERT INTO sobk12_tmp
	SELECT 0 :: ud_smallint AS sysorder, 1 :: ud_smallint AS sysprint, 0 :: ud_smallint AS systotal,
		'' ma_vt, '' dvt, SUM(sl_nhap), SUM(sl_xuat), 0 gia_nt2, SUM(tien_nt2), SUM(tien_nt_x), SUM(tien_nt_n), SUM(thue_nt), SUM(ck_nt), 0 gia_nt, 0 gia2,
		SUM(tien2), SUM(tien_xuat), SUM(tien_nhap), SUM(thue), SUM(ck), 0 gia, '' ma_nx, '' ma_kho, '' ma_vv, MAX(ma_ct), 
		'', '', '' stt_rec, 0 ln, NULL, 
		'', SUM(pt), SUM(pt_nt), SUM(so_luong), 
		SUM(tien), SUM(tien_nt),'', 'TỔNG CỘNG', 'TỔNG CỘNG', 
		'TỔNG CỘNG' ten_vt, 'TỔNG CỘNG' ten_vt2, '', '', '', 
		'' as rp_group, '' as ma_nt, null as ty_gia, null as gio_gh,
		sum(sl_duyet) as sl_duyet, sum(tien2_closing) as tien2_closing, sum(thue_closing) as thue_closing, sum(ck_closing) as ck_closing, sum(pt_closing) as pt_closing,
		null as so_po
	FROM sobk12_tmp WHERE systotal = 1;
	
	FOR r IN SELECT * FROM sobk12_tmp ORDER BY stt_rec, sysorder, ngay_ct, so_ct
	LOOP     
		IF r.sysorder = 5 THEN
			r.ma_nt = null;
			r.ty_gia = null;
		END IF;
		RETURN NEXT r;

	END LOOP;
        DROP TABLE IF EXISTS sobk12_tmp;
	RETURN;
END$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.sobk12(character varying)
  OWNER TO postgres;
