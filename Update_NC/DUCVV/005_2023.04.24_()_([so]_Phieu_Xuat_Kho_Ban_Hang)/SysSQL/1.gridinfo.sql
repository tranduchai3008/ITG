BEGIN;

DELETE FROM gridinfo WHERE gridid in( 'ItemLoCt','ItemLo');

INSERT INTO gridinfo (gridid,fieldname,fieldposition,fieldcaption,fieldcaption2,visible,style,width,lang,auto,excel_visible,excel_width,dashboard_values_yn,merge_caption) VALUES
('ItemLoCt','ma_vt','1','Mã hàng','Item ID','0','','100','','0','1','0.00','0',''),
('ItemLoCt','ma_lo','2','Mã lô','Batch no','1','MA','200','','0','1','0.00','0',''),
('ItemLoCt','ton13','8','Tồn lô','Balance','1','SL','80','','0','1','0.00','0',''),
('ItemLoCt','ma_vi_tri','6','Mã vị trí','Location  no','1','MA','200','','0','1','0.00','0',''),
('ItemLoCt','ton14','7','Tồn vị trí','Balance','1','SL','80','','0','1','0.00','0',''),
('ItemLoCt','so_luong','9','Số lượng','Q.ty','1','SL','80','','0','1','0.00','0',''),
('ItemLoCt','ma_vi_trin','10','Mã vị trí nhập','Location  no','1','MA','200','','0','1','0.00','0',''),
('ItemLo','ten_vt','3','Tên vật tư','Item Name','1','','200','','0','1','0.00','0',''),
('ItemLo','ma_kho','4','Mã kho','Site ID','1','','100','','0','1','0.00','0',''),
('ItemLo','so_luong','5','Số lượng','Quantity','0','SL','80','','0','1','0.00','0',''),
('ItemLo','t_needed','6','SL Cần tạo','Total Needed','1','SL','80','','0','1','0.00','0',''),
('ItemLo','tag','1','Chọn','Tag','0','CHECKBOX','50','','0','1','0.00','0',''),
('ItemLo','t_opened','8','SL Còn lại','Total Opened','1','SL','80','','0','1','0.00','0',''),
('ItemLo','ma_vt','2','Mã Vt','Item ID','1','','100','','0','1','0.00','0',''),
('ItemLo','t_created','7','SL Đã tạo','Total Created','1','SL','80','','0','1','0.00','0',''),
('ItemLoCt','ngay_nhap','3','Ngày nhập','Create date','1','DATE','80','','0','1','0.00','0',''),
('ItemLoCt','po_khsx','11','PO KHSX','PO Plan','1','MA','100','','0','1','0.00','0',''),
('ItemLoCt','ngay_hhsd','4','Hạn dùng','Expire date','1','DATE','80','','0','1','0.00','0',''),
('ItemLoCt','dau_tuan','12','Dấu tuần','Week ','1','MA','80','','0','1','0.00','0',''),
('ItemLoCt','dvt','8','Đvt','Unit','1','','50','','0','1','0.00','0','');

COMMIT;
