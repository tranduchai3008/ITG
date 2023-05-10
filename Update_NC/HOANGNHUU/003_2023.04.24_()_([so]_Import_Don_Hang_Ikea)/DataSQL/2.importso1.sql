-- Function: public.importso1(character varying, character varying, character varying, ud_float)

-- DROP FUNCTION public.importso1(character varying, character varying, character varying, ud_float);

CREATE OR REPLACE FUNCTION public.importso1(cstt_rec character varying, cma_kh character varying, cma_nt character varying, cty_gia ud_float)
  RETURNS void AS
$BODY$DECLARE
	r record;
	_stt_rec ud_stt_rec;
	_stt_rec_imp ud_stt_rec;
	_stt_rec_up ud_stt_rec;
	_ln smallint := -32768;
	_ln_item smallint := -32768;
	_max_so_ct ud_char20;
	_so_ct_FORmat ud_char20;
	_i integer := 0;
	_so_ct ud_so_ct;
	_so_po ud_so_ct;
	_dvt ud_dvt;
	_ma_dvcs ud_ma := '';
	_ma_vt ud_ma;
	_ma_nt ud_ma;
	_ma_kh ud_ma;
	_ngay_ct ud_ngay;
	_date0 ud_ngay;
	r1 record;
	r2 record;
	-- SELECT importso1('A1000000014397184', 'IKE-QT003','USD','25000.00000000000000000000')
	_check_run integer := 1;
	
BEGIN
	_ngay_ct := current_date;
	-- get stt_rec
	_stt_rec := get_stt_rec('SO1');
	update ctkhgh_imp set stt_rec_imp = _stt_rec where stt_rec = $1;

	-- chuyen cac dong da ton tại ve trogn thai k su dung
	UPDATE ctkhgh a SET status = '0' 
	where stt_rec <> _stt_rec and exists(select 1 from ctkhgh_imp b where a.ma_vt = b.ma_vt AND a.ngay_phai_gh = b.ngay_phai_gh AND a.so_po = b.so_po);
	
	DROP TABLE IF EXISTS tmp_imp;
	CREATE TEMP TABLE tmp_imp AS
	SELECT * FROM ctkhgh_imp WHERE stt_rec = $1;

	-------------finish1-------------
	raise notice 'finish1';

	-- import

	SELECT max(so_ct) INTO _max_so_ct FROM ph64 WHERE length(so_ct) = 13;
	IF _max_so_ct is null THEN
		SELECT so_ct_FORmat, so_ct_FORmat INTO _max_so_ct, _so_ct_FORmat FROM dmsoct WHERE ma_ct = 'SO1' AND ma_dvcs = _ma_dvcs;
		_max_so_ct = replace(_max_so_ct,'-yy-',right(to_char(extract(year FROM _date0),'0000'),2));
		_max_so_ct = replace(_max_so_ct,'-mm-',trim(to_char(extract(month FROM _date0),'00')));
		_so_ct = left(_max_so_ct,8) || trim(to_char(right(_so_ct_FORmat,5)::numeric(38, 0) + 1,'00000'));
	ELSE
		_so_ct = left(_max_so_ct,8) || trim(to_char(right(_max_so_ct,5)::numeric(38, 0) + 1,'00000'));
	END IF;
	_max_so_ct = _so_ct;
	UPDATE tmp_imp SET so_ct = _so_ct;
 		
	SELECT ma_dvcs, date0  INTO _ma_dvcs, _date0 FROM tmp_imp WHERE stt_rec = $1;
	
	FOR r2 in SELECT * FROM tmp_imp
	LOOP
		SELECT coalesce(max(ln_imp),0) INTO _ln 
		FROM tmp_imp 
		WHERE ln_imp <> 0;
		IF _ln = 0 then _ln = -32768; else _ln = _ln + 8; end IF;

		SELECT coalesce(max(ln_item_imp),0) INTO _ln_item
		FROM tmp_imp 
		where ma_vt = r2.ma_vt
			AND ln_item_imp <> 0;
		IF _ln_item = 0 then 
			SELECT coalesce(max(ln_item_imp),0) INTO _ln_item
			FROM tmp_imp 
			WHERE ma_vt <> r2.ma_vt
				AND ln_item_imp <> 0;
			IF _ln_item = 0 then _ln_item = -32768; else _ln_item = _ln_item + 8; end IF;
		end IF;
		
		update tmp_imp a SET ln_imp = _ln , ln_item_imp = _ln_item WHERE  a.stt_rec = r2.stt_rec AND a.ln = r2.ln;
		raise notice '-------------------------- **----------------------------- %, %, %, %, %, %',r2.ma_vt, r2.stt_rec_imp, _ln , _ln_item, r2.stt_rec, r2.ln;
	end LOOP;

	-------------finish2-------------
	raise notice '--------------finish2';
	
