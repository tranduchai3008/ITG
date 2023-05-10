-- Function: public.mfgetdatafromph87(character varying, date, date, character varying, character varying, date)

-- DROP FUNCTION public.mfgetdatafromph87(character varying, date, date, character varying, character varying, date);

CREATE OR REPLACE FUNCTION public.mfgetdatafromph87(cma_dvcs character varying, dfrom date, dto date, cso_ct_pd1 character varying, cma_thao_tac character varying, dtct date)
  RETURNS SETOF mfgetdatafromph87_return AS
$BODY$DECLARE
	r mfgetdatafromph87_return;
	r1 record;
	_so_luong ud_float:=0;
	_so_luong_bat ud_float:=0;
	_so_luong_bat_cdt ud_float:=0;
	_stt integer:=0;
	_ma_vt_cdt character varying := '';	
	_ma_thao_tac_cdt character varying := '';	
BEGIN	
	-- select * from mfgetdatafromph87('01', '2020-01-05', '2020-01-07', '01-2001-00037', 'DNTC', '2020-03-05');
	
	---Lenh sx - Chi tiet theo cong doan san xuat
	DROP TABLE IF EXISTS ct87a_tmp; -- select * from 
	CREATE TEMP TABLE ct87a_tmp AS-- select * from ct87a_tmp ct87a_tmp
	SELECT ct.stt_rec, ct.stt_rec AS stt_rec_pd1, sp.ln as ln_pd1, TRIM(ct.so_ct) AS so_ct_pd1, ct.ngay_ct AS ngay_ct_pd1, stt, 
		sp.so_luong AS so_luong_pd1, sp.ma_vt, sp.dvt1, sp.he_so, sp.ma_vv, 
		sp.stt_rec_dh, sp.so_dh, sp.ln_dh, sp.stt_rec_kh1, sp.so_ct_kh1, sp.ln_kh1, sp.ma_kho, sp.so_luong1 as so_luong_pd1b, sp.so_luong as so_luong_pd1c,
		ph.status, ct.ma_thao_tac
	FROM ct87a ct LEFT JOIN ph87 ph ON ct.stt_rec = ph.stt_rec
		left join ct87sp sp on ct.stt_rec = sp.stt_rec and ct.ln_item = sp.ln
	WHERE   CASE WHEN dfrom = '19000101' THEN 1 = 1 ELSE ct.ngay_ct >= dfrom END
		AND CASE WHEN dto = '19000101' THEN 1 = 1 ELSE ct.ngay_ct <= dto END
		AND TRIM(ct.so_ct) LIKE '%' || cso_ct_pd1
		AND ct.ma_thao_tac =  cma_thao_tac
		and ph.ma_gd <> 2
		-- AND (ph.status <> '0' ) 
		and ph.status not in('0', '1', '2', '6', '7')
		--and sp.close_yn = 0;
		And inlist(ph.ma_dvcs , cma_dvcs);
		
	--Phieu thong ke phan xuong phat sinh
	DROP TABLE IF EXISTS cttksx_tmp;
	CREATE TEMP TABLE cttksx_tmp AS -- select * from  cttksx_tmp
	SELECT ma_thao_tac, stt_rec_pd1, ln_pd1, so_ct_pd1, '19000101'::date AS ngay_ct_pd1, 0::ud_float AS so_luong_pd1, ma_vt, dvt dvt1, he_so, ma_vv, so_luong, so_luong_hong,
		stt_rec_dh, so_dh, ln_dh, stt_rec_kh1, so_ct_kh1, ln_kh1, stt_rec, so_ct, ln, stt_rec_tk1, so_ct_tk1, ln_tk1, ma_kho, 
		0::ud_float AS so_luong_pd1b, 0::ud_float AS so_luong_pd1c, dau_tuan, po_khsx
	FROM cttksx 
	WHERE EXISTS(SELECT stt_rec FROM ct87a_tmp WHERE cttksx.stt_rec_pd1 = ct87a_tmp.stt_rec_pd1)
			AND EXISTS(SELECT stt_rec FROM phtksx WHERE cttksx.stt_rec = phtksx.stt_rec AND phtksx.status <> '0');

	UPDATE cttksx_tmp a SET so_luong_pd1 = b.so_luong_pd1, so_luong_pd1b = b.so_luong_pd1b, so_luong_pd1c = b.so_luong_pd1c, ngay_ct_pd1 = b.ngay_ct_pd1 
			FROM ct87a_tmp b WHERE a.stt_rec_pd1 = b.stt_rec_pd1 AND a.ma_vt = b.ma_vt;

	update cttksx_tmp a SET ma_thao_tac = b.ma_thao_tac from phtksx b where a.stt_rec = b.stt_rec;
	--Bang luu KQ
	DROP TABLE IF EXISTS cttksx_return_tmp;
	CREATE TEMP TABLE cttksx_return_tmp
	(
		tag ud_smallint,
		stt_rec_tk1 ud_stt_rec,  
		so_ct_tk1 ud_stt_rec,  
		ln_tk1 ud_smallint,	   
		ma_thao_tac ud_ma,
		ten_thao_tac character varying,  
		stt_rec_pd1 ud_stt_rec,
		ln_pd1 ud_smallint,
		so_ct_pd1 ud_so_ct,
		ngay_ct_pd1 ud_ngay,	   
		ma_vt ud_ma,
		ten_vt ud_ten,
		dvt1 character varying,
		he_so ud_float,   
		ma_vv character varying,    
		so_luong_pd1 ud_float,
		sl_nhap_qt ud_float,
		sl_xuat_qt ud_float,    
		so_luong ud_float,   
		dien_giai character varying,
		stt_rec_dh ud_stt_rec,
		so_dh ud_so_ct,
		ln_dh ud_smallint,
		stt_rec_kh1 ud_stt_rec,
		so_ct_kh1 ud_so_ct,
		ln_kh1 ud_smallint,
		ma_kho ud_ma,
		so_luong_bat ud_float,
		so_luong_pd1b ud_float,
		so_luong_pd1c ud_float,
		dau_tuan ud_ma,
		po_khsx ud_ma
		
	);	
	
	FOR r1 IN SELECT * FROM ct87a_tmp LOOP
		IF r1.stt = 1 THEN --Cong doan dau tien. He thong se lay tu lenh san xuat
			INSERT INTO cttksx_return_tmp(stt_rec_pd1, ln_pd1, so_ct_pd1, ngay_ct_pd1, ma_vt, dvt1, he_so, ma_vv, so_luong_pd1, sl_nhap_qt, sl_xuat_qt, so_luong,
						      stt_rec_dh, so_dh, ln_dh, stt_rec_kh1, so_ct_kh1, ln_kh1, ma_kho, so_luong_bat, so_luong_pd1b, so_luong_pd1c, ma_thao_tac)
			SELECT stt_rec_pd1, max(ln_pd1) as ln_pd1, MAX(so_ct_pd1) AS so_ct_pd1, MAX(ngay_ct_pd1) AS ngay_ct_pd1, 
				ma_vt, MAX(dvt1) AS dvt1, MAX(he_so) AS he_so, MAX(ma_vv) AS ma_vv, 
				SUM(so_luong_pd1) AS so_luong_pd1, SUM(sl_nhap_qt) AS sl_nhap_qt, SUM(sl_xuat_qt) AS sl_xuat_qt, SUM(sl_nhap_qt - sl_xuat_qt)  AS so_luong,
				MAX(stt_rec_dh) AS stt_rec_dh, MAX(so_dh) AS so_dh, MAX(ln_dh) AS ln_dh, MAX(stt_rec_kh1) AS stt_rec_kh1, MAX(so_ct_kh1) AS so_ct_kh1, 
				MAX(ln_kh1) AS ln_kh1, MAX(ma_kho) AS ma_kho, 0::ud_float as so_luong_bat, SUM(so_luong_pd1b) as so_luong_pd1b, SUM(so_luong_pd1c) as so_luong_pd1c, 
				MAX(ma_thao_tac) as ma_thao_tac
			FROM
			(
				SELECT stt_rec_pd1, ln_pd1, so_ct_pd1, ngay_ct_pd1, ma_vt, dvt1, he_so, ma_vv, so_luong_pd1, so_luong_pd1 AS sl_nhap_qt, 0::ud_float AS sl_xuat_qt,
					stt_rec_dh, so_dh, ln_dh, stt_rec_kh1, so_ct_kh1, ln_kh1, ma_kho, so_luong_pd1b, so_luong_pd1c, '':: varchar ma_thao_tac
				FROM ct87a_tmp
				WHERE stt_rec_pd1 = r1.stt_rec and ln_pd1 = r1.ln_pd1
				and status <> '0'

				UNION ALL

				SELECT stt_rec_pd1, ln_pd1, ''::VARCHAR AS so_ct_pd1, '19000101'::DATE AS ngay_ct_pd1, ma_vt, ''::VARCHAR AS dvt1, 0::ud_float AS he_so, ma_vv, 
					0::ud_float AS so_luong_pd1, 0::UD_float AS sl_nhap_qt, so_luong + so_luong_hong AS sl_xuat_qt,
					stt_rec_dh, so_dh, ln_dh, stt_rec_kh1, so_ct_kh1, ln_kh1, ma_kho, 0::ud_float AS so_luong_pd1b, 0::ud_float AS so_luong_pd1c, '':: varchar ma_thao_tac
				FROM cttksx_tmp
				WHERE stt_rec_pd1 = r1.stt_rec and ln_pd1 = r1.ln_pd1 AND ma_thao_tac = cma_thao_tac
			) A GROUP BY stt_rec_pd1, ma_vt;
			
		ELSE--CONG DOAN SAU
			INSERT INTO cttksx_return_tmp(stt_rec_tk1, so_ct_tk1, ln_tk1, ma_thao_tac, stt_rec_pd1, ln_pd1, so_ct_pd1, ngay_ct_pd1, 
				ma_vt, dvt1, he_so, ma_vv, so_luong_pd1, 
				sl_nhap_qt, sl_xuat_qt, so_luong, stt_rec_dh, so_dh, ln_dh, stt_rec_kh1, so_ct_kh1, ln_kh1, ma_kho, so_luong_bat, so_luong_pd1b, so_luong_pd1c, dau_tuan)
			SELECT stt_rec_tk1, so_ct_tk1, ln_tk1, MAX(ma_thao_tac), stt_rec_pd1, MAX(ln_pd1) as ln_pd1, MAX(so_ct_pd1) AS so_ct_pd1, MAX(ngay_ct_pd1) AS ngay_ct_pd1, 
				ma_vt, MAX(dvt1) AS dvt1, MAX(he_so) AS he_so, MAX(ma_vv) AS ma_vv, 
				SUM(so_luong_pd1) AS so_luong_pd1, SUM(sl_nhap_qt) AS sl_nhap_qt, SUM(sl_xuat_qt) AS sl_xuat_qt, SUM(sl_nhap_qt - sl_xuat_qt)  AS so_luong,
				MAX(stt_rec_dh) AS stt_rec_dh, MAX(so_dh) AS so_dh, MAX(ln_dh) AS ln_dh, 
				MAX(stt_rec_kh1) AS stt_rec_kh1, MAX(so_ct_kh1) AS so_ct_kh1, MAX(ln_kh1) AS ln_kh1, MAX(ma_kho) AS ma_kho, 0::ud_float as so_luong_bat,
				SUM(so_luong_pd1b) as so_luong_pd1b, SUM(so_luong_pd1c) as so_luong_pd1c, MAX(dau_tuan) as dau_tuan, MAX(po_khsx) as po_khsx
			FROM
			(
				SELECT stt_rec as stt_rec_tk1, trim(so_ct) as so_ct_tk1, ln as ln_tk1, ma_thao_tac, stt_rec_pd1, ln_pd1, so_ct_pd1, ngay_ct_pd1, 
					ma_vt, dvt1, he_so, ma_vv, so_luong_pd1, 
					so_luong AS sl_nhap_qt, 0::ud_float AS sl_xuat_qt, stt_rec_dh, so_dh, ln_dh, stt_rec_kh1, so_ct_kh1, ln_kh1, ma_kho, so_luong_pd1b,
					so_luong_pd1c, dau_tuan, po_khsx
				FROM cttksx_tmp
				WHERE stt_rec_pd1 = r1.stt_rec and ln_pd1 = r1.ln_pd1-- ma_vt = r1.ma_vt 
					AND ma_thao_tac IN (SELECT ma_thao_tac FROM ct87a WHERE stt_rec = r1.stt_rec AND ln_item = r1.ln_pd1 AND stt = r1.stt - 1)
				
				UNION ALL
				SELECT stt_rec_tk1 as stt_rec_tk1, trim(so_ct_tk1) as so_ct_tk1, ln_tk1 as ln_tk1,''::varchar AS ma_thao_tac, stt_rec_pd1, ln_pd1, 
					''::VARCHAR AS so_ct_pd1, '19000101'::DATE AS ngay_ct_pd1, 
					ma_vt, ''::VARCHAR AS dvt1, 0::ud_float AS he_so, ma_vv, 
					0::ud_float AS so_luong_pd1, 0::UD_float AS sl_nhap_qt, so_luong + so_luong_hong AS sl_xuat_qt,
					stt_rec_dh, so_dh, ln_dh, stt_rec_kh1, so_ct_kh1, ln_kh1, ma_kho, 0::ud_float AS so_luong_pd1b, 0::ud_float AS so_luong_pd1c, dau_tuan, po_khsx
				FROM cttksx_tmp
				WHERE stt_rec_pd1 = r1.stt_rec AND ma_thao_tac = cma_thao_tac AND ln_pd1 = r1.ln_pd1
			) A GROUP BY stt_rec_tk1, so_ct_tk1, ln_tk1, stt_rec_pd1, ma_vt;		
		END IF;
	END LOOP;
	UPDATE cttksx_return_tmp a SET ten_thao_tac = b.ten_thao_tac FROM mfdmthaotac b WHERE a.ma_thao_tac = b.ma_thao_tac;
	UPDATE cttksx_return_tmp a SET ten_vt = b.ten_vt FROM dmvt b WHERE a.ma_vt = b.ma_vt;	

