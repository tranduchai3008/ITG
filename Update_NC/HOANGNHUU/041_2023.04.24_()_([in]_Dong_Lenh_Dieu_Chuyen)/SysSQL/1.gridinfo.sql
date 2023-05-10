BEGIN;

DELETE FROM gridinfo WHERE gridid in ('INApprove');

INSERT INTO gridinfo (gridid,fieldname,fieldposition,fieldcaption,fieldcaption2,visible,style,width,lang,auto,excel_visible,excel_width,dashboard_values_yn,merge_caption) VALUES
('INApprove','app_yn_i','3','Chọn','Tag','1','CHECKBOX','50','','0','1','0.00','0',''),
('INApprove','ten_vt','5','Tên vật tư','Item name','1','','150','','0','1','0.00','0',''),
('INApprove','gia','10','Đơn giá','Price','0','GIA','80','','0','1','0.00','0',''),
('INApprove','tien','11','Thành tiền ','Price','0','TIEN','80','','0','1','0.00','0',''),
('INApprove','sl_duyet','12','Số lượng duyệt','Quantity requirement','1','SL','100','','0','1','0.00','0',''),
('INApprove','ma_vt','4','Mã VT','Item ID','1','','100','','0','1','0.00','0',''),
('INApprove','po_khsx','6','PO KHSX','PO KHSX','1','','150','','0','1','0.00','0',''),
('INApprove','dau_tuan','7','Dấu tuần','Week','1','','150','','0','1','0.00','0',''),
('INApprove','dvt','8','Đvt','UOM','1','','50','','0','1','0.00','0',''),
('INApprove','so_luong','9','Số lượng ','Quantity requirement','1','SL','80','','0','1','0.00','0','');

COMMIT;
