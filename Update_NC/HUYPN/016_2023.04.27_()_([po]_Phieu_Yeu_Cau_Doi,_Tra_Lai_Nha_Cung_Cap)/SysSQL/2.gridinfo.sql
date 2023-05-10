

----------[gridinfo]--------

BEGIN;

DELETE FROM gridinfo WHERE gridid = 'Poctrq2' or gridid = 'ctrq2' or gridid = 'PR1TranRQ2' or gridid = 'ct67';

INSERT INTO gridinfo (gridid,fieldname,fieldposition,fieldcaption,fieldcaption2,visible,style,width,lang,auto,excel_visible,excel_width,dashboard_values_yn,merge_caption) VALUES
('ctrq2','tag','1','Chọn','Tag','1','CHECKBOX','40','','0','1','0.00','0',''),
('ctrq2','ten_vt','4','Tên hàng hóa','Voucher Date','1','Ten','180','','0','1','0.00','0',''),
('ctrq2','dvt','8','Đvt','Unit','1','DVT','50','','0','1','0.00','0',''),
('ctrq2','tien_nt','11','Tiền nhập','Amount','1','TIEN','70','','0','1','0.00','0',''),
('ct67','ten_vt','2','Tên vật tư','Item Name','1','TEN','200','','0','1','0.00','0',''),
('ct67','dvt','5','Dvt','Unit','1','DVT','50','','0','1','0.00','0',''),
('ct67','ma_kho','6','Mã kho','Site ID','1','MA','100','','0','1','0.00','0',''),
('ctrq2','so_ct','2','Số pn','Vo. No','1','','110','','0','1','0.00','0',''),
('PR1TranRQ2','tag','1','Chọn','Select','1','CHECKBOX','50','','0','1','0.00','0',''),
('PR1TranRQ2','ma_vt','2','Mã vt','Item id','1','','100','','0','1','0.00','0',''),
('PR1TranRQ2','ten_vt','3','Tên vt','Item name','1','','150','','0','1','0.00','0',''),
('PR1TranRQ2','sl_con_lai','9','SL còn lại','Remain quantity','1','SL','100','','0','1','0.00','0',''),
('PR1TranRQ2','so_luong','10','Số lượng','Quantity','1','SL','80','','0','1','0.00','0',''),
('ctrq2','ma_vt','3','Mã hàng','Item code','1','MA','100','','0','1','0.00','0',''),
('ct67','ma_vt','1','Mã Vt','Item ID','1','MA','100','','0','1','0.00','0',''),
('Poctrq2','tag','1','Chọn','Tag','1','CHECKBOX','50','','0','1','0.00','0',''),
('Poctrq2','ten_vt','3','Tên hàng hóa','Voucher Date','1','Ten','180','','0','1','0.00','0',''),
('Poctrq2','ma_vt','2','Mã hàng','Item code','1','MA','100','','0','1','0.00','0',''),
('PR1TranRQ2','po_khsx','4','PO KHSX','PO KHSX','1','','100','','0','1','0.00','0',''),
('PR1TranRQ2','dau_tuan','5','Dấu tuần','Dấu tuần','1','','100','','0','1','0.00','0',''),
('PR1TranRQ2','dvt','6','Đvt','Uom','1','','60','','0','1','0.00','0',''),
('PR1TranRQ2','sl_nhap_qt','7','SL nhập qt','Import quantity','1','SL','100','','0','1','0.00','0',''),
('PR1TranRQ2','sl_xuat_qt','8','SL xuất qt','Export quantity','1','SL','100','','0','1','0.00','0',''),
('Poctrq2','dvt','6','Đvt','Unit','1','DVT','50','','0','1','0.00','0',''),
('Poctrq2','ma_kho','7','Mã kho','Stock','1','MA','80','','0','1','0.00','0',''),
('Poctrq2','sl_nhap_qt','8','Số lượng','Q.Ty','1','SL','100','','0','1','0.00','0',''),
('Poctrq2','sl_xuat_qt','9','SL đã xuất','Q.Ty','1','SL','100','','0','1','0.00','0',''),
('Poctrq2','sl_con_lai','10','SL còn lại','Remain','1','SL','100','','0','1','0.00','0',''),
('Poctrq2','so_luong','11','SL xuất lần này','This time Qty','1','SL','100','','0','1','0.00','0',''),
('Poctrq2','po_khsx','4','PO KHSX','PO KHSX','1','MA','100','','0','1','0.00','0',''),
('Poctrq2','dau_tuan','5','Dấu tuần','Dấu tuần','1','MA','100','','0','1','0.00','0',''),
('ctrq2','so_luong_mua','9','Số lượng nhập','Q.Ty','1','SL','70','','0','1','0.00','0',''),
('ctrq2','gia_nt','10','Giá nhập','Price','1','GIA','70','','0','1','0.00','0',''),
('ctrq2','so_luong','12','SL Trả lại','Return Q.Ty','0','SL','70','','0','1','0.00','0',''),
('ctrq2','po_khsx','4','PO KHSX','PO KHSX','1','MA','100','','0','1','0.00','0',''),
('ctrq2','dau_tuan','5','Dấu tuần','Dấu tuần','1','MA','100','','0','1','0.00','0',''),
('ct67','so_luong','7','Số lượng','Weigth','1','SL','50','','0','1','0.00','0',''),
('ct67','gia_nt','8','Giá nt','FC Price','1','TIEN_NT','100','','0','1','0.00','0',''),
('ct67','tien_nt','9','Tiền nt','FC Amount','1','TIEN_NT','100','','0','1','0.00','0',''),
('ct67','po_khsx','3','PO KHSX','PO KHSX','1','TEN','100','','0','1','0.00','0',''),
('ct67','dau_tuan','4','Dấu tuần','Dấu tuần','1','TEN','100','','0','1','0.00','0','');

COMMIT;