BEGIN;

DELETE FROM gridinfo WHERE gridid in ('InctduyetApp5','InctduyetApp','InctduyetApp2','InctduyetApp3','InctduyetApp4','InctduyetApp6');

INSERT INTO gridinfo (gridid,fieldname,fieldposition,fieldcaption,fieldcaption2,visible,style,width,lang,auto,excel_visible,excel_width,dashboard_values_yn,merge_caption) VALUES
('InctduyetApp3','ma_vt','0','Mã hàng','Item ID','1','','100','','0','1','0.00','0',''),
('InctduyetApp3','ten_vt','1','Tên hàng','Item name','1','','150','','0','1','0.00','0',''),
('InctduyetApp3','dvt','4','Đvt','UOM','1','','50','','0','1','0.00','0',''),
('InctduyetApp3','so_luong','8','Số lượng','Ver','1','SL','100','','0','1','0.00','0',''),
('InctduyetApp3','tk_vt','9','Tk vật tư','Ver','1','','80','','0','1','0.00','0',''),
('InctduyetApp3','ma_nx','10','Mã nx','Ver','1','','80','','0','1','0.00','0',''),
('InctduyetApp3','ma_vv','11','Mã v/v','Ver','1','','100','','0','1','0.00','0',''),
('InctduyetApp3','ten_vv','12','Tên v/v','Ver','1','','150','','0','1','0.00','0',''),
('InctduyetApp3','so_ct_pd1','13','Số lệnh SX','Ver','1','','100','','0','1','0.00','0',''),
('InctduyetApp3','so_ct_dxv','16','Số phiếu YC NVL','NVL No','1','','100','','0','1','0.00','0',''),
('InctduyetApp3','ma_khon','6','Mã kho nhập','Ver','1','','100','','0','1','0.00','0',''),
('InctduyetApp3','ma_kho','7','Mã kho xuất','Ver','1','','100','','0','1','0.00','0',''),
('InctduyetApp','dvt','4','Đvt','UOM','1','','50','','0','1','0.00','0',''),
('InctduyetApp','ma_kho','6','Mã kho','Ver','1','','80','','0','1','0.00','0',''),
('InctduyetApp','so_luong','7','Số lượng','Ver','1','SL','100','','0','1','0.00','0',''),
('InctduyetApp','ma_nx','10','Mã nx','Ver','1','','80','','0','1','0.00','0',''),
('InctduyetApp','ma_vv','11','Mã v/v','Ver','1','','100','','0','1','0.00','0',''),
('InctduyetApp','ten_vv','12','Tên v/v','Ver','1','','150','','0','1','0.00','0',''),
('InctduyetApp','ma_cd_gt','13','Công đoạn tính giá','Ver','1','','100','','0','1','0.00','0',''),
('InctduyetApp','so_ct_pd1','14','Số lệnh SX','Ver','1','','100','','0','1','0.00','0',''),
('InctduyetApp','ma_bp','15','Mã bp','Ver','1','','100','','0','1','0.00','0',''),
('InctduyetApp','ma_cp','16','Mã cp','Ver','1','','100','','0','1','0.00','0',''),
('InctduyetApp','so_ct_qc2','17','Số phiếu QC','QC No','1','','100','','0','1','0.00','0',''),
('InctduyetApp2','ma_vt','0','Mã hàng','Item ID','1','','100','','0','1','0.00','0',''),
('InctduyetApp2','ten_vt','1','Tên hàng','Item name','1','','150','','0','1','0.00','0',''),
('InctduyetApp2','dvt','4','Đvt','UOM','1','','50','','0','1','0.00','0',''),
('InctduyetApp2','ma_kho','6','Mã kho','Ver','1','','80','','0','1','0.00','0',''),
('InctduyetApp2','so_luong','7','Số lượng','Ver','1','SL','100','','0','1','0.00','0',''),
('InctduyetApp2','tk_vt','9','Tk vật tư','Ver','1','','80','','0','1','0.00','0',''),
('InctduyetApp2','ma_nx','10','Mã nx','Ver','1','','80','','0','1','0.00','0',''),
('InctduyetApp2','ma_vv','11','Mã v/v','Ver','1','','100','','0','1','0.00','0',''),
('InctduyetApp2','ten_vv','12','Tên v/v','Ver','1','','150','','0','1','0.00','0',''),
('InctduyetApp2','ma_cd_gt','13','Công đoạn tính giá','Ver','1','','100','','0','1','0.00','0',''),
('InctduyetApp2','so_ct_pd1','14','Số lệnh SX','Ver','1','','100','','0','1','0.00','0',''),
('InctduyetApp2','ma_bp','15','Mã bp','Ver','1','','100','','0','1','0.00','0',''),
('InctduyetApp2','ma_cp','16','Mã cp','Ver','1','','100','','0','1','0.00','0',''),
('InctduyetApp2','so_ct_dxv','17','Số phiếu YC NVL','NVL No','1','','100','','0','1','0.00','0',''),
('InctduyetApp','pn_gia_tb','8','Giá TB','Ver','1','CHECKBOX','50','','0','1','0.00','0',''),
('InctduyetApp','tk_vt','9','Tk vật tư','Ver','1','','80','','0','1','0.00','0',''),
('InctduyetApp2','px_gia_dd','8','Giá Dd','Ver','1','CHECKBOX','50','','0','1','0.00','0',''),
('InctduyetApp3','ma_version','5','Ver','Ver','0','','50','','0','1','0.00','0',''),
('InctduyetApp','ma_version','5','Ver','Ver','0','','50','','0','1','0.00','0',''),
('InctduyetApp2','ma_version','5','Ver','Ver','0','','50','','0','1','0.00','0',''),
('InctduyetApp4','ten_vt','1','Tên hàng','Item name','1','','150','','0','1','0.00','0',''),
('InctduyetApp4','dvt','4','Đvt','UOM','1','','50','','0','1','0.00','0',''),
('InctduyetApp4','ma_kho','6','Mã kho','Ver','1','','80','','0','1','0.00','0',''),
('InctduyetApp4','so_luong','7','Số lượng','Ver','1','SL','100','','0','1','0.00','0',''),
('InctduyetApp4','ma_vv','11','Mã v/v','Ver','1','','100','','0','1','0.00','0',''),
('InctduyetApp4','tk_vt','9','Tk vật tư','Ver','1','','80','','0','1','0.00','0',''),
('InctduyetApp4','ma_version','5','Ver','Ver','0','','50','','0','1','0.00','0',''),
('InctduyetApp4','gia2','8','Giá','Ver','1','TIEN','50','','0','1','0.00','0',''),
('InctduyetApp4','ma_nx','10','Mã nx','Ver','0','','80','','0','1','0.00','0',''),
('InctduyetApp6','dvt','3','Đvt','UOM','1','','50','','0','1','0.00','0',''),
('InctduyetApp6','ma_kho','4','Mã kho','Ver','1','','80','','0','1','0.00','0',''),
('InctduyetApp6','so_luong','5','Số lượng','Ver','1','SL','100','','0','1','0.00','0',''),
('InctduyetApp6','tk_vt','6','Tk vật tư','Ver','1','','80','','0','1','0.00','0',''),
('InctduyetApp6','ma_vv','7','Mã v/v','Ver','1','','100','','0','1','0.00','0',''),
('InctduyetApp6','so_ct_rq2','11','Số phiếu yc','Request No','1','','100','','0','1','0.00','0',''),
('InctduyetApp6','so_lenh_vc','10','Số lệnh vc','Request NoTranport Vo.No','1','','100','','0','1','0.00','0',''),
('InctduyetApp6','loai_vt_xuat','9','Hàng KM','Goods type','1','','100','','0','1','0.00','0',''),
('InctduyetApp','dau_tuan','3','Dấu tuần','Week','1','','150','','0','1','0.00','0',''),
('InctduyetApp','ma_vt','0','Mã hàng','Item ID','1','','100','','0','1','0.00','0',''),
('InctduyetApp','ten_vt','1','Tên hàng','Item name','1','','150','','0','1','0.00','0',''),
('InctduyetApp2','po_khsx','2','PO KHSX','PO KHSX','1','','150','','0','1','0.00','0',''),
('InctduyetApp2','dau_tuan','3','Dấu tuần','Week','1','','150','','0','1','0.00','0',''),
('InctduyetApp3','po_khsx','2','PO KHSX','PO KHSX','1','','150','','0','1','0.00','0',''),
('InctduyetApp3','dau_tuan','3','Dấu tuần','Week','1','','150','','0','1','0.00','0',''),
('InctduyetApp4','po_khsx','2','PO KHSX','PO KHSX','1','','150','','0','1','0.00','0',''),
('InctduyetApp4','dau_tuan','3','Dấu tuần','Week','1','','150','','0','1','0.00','0',''),
('InctduyetApp4','ma_vt','0','Mã hàng','Item ID','1','','100','','0','1','0.00','0',''),
('InctduyetApp6','po_khsx','1','PO KHSX','PO KHSX','1','','150','','0','1','0.00','0',''),
('InctduyetApp6','dau_tuan','2','Dấu tuần','Week','1','','150','','0','1','0.00','0',''),
('InctduyetApp6','ma_vt','-1','Mã hàng','Item ID','1','','100','','0','1','0.00','0',''),
('InctduyetApp','po_khsx','2','PO KHSX','PO KHSX','1','','150','','0','1','0.00','0',''),
('InctduyetApp6','ten_vt','0','Tên hàng','Item name','1','','150','','0','1','0.00','0',''),
('InctduyetApp5','so_luong','8','Số lượng','Cust ID','1','SL','100','','0','1','0.00','0',''),
('InctduyetApp5','ma_vt','1','Mã hàng xuất','Cust ID','1','MA','100','','0','1','0.00','0',''),
('InctduyetApp5','ten_vt','3','Tên hàng xuất','Cust ID','1','TEN','200','','0','1','0.00','0',''),
('InctduyetApp5','dvt','4','Đvt','Cust ID','1','MA','100','','0','1','0.00','0',''),
('InctduyetApp5','ma_kho','7','Mã kho','Cust ID','1','MA','70','','0','1','0.00','0',''),
('InctduyetApp5','gia_nt','9','Giá','Cust ID','1','GIA','100','','0','1','0.00','0',''),
('InctduyetApp5','tien_nt','10','Tiền','Cust ID','1','TIEN','100','','0','1','0.00','0',''),
('InctduyetApp5','cp_nt','11','Chi phí','Cust ID','1','TIEN','100','','0','1','0.00','0','');

COMMIT;
