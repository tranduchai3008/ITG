-- Function: public.sobctdldc(date, date, character varying, character varying, character varying, character varying, character varying)

-- DROP FUNCTION public.sobctdldc(date, date, character varying, character varying, character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION public.sobctdldc(dfrom date, dto date, cma_kh character varying, cnh_kh1 character varying, cnh_kh2 character varying, cnh_kh3 character varying, cma_dvcs character varying)
  RETURNS SETOF sobctdldc_return AS
$BODY$
	declare
		r sobctdldc_return;
	begin
		drop table if exists sobctdldc_temp;
		create temp table sobctdldc_temp as
		select 5 as sysorder, 1 as sysprint, 1 as systotal, c.ma_kh as ma_kh, ''::character varying ten_kh, a.so_dh, a.ma_vt, ''::character varying ten_vt, b.ma_noi_nhan, a.so_ecis, a.ngay_gh, null::ud_ngay ngay_giao_thuc_te, a.so_luong as so_luong, a.sl_pallet as so_pallet, a.so_top as so_top, a.stt_rec, a.ln
		FROM ct96 a left join ctcont b on a.stt_rec = b.stt_rec and a.so_ecis = b.so_ecis and a.ma_noi_nhan = b.ma_noi_nhan and a.ngay_gh = b.ngay_dong_cont
				left join ph96 c on a.stt_rec = c.stt_rec
		WHERE case when dfrom <> '1900-01-01' then a.ngay_gh >= dfrom else 1=1 end
			and case when dto <> '1900-01-01' then a.ngay_gh <= dto else 1=1 end
			and case when cma_kh <> '' then inlist(c.ma_kh, cma_kh) else 1=1 end
			and exists(select 1 from dmkh where ma_kh = c.ma_kh
							and case when cnh_kh1 <> '' then inlist(nh_kh1, cnh_kh1) else 1= 1 end
							and case when cnh_kh2 <> '' then inlist(nh_kh2, cnh_kh2) else 1= 1 end
							and case when cnh_kh3 <> '' then inlist(nh_kh3, cnh_kh3) else 1= 1 end
			)
			and inlist(c.ma_dvcs, cma_dvcs);

		Update sobctdldc_temp a set ten_kh = b.ten_kh from dmkh b where a.ma_kh = b.ma_kh;
		Update sobctdldc_temp a set ten_vt = b.ten_vt from dmvt b where a.ma_vt = b.ma_vt;
		Update sobctdldc_temp a set ngay_giao_thuc_te = b.ngay_ct from ct81 b where a.stt_rec = b.stt_rec_vc and a.ln = b.ln_vc;

		-- Thêm dòng nhóm tổng
		insert into sobctdldc_temp(sysorder, sysprint, systotal, ma_kh, ten_kh, ngay_gh, ngay_giao_thuc_te, so_luong, so_pallet)
		select 4 as sysorder, 1 sysprint, 2 as systotal, ma_kh, max(ten_kh) ten_kh, null, null, sum(so_luong) so_luong, sum(so_pallet) so_pallet
		from sobctdldc_temp
		group by ma_kh;
		-- Thêm dòng tổng
		insert into sobctdldc_temp(sysorder, sysprint, systotal, ma_kh, ten_kh, ngay_gh, ngay_giao_thuc_te, so_luong, so_pallet)
		select 3 as sysorder, 1 sysprint, 2 as systotal, '', 'Tổng cộng', null, null, sum(so_luong) so_luong, sum(so_pallet) so_pallet
		from sobctdldc_temp where sysorder = 5;

		for r in select * from sobctdldc_temp order by ma_kh, sysorder 
		loop
			if r.sysorder = 5 then
				r.ma_kh = '';
				r.ten_kh = '';
			end if;
			return next r;
		end loop;
			
	end
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.sobctdldc(date, date, character varying, character varying, character varying, character varying, character varying)
  OWNER TO postgres;
