-- Function: public.arsobk1(date, date, character varying, character varying, character varying, character varying, character varying, character varying, smallint, character varying, character varying, character varying, character varying, character varying)

-- DROP FUNCTION public.arsobk1(date, date, character varying, character varying, character varying, character varying, character varying, character varying, smallint, character varying, character varying, character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION public.arsobk1(dfrom date, dto date, cso_ct1 character varying, cso_ct2 character varying, cma_kh character varying, ckey_kho character varying, cma_vt character varying, cma_dvcs character varying, inxt smallint, cma_ct character varying, cnh_vt character varying, strwhere character varying, cgroup character varying, cma_nx character varying)
  RETURNS SETOF arsobk1_return AS
$BODY$DECLARE
	r arsobk1_return;
	r1 record;
	list_kh character varying := '';
	strSQL character varying := '';
	kh_where character varying := '';
		
BEGIN	 --select * from ct70 where so_ct like '%CL%'
	-- Select * from Arsobk1('2016-01-01', '2016-08-22', '', '', '', '1=1', '', '01', '2', 'HDF', '1=1', '1=1 AND ma_ct not in (''PXA'',''PXB'',''PXE'',''PXC'')','ma_vt' )
	
	if cma_kh = '' then
		kh_where := ' ct70.ma_kh like ''%''';
	else
		list_kh := replace(cma_kh, ' ', '');
		list_kh := replace(quote_literal(list_kh), ',', quote_literal(','));
		kh_where := ' ct70.ma_kh IN (' ||list_kh||')';
	end if;
	
	strSQL	:= 'CREATE TEMP TABLE tmpchitiet AS SELECT 5 as sysorder, 1 as sysprint, 1 as systotal,
				   dmkho.ma_dvcs, ct70.stt_rec, ct70.ma_ct, ct70.ngay_ct, ct70.so_ct,
				   ct70.ma_vt, dmvt.ten_vt, dmvt.ten_vt2, ct70.so_seri_vt, dmvt.dvt, ct70.ln as ln, ct70.ma_kho, 
                                   ct70.sl_nhap, ct70.sl_xuat, ct70.sl_nhap + ct70.sl_xuat as so_luong,
                                   CASE WHEN '||inxt||' = 2 THEN ct70.gia2 ELSE ct70.gia0 END as gia_ban, 
                                   CASE WHEN '||inxt||' = 2 THEN ct70.gia_nt2 ELSE ct70.gia_nt0 END as gia_ban_nt, 
                                   CASE WHEN '||inxt||' = 2 THEN ct70.tien2 ELSE ct70.tien0 END as tien_ban, 
                                   CASE WHEN '||inxt||' = 2 THEN ct70.tien_nt2 ELSE ct70.tien_nt0 END as tien_ban_nt,
                                   0:: ud_float as sl_tl, 0:: ud_float as tien_tl, 0::ud_float as tien_tl_nt,
                                   ct70.ck, ct70.ck_nt, ct70.thue, ct70.thue_nt, 
                                   CASE WHEN '||inxt||' = 2 THEN case when ph94.ma_gd = 2 then ct70.tien2 - ct70.ck else ct70.tien2 + ct70.thue - ct70.ck end 
                                            ELSE case when ph94.ma_gd = 2 then ct70.tien0 - ct70.ck else ct70.tien_nhap + ct70.thue - ct70.ck end 
                                        END as pt, 
                                   CASE WHEN '||inxt||' = 2 THEN case when ph94.ma_gd = 2 then ct70.tien_nt2 - ct70.ck_nt else 
					ct70.tien_nt2 + ct70.thue_nt - ct70.ck_nt end ELSE case when ph94.ma_gd = 2 then ct70.tien_nt0 - ct70.ck_nt else
					ct70.tien_nt0 + ct70.thue_nt - ct70.ck_nt end END as pt_nt,
                                   ct70.ma_nt, ct70.ty_gia, ct70.dien_giai, ct70.ma_kh, dmkh.ten_kh, dmkh.ten_kh2,
                                   dmkh.dia_chi as dia_chi, dmkh.ong_ba as ong_ba, ct70.ngay_tt as ngay_tt, 
                                   ''''::character varying as tk_no, ''''::character varying as dien_giai_ph, null::ud_time as gio_gh, ''''::character varying as vi_tri_kh, dmvt.model,
                                   dmvt.nh_vt1, dmvt.nh_vt2, dmvt.nh_vt3, dmvt.nh_vt4, dmvt.nh_vt5 
                                   FROM ct70 ct70
                                   LEFT JOIN dmvt dmvt ON ct70.ma_vt = dmvt.ma_vt 
                                   LEFT JOIN dmkho dmkho ON ct70.ma_kho = dmkho.ma_kho
                                   LEFT JOIN dmkh dmkh ON ct70.ma_kh = dmkh.ma_kh
                                   left join ph77 ph77 ON ct70.stt_rec = ph77.stt_rec
                                   LEFT JOIN ph94 ph94 on ph77.stt_rec_dh = ph94.stt_rec
                                   WHERE (ct70.ngay_ct between '||quote_literal(dfrom)||' AND '||quote_literal(dto)||')
                                   AND CASE WHEN '||quote_literal(cso_ct1)||' <> '||quote_literal('')||' THEN (trim(ct70.so_ct) >= '||quote_literal(cso_ct1)||') ELSE 1=1 END
                                   AND CASE WHEN '||quote_literal(cso_ct2)||' <> '||quote_literal('')||' THEN (trim(ct70.so_ct) <= '||quote_literal(cso_ct2)||') ELSE 1= 1 END
                                   AND ('||kh_where||')
                                   AND (ct70.ma_vt like '||quote_literal(cma_vt ||'%')||')
                                   AND (ct70.nxt = '||inxt||')
                                   AND (ct70.ma_ct <> '||quote_literal(cma_ct)||')
                                   AND (CASE WHEN ct70.ma_ct = ''PR1'' THEN ct70.ma_gd <> 3 ELSE 1=1 END)
                                   AND ct70.ma_kho in(select ma_kho from dmkho where inlist(ma_dvcs2,'||quote_literal(cma_dvcs)||'))                                  
                                   AND '||strWhere||'
                                   AND (CASE WHEN ct70.ma_ct = ''DX2'' THEN ct70.ma_gd <> 3 ELSE 1=1 END)
                                   AND (CASE WHEN ct70.ma_ct = ''HDA'' THEN EXISTS(SELECT 1 FROM ph81 WHERE ct70.stt_rec = stt_rec AND INLIST(ma_nx, '||quote_literal(cma_nx)||')) ELSE 1=1 END)
                    UNION ALL
                    SELECT 	5 as sysorder, 1 as sysprint, 1 as systotal,
				dmkho.ma_dvcs, ct70.stt_rec, ct70.ma_ct, ct70.ngay_ct, ct70.so_ct,
				   ct70.ma_vt, dmvt.ten_vt, dmvt.ten_vt2, ct70.so_seri_vt, dmvt.dvt, ct70.ln as ln, ct70.ma_kho, 
                                   ct70.sl_nhap, ct70.sl_xuat, ct70.sl_nhap + ct70.sl_xuat as so_luong,
                                   gia as gia_ban, gia_nt as gia_ban_nt, 
                                   - ct70.tien_xuat as tien_ban, - ct70.tien_nt_x as tien_ban_nt, ct70.sl_nhap + ct70.sl_xuat as sl_tl, 
                                   CASE WHEN '||inxt||' = 2 THEN  ct70.tien2 + ct70.thue - ct70.ck ELSE ct70.tien_xuat + ct70.thue - ct70.ck END as tien_tl, 
                                   CASE WHEN '||inxt||' = 2 THEN ct70.tien_nt2 + ct70.thue_nt - ct70.ck_nt ELSE ct70.tien_nt_x + ct70.thue_nt - ct70.ck_nt END as tien_tl_nt,
                                   - ct70.ck as ck, - ct70.ck_nt as ck_nt, - ct70.thue as thue, - ct70.thue_nt as thue_nt, 
                                   CASE WHEN '||inxt||' = 2 THEN (-ct70.tien2 - ct70.thue + ct70.ck) ELSE (-ct70.tien_xuat - ct70.thue + ct70.ck) END as pt, 
                                   CASE WHEN '||inxt||' = 2 THEN (-ct70.tien_nt2 - ct70.thue_nt + ct70.ck_nt) ELSE (-ct70.tien_nt_x - ct70.thue_nt + ct70.ck_nt)END as pt_nt,
                                   ct70.ma_nt, ct70.ty_gia, ct70.dien_giai, ct70.ma_kh, dmkh.ten_kh, dmkh.ten_kh2,
                                   dmkh.dia_chi as dia_chi, dmkh.ong_ba as ong_ba, ct70.ngay_tt as ngay_tt, 
                                   ''''::character varying as tk_no, ''''::character varying as dien_giai_ph, null::ud_time as gio_gh, ''''::character varying as vi_tri_kh,dmvt.model,
                                   dmvt.nh_vt1, dmvt.nh_vt2, dmvt.nh_vt3, dmvt.nh_vt4, dmvt.nh_vt5 
                                   FROM ct70 ct70
                                   left join ph77 ph77 ON ct70.stt_rec = ph77.stt_rec
                                   LEFT JOIN dmvt dmvt ON ct70.ma_vt = dmvt.ma_vt 
                                   LEFT JOIN dmkho dmkho ON ct70.ma_kho = dmkho.ma_kho
                                   LEFT JOIN dmkh dmkh ON ct70.ma_kh = dmkh.ma_kh
                                   LEFT JOIN ph94 ph94 on ph77.stt_rec_dh = ph94.stt_rec
                                   WHERE (ct70.ngay_ct between '||quote_literal(dfrom)||' AND '||quote_literal(dto)||')
                                   AND CASE WHEN '||quote_literal(cso_ct1)||' <> '||quote_literal('')||' THEN (trim(ct70.so_ct) >= '||quote_literal(cso_ct1)||') ELSE 1=1 END
                                   AND CASE WHEN '||quote_literal(cso_ct2)||' <> '||quote_literal('')||' THEN (trim(ct70.so_ct) <= '||quote_literal(cso_ct2)||') ELSE 1= 1 END
                                   AND ('||kh_where||')
                                   AND (ct70.ma_vt like '||quote_literal(cma_vt ||'%')||')
                                   AND (ct70.nxt <> '||inxt||')
                                   AND (ct70.ma_ct = '||quote_literal(cma_ct)||')
                                   AND (CASE WHEN ct70.ma_ct = ''HDF'' THEN ct70.ma_gd <> 2 ELSE 1=1 END)
                                   AND (CASE WHEN ct70.ma_ct = ''PXC'' THEN ct70.ma_gd <> 2 ELSE 1=1 END)
                                   AND ct70.ma_kho in(select ma_kho from dmkho where inlist(ma_dvcs2,'||quote_literal(cma_dvcs)||'))    
                                   AND (CASE WHEN ct70.ma_ct = ''HDA'' THEN EXISTS(SELECT 1 FROM ph81 WHERE ct70.stt_rec = stt_rec AND INLIST(ma_nx, '||quote_literal(cma_nx)||')) ELSE 1=1 END)                              
                                   AND '||strWhere||'';
RAISE NOTICE 'strSQL = %', strSQL;  
                   EXECUTE strSQL;
--update vi tri khach hang
	update tmpchitiet a set vi_tri_kh = (select ma_vi_tri_kh from ct81 where a.stt_rec = stt_rec and a.ln = ln);
	update tmpchitiet a set vi_tri_kh = b.ten_vi_tri_kh from dmvitrikh b where a.vi_tri_kh = b.ma_vi_tri_kh and a.ma_kh = b.ma_kh;
        strSQL := 'CREATE TEMP TABLE tmpTonghop AS SELECT * FROM tmpchitiet WHERE so_ct not like ''%CL%'' and ' || cKey_kho || ' AND ' || cnh_vt ;
        EXECUTE strSQL;
      
--update 
	update tmpTonghop a set tk_no = b.ma_nx, dien_giai_ph = b.dien_giai from ph81 b where a.stt_rec = b.stt_rec;
	update tmpTonghop a set gio_gh = b.gio_gh from ct81 b where a.stt_rec = b.stt_rec and a.ln = a.ln;
	if cgroup = 'ma_vt' THEN
		insert into tmpTonghop
		SELECT 4 as sysorder, 0 as sysprint,0 as systotal,
		max(ma_dvcs) as ma_dvcs, '' as stt_rec, '' as ma_ct, null as ngay_ct, '' as so_ct,
		ma_vt, max(ten_vt) as ten_vt, max(ten_vt2) as ten_vt2, '' as so_seri_vt, '' as dvt, 0 as ln, '' as ma_kho, 
                sum(sl_nhap) as sl_nhap, sum(sl_xuat) as sl_xuat, sum(so_luong) as so_luong,
                0 as gia_ban, 0 as gia_ban_nt, 
                sum(tien_ban) as tien_ban, sum(tien_ban_nt) as tien_ban_nt,
                sum(sl_tl) as sl_tl, sum(tien_tl) as tien_tl, sum(tien_tl_nt) as tien_tl_nt,
                sum(ck) as ck, sum(ck_nt) as ck_nt, sum(thue) as thue, sum(thue_nt) as thue_nt, 
                sum(pt) as pt, sum(pt_nt) as pt_nt, '' as ma_nt, 0 as ty_gia, '' as dien_giai, 
                 ma_kh, max(ten_kh) as ten_kh, max(ten_kh2) as ten_kh2,max(dia_chi) as dia_chi, max(ong_ba) as ong_ba, max(ngay_tt) as ngay_tt,
                 null as tk_no, null as dien_giai_ph, null::ud_time as gio_gh, null as vi_tri_kh
                FROM tmpTonghop GROUP BY ma_vt, ma_kh;
	END IF;
	
	insert into tmpTonghop
	SELECT 0 as sysorder, 0 as sysprint,0 as systotal,
		max(ma_dvcs) as ma_dvcs, '' as stt_rec, '' as ma_ct, null::ud_ngay as ngay_ct, '' as so_ct,
		'' as ma_vt, 'TỔNG CỘNG' as ten_vt, 'TOTAL' as ten_vt2, '' as so_seri_vt, '' as dvt, 0 as ln, '' as ma_kho, 
                sum(sl_nhap) as sl_nhap, sum(sl_xuat) as sl_xuat, sum(so_luong) as so_luong,
                0 as gia_ban, 0 as gia_ban_nt, 
                sum(tien_ban) as tien_ban, sum(tien_ban_nt) as tien_ban_nt,
                sum(sl_tl) as sl_tl, sum(tien_tl) as tien_tl, sum(tien_tl_nt) as tien_tl_nt,
                sum(ck) as ck, sum(ck_nt) as ck_nt, sum(thue) as thue, sum(thue_nt) as thue_nt, 
                sum(pt) as pt, sum(pt_nt) as pt_nt, '' as ma_nt, 0 as ty_gia, '' as dien_giai, 
                '' AS ma_kh, '' as ten_kh, '' as ten_kh2, '' as dia_chi, '' as ong_ba, max(ngay_tt) as ngay_tt,
                null as tk_no, null as dien_giai_ph, null::ud_time as gio_gh, null as vi_tri_kh
                FROM tmpTonghop WHERE sysorder = 5
        UNION ALL
        SELECT 3 as sysorder, 0 as sysprint,0 as systotal,
		max(ma_dvcs) as ma_dvcs, '' as stt_rec, '' as ma_ct, null as ngay_ct, '' as so_ct,
		'' as ma_vt, '' as ten_vt, max(ten_kh2) as ten_vt2, '' as so_seri_vt, '' as dvt, 0 as ln, '' as ma_kho, 
                sum(sl_nhap) as sl_nhap, sum(sl_xuat) as sl_xuat, sum(so_luong) as so_luong,
                0 as gia_ban, 0 as gia_ban_nt, 
                sum(tien_ban) as tien_ban, sum(tien_ban_nt) as tien_ban_nt,
                sum(sl_tl) as sl_tl, sum(tien_tl) as tien_tl, sum(tien_tl_nt) as tien_tl_nt,
                sum(ck) as ck, sum(ck_nt) as ck_nt, sum(thue) as thue, sum(thue_nt) as thue_nt, 
                sum(pt) as pt, sum(pt_nt) as pt_nt, '' as ma_nt, 0 as ty_gia, '' as dien_giai, 
                ma_kh, max(ten_kh) as ten_kh, max(ten_kh2) as ten_kh2, max(dia_chi) as dia_chi, max(ong_ba) as ong_ba, max(ngay_tt) as ngay_tt,
                null as tk_no, null as dien_giai_ph, null::ud_time as gio_gh, null as vi_tri_kh
                FROM tmpTonghop WHERE sysorder = 5 GROUP BY ma_kh;
			
	FOR r IN select * from tmpTonghop ORDER BY ma_kh, ma_vt, sysorder, so_ct LOOP
		if r.sysorder = 3 THEN
			--r.ma_vt = r.ma_kh;
		END IF;
		return next r;
	END LOOP;		
	
	DROP TABLE tmpTonghop;
	DROP TABLE tmpchitiet;
	RETURN;
END$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.arsobk1(date, date, character varying, character varying, character varying, character varying, character varying, character varying, smallint, character varying, character varying, character varying, character varying, character varying)
  OWNER TO postgres;
