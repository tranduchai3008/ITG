-- Function: public.mfctpd1c(character varying, date, date, character varying, character varying)

-- DROP FUNCTION public.mfctpd1c(character varying, date, date, character varying, character varying);

CREATE OR REPLACE FUNCTION public.mfctpd1c(cma_dvcs character varying, dfrom date, dto date, cso_ct character varying, cma_phan_xuong character varying)
  RETURNS SETOF mfctpd1c_return AS
$BODY$DECLARE	
	r mfctpd1c_return;   
BEGIN

--   SELECT * FROM mfctpd1c('01'::character varying , '20160101'::date, '20990101'::date, '08'::character varying, '02'::character varying );

	DROP TABLE IF EXISTS mfctpd1c_tmp;
	CREATE TEMP TABLE mfctpd1c_tmp AS
	SELECT 0 as tag, a.stt_rec, a.ln, a.ln_item as ln_item, MAX(a.so_ct) as so_ct, MAX(a.ngay_ct) as ngay_ct, a.ma_vt, MAX(a.dvt) as dvt, MAX(a.he_so) as he_so, 
		MAX(a.ma_kho) as ma_kho, SUM(a.sl_nhap_qt) as sl_nhap_qt, SUM(a.sl_xuat_qt) as sl_xuat_qt, SUM(a.sl_con_lai) as sl_con_lai, SUM(a.so_luong) as so_luong, 
		MAX(b.ten_vt) as ten_vt, MAX(b.tk_vt) as tk_vt, max(a.ma_thao_tac) as ma_thao_tac, max(a.ten_thao_tac) as ten_thao_tac,
		MAX(a.po_khsx) as po_khsx, MAX(a.dau_tuan) as dau_tuan
	FROM (	
		SELECT a.stt_rec, a.ln, a.ln_item as ln_item, trim(a.so_ct) as so_ct, a.ngay_ct, a.ma_vt, a.dvt, a.he_so, a.ma_kho as ma_kho, a.so_luong as sl_nhap_qt, 
			0 as sl_xuat_qt, a.so_luong as sl_con_lai, a.so_luong, a.ma_thao_tac, d.ten_thao_tac, a.po_khsx, a.dau_tuan
		FROM ct87 a  left join ph87 b on a.stt_rec = b.stt_rec
			left join dmvt c on a.ma_vt_item = c.ma_vt
			left join mfdmthaotac d on a.ma_thao_tac = d.ma_thao_tac
		WHERE  b.status IN ('3','4', '5')
			and INLIST(b.ma_dvcs, cma_dvcs)
			and case when dfrom = '19000101' then 1=1 else b.ngay_ct >= dfrom end
			and case when dto = '19000101' then 1=1 else b.ngay_ct <= dto end
			and b.so_ct like '%'||cso_ct||'%'
			and inlist(c.ma_phan_xuong, cma_phan_xuong)
			AND EXISTS (SELECT 1 FROM ct87sp WHERE a.stt_rec = ct87sp.stt_rec AND a.ln_item = ct87sp.ln AND ct87sp.close_yn = 0)
		UNION ALL

		SELECT a.stt_rec_pd1 as stt_rec, a.ln_pd1 as ln, a.ln_pd1_2 as ln_item, trim(a.so_ct_pd1) as so_ct, NULL AS ngay_ct, a.ma_vt as ma_vt, '' as dvt, 
			he_so as he_so, '' as ma_kho, 0 as sl_nhap_qt, a.so_luong as sl_xuat_qt, -a.so_luong as sl_con_lai, -a.so_luong, 
			'':: character varying, '':: character varying, '':: character varying, '':: character varying
		FROM ct84 a left join ph84 b on a.stt_rec = b.stt_rec
		WHERE b.status <> '0'
		and INLIST(b.ma_dvcs, cma_dvcs)
		and exists 
			(
				select 1
				FROM ph87
				WHERE  status IN ('3','4', '5')
					and INLIST(ma_dvcs, cma_dvcs)
					and case when dfrom = '19000101' then 1=1 else ngay_ct >= dfrom end
					and case when dto = '19000101' then 1=1 else ngay_ct <= dto end
					and so_ct like '%'||cso_ct||'%'
					and inlist(ma_phan_xuong, cma_phan_xuong)
					and a.stt_rec_pd1 = stt_rec
					and exists (select 1 from ct87 left join dmvt on ct87.ma_vt = dmvt.ma_vt 
						where ph87.stt_rec = ct87.stt_rec and inlist(dmvt.ma_phan_xuong, cma_phan_xuong)
						AND EXISTS (SELECT 1 FROM ct87sp WHERE ct87.stt_rec = ct87sp.stt_rec AND ct87.ln_item = ct87sp.ln AND ct87sp.close_yn = 0)
						)
			)

	) a LEFT JOIN dmvt b ON a.ma_vt = b.ma_vt
	GROUP BY a.stt_rec, a.ma_vt, a.ln, a.ln_item
	HAVING SUM(a.so_luong) > 0;
	
	FOR r IN SELECT * FROM mfctpd1c_tmp 
	LOOP                
		RETURN NEXT r;
	END LOOP;
        DROP TABLE IF EXISTS mfctpd1c_tmp;
	RETURN;
END$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.mfctpd1c(character varying, date, date, character varying, character varying)
  OWNER TO postgres;
