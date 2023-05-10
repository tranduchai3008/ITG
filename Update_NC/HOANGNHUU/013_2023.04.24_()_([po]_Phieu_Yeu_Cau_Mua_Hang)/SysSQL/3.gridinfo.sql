BEGIN;

DELETE FROM gridinfo WHERE gridid in ('ct91');

INSERT INTO gridinfo (gridid,fieldname,fieldposition,fieldcaption,fieldcaption2,visible,style,width,lang,auto,excel_visible,excel_width,dashboard_values_yn,merge_caption) VALUES
('ct91','ten_vt','0','Tên vật tư','Item Name','1','','200','','0','1','0.00','0',''),
('ct91','app_yn_i','9','Duyệt','App','1','CHECKBOX','50','','0','1','0.00','0',''),
('ct91','ma_kh','10','Mã NCC','Supplyer','1','','80','','0','1','0.00','0',''),
('ct91','ma_kho','1','Mã kho','Site ID','1','','80','','0','1','0.00','0',''),
('ct91','ma_vv','11','Mã Vv','JobID','0','','100','','0','1','0.00','0',''),
('ct91','dvt','2','Đvt','Unit','1','','50','','0','1','0.00','0',''),
('ct91','tien_nt','7','Tiền nt','FC Amount','1','TIEN','100','','0','1','0.00','0',''),
('ct91','gia_nt','6','Giá nt','FC Price','1','TIEN','80','','0','1','0.00','0',''),
('ct91','so_luong','5','Số lượng','Quantity','1','TIEN','80','','0','1','0.00','0',''),
('ct91','sl_duyet','8','SL Duyệt','Q.Ty App','1','TIEN','80','','0','1','0.00','0',''),
('ct91','ma_vt','-1','Mã Vt','Item ID','1','','100','','0','1','0.00','0',''),
('ct91','so_ct_dhb','12','Số CT đơn hàng bán','Sales order voucher number','1','SO_CT','120','','0','1','0.00','0',''),
('ct91','po_khsx','3','PO KHSX','PO KHSX','1','','120','','0','1','0.00','0',''),
('ct91','dau_tuan','4','Dấu tuần','Week','1','','120','','0','1','0.00','0','');

COMMIT;
