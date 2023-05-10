-- Function: public.potranstatus(date, date, date, date, character varying, character varying, character varying, character varying, character varying, character varying, character varying)

-- DROP FUNCTION public.potranstatus(date, date, date, date, character varying, character varying, character varying, character varying, character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION public.potranstatus(dfrom date, dto date, dtngay_nh1 date, dtngay_nh2 date, cso_ct1 character varying, cso_ct2 character varying, cma_kh character varying, cbranch character varying, cgroup character varying, cstatus character varying, cma_kho character varying)
  RETURNS SETOF potranstatus_return AS
$BODY$
DECLARE    
    _r record;
    r Potranstatus_return;
    strSQL character varying;
    _stt smallint;
   
BEGIN

-- select * from potranstatus('20230101', '20230131', '19000101', '19000101', '', '', '', '01', '', '1,2', '')
	CREATE TEMP TABLE tmpph94 AS 
			SELECT ma_dvcs, stt_rec, ma_kh, ma_kh2, ten_kh, ten_kh2, dia_chi, dia_chi2, dien_thoai, dien_thoai2, ong_ba, ong_ba2, ma_gd 
			FROM ph94 
			WHERE (Ngay_ct between dfrom and dto)
			and status <> '0'
			AND (CASE WHEN cso_ct1 <> '' THEN trim(so_ct) >= cso_ct1 ELSE 1=1 END)
			AND (CASE WHEN cso_ct2 <> '' THEN trim(so_ct) <= cso_ct2 ELSE 1=1 END)
			AND (CASE WHEN cstatus <> '*' THEN  inlist(status,cstatus) ELSE 1=1 END)
			AND ma_kh like cma_kh||'%' 
			AND stt_rec IN(SELECT stt_rec FROM ct94 WHERE exists(select 1 from dmvt where ct94.ma_vt = dmvt.ma_vt and INLIST(dmvt.ma_kho, cma_kho)))
			and stt_rec in(select stt_rec from ctkhnh where case when dtngay_nh1 <> '1900-01-01' then ngay_hua_nh >= dtngay_nh1 else 1=1 end
							and case when dtngay_nh2 <> '1900-01-01' then ngay_hua_nh <= dtngay_nh2 else 1=1 end)
			AND ma_dvcs like cbranch||'%';
	--and inlist(ma_kho, '||quote_literal(cma_kho)||')	
	strSQL	:= 'CREATE TEMP TABLE tmpTable01 AS
			SELECT stt_rec, ln as ln, ln2 as ln2, MAX(ngay_ct) as ngay_ct, MAX(ma_ct) as ma_ct, MAX(so_ct) as so_ct, ma_vt, SUM(so_luong) as so_luong, 
			max(gia) as gia, max(gia_nt) as gia_nt, sum(tien) as tien, sum(tien_nt) as tien_nt, sum(thue) as thue, sum(thue_nt) as thue_nt, sum(ck) as ck, 
			sum(ck_nt) as ck_nt, MAX(stt_rec_01) as stt_rec_01, MAX(so_ct_01) as so_ct_01, MAX(ngay_ct_01) as ngay_ct_01, SUM(so_luong_01) as so_luong_01,
			SUM(so_luong - so_luong_01) as chenh_lech_01, MAX(ghi_chu) as ghi_chu, max(dvt) as dvt, MAX(muc_dich_sd) as muc_dich_sd,MAX(dien_giai) as dien_giai, MAX(so_ct_pr0) as so_ct_pr0, max(po_khsx) as  po_khsx, max(dau_tuan) as  dau_tuan
			FROM
			(SELECT ct1.stt_rec, ct1.ln_item as ln, ct1.ln as ln2, MAX(ct1.ngay_ct) as ngay_ct, max(ct1.ma_ct) as ma_ct, MAX(ct1.so_ct) as so_ct, ct1.ma_vt as ma_vt,
				sum(ct1.so_luong) as so_luong, max(ct2.gia_mua) as gia, max(ct2.gia_mua_nt) as gia_nt, sum(ct1.so_luong * ct2.gia_mua) as tien, 
				sum(ct1.so_luong * ct2.gia_mua_nt) as tien_nt, sum(ct1.so_luong * ct2.gia_mua * ct2.thue_suat / 100) as thue, 
				sum(ct1.so_luong * ct2.gia_mua_nt * ct2.thue_suat / 100) as thue_nt, sum(ct1.so_luong * ct2.gia_mua * ct2.pt_ck / 100) as ck, 
				sum(ct1.so_luong * ct2.gia_mua_nt * ct2.thue_suat / 100) as ck_nt, '''' as stt_rec_01, '''' as so_ct_01, null as ngay_ct_01, 0 as so_luong_01, 
				0 as chenh_lech_01, max(ct1.ghi_chu) as ghi_chu, max(ct2.dvt) as dvt, max(ct2.muc_dich_sd) as muc_dich_sd,max(ct2.dien_giai) as dien_giai, max(ct2.so_ct_pr0) as  so_ct_pr0, max(ct2.po_khsx) as  po_khsx, max(ct2.dau_tuan) as  dau_tuan
				FROM ctkhnh ct1 left join ct94 ct2 on ct1.stt_rec = ct2.stt_rec and ct1.ln_item = ct2.ln
				WHERE ct1.stt_rec IN (SELECT stt_rec FROM tmpph94) 
				AND EXISTS(SELECT 1 FROM dmvt WHERE ct1.ma_vt = dmvt.ma_vt AND inlist(dmvt.ma_kho,'|| quote_literal(cma_kho)||'))
				AND CASE WHEN '||quote_literal(dtngay_nh1)||' <> ''1900-01-01'' THEN ct1.ngay_hua_nh >= '||quote_literal(dtngay_nh1)||' ELSE 1=1 END
				AND CASE WHEN '||quote_literal(dtngay_nh2)||' <> ''1900-01-01'' THEN ct1.ngay_hua_nh <= '||quote_literal(dtngay_nh2)||' ELSE 1=1 END
				GROUP BY ct1.stt_rec, ct1.ma_vt, ct1.ln, ct1.ln_item
			UNION ALL 
			SELECT ct2.stt_rec_dh as stt_rec, ct2.ln_dh as ln, ct2.ln_dh2 as ln2, '||quote_literal('19000101')||' as ngay_ct, '''' as ma_ct, '''' as co_ct, 
				ct2.ma_vt as ma_vt, 0 as so_luong, 0 as gia, 0 as gia_nt, 0 as tien, 0 as tien_nt, 0 as thue, 0 as thue_nt, 0 as ck, 0 as ck_nt,
				max(ct2.stt_rec) as stt_rec_01, max(ct2.so_ct) as so_ct_01, max(ct2.ngay_ct) as ngay_ct_01, sum(ct2.so_luong) as so_luong_01, 0 as chenh_lech_01,
				'''' as ghi_chu, '''' as dvt, ''''::character varying as muc_dich_sd,''''::character varying as dien_giai ,''''::character varying as  so_ct_pr0,
				''''::character varying as  po_khsx, ''''::character varying as  dau_tuan
				FROM ct77 ct2  left join ph77 ph77 on ct2.stt_rec = ph77.stt_rec
				WHERE ct2.stt_rec_dh IN (SELECT stt_rec FROM tmpph94)
				and ph77.status <> ''0''
				AND EXISTS(SELECT 1 FROM dmvt WHERE ct2.ma_vt = dmvt.ma_vt AND inlist(dmvt.ma_kho,'|| quote_literal(cma_kho)||')) 
				AND exists(select 1 from ctkhnh 
						where ct2.stt_rec_dh = ctkhnh.stt_rec and ct2.ln_dh2 = ctkhnh.ln
						and case when '||quote_literal(dtngay_nh1)||' <> ''1900-01-01'' then ngay_hua_nh >= '||quote_literal(dtngay_nh1)||' else 1=1 end
						and case when '||quote_literal(dtngay_nh2)||' <> ''1900-01-01'' then ngay_hua_nh <= '||quote_literal(dtngay_nh2)||' else 1=1 end
						)
				and case when '||quote_literal(dfrom)||' <> ''1900-01-01'' then ph77.ngay_ct >= '||quote_literal(dfrom)||' else 1=1 end
				and case when '||quote_literal(dto)||' <> ''1900-01-01'' then ph77.ngay_ct <= '||quote_literal(dto)||' else 1=1 end
		
				GROUP BY ct2.stt_rec_dh, ct2.ma_vt, ct2.ln_dh, ct2.ln_dh2
			UNION ALL
			SELECT ct2.stt_rec_po1 as stt_rec, ct2.ln_po1 as ln, ct2.ln_po12 as ln2, '||quote_literal('19000101')||' as ngay_ct, '''' as ma_ct, '''' as co_ct, 
				ct2.ma_vt as ma_vt, 0 as so_luong, 0 as gia, 0 as gia_nt, 0 as tien, 0 as tien_nt, 0 as thue, 0 as thue_nt, 0 as ck, 0 as ck_nt,
				max(ct2.stt_rec) as stt_rec_01, max(ct2.so_ct) as so_ct_01, max(ct2.ngay_ct) as ngay_ct_01, sum(ct2.so_luong) as so_luong_01, 0 as chenh_lech_01,
				'''' as ghi_chu, '''' as dvt, ''''::character varying as muc_dich_sd,''''::character varying as dien_giai , ''''::character varying as  so_ct_pr0,
				''''::character varying as  po_khsx, ''''::character varying as  dau_tuan
				FROM ct74 ct2  left join ph74 ph74 on ct2.stt_rec = ph74.stt_rec
				WHERE ct2.stt_rec_po1 IN (SELECT stt_rec FROM tmpph94)
				and ph74.status <> ''0''
				AND EXISTS(SELECT 1 FROM dmvt WHERE ct2.ma_vt = dmvt.ma_vt AND inlist(dmvt.ma_kho,'|| quote_literal(cma_kho)||')) 
				AND exists(select 1 from ctkhnh 
						where ct2.stt_rec_po1 = ctkhnh.stt_rec and ct2.ln_po12 = ctkhnh.ln
						and case when '||quote_literal(dtngay_nh1)||' <> ''1900-01-01'' then ngay_hua_nh >= '||quote_literal(dtngay_nh1)||' else 1=1 end
						and case when '||quote_literal(dtngay_nh2)||' <> ''1900-01-01'' then ngay_hua_nh <= '||quote_literal(dtngay_nh2)||' else 1=1 end
						)
				and case when '||quote_literal(dfrom)||' <> ''1900-01-01'' then ph74.ngay_ct >= '||quote_literal(dfrom)||' else 1=1 end
				and case when '||quote_literal(dto)||' <> ''1900-01-01'' then ph74.ngay_ct <= '||quote_literal(dto)||' else 1=1 end
		
				GROUP BY ct2.stt_rec_po1, ct2.ma_vt, ct2.ln_po1, ct2.ln_po12
				) 
			a GROUP BY stt_rec, ma_vt, ln, ln2';
			
	RAISE NOTICE 'strSQL = %', strSQL;
	EXECUTE strSQL;
	strSQL  := 'CREATE TEMP TABLE tmpTable02 AS 
					SELECT MAX(stt_rec) as stt_rec, MAX(ngay_ct) as ngay_ct, MAX(ma_ct) as ma_ct, MAX(so_ct) as so_ct, ln as ln, ln2 as ln2,
						ma_vt, SUM(so_luong) as so_luong, max(gia) as gia, max(gia_nt) as gia_nt, sum(tien) as tien, sum(tien_nt) as tien_nt,
						sum(thue) as thue, sum(thue_nt) as thue_nt, sum(ck) as ck, sum(ck_nt) as ck_nt, MAX(stt_rec_01) as stt_rec_01, 
						MAX(so_ct_01) as so_ct_01, MAX(ngay_ct_01) as ngay_ct_01, SUM(so_luong_01) as so_luong_01, SUM(chenh_lech_01) as chenh_lech_01,
						MAX(stt_rec_12) as stt_rec_12, MAX(so_ct_12) as so_ct_12, MAX(ngay_ct_12) as ngay_ct_12, SUM(so_luong_12) as so_luong_12,
						SUM(so_luong_01 - so_luong_12) as chenh_lech_12, MAX(ghi_chu) as ghi_chu, MAX(dvt) as dvt, MAX(muc_dich_sd) as muc_dich_sd,MAX(dien_giai) as dien_giai,
						MAX(so_ct_pr0) as so_ct_pr0, max(po_khsx) as  po_khsx, max(dau_tuan) as  dau_tuan
						FROM
						(SELECT MAX(tmp01.stt_rec) as stt_rec, MAX(tmp01.ngay_ct) as ngay_ct, MAX(tmp01.ma_ct) as ma_ct, MAX(tmp01.so_ct) as so_ct,
							tmp01.ln as ln, tmp01.ln2 as ln2,
							MAX(tmp01.ma_vt) as ma_vt, SUM(tmp01.so_luong) as so_luong, max(tmp01.gia) as gia, max(tmp01.gia_nt) as gia_nt, 
							sum(tmp01.tien) as tien, sum(tmp01.tien_nt) as tien_nt, sum(tmp01.thue) as thue, sum(tmp01.thue_nt) as thue_nt,
							sum(tmp01.ck) as ck, sum(tmp01.ck_nt) as ck_nt, MAX(tmp01.stt_rec_01) as stt_rec_01, MAX(tmp01.so_ct_01) as so_ct_01,
							MAX(tmp01.ngay_ct_01) as ngay_ct_01, SUM(tmp01.so_luong_01) as so_luong_01, SUM(tmp01.chenh_lech_01) as chenh_lech_01,
							'''' as stt_rec_12, '''' as so_ct_12, null as ngay_ct_12, 0 as so_luong_12, 0 as chenh_lech_12, 
							max(tmp01.ghi_chu) as ghi_chu, max(tmp01.dvt) as dvt, MAX(tmp01.muc_dich_sd) as muc_dich_sd, MAX(tmp01.dien_giai) as dien_giai,
							MAX(tmp01.so_ct_pr0) as so_ct_pr0, max(tmp01.po_khsx) as  po_khsx, max(tmp01.dau_tuan) as  dau_tuan
							FROM tmpTable01 tmp01 
							GROUP BY tmp01.stt_rec, tmp01.ma_vt, tmp01.ln, tmp01.ln2
						UNION ALL
						SELECT MAX(ct3.stt_rec_dh) as stt_rec, '||quote_literal('19000101')||'::ud_ngay as ngay_ct, 
							'||quote_literal('')||'::character varying as ma_ct, '||quote_literal('')||'::character varying as so_ct, ct3.ln_dh as ln,
							ct77.ln_dh2 as ln2, ct3.ma_vt as ma_vt, 0 as so_luong, 0 as gia, 0 as gia_nt, 0 as tien, 0 as tien_nt, 
							0 as thue, 0 as thue_nt, 0 as ck, 0 as ck_nt, MAX(ct3.stt_rec_pr1) as stt_rec_01, 
							'||quote_literal('')||'::character varying as so_ct_01, '||quote_literal('19000101')||'::ud_ngay as ngay_ct_01, 
							0 as so_luong_01, 0 as chenh_lech_01, MAX(ct3.stt_rec) as stt_rec_12, MAX(ct3.so_ct) as so_ct_12, 
							MAX(ct3.ngay_ct) as ngay_ct_12, SUM(ct3.so_luong) as so_luong_12, 0 as chenh_lech_12, '''' as ghi_chu, 
							'''' as dvt, ''''::character varying as muc_dich_sd, ''''::character varying as dien_giai, 
							''''::character varying as  so_ct_pr0, ''''::character varying as  po_khsx, ''''::character varying as  dau_tuan
							FROM ct71 ct3 left join ph71 ph3 on ct3.stt_rec = ph3.stt_rec 
							left join ct77 ct77 on ct3.stt_rec_pr1 = ct77.stt_rec and ct3.ln_pr1 = ct77.ln
							WHERE ph3.status <> ''0''
							AND ph3.stt_rec_dh IN (select stt_rec FROM tmpTable01)
							AND EXISTS(SELECT 1 FROM dmvt WHERE ct3.ma_vt = dmvt.ma_vt AND inlist(dmvt.ma_kho,'|| quote_literal(cma_kho)||'))
							and case when '||quote_literal(dfrom)||' <> ''1900-01-01'' then ph3.ngay_ct >= '||quote_literal(dfrom)||' else 1=1 end
							and case when '||quote_literal(dto)||' <> ''1900-01-01'' then ph3.ngay_ct <= '||quote_literal(dto)||' else 1=1 end
							GROUP BY ct3.stt_rec_dh, ct3.ma_vt, ct3.ln_dh, ct77.ln_dh2)b GROUP BY stt_rec, ma_vt, ln, ln2';
						
	EXECUTE strSQL;	
	RAISE NOTICE 'strSQL = %', strSQL;				
	strSQL	:= 'CREATE TEMP TABLE tmpTable03 AS
				SELECT 5 as sysorder, 1 as sysprint, 1 as systotal, max(ph1.ma_dvcs) as ma_dvcs, ct.stt_rec as stt_rec, 
				max(ct.ngay_ct) as ngay_ct, max(ct.so_ct) as so_ct, ct.ln as ln, ct.ln2 as ln2, SUM(ct.so_luong) as so_luong, max(gia) as gia, 
				max(gia_nt) as gia_nt, sum(tien) as tien, sum(tien_nt) as tien_nt, sum(thue) as thue, sum(thue_nt) as thue_nt, sum(ck) as ck, sum(ck_nt) as ck_nt,
				sum(ct.so_luong_01) as so_luong_01, sum(ct.chenh_lech_01) as chenh_lech_01, MAX(ph1.ma_kh) as ma_kh, MAX(ph1.ten_kh) as ten_kh, 
				MAX(ph1.ten_kh) as ten_kh2, MAX(ph1.ma_gd) as ma_gd, MAX(ct.ma_vt) as ma_vt, MAX(dmvt.ten_vt) as ten_vt, max(ct.stt_rec_01) as stt_rec_01,
				max(ct.so_ct_01) as so_ct_01, max(ngay_ct_01) as ngay_ct_01, SUM(so_luong_12) as so_luong_12, SUM(chenh_lech_12) as chenh_lech_12, 
				MAX(stt_rec_12) as stt_rec_12, MAX(so_ct_12) as so_ct_12, MAX(ngay_ct_12) as ngay_ct_12, 
				'||quote_literal('')||'::character varying as group_code, ''''::VARCHAR AS stt_rec_pr1, null::date as ngay_nh_po1, 
				''19000101''::date as ngay_nh_pr1, max(ct.dvt) as dvt, ''''::character varying as tt_dh, ''''::character varying as status, 
				max(ct.ghi_chu) as ghi_chu, 0::ud_smallint as user_id, ''''::character varying as user_name, max(ct.muc_dich_sd) as muc_dich_sd, max(ct.dien_giai) as dien_giai,
				max(ct.so_ct_pr0) as so_ct_pr0 ,''''::character varying as so_ct_dhb, max(ct.po_khsx) as  po_khsx, max(ct.dau_tuan) as  dau_tuan
				FROM tmpph94 ph1, tmpTable02 ct, dmvt dmvt  			 
				WHERE ph1.stt_rec = ct.stt_rec 
				AND ct.ma_vt = dmvt.ma_vt 
				GROUP BY ct.stt_rec, ct.ma_vt, ct.ln, ct.ln2';		
	
	RAISE NOTICE 'strSQL = %', strSQL;

	EXECUTE strSQL;

--update don hang dong
	update tmpTable03 a set chenh_lech_01 = 0 WHERE EXISTS(select 1 FROm ph94 where a.stt_rec = stt_rec  and status = '5');
	
		if cgroup = 'ma_vt' then
			Update tmpTable03 set group_code = ma_vt;
			
			INSERT INTO tmpTable03 SELECT 1 as sysorder, 0 as sysprint, 0 as systotal, '' as ma_dvcs, '' as stt_rec, null as ngay_ct, '' as so_ct, 
			max(ln) as ln, max(ln2) as ln2, sum(so_luong) as so_luong, 0 as gia, 0 as gia_nt, sum(tien) as tien, sum(tien_nt) as tien_nt, sum(thue) as thue, 
			sum(thue_nt) as thue_nt, sum(ck) as ck, sum(ck_nt) as ck_nt, sum(so_luong_01) as so_luong_01, sum(chenh_lech_01) as chenh_lech_01, ma_vt as ma_kh, 
			max(ten_vt) as ten_kh, max(ten_vt) as ten_kh2, 0 as ma_gd, '' as ma_vt, '' as ten_vt, '' as stt_rec_01, '' as so_ct_01, null as ngay_ct_01,
			sum(so_luong_12) as so_luong_12, sum(chenh_lech_12) as chenh_lech_12, '' as stt_rec_12, '' as so_ct_12, null as ngay_ct_12, ma_vt as group_code, 
			''''::VARCHAR AS stt_rec_pr1, null::date as ngay_nh_po1, null::date as ngay_nh_pr1, max(dvt) as dvt, ''::character varying as tt_dh, 
			''::character varying as status, ''::character varying as ghi_chu, null as user_id, null as user_name, null as muc_dich_sd,null as dien_giai, null as so_ct_pr0
			FROM tmpTable03 GROUP BY ma_vt;
		end if;
		if cgroup = 'ma_kh' then
			Update tmpTable03 set group_code = ma_kh;
			
			INSERT INTO tmpTable03 SELECT 1 as sysorder, 0 as sysprint, 0 as systotal, '' as ma_dvcs, '' as stt_rec, null as ngay_ct, '' as so_ct, 
			max(ln) as ln, max(ln2) as ln2, sum(so_luong) as so_luong, 0 as gia, 0 as gia_nt, sum(tien) as tien, sum(tien_nt) as tien_nt, sum(thue) as thue, 
			sum(thue_nt) as thue_nt, sum(ck) as ck, sum(ck_nt) as ck_nt, sum(so_luong_01) as so_luong_01, sum(chenh_lech_01) as chenh_lech_01, '' as ma_kh, 
			'' as ten_kh, '' as ten_kh2, 0 as ma_gd, ma_kh as ma_vt, max(ten_kh) as ten_vt, '' as stt_rec_01, '' as so_ct_01, null as ngay_ct_01,
			sum(so_luong_12) as so_luong_12, sum(chenh_lech_12) as chenh_lech_12, '' as stt_rec_12, '' as so_ct_12, null as ngay_ct_12, ma_kh as group_code, 
			''''::VARCHAR AS stt_rec_pr1, null::date as ngay_nh_po1, null::date as ngay_nh_pr1, null as dvt, ''::character varying as tt_dh, 
			''::character varying as status, ''::character varying as ghi_chu, null as user_id, null as user_name, null as muc_dich_sd,null as dien_giai, null as so_ct_pr0
			FROM tmpTable03 GROUP BY ma_kh;
		end if;
	_stt := 0;
	UPDATE tmpTable03 a SET so_ct = b.so_ct, ngay_ct = b.ngay_ct, user_id = b.user_id0  FROM ph94 b WHERE a.stt_rec = b.stt_rec;	
	update tmpTable03 a set user_name = b.user_name from userinfo b where a.user_id = b.user_id;
	UPDATE tmpTable03 a SET ngay_nh_po1 = b.ngay_hua_nh FROM ctkhnh b WHERE a.stt_rec = b.stt_rec and a.ln2 = b.ln and a.ln = b.ln_item;
	
	UPDATE tmpTable03 a SET stt_rec_pr1 = b.stt_rec
	FROM 
	(
		SELECT a.stt_rec_dh, max(a.stt_rec) as stt_rec
		FROM ct77 a left join ph77 b on a.stt_rec = b.stt_rec 
		WHERE a.stt_rec_dh in(SELECT stt_rec FROM ph94 WHERE Ngay_ct between dfrom and dto)
		and b.status <> '0'
		GROUP BY a.stt_rec_dh
		union all
		SELECT a.stt_rec_po1 as stt_rec_dh, max(a.stt_rec) as stt_rec
		FROM ct74 a left join ph74 b on a.stt_rec = b.stt_rec 
		WHERE a.stt_rec_po1 in(SELECT stt_rec FROM ph94 WHERE Ngay_ct between dfrom and dto)
		and b.status <> '0'
		GROUP BY a.stt_rec_po1
	)
	 b WHERE a.stt_rec = b.stt_rec_dh;
	 --UPDATE tmpTable03 a SET ngay_nh_pr1 = b.ngay_nh FROM ph77 b WHERE a.stt_rec_pr1 = b.stt_rec;
	 UPDATE tmpTable03 a SET ngay_nh_pr1 = b.ngay_ct FROM (select max(c.ngay_ct) as ngay_ct, b.stt_rec_dh, b.ln_dh, b.ln_dh2, b.ma_vt 
								from ct77 b left join ph77 c on b.stt_rec = c.stt_rec 
								where c.status <> '0'
								and b.stt_rec_dh in (select stt_rec from tmpTable03)
								group by b.stt_rec_dh, b.ln_dh, b.ln_dh2, b.ma_vt 
								union all
								select max(c.ngay_ct) as ngay_ct, b.stt_rec_po1 as stt_rec_dh, b.ln_po1, b.ln_po12, b.ma_vt 
								from ct74 b left join ph74 c on b.stt_rec = c.stt_rec 
								where c.status <> '0'
								and b.stt_rec_po1 in (select stt_rec from tmpTable03)
								group by b.stt_rec_po1, b.ln_po1, b.ln_po12, b.ma_vt 
								) b WHERE b.stt_rec_dh = a.stt_rec and a.ln = b.ln_dh and a.ln2 = b.ln_dh2 and a.ma_vt = b.ma_vt ;
	 UPDATE tmpTable03 a SET gia_nt = 0, tien_nt = 0 where stt_rec in(select stt_rec from ph94 where ma_gd = 1);
	 update tmpTable03 a set tt_dh = 'Chưa đến hạn' where a.ngay_nh_po1 >= current_date;
	 update tmpTable03 a set tt_dh = 'Chậm giao' where a.ngay_nh_po1 < current_date;-- and (a.ngay_nh_pr1 = null or a.ngay_nh_pr1 = '19000101');
	 update tmpTable03 a set tt_dh = 'Trước hạn' where a.ngay_nh_pr1 < a.ngay_nh_po1 and a.ngay_nh_pr1 <> '19000101'::ud_ngay;
	 update tmpTable03 a set tt_dh = 'Giao muộn' where a.ngay_nh_pr1 > a.ngay_nh_po1;
	 update tmpTable03 a set tt_dh = 'Đúng hạn' where a.ngay_nh_pr1 = a.ngay_nh_po1;
	 
	update tmpTable03 a set status = case when b.status = '0' then 'Lập chứng từ' when b.status = '1' then 'Chờ duyệt' when b.status = '2' then 'Duyệt'
					              when b.status = '3' then 'Thực hiện' when b.status = '4' then 'Hoàn thành' when b.status = '5' then 'Đóng'
					              when b.status = '6' then 'Từ chối duyệt' END  from ph94 b where a.stt_rec = b.stt_rec;
	update tmpTable03 a set so_ct_dhb = b.so_ct_dhb  from ct94 b where a.stt_rec = b.stt_rec and a.ln =b.ln;			              
--	update tmpTable03 a set status = b.status from ph94 b where a.so_ct = b.so_ct;

	
	FOR _r IN SELECT * FROM  tmpTable03 order by group_code, sysorder LOOP 
			r.sysorder	:= _r.sysorder;
			r.sysprint	:= _r.sysprint;
			r.systotal	:= _r.systotal;
			IF _r.sysorder <> 1 then
				_stt		:= _stt + 1;
			END IF;
			r.stt		:= _stt;
			r.ma_dvcs	:= _r.ma_dvcs;
			r.stt_rec	:= _r.stt_rec;
			r.ngay_ct	:= _r.ngay_ct;
			r.so_ct		:= _r.so_ct;
			r.ma_kh		:= _r.ma_kh;
			r.ten_kh	:= _r.ten_kh;
			r.ten_kh2	:= _r.ten_kh2;
			r.ma_vt		:= _r.ma_vt;
			r.ten_vt	:= _r.ten_vt;
			r.so_luong	:= _r.so_luong;
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
			r.group_code	:= _r.group_code;
			r.stt_rec_pr1	:= _r.stt_rec_pr1;
			r.ngay_nh_po1	:= _r.ngay_nh_po1;
			r.ngay_nh_pr1	:= _r.ngay_nh_pr1;
			r.cl_ngay	:= case when _r.ngay_nh_pr1 = '1900-01-01' then current_date -  _r.ngay_nh_po1 else _r.ngay_nh_po1 - _r.ngay_nh_pr1 end;--r.ngay_nh_po1 - r.ngay_nh_pr1;
			r.dvt		:= _r.dvt;
			r.tt_dh		:= _r.tt_dh;
			if _r.ngay_nh_pr1 = '19000101'::ud_ngay then
			r.ngay_nh_pr1 := null;
			end if;
			r.status	:= _r.status;
			r.ghi_chu	:= _r.ghi_chu;
			r.user_id	:= _r.user_id;
			r.user_name	:= _r.user_name;
			r.muc_dich_sd	:= _r.muc_dich_sd;
			r.dien_giai	:= _r.dien_giai;
			r.so_ct_pr0	:= _r.so_ct_pr0;
			r.so_ct_dhb	:= _r.so_ct_dhb;
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
ALTER FUNCTION public.potranstatus(date, date, date, date, character varying, character varying, character varying, character varying, character varying, character varying, character varying)
  OWNER TO postgres;
