alter table ct74 add column po_khsx ud_ma;
alter table cttksx add column po_khsx ud_ma;
alter table ct87 add column dau_tuan ud_ma;
alter table ct87 add column po_khsx ud_ma;
alter table ct87sp add column dau_tuan ud_ma;
alter table ct87sp add column po_khsx ud_ma;
alter table ct84 add column po_khsx ud_ma;
select create_schema_info();
select createdbcolumns();
