BEGIN;

DELETE FROM gridinfo WHERE gridid in ('phqc3');

INSERT INTO gridinfo (gridid,fieldname,fieldposition,fieldcaption,fieldcaption2,visible,style,width,lang,auto,excel_visible,excel_width,dashboard_values_yn,merge_caption) VALUES
('phqc3','so_ct','2','Số ct','Số ct','1','','80','','0','1','0.00','0',''),
('phqc3','ma_kh','4','Mã NCC','Mã NCC','1','MA','80','','0','1','0.00','0',''),
('phqc3','ten_kh','5','Tên NCC','Tên NCC','1','','200','','0','1','0.00','0',''),
('phqc3','dia_chi','6','Địa chỉ','Địa chỉ','1','','200','','0','1','0.00','0',''),
('phqc3','dien_giai','7','Diễn giải','Diễn giải','1','','200','','0','1','0.00','0',''),
('phqc3','ngay_ct','1','Ngày ct','Ngày ct','1','DATE','80','','0','1','0.00','0',''),
('phqc3','date0','12','Ngày tạo','Created date','1','DATE','80','','0','1','0.00','0',''),
('phqc3','time0','13','Giờ tạo','Cr time','1','TIME','80','','0','1','0.00','0',''),
('phqc3','user_name0','14','Người tạo','Created user','1','','80','','0','1','0.00','0',''),
('phqc3','status','15','Trạng thái','Status','1','','50','','0','1','0.00','0',''),
('phqc3','date2','16','Ngày sửa','Modified date','1','DATE','80','','0','1','0.00','0',''),
('phqc3','time2','17','Giờ sửa','Modi time','1','TIME','80','','0','1','0.00','0',''),
('phqc3','user_name2','18','Người sửa','Modified user','1','','80','','0','1','0.00','0','');

COMMIT;
