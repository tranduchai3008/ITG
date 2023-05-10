-- Function: public.getlotfifo(date, character varying)

-- DROP FUNCTION public.getlotfifo(date, character varying);

CREATE OR REPLACE FUNCTION public.getlotfifo(dto date, cdata character varying)
  RETURNS SETOF getlotfifo_return AS
$BODY$
DECLARE
	r getlotfifo_return;
	r1 record;
	r2 record;
	start_date ud_ngay;
	_ngay_ct ud_ngay;
	_ma_ct ud_ma;
	_stt_rec ud_stt_rec;
	_t_sl ud_float;
	_sl_da_tao ud_float;
	_sl_con_lai ud_float;
BEGIN
	drop table if exists temp;
	create temp table temp as  -- select * from temp
	SELECT 3 sysorder, * FROM json_populate_recordset(null::record, cdata::json) AS 
		(stt_rec ud_stt_rec, ln ud_smallint, ln_item ud_smallint, ma_vt ud_ma, dvt ud_ma, he_so ud_float, ma_kho ud_ma, ma_lo ud_ma, 
			ton13 ud_float, so_luong ud_float, ngay_nhap ud_ngay, ngay_sx ud_ngay, ngay_hhsd ud_ngay, po_khsx ud_ma, dau_tuan ud_ma, 
			t_needed ud_float, t_created ud_float, t_opened ud_float, ma_ct ud_ma);

	select max(ma_ct), max(stt_rec) into _ma_ct, _stt_rec from temp;

	if _ma_ct = 'HDA' then 
		if exists (select 1 from ph81 where stt_rec = _stt_rec) then 
			select ngay_ct into _ngay_ct from ph81 where stt_rec = _stt_rec;
		else 
			_ngay_ct := current_date;
		end if;
	else
		if exists (select 1 from ph80 where stt_rec = _stt_rec) then 
			select ngay_ct into _ngay_ct from ph80 where stt_rec = _stt_rec;
		else 
			_ngay_ct := current_date;
		end if;
	end if;

	SELECT getstartdate(_ngay_ct) INTO start_date;
			
	drop table if exists temp_ton;
	create temp table temp_ton as  -- select * from temp_ton
	SELECT  a.ma_vt, a.ma_lo, a.ma_kho, sum(so_luong) as so_luong, '1900-01-01'::ud_ngay ngay_nhap
	    FROM(
			SELECT ma_vt, ma_lo, ma_kho, sum(ton00) as so_luong
			FROM cdlo a
			WHERE nam = EXTRACT(year FROM start_date)
				and exists (select 1 from temp b where a.ma_kho = b.ma_kho and a.ma_vt = b.ma_vt)
			GROUP BY ma_vt, ma_kho, ma_lo

			UNION ALL
			
			SELECT ma_vt, ma_lo, ma_kho, sum(sl_nhap - sl_xuat) as so_luong
			FROM ct70b a
			WHERE (ngay_ct BETWEEN start_date AND _ngay_ct)
				and exists (select 1 from temp b where a.ma_kho = b.ma_kho and a.ma_vt = b.ma_vt and a.stt_rec <> b.stt_rec)
			GROUP BY ma_vt, ma_kho, ma_lo
		) A 	
		GROUP BY a.ma_vt, a.ma_kho, a.ma_lo
		HAVING sum(so_luong) > 0;
		
	update temp_ton a set ngay_nhap = b.ngay_nhap
	from dmlo b
	where a.ma_vt = b.ma_vt 
		and a.ma_lo = b.ma_lo;
		
	for r1 in select * from temp order by ln 
	loop
		_t_sl := r1.t_needed;
		_sl_da_tao:= r1.t_created;
		_sl_con_lai:= r1.t_opened;
		if _sl_con_lai > 0 then
			for r2 in select * from temp_ton where ma_vt = r1.ma_vt and ma_kho = r1.ma_kho order by ngay_nhap 
			loop
				if _sl_con_lai <= r2.so_luong then 
					insert into temp (sysorder, stt_rec, ln_item, ma_kho, ma_vt, ma_lo, ton13, so_luong, ngay_nhap)
						values(5, r1.stt_rec, r1.ln, r2.ma_kho, r2.ma_vt, r2.ma_lo, r2.so_luong, _sl_con_lai, r2.ngay_nhap);
						
					_sl_da_tao := _sl_da_tao + _sl_con_lai;
					_sl_con_lai := 0;
					exit;
				else 
					insert into temp (sysorder, stt_rec, ln_item, ma_kho, ma_vt, ma_lo, ton13, so_luong, ngay_nhap)
						values(5, r1.stt_rec, r1.ln, r2.ma_kho, r2.ma_vt, r2.ma_lo, r2.so_luong, r2.so_luong, r2.ngay_nhap);
						
					_sl_da_tao := _sl_da_tao + r2.so_luong;
					_sl_con_lai:= _sl_con_lai - r2.so_luong;
				end if;
			end loop;	
		end if;
		
		update temp set t_created = _sl_da_tao, t_opened = _sl_con_lai, ln_item = ln where stt_rec = r1.stt_rec and ln = r1.ln and sysorder = 3;
	end loop;

	update temp a set ngay_sx = b.ngay_sx, ngay_hhsd = b.ngay_hhsd, po_khsx = b.po_khsx, dau_tuan = b.dau_tuan
	from dmlo b
	where a.ma_vt = b.ma_vt 
		and a.ma_lo = b.ma_lo;

	FOR r IN select * from temp order by ln 
        LOOP
		RETURN NEXT r;
	END LOOP;
	
	drop table if exists temp;
	drop table if exists temp_ton;
	RETURN;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.getlotfifo(date, character varying)
  OWNER TO postgres;



