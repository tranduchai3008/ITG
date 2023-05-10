BEGIN;

DELETE FROM vouchergridinfo WHERE vcode = 'QC2';

INSERT INTO vouchergridinfo (vcode,gridid,fieldname,fieldposition,fieldcaption,fieldcaption2,carry,visible,editable,style,width,lookupid,lookupfieldname,notempty) VALUES
('QC2','ctqcsp','so_ct_rew','21','Phiếu Sorting/Rework','Phiếu Sorting/Rework','0','0','1','','100','','','0'),
('QC2','ctqcsp','so_luong_qc1','8','SL kiểm tra chọn mẫu','Number of test sample','0','1','0','SL','100','','','0'),
('QC2','ctqcsp','pass','13','PASS','PASS','0','1','0','CHECKBOX','50','','','0'),
('QC2','ctqcsp','dvt','5','Dvt','Unit','0','1','0','DVT','50','','','0'),
('QC2','ctqcsp','ten_vt','2','Tên hàng','Item Name','0','1','1','TEN','200','','','0'),
('QC2','ctqcsploi','ten_vt','2','Tên hàng','Item Name','0','1','1','TEN','200','','','0'),
('QC2','ctqcsp','ty_le_hong','12','Tỷ lệ NG','NG rate','0','1','1','HE_SO','100','','','0'),
('QC2','ctqcsp','ty_le_ok','11','Tỷ lệ OK','OK rate','0','1','1','HE_SO','100','','','0'),
('QC2','ctqcsploi','dvt','5','Dvt','Uom','0','1','0','DVT','50','','','0'),
('QC2','ctqcsploi','ma_loi','6','Mã lỗi','NG id','0','1','0','MA','80','','','0'),
('QC2','ctqcsploi','ten_loi','7','Tên lỗi','NG name','0','1','1','TEN','150','','','0'),
('QC2','ctqcsploi','so_luong_hong','8','SL hỏng','NG quantities','0','1','0','SL','100','','','0'),
('QC2','ctqcsp','so_ct_pd1','18','Lệnh sản xuất','Production orders','0','0','1','','100','','','0'),
('QC2','ctqcsp','so_ct_to2','17','Lệnh giao hàng','Delivery order','0','0','1','','100','','','0'),
('QC2','ctqcsp','so_luong_qc','7','SL kiểm tra','Checked quantities','0','1','0','SL','100','','','0'),
('QC2','ctqcsp','so_luong','9','SL OK','OK quantities','0','1','0','SL','100','','','0'),
('QC2','ctqcsp','so_luong_hong','10','SL NG','NG quantities','0','1','0','SL','100','','','0'),
('QC2','ctqcsp','ma_nv','15','Người kiểm tra','Checker','0','1','0','MA','120','','','0'),
('QC2','ctqcsp','so_ct_tk1','19','Phiếu thống kê','Statistical votes','0','0','1','','100','','','0'),
('QC2','ctqcsp','ghi_chu','16','Ghi chú','Note','0','1','0','','200','','','0'),
('QC2','ctqcsp','ma_vt','1','Mã hàng','Item ID','0','1','0','MA','100','','','1'),
('QC2','ctqcsploi','ma_vt','1','Mã hàng','Item ID','0','1','0','MA','100','','','0'),
('QC2','ctqcsp','so_ct_pxb','20','Phiếu điều chuyển','Delivery order','0','1','1','','100','','','0'),
('QC2','ctqcsp','thong_ke_loi','22','Thống kê lỗi','Statistics error','0','0','0','','100','','','0'),
('QC2','ctqcsp','reject','14','REJECT','REJECT','0','1','0','CHECKBOX','60','','','0'),
('QC2','ctqcsp','ma_version','6','Version','Version','0','0','1','','80','','','0'),
('QC2','ctqcsploi','po_khsx','3','PO KHSX','PO KHSX','0','1','1','MA','100','','','0'),
('QC2','ctqcsploi','dau_tuan','4','Dấu tuần','Dấu tuần','0','1','1','MA','100','','','0'),
('QC2','ctqcsp','po_khsx','3','PO KHSX','PO KHSX','0','1','1','MA','100','','','0'),
('QC2','ctqcsp','dau_tuan','4','Dấu tuần','Dấu tuần','0','1','1','MA','100','','','0');

COMMIT;
