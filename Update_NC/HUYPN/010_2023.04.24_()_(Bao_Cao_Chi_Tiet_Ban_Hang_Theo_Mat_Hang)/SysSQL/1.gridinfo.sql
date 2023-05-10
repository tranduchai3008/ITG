

----------[gridinfo]--------

BEGIN;

DELETE FROM gridinfo WHERE gridid like 'DetailByItem%';

INSERT INTO gridinfo (gridid,fieldname,fieldposition,fieldcaption,fieldcaption2,visible,style,width,lang,auto,excel_visible,excel_width,dashboard_values_yn,merge_caption) VALUES
('DetailByItem2','ten_vt','2','Tên hàng','Item name','1','','250','1','0','1','0.00','0',''),
('DetailByItem2','ten_vt2','2','Tên hàng','Item name','1','','250','2','0','1','0.00','0',''),
('DetailByItem2','so_luong','3','Số lượng','Quantity','1','SL','100','','0','1','0.00','0',''),
('DetailByItem2','tien_ban','4','Thành tiền','Amount','1','TIEN','100','','0','1','0.00','0',''),
('DetailByItem2','thue','5','Thuế','Tax amount','1','TIEN','100','','0','1','0.00','0',''),
('DetailByItem2','ck','6','Chiết khấu','Discount','1','TIEN','100','','0','1','0.00','0',''),
('DetailByItem2','sl_tl','8','Sl trả lại','Return quantity','1','SL','100','','0','1','0.00','0',''),
('DetailByItem2','tien_tl','9','Tiền trả lại','Return amount','1','TIEN','100','','0','1','0.00','0',''),
('DetailByItem2','pt','10','Doanh thu','Turnover','1','TIEN','100','','0','1','0.00','0',''),
('DetailByItem2','tien_von','11','Tiền vốn','Capital','1','TIEN','100','','0','1','0.00','0',''),
('DetailByItem2','lai','12','Lãi gộp','Lãi gộp','1','TIEN','100','','0','1','0.00','0',''),
('DetailByItem2','ma_vt','1','Mã hàng','Item ID','1','MA','100','','0','1','0.00','0',''),
('DetailByItem','ngay_ct','1','Ngày','Date','1','DATE','80','','0','1','0.00','0',''),
('DetailByItem','dien_giai','3','Diễn giải','Description','1','MA','250','','0','1','0.00','0',''),
('DetailByItem','gia_ban','11','Giá','Price','1','TIEN','100','','0','1','0.00','0',''),
('DetailByItem','tien_ban','12','Thành tiền','Amount','1','TIEN','100','','0','1','0.00','0',''),
('DetailByItem','thue','13','Thuế','Tax amount','1','TIEN','100','','0','1','0.00','0',''),
('DetailByItem','sl_tl','16','Sl trả lại','Return quantity','1','SL','100','','0','1','0.00','0',''),
('DetailByItem','tien_tl','17','Tiền trả lại','Return amount','1','TIEN','100','','0','1','0.00','0',''),
('DetailByItem','tien_von','18','Tiền vốn','Capital','1','TIEN','100','','0','1','0.00','0',''),
('DetailByItem','so_ct','2','Số Ctừ','Number','1','','110','','0','1','0.00','0',''),
('DetailByItem','dt','15','Doanh thu','Turnover','0','TIEN','100','','0','1','0.00','0',''),
('DetailByItem','so_po','6','Số PO','PO No','1','','90','','0','1','0.00','0',''),
('DetailByItem','so_luong','10','Số lượng','Quantity','1','SL','100','','0','1','0.00','0',''),
('DetailByItem','ck','14','Chiết khấu','Discount','1','TIEN','100','','0','1','0.00','0',''),
('DetailByItem','so_do','8','Số DO','DO No','0','','90','','0','1','0.00','0',''),
('DetailByItem','ngay_do','9','Ngày DO','Date','0','DATE','80','','0','1','0.00','0',''),
('DetailByItem','nhom_sp','4','Nhóm sản phẩm','Number','0','','90','','0','1','0.00','0',''),
('DetailByItem','model','5','Model','Model','0','','80','','0','1','0.00','0',''),
('DetailByItem','ngay_dh','7','Ngày ĐH','Date','0','DATE','80','','0','1','0.00','0','');

COMMIT;