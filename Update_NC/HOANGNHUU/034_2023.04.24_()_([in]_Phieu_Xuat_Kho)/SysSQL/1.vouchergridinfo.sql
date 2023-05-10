

----------[vouchergridinfo]--------

BEGIN;

DELETE FROM vouchergridinfo WHERE vcode = 'PXA';

INSERT INTO vouchergridinfo (vcode,gridid,fieldname,fieldposition,fieldcaption,fieldcaption2,carry,visible,editable,style,width,lookupid,lookupfieldname,notempty) VALUES
('PXA','ct84','so_ct_lhk','30','Lệnh hạ khổ','MF Command','0','0','1','','100','','','0'),
('PXA','ctseri2','ma_vt','1','Mã Vt','Item ID','0','1','1','MA','100','dmvt','ten_vt','1'),
('PXA','ctseri2','ten_vt','2','Tên vật tư','Item Name','0','1','1','TEN','200','','','0'),
('PXA','ctseri2','so_seri_vt','3','Số seri','Seri number','0','1','1','TEN','200','','','0'),
('PXA','ct84','ma_thao_tac','21','Mã công đoạn SX','SX stage Code','1','1','1','MA','100','mfdmthaotac','','0'),
('PXA','ct84','ghi_chu','28','Ghi chú','Note','0','1','0','','200','','','0'),
('PXA','ct84','ten_vv','19','Tên VV','Job name','0','1','1','','200','','','0'),
('PXA','ct84','tk_vt','14','Tk vt (Tk có)','Cr Account','0','1','0','MA_TK','60','dmnx','','1'),
('PXA','ct84','ma_vt','1','Mã vật tư','Item ID','0','1','0','MA','100','','','1'),
('PXA','ct84','ma_nx','15','Mã nx (Tk nợ)','Dr account','1','1','0','MA_TK','60','dmnx','','1'),
('PXA','ct84','ten_vt','2','Tên vật tư','Item Name','0','1','1','TEN','200','','','0'),
('PXA','ct84','ma_lo','6','Mã lô','BatchID','0','0','0','MA','80','','','0'),
('PXA','ct84','so_luong','8','Số lượng','Quantity','0','1','0','SL','100','','','0'),
('PXA','ct84','px_gia_dd','11','Giá Dd','Specific','0','1','0','CHECKBOX','50','','','0'),
('PXA','ct84','gia_nt','12','Giá nt','FC Price','0','1','0','GIA_NT','100','','','0'),
('PXA','ct84','so_ct_dxv','30','Phiếu xuất NVL','MF Command','0','1','1','','100','','','0'),
('PXA','ct84','so_ct_pd12','31','Lệnh SX gia công','MF Command','0','1','1','','100','','','0'),
('PXA','ct84','ma_vt1','33','Mã vật tư chuẩn','Item ID','0','1','1','MA','100','','','0'),
('PXA','ct84','ten_vt1','35','Tên vật tư chuẩn','Item Name','0','1','1','TEN','200','','','0'),
('PXA','ct84','tien_nt','13','Tiền nt','FC Amount','0','1','0','TIEN_NT','100','','','0'),
('PXA','ct84','ma_dvcs_i','16','Mã đvcs','Unit','1','1','0','MA','80','dmdvcs','','0'),
('PXA','ct84','ma_vv','18','Mã Vv','JobID','0','1','0','MA','80','dmvv','','0'),
('PXA','ct84','ma_cd_gt','20','Công đoạn tính giá','Pricing stage','0','1','0','MA','100','dmcdgt','','0'),
('PXA','ct84','gia','23','Giá','Price','0','1','0','GIA','100','','','0'),
('PXA','ct84','tien','24','Tiền','Amount','0','1','0','TIEN','100','','','0'),
('PXA','ct84','ma_bp','25','Mã BP','Dept ID','1','1','0','MA','80','dmbp','','0'),
('PXA','ct84','ma_cp','26','Mã phí','Fee ID','1','1','0','MA','80','dmcp','','0'),
('PXA','ct84','ma_td_i','21','Mã nhà máy','Mã nhà máy','0','0','0','MA','100','dmtd1','','0'),
('PXA','ct84','ma_version','3','Version','Version','0','0','0','MA','60','','','0'),
('PXA','ct84','so_luong1','10','Số lượng (Đvt2)','Quantity (KG)','0','0','0','SL','80','','','0'),
('PXA','ct84','sl_thung','10','Số lượng thùng','Quantity','0','1','0','SL','100','','','0'),
('PXA','ct84','dau_tuan','4','Dấu tuần','Pointweek','0','1','0','','100','','','0'),
('PXA','ct84','ma_kieu','31','Mã kiểu hạ khổ','MF Command','0','0','1','MA
','100','','','0'),
('PXA','ct84','so_ct_pnd','27','Phiếu NK NG','MF Command','0','0','1','','100','','','0'),
('PXA','ct84','so_ct_pd1','29','Số lệnh SX','MF Command','0','1','1','','100','','','0'),
('PXA','ct84','ten_thao_tac','22','Tên công đoạn SX','SX stage name','0','1','1','TEN','150','','','0'),
('PXA','ct84','so_luong_sp','17','SL sản phẩm','Quantity','0','1','0','SL','100','','','0'),
('PXA','ct84','po_khsx','3','PO KHSX','PO KHSX','0','1','0','MA','120','dmpokhsx','','1'),
('PXA','ct84','dvt','5','Đvt','Unit','0','1','0','DVT','50','','','1'),
('PXA','ct84','ma_kho','6','Mã kho','Site ID','1','1','0','MA','60','dmkho','','1'),
('PXA','ct84','ton13','7','Tồn','Balance','0','1','1','SL','80','','','0'),
('PXA','ct84','sl_kg','9','Số lượng KG','Quantity','0','1','0','SL','100','','','0');

COMMIT;