--	FOR r1 IN SELECT * FROM cttksx_return_tmp LOOP
--		_so_luong := r1.so_luong;
--		select so_luong_bat into _so_luong_bat from dmbom2 where ma_sp = r1.ma_vt and ma_thao_tac = cma_thao_tac and dtct >= ngay_hl1 and dtct <= ngay_hl2;
--		Update cttksx_return_tmp set so_luong_bat = (select so_luong_bat from dmbom2 where ma_sp = r1.ma_vt and ma_thao_tac = r1.ma_thao_tac and dtct >= ngay_hl1 and dtct <= ngay_hl2) 
--						where stt_rec_pd1 = r1.stt_rec_pd1 and ln_pd1 = r1.ln_pd1 and ma_vt = r1.ma_vt;
--		select stt into _stt from ct87a where stt_rec = r1.stt_rec_pd1 and ma_thao_tac = cma_thao_tac and ma_vt_item = r1.ma_vt;
--		if _so_luong_bat <> 0 and _stt = 1 then
--			--r1.so_luong := r1.so_luong / _so_luong_bat;
--			Update cttksx_return_tmp set sl_nhap_qt = sl_nhap_qt /_so_luong_bat where stt_rec_pd1 = r1.stt_rec_pd1 and ln_pd1 = r1.ln_pd1 and ma_vt = r1.ma_vt;
--			Update cttksx_return_tmp set so_luong = sl_nhap_qt - sl_xuat_qt where stt_rec_pd1 = r1.stt_rec_pd1 and ln_pd1 = r1.ln_pd1 and ma_vt = r1.ma_vt;
--		end if;
--		if _so_luong_bat <> 0 and _stt <> 1 Then
--			SELECT b.ma_vt into _ma_vt_cdt from ct87a a left join ct87sp b on a.stt_rec = b.stt_rec and a.ln_item = b.ln 
--				WHERE a.stt_rec = r1.stt_rec_pd1 and a.stt = _stt - 1 and ma_vt_item = r1.ma_vt;
--			select ma_thao_tac into _ma_thao_tac_cdt from ct87a where stt_rec = r1.stt_rec_pd1 and stt = _stt - 1 and ma_vt_item = r1.ma_vt;
--			select so_luong_bat into _so_luong_bat_cdt from dmbom2 
--				where ma_sp = _ma_vt_cdt and ma_thao_tac = _ma_thao_tac_cdt and dtct >= ngay_hl1 and dtct <= ngay_hl2;
			--r1.so_luong := r1.so_luong * _so_luong_bat_cdt / _so_luong_bat;
--			Update cttksx_return_tmp set sl_nhap_qt = sl_nhap_qt * _so_luong_bat_cdt /_so_luong_bat 
--				where stt_rec_pd1 = r1.stt_rec_pd1 and ln_pd1 = r1.ln_pd1 and ma_vt = r1.ma_vt;
--			Update cttksx_return_tmp set so_luong = sl_nhap_qt - sl_xuat_qt where stt_rec_pd1 = r1.stt_rec_pd1 and ln_pd1 = r1.ln_pd1 and ma_vt = r1.ma_vt;
--		end if;
--	end loop;
	-------RETURN---------	
	FOR r IN SELECT * FROM cttksx_return_tmp WHERE so_luong > 0
	LOOP
		RETURN NEXT r;
	END LOOP;
	
	RETURN;
END$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.mfgetdatafromph87(character varying, date, date, character varying, character varying, date)
  OWNER TO postgres;
