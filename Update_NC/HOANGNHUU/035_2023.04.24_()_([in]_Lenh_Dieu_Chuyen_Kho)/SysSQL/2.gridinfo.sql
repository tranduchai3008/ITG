

----------[gridinfo]--------

BEGIN;

DELETE FROM gridinfo WHERE gridid in ('ct95');

INSERT INTO gridinfo (gridid,fieldname,fieldposition,fieldcaption,fieldcaption2,visible,style,width,lang,auto,excel_visible,excel_width,dashboard_values_yn,merge_caption) VALUES
('ct95','ten_vt','1','Tên vật tư','Item Name','1','TEN','200','','0','1','0.00','0',''),
('ct95','gia_nt','6','Giá nt','FC Price','1','GIA_NT','100','','0','1','0.00','0',''),
('ct95','tien_nt','7','Tiền nt','FC Amount','1','TIEN_NT','100','','0','1','0.00','0',''),
('ct95','ma_nx','8','Tk nợ','Dr Account','0','MA_TK','100','','0','1','0.00','0',''),
('ct95','tk_vt','9','Tk có','Cr Account','0','MA_TK','100','','0','1','0.00','0',''),
('ct95','gia','10','Giá','Price','1','GIA','100','','0','1','0.00','0',''),
('ct95','tien','11','Tiền','Amount','1','TIEN','100','','0','1','0.00','0',''),
('ct95','ma_vv','12','Mã Vv','JobID','1','MA','100','','0','1','0.00','0',''),
('ct95','po_khsx','2','PO KHSX','PO KHSX','1','TEN','200','','0','1','0.00','0',''),
('ct95','dau_tuan','3','Dấu tuần','Week','1','TEN','200','','0','1','0.00','0',''),
('ct95','dvt','4','Dvt','Unit','1','DVT','50','','0','1','0.00','0',''),
('ct95','so_luong','5','Số lượng','Quantity','1','SL','100','','0','1','0.00','0',''),
('ct95','so_ct_qc2','13','Phiếu chất lượng','JobID','0','','100','','0','1','0.00','0','');

COMMIT;