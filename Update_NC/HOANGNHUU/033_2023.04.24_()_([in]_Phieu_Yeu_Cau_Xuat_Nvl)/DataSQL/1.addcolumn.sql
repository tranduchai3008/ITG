﻿alter table ctdxnvl add column po_khsx ud_ma;
alter table ctdxnvl add column dau_tuan ud_ma;
select create_schema_info();
select createdbcolumns();