-----CTKHGH
	 INSERT INTO ctkhgh(
            stt_rec, ngay_ct, so_ct, ln, ln_item, ngay_phai_gh, ngay_kh_gh, so_luong, 
            ma_noi_nhan, ma_loai_noi_nhan, ma_qg_nhan, cap_do, dh_uu_tien, 
            sl_pallet, sl_consignment, so_ct_dh2, cach_giao_hang, ma_noi_nhan_cuoi, 
            ma_loai_nn_cuoi, ma_qg_cuoi, ghi_chu, ma_vt, ma_kho, loai_hang, rcvd_date, 
            so_po, ma_ct, he_so, trang_thai, sl_can_bang, sl_da_giao, sl_da_book, status)
	SELECT	stt_rec_imp, ngay_ct, so_ct, ln_imp, ln_item_imp, ngay_phai_gh, ngay_kh_gh, so_luong, 
            ma_noi_nhan, ma_loai_noi_nhan, ma_qg_nhan, cap_do, dh_uu_tien, 
            sl_pallet, sl_consignment, so_ct_dh2, cach_giao_hang, ma_noi_nhan_cuoi, 
            ma_loai_nn_cuoi, ma_qg_cuoi, ghi_chu, ma_vt, ma_kho, loai_hang, rcvd_date,
            so_po , 'SO1', 1, trang_thai, sl_can_bang, sl_da_giao, sl_da_book, '1'
	FROM tmp_imp ; 

	UPDATE ctkhgh a SET dvt = b.dvt FROM dmvt b 
			WHERE a.stt_rec in (SELECT stt_rec_imp FROM tmp_imp WHERE stt_rec = $1) AND b.ma_vt = a.ma_vt;
-- LAY GIA TU FUN getmainitemprice
	--  SELECT * FROM getmainitemprice('01','IKE-QT003','10445379','KG',48,1,'USD') -- ma_dvcs, ma_kh, ma_vt, dvt, so_luong, gia_bb_ble, _ma_nt
	/*FOR r IN SELECT * FROM ctkhgh WHERE stt_rec in (SELECT stt_rec_imp FROM tmp_imp WHERE stt_rec = $1) 
	LOOP
		UPDATE ctkhgh d SET gia_nt2 = c.gia0
			FROM (SELECT a.ma_vt, a.gia, a.gia0, a.ma_thue FROM getmainitemprice(_ma_dvcs, cma_kh, r.ma_vt, r.dvt, r.so_luong, 1, cma_nt)a 
				LEFT JOIN dmgiabanct b ON a.ma_vt = b.ma_vt 
				WHERE (r.ngay_kh_gh between ngay_bd AND ngay_kt) AND a.ma_vt = r.ma_vt AND b.active = 1)c  
			WHERE d.stt_rec in (SELECT stt_rec_imp FROM tmp_imp WHERE stt_rec = $1) AND d.ma_vt = c.ma_vt;
	END LOOP;*/
	--> cai tien lấy giá trực tiếp từ bàng giá, không xử lý qua function
		-- UPDATE ctkhgh d SET gia_nt2 = c.gia0
-- 		FROM dmgiabanct c  
-- 		WHERE d.stt_rec in (SELECT stt_rec_imp FROM tmp_imp WHERE stt_rec = $1)
-- 			AND d.ma_vt = c.ma_vt
-- 			and d.ngay_kh_gh between c.ngay_bd AND c.ngay_kt
-- 			and c.ma_kh = _ma_kh;
			
	
	-- UPDATE ctkhgh SET gia2 = round(cty_gia * gia_nt2, get_options('M_ROUND_GIA_NT')::int)
