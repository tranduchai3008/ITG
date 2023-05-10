-- Function: public.sobctdhdh(date, date, character varying, character varying, character varying, character varying)

-- DROP FUNCTION public.sobctdhdh(date, date, character varying, character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION public.sobctdhdh(corig_date1 date, corig_date2 date, cplan_date1 date, cplan_date2 date, cso_po character varying, cma_kh character varying, cnh_kh1 character varying, cma_dvcs character varying)
  RETURNS SETOF sobctdhdh_return AS
$BODY$
	Declare
		r sobctdhdh_return;
	begin
		-- select * from sobctdhdh('2023-03-24', '2023-03-24', '2023-03-24', '2023-03-24', '4100990038', '', '', '01')
		drop table if exists sobctdhdh_temp; -- select * from sobctdhdh_temp
		create temp table sobctdhdh_temp as
		select 5 as sysorder, 1 as sysprint, 0 as systotal, max(b.ma_kh) ma_kh, ''::character varying as ten_kh, a.so_po as so_po,
			a.ma_vt, ''::character varying ten_vt, max(a.ma_noi_nhan) as rcv, a.ngay_phai_gh as orig_date, max(a.rcvd_date) as rcvd_date,
			a.ngay_kh_gh as plan_date, max(a.dvt) as dvt, ''::character varying as status, sum(a.so_luong) so_luong, 0::ud_float as chenh_lech, 0::ud_smallint as so_lan,
			a.stt_rec, a.ln
		from ctkhgh a left join ph64 b on a.stt_rec = b.stt_rec
		where case when corig_date1 <> '1900-01-01' then a.ngay_phai_gh >= corig_date1 else 1=1 end 
			and case when corig_date2 <> '1900-01-01' then a.ngay_phai_gh <= corig_date2 else 1=1 end 
			and case when cplan_date1 <> '1900-01-01' then a.ngay_kh_gh >= cplan_date1 else 1=1 end 
			and case when cplan_date2 <> '1900-01-01' then a.ngay_kh_gh <= cplan_date2 else 1=1 end 
			and case when cso_po <> '' then a.so_po = cso_po else 1 = 1 end
			and case when cma_kh <> '' then INLIST(b.ma_kh, cma_kh) else 1 = 1 end
			and exists(select 1 from dmkh where b.ma_kh = ma_kh
							and case when cnh_kh1 <> '' then inlist(nh_kh1, cnh_kh1) else 1=1 end
			)
			and inlist(b.ma_dvcs, cma_dvcs)
		group by a.so_po, ma_vt, orig_date, plan_date, a.stt_rec, a.ln;

		update sobctdhdh_temp a set status = b.trang_thai from ctkhgh b where a.stt_rec = b.stt_rec and a.ln = b.ln;
		
		-- Cập nhật các dòng chênh lệch
		update sobctdhdh_temp a set chenh_lech = case when so_luong_cancel <> 0 then so_luong_new - so_luong_cancel else 0 end from (
			select so_po, ma_vt, orig_date, plan_date, sum(so_luong_new) as so_luong_new, sum(so_luong_cancel) as so_luong_cancel from (
				select so_po, ma_vt, orig_date, plan_date, coalesce(sum(so_luong), 0) as so_luong_new, 0::ud_float as so_luong_cancel
					from sobctdhdh_temp
				where status = 'New'
				group by so_po, ma_vt, orig_date, plan_date

				union all 

				select so_po, ma_vt, orig_date, plan_date, 0::ud_float as so_luong_new, coalesce(sum(so_luong), 0) as so_luong_cancel
					from sobctdhdh_temp
				where status = 'Cancel'
				group by so_po, ma_vt, orig_date, plan_date
			)b group by so_po, ma_vt, orig_date, plan_date
		)b where a.so_po = b.so_po and a.ma_vt = b.ma_vt and a.orig_date = b.orig_date and a.plan_date = b.plan_date;

		update sobctdhdh_temp a set so_lan = b.so_lan from (
			select so_po, ma_vt, orig_date, plan_date, stt_rec, ln, 
				row_number() over(partition by so_po, ma_vt, orig_date, plan_date order by so_po, ma_vt, orig_date, plan_date, stt_rec, ln) as so_lan 
			from sobctdhdh_temp
		)b where a.so_po = b.so_po and a.ma_vt = b.ma_vt and a.orig_date = b.orig_date and a.plan_date = b.plan_date and a.stt_rec = b.stt_rec and a.ln = b.ln;

		update sobctdhdh_temp a set ten_kh = b.ten_kh from dmkh b where a.ma_kh = b.ma_kh;
		update sobctdhdh_temp a set ten_vt = b.ten_vt from dmvt b where a.ma_vt = b.ma_vt;
		
		drop table if exists so_lan_temp;
		create table so_lan_temp as select distinct so_lan from sobctdhdh_temp;
		for r in select * from sobctdhdh_temp order by so_po, ma_vt, orig_date, plan_date, so_lan
		loop
			if r.plan_date = '1900-01-01' then r.plan_date = null; end if;
			if r.orig_date = '1900-01-01' then r.orig_date = null; end if;
			if r.rcvd_date = '1900-01-01' then r.rcvd_date = null; end if;

			return next r;
		end loop;

		--drop table if exists sobctdhdh_temp;
	end
$BODY$
  LANGUAGE plpgsql;
