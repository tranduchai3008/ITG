-- Function: public.poctpo1close(date, date, character varying, character varying, character varying, character varying, character varying)

-- DROP FUNCTION public.poctpo1close(date, date, character varying, character varying, character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION public.poctpo1close(dfrom date, dto date, cso_ct1 character varying, cso_ct2 character varying, cma_kh character varying, cbranch character varying, cstatus character varying)
  RETURNS SETOF poctpo1close_return AS
$BODY$
DECLARE    
    _r record;
    r poctpo1close_return;
    strSQL character varying;
    _stt smallint;
   
BEGIN
	--select * from poctpo1close('20230401','20230430','','','','01','1')
	CREATE TEMP TABLE tmpph94 AS 
			SELECT ma_dvcs, stt_rec, ma_kh, ma_kh2, ten_kh, ten_kh2, dia_chi, dia_chi2, dien_thoai, 
			dien_thoai2, ong_ba, ong_ba2, ma_gd, ma_bp ,gc_ud1, status
			FROM ph94 
			WHERE (Ngay_ct between dfrom and dto)
			AND (CASE WHEN cso_ct1 <> '' THEN trim(so_ct) >= cso_ct1 ELSE 1=1 END)
			AND (CASE WHEN cso_ct2 <> '' THEN trim(so_ct) <= cso_ct2 ELSE 1=1 END)
			AND (CASE WHEN cstatus <> '1' THEN status = '5' ELSE status <> '5' END)
			AND ma_kh like cma_kh||'%' 
			AND ma_dvcs like cbranch||'%';
		
	strSQL	:= 'CREATE TEMP TABLE tmpTable01 AS
			SELECT stt_rec, max(ln) as ln, MAX(ngay_ct) as ngay_ct, MAX(ma_ct) as ma_ct, MAX(so_ct) as so_ct, ma_vt, SUM(so_luong) as so_luong,SUM(sl_duyet) as sl_duyet,
			max(gia) as gia, max(gia_nt) as gia_nt, sum(tien) as tien, sum(tien_nt) as tien_nt, 
			sum(thue) as thue, sum(thue_nt) as thue_nt, sum(ck) as ck, sum(ck_nt) as ck_nt,
			MAX(stt_rec_01) as stt_rec_01, MAX(so_ct_01) as so_ct_01, MAX(ngay_ct_01) as ngay_ct_01, 
			SUM(so_luong_01) as so_luong_01, SUM(so_luong - so_luong_01) as chenh_lech_01, max(po_khsx) as po_khsx, max(dau_tuan) as dau_tuan
			FROM
			(SELECT ct1.stt_rec, ct1.ln as ln, MAX(ct1.ngay_ct) as ngay_ct, max(ct1.ma_ct) as ma_ct, MAX(ct1.so_ct) as so_ct, ct1.ma_vt as ma_vt, sum(ct1.so_luong) as so_luong,SUM(sl_duyet) as sl_duyet,
				max(ct1.gia) as gia, max(ct1.gia_nt) as gia_nt, sum(ct1.tien) as tien, sum(ct1.tien_nt) as tien_nt, 
				sum(ct1.thue) as thue, sum(ct1.thue_nt) as thue_nt, sum(ct1.ck + ct1.ck2 + ct1.ck3) as ck, sum(ct1.ck_nt + ct1.ck_nt2 + ct1.ck_nt3) as ck_nt,
				'''' as stt_rec_01, '''' as so_ct_01, null as ngay_ct_01, 0 as so_luong_01, 0 as chenh_lech_01, max(ct1.po_khsx) as po_khsx, 
				max(ct1.dau_tuan) as dau_tuan
				FROM ct94 ct1
				WHERE ct1.stt_rec IN (SELECT stt_rec FROM tmpph94)
				GROUP BY ct1.stt_rec, ct1.ln, ct1.ma_vt
			UNION ALL 
			SELECT ct2.stt_rec_dh as stt_rec, ct2.ln_dh as ln, '||quote_literal('19000101')||' as ngay_ct, '''' as ma_ct, '''' as so_ct, ct2.ma_vt as ma_vt, 0 as so_luong, 0 as sl_duyet,
				0 as gia, 0 as gia_nt, 0 as tien, 0 as tien_nt, 0 as thue, 0 as thue_nt, 0 as ck, 0 as ck_nt,
				max(ct2.stt_rec) as stt_rec_01, max(ct2.so_ct) as so_ct_01, max(ct2.ngay_ct) as ngay_ct_01, 
				sum(ct2.so_luong) as so_luong_01, 0 as chenh_lech_01, ''''::character varying po_khsx, ''''::character varying dau_tuan
				FROM ct77 ct2 
				WHERE ct2.stt_rec_dh IN (SELECT stt_rec FROM tmpph94)
				GROUP BY ct2.stt_rec_dh, ct2.ln_dh, ct2.ma_vt
			) 
			a GROUP BY stt_rec, ln, ma_vt';
			
	RAISE NOTICE 'strSQL = %', strSQL;     
	EXECUTE strSQL;
	
	strSQL  := 'CREATE TEMP TABLE tmpTable02 AS 
					SELECT  stt_rec as stt_rec, ln as ln, MAX(ngay_ct) as ngay_ct, MAX(ma_ct) as ma_ct, MAX(so_ct) as so_ct, ma_vt, SUM(so_luong) as so_luong, SUM(sl_duyet) as sl_duyet,
						max(gia) as gia, max(gia_nt) as gia_nt, sum(tien) as tien, sum(tien_nt) as tien_nt,
						sum(thue) as thue, sum(thue_nt) as thue_nt, sum(ck) as ck, sum(ck_nt) as ck_nt,
						MAX(stt_rec_01) as stt_rec_01, MAX(so_ct_01) as so_ct_01, MAX(ngay_ct_01) as ngay_ct_01, 
						SUM(so_luong_01) as so_luong_01, SUM(chenh_lech_01) as chenh_lech_01,
						MAX(stt_rec_12) as stt_rec_12, MAX(so_ct_12) as so_ct_12, MAX(ngay_ct_12) as ngay_ct_12,
						SUM(so_luong_12) as so_luong_12, SUM(so_luong_01 - so_luong_12) as chenh_lech_12,
						max(po_khsx) as po_khsx, max(dau_tuan) as dau_tuan 
						FROM
						(SELECT tmp01.stt_rec as stt_rec, tmp01.ln as ln,  MAX(tmp01.ngay_ct) as ngay_ct, MAX(tmp01.ma_ct) as ma_ct, MAX(tmp01.so_ct) as so_ct, 
							MAX(tmp01.ma_vt) as ma_vt, SUM(tmp01.so_luong) as so_luong, SUM(tmp01.sl_duyet) as sl_duyet, max(tmp01.gia) as gia, max(tmp01.gia_nt) as gia_nt, 
							sum(tmp01.tien) as tien, sum(tmp01.tien_nt) as tien_nt, sum(tmp01.thue) as thue, sum(tmp01.thue_nt) as thue_nt, sum(tmp01.ck) as ck, sum(tmp01.ck_nt) as ck_nt,
							MAX(tmp01.stt_rec_01) as stt_rec_01, 
							MAX(tmp01.so_ct_01) as so_ct_01, MAX(tmp01.ngay_ct_01) as ngay_ct_01, 
							SUM(tmp01.so_luong_01) as so_luong_01, SUM(tmp01.chenh_lech_01) as chenh_lech_01,
							'''' as stt_rec_12, '''' as so_ct_12, null as ngay_ct_12, 0 as so_luong_12, 0 as chenh_lech_12,
							max(tmp01.po_khsx) as po_khsx, max(tmp01.dau_tuan) as dau_tuan
							FROM tmpTable01 tmp01 
							GROUP BY tmp01.stt_rec,tmp01.ln, tmp01.ma_vt 
						UNION ALL
						SELECT  ct3.stt_rec_dh as stt_rec, ct3.ln_dh as ln, '||quote_literal('19000101')||'::ud_ngay as ngay_ct, 
							'||quote_literal('')||'::character varying as ma_ct, '||quote_literal('')||'::character varying as so_ct, 
							ct3.ma_vt as ma_vt, 0 as so_luong, 0 as sl_duyet,  0 as gia, 0 as gia_nt, 0 as tien, 0 as tien_nt, 
							0 as thue, 0 as thue_nt, 0 as ck, 0 as ck_nt, 
							MAX(ct3.stt_rec_pr1) as stt_rec_01, '||quote_literal('')||'::character varying as so_ct_01, 
							'||quote_literal('19000101')||'::ud_ngay as ngay_ct_01, 0 as so_luong_01, 0 as chenh_lech_01,
							MAX(ct3.stt_rec) as stt_rec_12, MAX(ct3.so_ct) as so_ct_12, MAX(ct3.ngay_ct) as ngay_ct_12,
							SUM(ct3.so_luong) as so_luong_12, 0 as chenh_lech_12, ''''::character varying as po_khsx, 
							''''::character varying as dau_tuan 
							FROM ct71 ct3, ph71 ph3 
							WHERE ct3.stt_rec = ph3.stt_rec 
							AND ph3.stt_rec_dh IN (select stt_rec FROM tmpTable01)
							GROUP BY ct3.stt_rec_dh, ct3.ln_dh, ct3.ma_vt
						UNION ALL
						SELECT  ct3.stt_rec_dh as stt_rec, ct3.ln_dh as ln, '||quote_literal('19000101')||'::ud_ngay as ngay_ct, 
							'||quote_literal('')||'::character varying as ma_ct, '||quote_literal('')||'::character varying as so_ct, 
							ct3.ma_vt as ma_vt, 0 as so_luong,0 as sl_duyet, 0 as gia, 0 as gia_nt, 0 as tien, 0 as tien_nt, 
							0 as thue, 0 as thue_nt, 0 as ck, 0 as ck_nt, 
							MAX(ct3.stt_rec_pr1) as stt_rec_01, '||quote_literal('')||'::character varying as so_ct_01, 
							'||quote_literal('19000101')||'::ud_ngay as ngay_ct_01, 0 as so_luong_01, 0 as chenh_lech_01,
							MAX(ct3.stt_rec) as stt_rec_12, MAX(ct3.so_ct) as so_ct_12, MAX(ct3.ngay_ct) as ngay_ct_12,
							SUM(ct3.so_luong) as so_luong_12, 0 as chenh_lech_12,  ''''::character varying as po_khsx, 
							''''::character varying as dau_tuan 
							FROM ct72 ct3, ph72 ph3 
							WHERE ct3.stt_rec = ph3.stt_rec 
							AND ph3.stt_rec_dh IN (select stt_rec FROM tmpTable01)
							GROUP BY ct3.stt_rec_dh,ct3.ln_dh, ct3.ma_vt
						)b GROUP BY stt_rec, ln, ma_vt';  
						 
	EXECUTE strSQL;	
	RAISE NOTICE 'strSQL = %', strSQL;
					
	strSQL	:= 'CREATE TEMP TABLE tmpTable03 AS
				SELECT  max(ph1.ma_dvcs) as ma_dvcs, ct.stt_rec as stt_rec, ct.ln as ln, max(ph1.gc_ud1) as gc_ud1, max(ph1.status) as status,
				max(ct.ma_ct) as ma_ct, max(ct.ngay_ct) as ngay_ct, max(ct.so_ct) as so_ct, 
				SUM(ct.so_luong) as so_luong, SUM(ct.sl_duyet) as sl_duyet, max(gia) as gia, max(gia_nt) as gia_nt, sum(tien) as tien, sum(tien_nt) as tien_nt,
				sum(thue) as thue, sum(thue_nt) as thue_nt, sum(ck) as ck, sum(ck_nt) as ck_nt,
				sum(ct.so_luong_01) as so_luong_01, sum(ct.chenh_lech_01) as chenh_lech_01, 
				MAX(ph1.ma_kh) as ma_kh, MAX(ph1.ten_kh) as ten_kh, MAX(ph1.ten_kh) as ten_kh2, MAX(ph1.ma_gd) as ma_gd, MAX(ph1.ma_bp) as ma_bp,
				MAX(ct.ma_vt) as ma_vt, MAX(dmvt.ten_vt) as ten_vt, MAX(dmvt.dvt) as dvt,
				max(ct.stt_rec_01) as stt_rec_01, max(ct.so_ct_01) as so_ct_01, max(ngay_ct_01) as ngay_ct_01,
				SUM(so_luong_12) as so_luong_12, SUM(chenh_lech_12) as chenh_lech_12, 
				MAX(stt_rec_12) as stt_rec_12, MAX(so_ct_12) as so_ct_12, MAX(ngay_ct_12) as ngay_ct_12, 
				MAX(ct.po_khsx) as po_khsx, MAX(ct.dau_tuan) as dau_tuan,
				'||quote_literal('')||'::character varying as group_code, ''''::character varying as ly_do_dong 
				FROM tmpph94 ph1, tmpTable02 ct, dmvt dmvt  			 
				WHERE ph1.stt_rec = ct.stt_rec 
				AND ct.ma_vt = dmvt.ma_vt 
				GROUP BY ct.stt_rec, ct.ln, ct.ma_vt';		
	
	RAISE NOTICE 'strSQL = %', strSQL;
	EXECUTE strSQL;
--update
	update tmpTable03 a set ly_do_dong = (SELECT ly_do_dong from ph94 where stt_rec = a.stt_rec);
		
	FOR _r IN SELECT * FROM  tmpTable03 order by stt_rec LOOP 
			
			r.app_yn_i	:= 0;
			r.stt		:= _stt;
			r.ma_dvcs	:= _r.ma_dvcs;
			r.stt_rec	:= _r.stt_rec;
			r.ma_ct		:= _r.ma_ct;
			r.ngay_ct	:= _r.ngay_ct;
			r.so_ct		:= _r.so_ct;
			r.ma_kh		:= _r.ma_kh;
			r.ten_kh	:= _r.ten_kh;
			r.ten_kh2	:= _r.ten_kh2;
			r.ma_bp         := _r.ma_bp;
			r.ma_vt		:= _r.ma_vt;
			r.ten_vt	:= _r.ten_vt;
			r.dvt	        := _r.dvt;
			r.so_luong	:= _r.so_luong;
			r.sl_duyet      := _r.sl_duyet;
			r.gia		:= _r.gia;
			r.gia_nt	:= _r.gia_nt;
			r.tien		:= _r.tien;
			r.tien_nt	:= _r.tien_nt;
			r.thue		:= _r.thue;
			r.thue_nt	:= _r.thue_nt;
			r.ck		:= _r.ck;
			r.ck_nt		:= _r.ck_nt;
			r.so_luong_01	:= _r.so_luong_01;
			r.chenh_lech_01	:= _r.chenh_lech_01;
			r.stt_rec_01	:= _r.stt_rec_01;
			r.so_ct_01	:= _r.so_ct_01;
			r.ngay_ct_01	:= _r.ngay_ct_01;
			r.so_luong_12	:= _r.so_luong_12;
			r.chenh_lech_12	:= _r.chenh_lech_12;
			r.stt_rec_12	:= _r.stt_rec_12;
			r.so_ct_12	:= _r.so_ct_12;
			r.ngay_ct_12	:= _r.ngay_ct_12;
			r.gc_ud1        := _r.gc_ud1;
			r.status        := _r.status;
			r.ly_do_dong	:= _r.ly_do_dong;
			r.po_khsx	:= _r.po_khsx;
			r.dau_tuan	:= _r.dau_tuan;
			
			return next r;		
	END LOOP;
	DROP TABLE tmpTable01;
	DROP TABLE tmpTable02;
	DROP TABLE tmpTable03;
	DROP TABLE tmpph94;
RETURN;
       
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.poctpo1close(date, date, character varying, character varying, character varying, character varying, character varying)
  OWNER TO postgres;
