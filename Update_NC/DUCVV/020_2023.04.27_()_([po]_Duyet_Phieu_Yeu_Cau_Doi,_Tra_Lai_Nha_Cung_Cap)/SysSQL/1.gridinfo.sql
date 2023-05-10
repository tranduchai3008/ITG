BEGIN;

DELETE FROM gridinfo WHERE gridid = 'PORequest2App';

INSERT INTO gridinfo (gridid,fieldname,fieldposition,fieldcaption,fieldcaption2,visible,style,width,lang,auto,excel_visible,excel_width,dashboard_values_yn,merge_caption) VALUES
('PORequest2App','ghi_chu','11','Diễn giải','Description','1','','150','','0','1','0.00','0',''),
('PORequest2App','sl_duyet','10','Sl duyệt','App quantity','1','SL','60','','0','1','0.00','0',''),
('PORequest2App','dvt','6','Đvt','UOM','1','','80','','0','1','0.00','0',''),
('PORequest2App','gia_nt0','8','Đơn giá','Price','1','GIA','80','','0','1','0.00','0',''),
('PORequest2App','tien_nt0','9','Thành tiền','Amount','1','TIEN','100','','0','1','0.00','0',''),
('PORequest2App','ten_vt','3','Tên hàng','Item name','1','','150','','0','1','0.00','0',''),
('PORequest2App','ma_vt','2','Mã hàng','Item ID','1','','100','','0','1','0.00','0',''),
('PORequest2App','app_yn_i','1','Chọn','Check','0','CHECKBOX','40','','0','1','0.00','0',''),
('PORequest2App','po_khsx','4','PO KHSX','PO Plan','1','','120','','0','1','0.00','0',''),
('PORequest2App','dau_tuan','5','Dấu tuần','Week','1','','100','','0','1','0.00','0',''),
('PORequest2App','so_luong','7','Số lượng yc','Request quan','1','SL','80','','0','1','0.00','0','');

COMMIT;
