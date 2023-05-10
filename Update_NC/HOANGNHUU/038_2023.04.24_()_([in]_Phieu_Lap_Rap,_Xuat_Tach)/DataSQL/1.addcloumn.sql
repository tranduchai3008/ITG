alter table ct88 add column po_khsx ud_ma;
alter table ct88 add column dau_tuan ud_ma;
alter table ph88 add column po_khsx ud_ma;
alter table ph88 add column dau_tuan ud_ma;
select create_schema_info();
select createdbcolumns();

