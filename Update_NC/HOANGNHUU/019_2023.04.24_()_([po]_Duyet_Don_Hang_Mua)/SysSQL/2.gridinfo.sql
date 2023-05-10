BEGIN;

DELETE FROM gridinfo WHERE gridid in ('POApprove');

INSERT INTO gridinfo (gridid,fieldname,fieldposition,fieldcaption,fieldcaption2,visible,style,width,lang,auto,excel_visible,excel_width,dashboard_values_yn,merge_caption) VALUES
('POApprove','ten_vt','3','Tên vật tư','Item name','1','','150','','0','1','0.00','0',''),
('POApprove','dvt','4','Đvt','UOM','1','','50','','0','1','0.00','0',''),
('POApprove','app_yn_i','1','Chọn','Tag','1','CHECKBOX','50','','0','1','0.00','0',''),
('POApprove','ma_vt','2','Mã VT','Item ID','1','','100','','0','1','0.00','0',''),
('POApprove','so_luong_12','0','SL hoá đơn','Q.ty App','0','SL','100','','0','0','0.00','0',''),
('POApprove','chenh_lech_12','0','SL còn chưa hđ','Q.ty App','0','SL','100','','0','0','0.00','0',''),
('POApprove','so_luong_01','0','SL đã nhập','Q.ty App','0','SL','100','','0','0','0.00','0',''),
('POApprove','sl_duyet','0','SL Duyệt','Q.ty App','0','SL','80','','0','0','0.00','0',''),
('POApprove','chenh_lech_01','0','SL còn còn lại','Q.ty App','0','SL','100','','0','0','0.00','0',''),
('POApprove','gia_nt','8','Đơn giá','Price','1','GIA_NT','100','','0','1','0.00','0',''),
('POApprove','po_khsx','5','PO KHSX','PO KHSX','1','','120','','0','1','0.00','0',''),
('POApprove','dau_tuan','6','Dấu tuần','Week','1','','120','','0','1','0.00','0',''),
('POApprove','so_luong','7','Số lượng Yc','Quantity requirement','1','SL','100','','0','1','0.00','0',''),
('POApprove','tien_nt','9','Thành tiền ','Price','1','TIEN_NT','100','','0','1','0.00','0','');

COMMIT;
