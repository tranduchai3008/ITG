-- Function: public.postlo2dmlo(character varying, character varying)

-- DROP FUNCTION public.postlo2dmlo(character varying, character varying);

CREATE OR REPLACE FUNCTION public.postlo2dmlo(pstt_rec character varying, pma_ct character varying)
  RETURNS void AS
$BODY$
DECLARE
	_m_ph character varying:='';
	_m_ct character varying:='';
	_stt_rec_po1 character varying:='';
	_ma_gd_po1 character varying:='';
	r record;
BEGIN
	SELECT m_ph, m_ct INTO _m_ph, _m_ct FROM dmct WHERE ma_ct = pma_ct;	
	FOR r IN 	
		SELECT a.ma_vt, a.ma_lo, b.ten_vt, b.ten_vt2, a.ma_kh, a.ma_kho, a.so_luong,
			a.gia_nt, a.gia, a.tien_nt, a.tien, 
			a.stt_rec, a.ma_ct, a.so_ct, 
			a.ngay_ct, a.ngay_nhap, a.ngay_sx, a.ngay_bdsd, a.ngay_hhsd, a.ma_version, a.po_khsx, a.dau_tuan
		FROM ctlo a LEFT JOIN dmvt b ON a.ma_vt = b.ma_vt
		WHERE a.stt_rec = $1 and a.ma_lo <> '' and a.ma_vt <> '' 

		LOOP
		IF(Not Exists(Select 1 From dmlo Where ma_lo = r.ma_lo And ma_vt = r.ma_vt)) THEN
			INSERT INTO dmlo(ma_vt, ma_lo, ten_lo, ten_lo2, ma_kh, ma_kho, sl_nhap,
				gia_nt, gia, tien_nt, tien, 
				stt_rec, ma_ct, so_ct, 
				ngay_ct, ngay_nhap, ngay_sx, ngay_bdsd, ngay_hhsd, ma_version, po_khsx, dau_tuan)
			VALUES(r.ma_vt, r.ma_lo, r.ten_vt, r.ten_vt2, r.ma_kh, r.ma_kho, r.so_luong,
				r.gia_nt, r.gia, r.tien_nt, r.tien, 
				r.stt_rec, r.ma_ct, r.so_ct, 
				r.ngay_ct, r.ngay_nhap, r.ngay_sx, r.ngay_bdsd, r.ngay_hhsd, r.ma_version, r.po_khsx, r.dau_tuan);

			EXECUTE 'UPDATE dmlo SET MA_CT = PH.MA_CT, NGAY_CT = PH.NGAY_CT,
				SO_CT = PH.SO_CT, MA_NT = PH.MA_NT, TY_GIA = PH.TY_GIA,
				MA_KH = PH.MA_KH, 
				DATE0 = PH.DATE0, TIME0 = PH.TIME0, USER_ID0 = PH.USER_ID0,
				DATE2 = PH.DATE2, TIME2 = PH.TIME2, USER_ID2 = PH.USER_ID2,
				STATUS = ' || quote_literal('1') ||
				' FROM ' || _m_ph || ' PH WHERE PH.STT_REC = ' || quote_literal($1) || ' AND dmlo.STT_REC = PH.STT_REC ';
			SELECT max(stt_rec_po1) INTO _stt_rec_po1 FROM ct77 WHERE stt_rec = $1;	
			select ma_gd into _ma_gd_po1 from ph94 where stt_rec = _stt_rec_po1;
			if _ma_gd_po1 = '2' then 
				EXECUTE 'UPDATE dmlo SET lo_nk = 1 WHERE dmlo.STT_REC = ' || quote_literal($1) || '';
			end if;
		END IF;
		UPdate dmlo a set ma_version = b.ma_version from (select a.ma_vt, a.ma_lo, a.ma_version from ctlo a where a.stt_rec = $1 and a.ma_lo <> '' and a.ma_vt <> '') b 
					where a.ma_vt = b.ma_vt and a.ma_lo = b.ma_lo AND a.ma_version = '';
	END LOOP;
	------	

	RETURN;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.postlo2dmlo(character varying, character varying)
  OWNER TO postgres;
