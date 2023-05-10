-- Function: public.mfctpd1pxb(character varying, date, date, character varying)

-- DROP FUNCTION public.mfctpd1pxb(character varying, date, date, character varying);

CREATE OR REPLACE FUNCTION public.mfctpd1pxb(cma_dvcs character varying, dfrom date, dto date, cso_ct character varying)
  RETURNS SETOF mfctpd1pxb_return AS
$BODY$DECLARE	
	r mfctpd1pxb_return;   
BEGIN

--   SELECT * FROM mfctpd1dxv('01'::character varying , '20200101'::date, '20200601'::date, ''::character varying, ''::character varying, ''::character varying, ''::character varying, ''::character varying);

	DROP TABLE IF EXISTS mfctpd1pxb_tmp0;
	CREATE TEMP TABLE mfctpd1pxb_tmp0 AS
	SELECT a.stt_rec, a.ln, a.ln_item as ln_item, trim(a.so_ct) as so_ct, a.ngay_ct, 
		a.ma_vt, a.dvt, a.he_so, a.ma_kho as ma_kho, 
		a.so_luong as sl_nhap_qt, 0 as sl_xuat_qt, a.so_luong as sl_con_lai, a.so_luong, 
		a.ma_thao_tac, ''::character varying AS ten_thao_tac, a.ma_vv as ma_vv_ct, ''::character varying AS ten_vv_ct,
		a.ma_vt_item as ma_vt_item, ''::character varying AS ma_kho_vt, ''::character varying AS ma_version_vt,
		a.po_khsx, a.dau_tuan
	FROM ct87 a  left join ph87 b on a.stt_rec = b.stt_rec
		left join dmvt c on a.ma_vt = c.ma_vt
	WHERE  b.status IN ('3','4')
		AND b.ma_gd = 1
		AND INLIST(b.ma_dvcs, cma_dvcs)
		AND case when dfrom = '19000101' then 1=1 else b.ngay_ct >= dfrom end
		AND case when dto = '19000101' then 1=1 else b.ngay_ct <= dto end
		AND b.so_ct like '%'||cso_ct||'%'
		--AND inlist(b.ma_phan_xuong, cma_phan_xuong)
		--AND inlist(b.ma_bp, cma_bp)
		--AND inlist(c.ma_kho, cma_kho)
		--and inlist(a.ma_vt_item, cma_vt_item)
		AND EXISTS (SELECT 1 FROM ct87sp WHERE a.stt_rec = ct87sp.stt_rec AND a.ln_item = ct87sp.ln);
	
	DROP TABLE IF EXISTS mfctpd1pxb_tmp;
	CREATE TEMP TABLE mfctpd1pxb_tmp AS
	SELECT 0 as tag, a.stt_rec, a.ln, MAX(a.ln_item) as ln_item, MAX(a.so_ct) as so_ct, MAX(a.ngay_ct) as ngay_ct, 
		MAX(a.ma_vt) AS ma_vt, MAX(a.dvt) as dvt, MAX(a.he_so) as he_so, MAX(a.ma_kho) as ma_kho, 
		SUM(a.sl_nhap_qt) as sl_nhap_qt, SUM(a.sl_xuat_qt) as sl_xuat_qt, SUM(a.sl_con_lai) as sl_con_lai, SUM(a.so_luong) as so_luong, 
		''::character varying as ten_vt, ''::character varying as tk_vt, max(a.ma_thao_tac) as ma_thao_tac, ''::character varying as ten_thao_tac,
		MAX(a.ma_vv_ct) as ma_vv_ct, ''::character varying AS ten_vv_ct,
		MAX(a.ma_vt_item) as ma_vt_item, ''::character varying AS ma_kho_vt, ''::character varying AS ma_version_vt,
		MAX(a.po_khsx) as po_khsx, Max(a.dau_tuan) as dau_tuan 
		 
	FROM (	
		SELECT * FROM mfctpd1pxb_tmp0
			
		UNION ALL

		SELECT a.stt_rec_pd1 as stt_rec, a.ln_pd1 as ln, a.ln_pd12 as ln_item, trim(a.so_ct_pd1) as so_ct, NULL AS ngay_ct, a.ma_vt as ma_vt, '' as dvt, 
			he_so as he_so, '' as ma_kho, 0 as sl_nhap_qt, a.so_luong as sl_xuat_qt, -a.so_luong as sl_con_lai, -a.so_luong, '':: character varying, '':: character varying,
			'':: character varying as ma_vv_ct, ''::character varying AS ten_vv_ct,
			'':: character varying as ma_vt_item, ''::character varying AS ma_kho_vt, ''::character varying AS ma_version_vt,
			''::character varying AS po_khsx, ''::character varying AS dau_tuan   
		FROM ct85 a left join ph85 b on a.stt_rec = b.stt_rec
		WHERE b.status <> '0'
		and INLIST(b.ma_dvcs, cma_dvcs)
		and stt_rec_pd1 IN ( SELECT stt_rec FROM mfctpd1pxb_tmp0)

	) a 
	GROUP BY a.stt_rec, a.ln, a.ln_item
	HAVING SUM(a.so_luong) > 0;

	UPDATE mfctpd1pxb_tmp a SET ten_vt = b.ten_vt, tk_vt = b.tk_vt, ma_kho_vt = b.ma_kho, ma_version_vt = b.ma_version  FROM dmvt b WHERE a.ma_vt = b.ma_vt;	
	UPDATE mfctpd1pxb_tmp a SET ten_thao_tac = b.ten_thao_tac FROM mfdmthaotac b WHERE a.ma_thao_tac = b.ma_thao_tac;
	UPDATE mfctpd1pxb_tmp a SET ten_vv_ct = b.ten_vv FROM dmvv b WHERE a.ma_vv_ct = b.ma_vv;
	
	FOR r IN SELECT * FROM mfctpd1pxb_tmp 
	LOOP                
		RETURN NEXT r;
	END LOOP;
	--DROP TABLE IF EXISTS select * from mfctpd1pxb_tmp0;
        --DROP TABLE IF EXISTS mfctpd1pxb_tmp;
	RETURN;
END$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.mfctpd1pxb(character varying, date, date, character varying)
  OWNER TO postgres;
