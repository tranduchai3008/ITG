BEGIN;

DELETE FROM gridinfo WHERE gridid in ('Inctkk1app');

INSERT INTO gridinfo (gridid,fieldname,fieldposition,fieldcaption,fieldcaption2,visible,style,width,lang,auto,excel_visible,excel_width,dashboard_values_yn,merge_caption) VALUES
('Inctkk1app','ma_vt','0','Mã vật tư','Item ID','1','','100','','0','1','0.00','0',''),
('Inctkk1app','ten_vt','1','Tên vật tư ','Item name','1','','150','','0','1','0.00','0',''),
('Inctkk1app','dvt','4','Đvt','UOM','1','','50','','0','1','0.00','0',''),
('Inctkk1app','ma_kho','5','Mã kho','Store code','1','','80','','0','1','0.00','0',''),
('Inctkk1app','ton13','6','SL tồn','The number N','1','SL','100','','0','1','0.00','0',''),
('Inctkk1app','so_luong','7','Sl kiểm kê','Quantity','1','SL','100','','0','1','0.00','0',''),
('Inctkk1app','so_luong_cl','8','Chênh lệch','Quantity','1','SL','100','','0','1','0.00','0',''),
('Inctkk1app','po_khsx','2','PO KHSX','PO KHSX','1','','150','','0','1','0.00','0',''),
('Inctkk1app','dau_tuan','3','Dấu tuần','Week','1','','150','','0','1','0.00','0',''),
('Inctkk1app','app_yn_i','-1','Chọn','Tag','0','CHECKBOX','50','','0','1','0.00','0','');

COMMIT;
