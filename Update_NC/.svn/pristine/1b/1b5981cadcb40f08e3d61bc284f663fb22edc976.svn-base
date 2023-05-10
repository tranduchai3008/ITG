-- Function: public.mfgetdatasx_ng(character varying, date, date, character varying)

-- DROP FUNCTION public.mfgetdatasx_ng(character varying, date, date, character varying);

CREATE OR REPLACE FUNCTION public.mfgetdatasx_ng(cma_dvcs character varying, dfrom date, dto date, cso_ct_pd1 character varying)
  RETURNS SETOF mfgetdatasx_ng_return AS
$BODY$DECLARE
	r mfgetdatasx_ng_return;
	r1 record;		
BEGIN	 --select * from mfgetdatasx_ng('01','20230101','20230426','');
	---Lenh sx - Chi tiet theo cong doan san xuat
	DROP TABLE IF EXISTS ph87_tmp;
	CREATE TEMP TABLE ph87_tmp AS
	SELECT a.stt_rec, a.stt_rec AS stt_rec_pd1, TRIM(b.so_ct) AS so_ct_pd1, b.ngay_ct AS ngay_ct_pd1, 
		a.so_luong AS so_luong_pd1, a.ma_vt, a.dvt, a.he_so, a.ma_vv, b.dien_giai, a.po_khsx, a.dau_tuan
	FROM ct87sp a left join ph87 b on a.stt_rec = b.stt_rec
	WHERE   CASE WHEN dfrom = '19000101' THEN 1 = 1 ELSE b.ngay_ct >= dfrom END
		AND CASE WHEN dto = '19000101' THEN 1 = 1 ELSE b.ngay_ct <= dto END
		AND TRIM(b.so_ct) LIKE cso_ct_pd1 || '%'		
		AND (b.status = '2' or b.status = '3' or b.status = '4');
		
	--Phieu thong ke phan xuong phat sinh
	DROP TABLE IF EXISTS cttksx_tmp;
	CREATE TEMP TABLE cttksx_tmp AS
	SELECT stt_rec_pd1, MAX(so_ct_pd1) AS so_ct_pd1, ma_vt, SUM(so_luong_hong) AS so_luong_hong, max(ma_thao_tac) as ma_thao_tac
	FROM cttksx WHERE EXISTS(SELECT stt_rec FROM ph87_tmp WHERE cttksx.stt_rec_pd1 = ph87_tmp.stt_rec)
			AND EXISTS(SELECT stt_rec FROM phtksx WHERE cttksx.stt_rec = phtksx.stt_rec AND phtksx.status <> '0')			
	GROUP BY stt_rec_pd1, ma_vt
	HAVING SUM(so_luong_hong) >0
	UNION ALL
	SELECT stt_rec_pd1, MAX(so_ct_pd1) AS so_ct_pd1, ma_vt, SUM(so_luong_hong) AS so_luong_hong, ''::character varying as ma_thao_tac
	FROM ctqcsp WHERE EXISTS(SELECT stt_rec FROM ph87_tmp WHERE ctqcsp.stt_rec_pd1 = ph87_tmp.stt_rec)
			AND EXISTS(SELECT stt_rec FROM phqcsp WHERE ctqcsp.stt_rec = phqcsp.stt_rec AND phqcsp.status <> '0')
	GROUP BY stt_rec_pd1, ma_vt
	HAVING SUM(so_luong_hong) >0;	
	
	--Bang luu KQ
	DROP TABLE IF EXISTS cttksx_return_tmp;
	CREATE TEMP TABLE cttksx_return_tmp AS
	SELECT 0 AS tag, stt_rec_pd1, MAX(so_ct_pd1) AS so_ct_pd1, MAX(ngay_ct_pd1) AS ngay_ct_pd1,
		ma_vt, ''::VARCHAR AS ten_vt, max(dvt) AS dvt, MAX(he_so) AS he_so, MAX(ma_vv) AS ma_vv,
		SUM(so_luong_pd1) AS so_luong_pd1, SUM(sl_nhap_qt) AS sl_nhap_qt, SUM(sl_xuat_qt) AS sl_xuat_qt,
		SUM(sl_nhap_qt - sl_xuat_qt) AS so_luong, MAX(dien_giai) AS dien_giai, ''::VARCHAR AS ma_kho_vt, max(ma_thao_tac) as ma_thao_tac,
		MAX(po_khsx) AS po_khsx, MAX(dau_tuan) as dau_tuan
	FROM
	(
		SELECT stt_rec_pd1, so_ct_pd1, ngay_ct_pd1, ma_vt, dvt, he_so, ma_vv,
			so_luong_pd1, 0::ud_float AS sl_nhap_qt, 0::ud_float AS sl_xuat_qt, 0::ud_float AS so_luong, dien_giai, ''::character varying as ma_thao_tac,
			po_khsx, dau_tuan
		FROM ph87_tmp 
		UNION ALL
		SELECT stt_rec_pd1, so_ct_pd1, '19000101'::DATE AS ngay_ct_pd1, ma_vt, ''::VARCHAR AS dvt, 1 AS he_so, ''::VARCHAR AS ma_vv,
			0::ud_float AS so_luong_pd1, so_luong_hong AS sl_nhap_qt, 0::ud_float AS sl_xuat_qt, 0::ud_float AS so_luong, ''::VARCHAR AS dien_giai, 
			ma_thao_tac as ma_thao_tac, ''::VARCHAR AS po_khsx, ''::VARCHAR AS dau_tuan
		FROM cttksx_tmp 
		UNION ALL
		SELECT stt_rec_pd1, TRIM(so_ct_pd1) AS so_ct_pd1, '19000101'::DATE AS ngay_ct_pd1, ma_vt, ''::VARCHAR AS dvt, 1 AS he_so, ''::VARCHAR AS ma_vv,
			0::ud_float AS so_luong_pd1, 0::ud_float AS sl_nhap_qt,so_luong AS sl_xuat_qt, 0::ud_float AS so_luong, ''::VARCHAR AS dien_giai, 
			''::character varying as ma_thao_tac, ''::VARCHAR AS po_khsx, ''::VARCHAR AS dau_tuan
		FROM ct74 
		WHERE EXISTS(SELECT stt_rec FROM ph87_tmp WHERE ct74.stt_rec_pd1 = ph87_tmp.stt_rec)
			AND EXISTS(SELECT stt_rec FROM ph74 WHERE ct74.stt_rec = ph74.stt_rec AND ph74.status <> '0')
			and ma_kho in (select ma_kho from dmkho where ng_yn = 1)
		
	) A GROUP BY stt_rec_pd1, ma_vt;	
	
	UPDATE cttksx_return_tmp a SET ten_vt = b.ten_vt, ma_kho_vt = b.ma_kho FROM dmvt b WHERE a.ma_vt = b.ma_vt;	
	
	-------RETURN---------	
	FOR r IN SELECT * FROM cttksx_return_tmp WHERE so_luong <> 0
	LOOP
		RETURN NEXT r;
	END LOOP;
	
	RETURN;
END$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.mfgetdatasx_ng(character varying, date, date, character varying)
  OWNER TO postgres;
