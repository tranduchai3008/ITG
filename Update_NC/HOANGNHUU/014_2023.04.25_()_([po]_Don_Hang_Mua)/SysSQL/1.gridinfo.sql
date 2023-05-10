BEGIN;

DELETE FROM gridinfo WHERE gridid in ('ctycmh');

INSERT INTO gridinfo (gridid,fieldname,fieldposition,fieldcaption,fieldcaption2,visible,style,width,lang,auto,excel_visible,excel_width,dashboard_values_yn,merge_caption) VALUES
('ctycmh','ten_vt','3','Tên hàng hóa','Voucher Date','1','Ten','180','','0','1','0.00','0',''),
('ctycmh','so_luong','11','SL đặt','Q.Ty','1','SL','70','','0','1','0.00','0',''),
('ctycmh','sl_nhap_qt','9','SL y.cầu','Q.Ty','1','SL','70','','0','1','0.00','0',''),
('ctycmh','sl_xuat_qt','10','SL Đã đặt','Q.Ty','1','SL','70','','0','1','0.00','0',''),
('ctycmh','ma_vt','2','Mã hàng','Item code','1','MA','100','','0','1','0.00','0',''),
('ctycmh','tag','1','Chọn','Select','1','CHECKBOX','40','','0','1','0.00','0',''),
('ctycmh','dvt','5','Đvt','Unit','1','DVT','50','','0','1','0.00','0',''),
('ctycmh','dien_giai','0','Mô tả chi tiết / Quy cách','explain
','0','Ten','160','','0','0','0.00','0',''),
('ctycmh','dau_tuan','7','Dấu tuần','Week','1','MA','120','','0','1','0.00','0',''),
('ctycmh','po_khsx','6','PO KHSX','PO KHSX','1','MA','120','','0','1','0.00','0','');

COMMIT;
