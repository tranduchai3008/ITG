-- Function: public.insdlo_new2(character varying, date, character varying, character varying, character varying, character varying, character varying, character varying, character varying)

-- DROP FUNCTION public.insdlo_new2(character varying, date, character varying, character varying, character varying, character varying, character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION public.insdlo_new2(cma_kho character varying, dto date, cma_vt character varying, cstt_rec character varying, cma_lo character varying, cma_vi_tri character varying, cdvt character varying, cpo_khsx character varying, cdau_tuan character varying)
  RETURNS SETOF insdlo_new_return AS
$BODY$
DECLARE
	r insdlo_new_return;
	_r record;
	start_date ud_ngay;
	strSQL character varying;
	_he_so ud_float;
	_m_round_sl ud_smallint;
	-- SELECT * FROM insdlo_new2('KNPL', '2023-05-08', '40010027', 'A1000000024095125PXA', '', '', 'CHIEC', '', '') ORDER BY ngay_nhap DESC
BEGIN
	SELECT getstartdate($2) INTO start_date;
	SELECT coalesce(he_so,1) INTO _he_so from dmqddvt where ma_vt = cma_vt and dvt = cdvt;
	_m_round_sl := get_options('M_ROUND_SL');

	drop table if exists tmp;
	create temp table tmp as  -- select * from tmp
	SELECT a.ma_vt, ''::character varying ten_vt, a.ma_lo, ''::character varying ten_lo, ''::character varying ten_lo2, 
		'1900-01-01'::ud_ngay ngay_nhap, '1900-01-01'::ud_ngay ngay_sx, sum(a.sl_nhap) as sl_nhap, sum(a.sl_xuat) as sl_xuat,
		sum(so_luong) as so_luong, '1900-01-01'::ud_ngay ngay_bdsd, '1900-01-01'::ud_ngay ngay_hhsd, '1900-01-01'::ud_ngay ngay_kt,
		a.ma_vi_tri, a.ma_kho, ''::character varying ten_vi_tri, ''::character varying ten_vi_tri2, 
		sum(a.so_luong2) as so_luong2, null::character varying po_khsx, null::character varying dau_tuan
	FROM(
		SELECT ma_vt, ma_lo, ''::ud_ma as ma_vi_tri, ma_kho, 0::ud_float as sl_nhap, 0::ud_float as sl_xuat, sum(ton00) as so_luong, 0::ud_float as so_luong2
		FROM cdlo
		WHERE nam = EXTRACT(year FROM start_date)
			and case when cma_kho <> '' then ma_kho = cma_kho else 1 = 1 end 
			and case when cma_vt <> '' then ma_vt = cma_vt else 1 = 1 end 
			AND ma_lo != ''
			and (case when cma_lo <> '' then ma_lo = cma_lo else 1 = 1 end)
			and (case when cma_vi_tri <> '' then ma_vi_tri = cma_vi_tri else 1 = 1 end)
		GROUP BY ma_vt, ma_kho, ma_lo

		UNION ALL

		SELECT ma_vt, ''::ud_ma AS ma_lo, ma_vi_tri, ma_kho, 0::ud_float as sl_nhap, 0::ud_float as sl_xuat, 0::ud_float as so_luong, sum(ton00) as so_luong2
		FROM cdlo
		WHERE nam = EXTRACT(year FROM start_date)
			and case when cma_kho <> '' then ma_kho = cma_kho else 1 = 1 end 
			and case when cma_vt <> '' then ma_vt = cma_vt else 1 = 1 end 
			AND ma_vi_tri != ''
			and (case when cma_lo <> '' then ma_lo = cma_lo else 1 = 1 end)
			and (case when cma_vi_tri <> '' then ma_vi_tri = cma_vi_tri else 1 = 1 end)
		GROUP BY ma_vt, ma_kho, ma_vi_tri

		UNION ALL
		
		SELECT ma_vt, ma_lo, ma_vi_tri, ma_kho, sum(sl_nhap) as sl_nhap, sum(sl_xuat) as sl_xuat, 
			sum(sl_nhap - sl_xuat) as so_luong, 0::ud_float as so_luong2
		FROM ct70b
		WHERE (ngay_ct BETWEEN start_date AND dTo)
			and case when cma_kho <> '' then ma_kho = cma_kho else 1 = 1 end 
			and case when cma_vt <> '' then ma_vt = cma_vt else 1 = 1 end 
			AND ma_lo != ''
			AND stt_rec != cstt_rec
			and (case when cma_lo <> '' then ma_lo = cma_lo else 1 = 1 end)
			and (case when cma_vi_tri <> '' then ma_vi_tri = cma_vi_tri else 1 = 1 end)
		GROUP BY ma_vt, ma_kho, ma_lo, ma_vi_tri

		UNION ALL
		
		SELECT ma_vt, ma_lo, ma_vi_tri, ma_kho, 0::ud_float as sl_nhap, 0::ud_float as sl_xuat, 
			0::ud_float as so_luong, sum(sl_nhap - sl_xuat) as so_luong2
		FROM ct70b
		WHERE (ngay_ct BETWEEN start_date AND dTo)
			and case when cma_kho <> '' then ma_kho = cma_kho else 1 = 1 end 
			and case when cma_vt <> '' then ma_vt = cma_vt else 1 = 1 end 
			AND ma_vi_tri != ''
			AND stt_rec != cstt_rec
			and (case when cma_lo <> '' then ma_lo = cma_lo else 1 = 1 end)
			and (case when cma_vi_tri <> '' then ma_vi_tri = cma_vi_tri else 1 = 1 end)
		GROUP BY ma_vt, ma_kho, ma_vi_tri, ma_lo
		
	) A 	
	GROUP BY a.ma_vt, a.ma_kho, a.ma_lo, a.ma_vi_tri
	HAVING sum(so_luong) + sum(so_luong2) > 0
	ORDER BY ngay_nhap;
	
	update tmp set sl_nhap = round(sl_nhap/_he_so,_m_round_sl), sl_xuat = round(sl_xuat/_he_so,_m_round_sl),
		so_luong = round(so_luong/_he_so,_m_round_sl), so_luong2 = round(so_luong2/_he_so,_m_round_sl);
	
	update tmp a set ten_vt = b.ten_vt
	from dmvt b
	where a.ma_vt = b.ma_vt;

	-- HuyPN: 8-5-2023: lấy các lô có po_khsx và dấu tuần theo điều kiện.
	update tmp a set ngay_sx = b.ngay_sx, ngay_hhsd = b.ngay_hhsd, ngay_nhap = b.ngay_nhap, 
		ngay_bdsd = b.ngay_bdsd, ngay_kt = b.ngay_kt, po_khsx = b.po_khsx, dau_tuan = b.dau_tuan,
		ten_lo = b.ten_lo, ten_lo2 = b.ten_lo2
	from dmlo b
	where a.ma_vt = b.ma_vt 
		and a.ma_lo = b.ma_lo;
		
	update tmp a set ten_vi_tri = b.ten_vi_tri, ten_vi_tri2 = b.ten_vi_tri2
	from dmvitri b
	where a.ma_kho = b.ma_kho 
		and a.ma_vi_tri = b.ma_vi_tri;
		
	FOR r IN select * from tmp WHERE (po_khsx = cpo_khsx AND dau_tuan = cdau_tuan)ORDER BY ngay_nhap 
        LOOP
		RETURN NEXT r;
	END LOOP;
	
	drop table if exists tmp;
    RETURN;     
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.insdlo_new2(character varying, date, character varying, character varying, character varying, character varying, character varying, character varying, character varying)
  OWNER TO postgres;
