alter table ctqcsp
add column po_khsx ud_ma,
add column dau_tuan ud_ma;

alter table ctqcsploi
add column po_khsx ud_ma,
add column dau_tuan ud_ma;

select createdbcolumns();
select create_schema_info();