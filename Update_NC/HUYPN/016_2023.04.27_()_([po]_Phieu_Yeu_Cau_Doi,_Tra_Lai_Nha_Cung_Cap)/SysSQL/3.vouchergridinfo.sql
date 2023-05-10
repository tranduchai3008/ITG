BEGIN;

DELETE FROM vouchergridinfo WHERE vcode = 'RQ2';

INSERT INTO vouchergridinfo (vcode,gridid,fieldname,fieldposition,fieldcaption,fieldcaption2,carry,visible,editable,style,width,lookupid,lookupfieldname,notempty) VALUES
('RQ2','ct67','ten_vt','2','Tên vật tư','Item name','0','1','1','TEN','150','','','1'),
('RQ2','ct67','ma_kho','6','Mã kho','Stock','0','1','0','MA','60','dmkho','','1'),
('RQ2','ct67','dvt','5','Đvt','UOM','0','1','0','MA','50','','','1'),
('RQ2','ct67','gia0','19','Giá','Price','0','1','1','GIA','100','','','0'),
('RQ2','ct67','app_yn_i','22','Duyệt','Approved','0','1','1','CHECKBOX','50','','','0'),
('RQ2','ct67','so_luong_mua','6','Sl nhập về','Sale quantity','0','0','0','SL','60','','','0'),
('RQ2','ct67','ghi_chu','29','Ghi chú','Comment','0','1','0','','150','','','0'),
('RQ2','ct67','tien0','20','Thành tiền','Amount','0','1','1','TIEN','100','','','0'),
('RQ2','ct67','tien_nt0','12','Thành tiền nt','FC amount','0','1','0','TIEN_NT','100','','','0'),
('RQ2','ct67','thue','21','Thuế','Tax','0','1','1','TIEN','100','','','0'),
('RQ2','ct67','ck','20','Ck','Discount','0','1','1','TIEN','100','','','0'),
('RQ2','ct67','ck_nt','15','Ck nt','FC Discount','0','1','1','TIEN_NT','100','','','0'),
('RQ2','ct67','thue_nt','18','Thuế nt','FC Tax','0','1','1','TIEN_NT','100','','','0'),
('RQ2','ct67','pt_ck','14','%Ck','%Discount','0','1','1','HE_SO','50','','','0'),
('RQ2','ct67','ma_thue','16','Mã thuế','Tax code','0','1','0','MA_THUE','50','dmthue','','1'),
('RQ2','ct67','ma_ck','13','Mã ck','Discount code','0','1','0','MA_THUE','50','dmmack','','1'),
('RQ2','ct67','thue_suat','17','%Thuế','%Tax','0','1','1','HE_SO','50','','','0'),
('RQ2','ct67','sl_duyet','23','SL duyệt','Approve','0','1','1','SL','80','','','0'),
('RQ2','ct67','so_dh','25','Số hóa đơn','Comment','0','1','1','','120','','','0'),
('RQ2','ct67','so_ct_pr1','31','Số phiếu nhập hàng','Comment','0','1','1','','100','','','0'),
('RQ2','ct67','ma_vt','1','Mã Vt','Item ID','0','1','0','MA','100','dmvt','ten_vt','1'),
('RQ2','ct67','so_luong','10','Số lượng','Request quantity','0','1','0','SL','80','','','0'),
('RQ2','ct67','gia_nt0','11','Đơn giá nt','FC price','0','1','0','GIA_NT','100','','','0'),
('RQ2','ct67','ten_loi','28','Tên lỗi','Comment','0','1','0','','150','','','0'),
('RQ2','ct67','ngay_tra_hang','30','Ngày trả','Comment','0','1','0','DATE','100','','','0'),
('RQ2','ct67','dvt1','8','Đvt (Đvt2)','UOM (To)','0','0','0','MA','50','','','1'),
('RQ2','ct67','so_luong1','9','Số lượng (Đvt2)','Request quantity (To)','0','0','0','SL','80','','','0'),
('RQ2','ct67','loai_vt_xuat','7','Hàng KM','Goods Type','0','1','0','CHECKBOX','40','','','0'),
('RQ2','ct67','po_khsx','3','PO KHSX','PO KHSX','0','1','1','MA','100','','','1'),
('RQ2','ct67','dau_tuan','4','Dấu tuần','Dấu tuần','0','1','1','MA','100','','','1');

COMMIT;
