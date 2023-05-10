BEGIN;

DELETE FROM vouchergridinfo WHERE gridid in ('ct85') and vcode ='PXB';

INSERT INTO vouchergridinfo (vcode,gridid,fieldname,fieldposition,fieldcaption,fieldcaption2,carry,visible,editable,style,width,lookupid,lookupfieldname,notempty) VALUES
('PXB','ct85','dau_tuan','4','Dấu tuần','Dấu tuần','0','1','1','TEN','120','','','0'),
('PXB','ct85','dvt','8','Đvt','Unit','0','1','0','DVT','50','','','1'),
('PXB','ct85','dvt1','11','Đvt (Đvt2)','Unit (To)','0','0','1','DVT','50','','','0'),
('PXB','ct85','gia','19','Giá','Price','0','1','0','GIA','100','','','0'),
('PXB','ct85','gia_nt','14','Giá nt','FC Price','0','1','0','GIA_NT','100','','','0'),
('PXB','ct85','gio_gh','9','Giờ GH','Delivery Time','0','1','0','TIME','80','','','1'),
('PXB','ct85','ma_lo','10','Mã lô','BatchID','0','0','0','MA','100','','','0'),
('PXB','ct85','ma_nx','17','Ma nx(Tk nợ)','Dr account','1','1','0','MA_TK','100','dmnx','','1'),
('PXB','ct85','ma_vi_tri_kh','0','Mã vị trí KH','JobID','0','0','1','MA','100','','','0'),
('PXB','ct85','ma_vt','1','Mã vật tư','Item ID','0','1','0','MA','100','dmvt','ten_vt','1'),
('PXB','ct85','ma_vv','21','Mã Vv','JobID','0','1','0','MA','100','','','0'),
('PXB','ct85','po_khsx','3','PO KHSX','PO KHSX','0','1','1','TEN','120','','','0'),
('PXB','ct85','px_gia_dd','16','Giá đích danh','Specific Price','0','1','0','CHECKBOX','50','','','0'),
('PXB','ct85','so_ct_dxv','31','Phiếu yêu cầu NVL','Change delivery votes','0','0','1','SO_CT','100','','','0'),
('PXB','ct85','so_ct_pd1','28','Số LSX','Change delivery votes','0','1','1','SO_CT','100','','','0'),
('PXB','ct85','so_ct_pxb2','34','Phiếu xuất điều chuyển NG','Change delivery votes','0','0','1','SO_CT','100','','','0'),
('PXB','ct85','so_ct_qc1','25','Số phiếu QC','No QC','0','1','1','SO_CT','100','','','0'),
('PXB','ct85','so_ct_qc2','0','Phiếu chất lượng','Phiếu chất lượng','0','0','1','SO_CT','100','','','0'),
('PXB','ct85','so_ct_qc2b','29','Phiếu QC NG Lot','Change delivery votes','0','0','1','SO_CT','100','','','0'),
('PXB','ct85','so_ct_qc2c','30','Phiếu QC NG lẻ','Change delivery votes','0','0','1','SO_CT','100','','','0'),
('PXB','ct85','so_ct_rew','33','Phiếu Sortting','Change delivery votes','0','0','1','SO_CT','100','','','0'),
('PXB','ct85','so_ct_rq1','27','Số phiếu đổi trả hàng','Change delivery votes','0','0','1','SO_CT','100','','','0'),
('PXB','ct85','so_ct_to1','23','Số lệnh đ/c','Tranfer Order No','0','1','1','SO_CT','100','','','0'),
('PXB','ct85','so_ct_to2','26','Số lệnh GH','No GH','0','1','1','SO_CT','100','','','0'),
('PXB','ct85','so_ct_to2b','32','Lệnh đ/c đại lý','Change delivery votes','0','0','1','SO_CT','100','','','0'),
('PXB','ct85','so_luong','11','Số lượng','Quantity','0','1','0','SL','80','','','0'),
('PXB','ct85','so_luong_da_nhan','0','SL đã nhận','Qty Receipted','0','0','1','SL','100','','','0'),
('PXB','ct85','so_luong_kg','12','Số lượng KG','Quantity KG','0','1','0','SL','80','','','0'),
('PXB','ct85','so_luong_thung','13','Số lượng thùng','Quantity box','0','1','0','SL','80','','','0'),
('PXB','ct85','so_luong1','12','Số lượng (Đvt2)','Quantity (To)','0','0','0','SL','80','','','0'),
('PXB','ct85','ten_vt','2','Tên vật tư','Item Name','0','1','1','TEN','200','','','0'),
('PXB','ct85','tien','20','Tiền','Amount','0','1','0','TIEN','100','','','0'),
('PXB','ct85','tien_nt','15','Tiền nt','FC Amount','0','1','0','TIEN_NT','100','','','0'),
('PXB','ct85','tk_vt','18','Tk vt(Tk có)','Cr Account','0','1','0','MA_TK','100','dmnx','','1'),
('PXB','ct85','ton13','10','Tồn kho','Price','0','1','1','SL','80','','','0');

COMMIT;