-- 			WHERE stt_rec in (SELECT stt_rec_imp FROM tmp_imp WHERE stt_rec = $1);
-- 	UPDATE ctkhgh SET tien2 = round(so_luong * gia2, get_options('M_ROUND_TIEN')::int),
-- 			tien_nt2 = round(so_luong * gia_nt2,get_options('M_ROUND_TIEN_NT')::int)
-- 			WHERE stt_rec in (SELECT stt_rec_imp FROM tmp_imp WHERE stt_rec = $1);
	INSERT INTO ph64(
            ma_dvcs, stt_rec, ma_ct, ma_gd, ngay_ct, ngay_lct, so_seri, so_ct, 
            ma_kh, ten_kh, ma_kh2, ten_kh2, ong_ba, ong_ba2, ong_ba3, dia_chi, 
            dia_chi2, dia_chi3, ma_so_thue, ma_so_thue2, dien_giai, ma_bp, 
            ma_nvbh, ma_nx, ma_tt, ngay_tt, ma_nt, ty_gia, pt_tt_ck, ngay_tt_ck, 
            ma_httt, ma_htvc, ma_kho, t_so_luong, t_tien_nt, t_tien, t_thue_nt, 
            t_thue, ma_thue, thue_suat, tk_thue_co, tk_thue_no, 
            sua_tkthue, t_tien_nt2, t_tien2, tinh_ck, tk_ck, t_ck_nt, t_ck, 
            t_tt_nt, t_tt, t_cp_nt, t_cp, date0, time0, user_id0, status, 
            date2, time2, user_id2, ten_vtthue, ma_tinh, ma_huyen, dien_thoai, 
            dien_thoai2, ngay_gh, gio_gh, noi_gh, ma_loai_vc, so_km, so_chuyen, 
            app_yn, ma_nvgh, ma_nv_duyet, cach_tinh_thue, ma_bang_gia, sx_yn, 
            ma_tuyen, nguoi_duyet, ngay_duyet, gio_duyet, xac_nhan_gh, so_po, 
            loai_dh, gc_ud1, ghi_chu_duyet, ikea_yn, thang, nam)
	SELECT MAX(ma_dvcs), stt_rec_imp, 'SO1', 2, MAX(date0),MAX(date0), ''::ud_so_seri so_seri, so_ct, 
            ''::ud_ma ma_kh, ''::ud_ten ten_kh, ''::ud_ma ma_kh2, ''::ud_ten ten_kh2, '':: character varying ong_ba,'':: character varying ong_ba2,'':: character varying ong_ba3,
            '':: character varying dia_chi, 
            '':: character varying dia_chi2,'':: character varying dia_chi3, ''::ud_ma ma_so_thue, ''::ud_ma ma_so_thue2,'':: character varying dien_giai, ''::ud_ma ma_bp, 
            ''::ud_ma ma_nvbh, ''::ud_ma ma_nx, ''::ud_ma ma_tt,'1900-01-01'::ud_ngay ngay_tt, ''::ud_ma_nt ma_nt, 0::ud_float ty_gia, 0::ud_float pt_tt_ck, 
            '1900-01-01'::ud_ngay ngay_tt_ck, 
            ''::ud_ma ma_httt, ''::ud_ma ma_htvc, ''::ud_ma ma_kho, SUM(so_luong), 0::ud_float t_tien_nt, 0::ud_float t_tien, 0::ud_float t_thue_nt, 
            0::ud_float t_thue, ''::ud_ma ma_thue, 0::ud_float thue_suat, '':: character varying tk_thue_co,'':: character varying tk_thue_no, 
            0::ud_smallint sua_tkthue,0::ud_float  t_tien_nt2, 0::ud_float t_tien2,0::ud_smallint tinh_ck,'':: character varying tk_ck, 0::ud_float t_ck_nt, 0::ud_float t_ck, 
            0::ud_float t_tt_nt, 0::ud_float t_tt, 0::ud_float t_cp_nt, 0::ud_float t_cp, MAX(date0), MAX(time0), MAX(user_id0), 1, 
            MAX(date2), MAX(time2), MAX(user_id2),'':: character varying ten_vtthue, ''::ud_ma ma_tinh, ''::ud_ma ma_huyen,''::ud_char50 dien_thoai, 
            ''::ud_char50 dien_thoai2,'1900-01-01'::ud_ngay ngay_gh,'00:00:00'::ud_time gio_gh, 0::ud_smallint noi_gh, ''::ud_ma ma_loai_vc, 
            0::ud_float so_km, 0::ud_float so_chuyen, 
            0::ud_smallint app_yn, ''::ud_ma ma_nvgh, ''::ud_ma ma_nv_duyet, 0::ud_smallint cach_tinh_thue, '01',0::ud_smallint sx_yn, 
            ''::ud_ma ma_tuyen,'':: character varying nguoi_duyet, '1900-01-01'::ud_ngay ngay_duyet,'00:00:00'::ud_time gio_duyet,0::ud_smallint xac_nhan_gh, '', 
            1,'':: character varying gc_ud1,'':: character varying ghi_chu_duyet, 1, MAX(extract(month FROM ngay_phai_gh)), MAX(extract(year FROM ngay_phai_gh))
        FROM tmp_imp
        GROUP BY stt_rec_imp , so_ct; 

	UPDATE ph64 a SET ma_kh = b.ma_kh FROM dmkh b WHERE b.ma_kh = cma_kh AND a.stt_rec in (SELECT stt_rec_imp FROM tmp_imp WHERE stt_rec = $1);
        UPDATE ph64 a SET ten_kh = b.ten_kh, ten_kh2 = b.ten_kh2,ma_so_thue = b.ma_so_thue, ma_so_thue2 = b.ma_so_thue2, dia_chi= b.dia_chi, 
			dia_chi2 = b.dia_chi2, dien_thoai= b.dien_thoai, dien_thoai2= b.dien_thoai2, ong_ba = b.ong_ba , ma_kh2 = b.ma_kh, ong_ba2 = b.ong_ba
			FROM dmkh b
			WHERE b.ma_kh = a.ma_kh AND a.stt_rec in (SELECT stt_rec_imp FROM tmp_imp WHERE stt_rec = $1);
		
	UPDATE ph64 a SET ma_nt = b.ma_nt , ty_gia = b.ty_gia 
			FROM (SELECT ma_nt , ty_gia FROM dmtgnt WHERE ma_nt = cma_nt AND ty_gia = cty_gia)b 
			WHERE a.stt_rec in (SELECT stt_rec_imp FROM tmp_imp WHERE stt_rec = $1);

	UPDATE ph64 a SET  t_tien_nt = b.t_tien_nt,
				t_tien = b.t_tien,
				t_thue_nt = b.t_thue_nt,
				t_thue = b.t_thue,
				t_tien_nt2 = b.t_tien_nt2,
				t_tien2 = b.t_tien2
			FROM (SELECT stt_rec , SUM(tien_nt) AS t_tien_nt, SUM(tien) AS t_tien, SUM(tien_nt2) AS t_tien_nt2, SUM(tien2) AS t_tien2, 
			SUM(thue) AS t_thue, SUM(thue_nt) AS t_thue_nt
			FROM ct64 WHERE stt_rec in (SELECT stt_rec_imp FROM tmp_imp WHERE stt_rec = $1) GROUP BY stt_rec) b 
			WHERE a.stt_rec in (SELECT stt_rec_imp FROM tmp_imp WHERE stt_rec = $1) AND a.stt_rec = b.stt_rec ;

	-- UPDATE ph64 SET  t_tt_nt = t_tien_nt2 + t_thue_nt - t_ck_nt , 
-- 			t_tt = t_tien2 + t_thue - t_ck
-- 			WHERE stt_rec in (SELECT stt_rec_imp FROM tmp_imp WHERE stt_rec = $1) ;

	-- CHAY HAM POST
	PERFORM postso(_stt_rec);
	
	RETURN;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.importso1(character varying, character varying, character varying, ud_float)
  OWNER TO postgres;
