alter table ph96 add column tinh_trang ud_smallint;
alter table ct96 add column so_top text;
select create_schema_info();
select createdbcolumns();