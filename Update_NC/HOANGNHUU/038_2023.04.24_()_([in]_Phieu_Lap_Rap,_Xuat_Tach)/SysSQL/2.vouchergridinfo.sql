

----------[vouchergridinfo]--------

BEGIN;

DELETE FROM vouchergridinfo WHERE gridid in ('ct88') and vcode in ('PXE');

INSERT INTO vouchergridinfo (vcode,gridid,fieldname,fieldposition,fieldcaption,fieldcaption2,carry,visible,editable,style,width,lookupid,lookupfieldname,notempty) VALUES
('PXE','ct88','cp','16','Chi phí','Amount','0','0','0','TIEN','100','','','0'),
('PXE','ct88','cp_nt','11','Chi phí','FC Amount','0','0','0','TIEN_NT','100','','','0'),
('PXE','ct88','dau_tuan','2','Dấu tuần','Week','0','1','0','','120','','','0'),
('PXE','ct88','dvt','3','Dvt','Unit','0','1','0','DVT','50','','','1'),
('PXE','ct88','gia','14','Giá','Price','0','1','0','GIA','100','','','0'),
('PXE','ct88','gia_nt','9','Giá nt','FC Price','0','1','0','GIA_NT','100','','','0'),
('PXE','ct88','ma_kho','4','Mã kho','Site ID','1','1','0','MA','60','dmkho','','1'),
('PXE','ct88','ma_lo','5','Mã lô','BatchID','0','0','0','MA','60','','','0'),
('PXE','ct88','ma_nx','13','Mã nx','Dr account','1','1','0','MA_TK','60','dmnx','','1'),
('PXE','ct88','ma_vt','-1','Mã vật tư','Item ID','0','1','0','MA','100','','','1'),
('PXE','ct88','ma_vv','14','Mã Vv','JobID','1','1','0','MA','60','dmvv','','0'),
('PXE','ct88','po_khsx','1','PO KHSX','PO KHSX','0','1','0','MA','120','dmpokhsx','po_khsx','0'),
('PXE','ct88','px_gia_dd','7','Giá Dd','Specific','0','1','0','CHECKBOX','50','','','0'),
('PXE','ct88','so_luong','6','Số lượng','Quantity','0','1','0','SL','80','','','0'),
('PXE','ct88','ten_vt','0','Tên vật tư','Item Name','0','1','1','TEN','200','','','0'),
('PXE','ct88','tien','15','Tiền','Amount','0','1','0','TIEN','100','','','0'),
('PXE','ct88','tien_nt','10','Tiền nt','FC Amount','0','1','0','TIEN_NT','100','','','0'),
('PXE','ct88','tk_vt','12','Tk vt','Cr Account','0','1','0','MA_TK','60','','','1'),
('PXE','ct88','ty_le','5','Tỷ lệ','Ratio','0','0','0','SL','80','','','0'),
('PXE','ct88','tyle','8','Tỷ lệ (S)','Percentage','0','0','0','SL','100','','','0');

COMMIT;