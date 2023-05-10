BEGIN;

DELETE FROM gridinfo WHERE gridid in ('MfctdxvApp');

INSERT INTO gridinfo (gridid,fieldname,fieldposition,fieldcaption,fieldcaption2,visible,style,width,lang,auto,excel_visible,excel_width,dashboard_values_yn,merge_caption) VALUES
('MfctdxvApp','ma_kho','7','Mã kho','Store code','1','','80','','0','1','0.00','0',''),
('MfctdxvApp','ton13','8','SL tồn','The number N','1','SL','100','','0','1','0.00','0',''),
('MfctdxvApp','ngay_nhan_hang','12','Ngày xuất dự kiến','Uses','0','DATE','100','','0','0','0.00','0',''),
('MfctdxvApp','app_yn_i','1','Chọn','Tag','1','CHECKBOX','50','','0','1','0.00','0',''),
('MfctdxvApp','ma_vt','2','Mã VT','Item ID','1','','100','','0','1','0.00','0',''),
('MfctdxvApp','ten_vt','3','Tên vật tư','Item name','1','','150','','0','1','0.00','0',''),
('MfctdxvApp','dvt','6','Đvt','UOM','1','','50','','0','1','0.00','0',''),
('MfctdxvApp','so_luong','10','Số lượng','Quantity','1','SL','100','','0','1','0.00','0',''),
('MfctdxvApp','ghi_chu','13','Mục đích sử dụng','Uses','1','','200','','0','1','0.00','0',''),
('MfctdxvApp','so_ct_pd1','11','Số lệnh SX','Uses','0','','100','','0','0','0.00','0',''),
('MfctdxvApp','sl_pd1_0','9','SL trên lệnh SX','Quantity','0','SL','100','','0','0','0.00','0',''),
('MfctdxvApp','po_khsx','4','PO KHSX','PO KHSX','1','','150','','0','1','0.00','0',''),
('MfctdxvApp','dau_tuan','5','Dấu tuần','Week','1','','150','','0','1','0.00','0','');

COMMIT;
