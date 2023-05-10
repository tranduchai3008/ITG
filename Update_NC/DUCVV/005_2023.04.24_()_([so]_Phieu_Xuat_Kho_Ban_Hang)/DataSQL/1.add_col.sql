alter table ctlo
add column po_khsx ud_ma,
 add column dau_tuan ud_ma;

 alter table ct81
add column po_khsx ud_ma,
 add column dau_tuan ud_ma,
 add column ma_noi_nhan ud_ma;


select create_schema_info();
select createdbcolumns();
