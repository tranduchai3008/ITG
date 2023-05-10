

----------[gridinfo]--------

BEGIN;

DELETE FROM gridinfo WHERE gridid like 'Sobctdhdh%';

INSERT INTO gridinfo (gridid,fieldname,fieldposition,fieldcaption,fieldcaption2,visible,style,width,lang,auto,excel_visible,excel_width,dashboard_values_yn,merge_caption) VALUES
('SobctdhdhH','so_lan','17','','','0','','100','','0','1','0.00','0',''),
('SobctdhdhH','status','14','___Status','___Status','1','','100','','0','1','0.00','0',''),
('SobctdhdhH','so_luong','15','___Số lượng','___Số lượng','1','SL','100','','0','1','0.00','0',''),
('Sobctdhdh','sysorder','1','','','0','','100','','0','1','0.00','0',''),
('Sobctdhdh','systotal','2','','','0','','100','','0','1','0.00','0',''),
('Sobctdhdh','sysprint','3','','','0','','100','','0','1','0.00','0',''),
('Sobctdhdh','ma_kh','4','Mã khách hàng','Cus id','1','MA','100','','0','1','0.00','0',''),
('Sobctdhdh','ten_kh','5','Tên khách hàng','Customer name','1','TEN','200','','0','1','0.00','0',''),
('Sobctdhdh','so_po','6','Số Order','Order No.','1','','100','','0','1','0.00','0',''),
('Sobctdhdh','ma_vt','7','Mã hàng','Item Name','1','MA','100','','0','1','0.00','0',''),
('Sobctdhdh','ten_vt','8','Tên hàng','Item Name','1','TEN','200','','0','1','0.00','0',''),
('Sobctdhdh','rcv','9','RCV','RCV','1','MA','100','','0','1','0.00','0',''),
('Sobctdhdh','orig_date','10','Orig Date','Orig Date','1','DATE','100','','0','1','0.00','0',''),
('Sobctdhdh','rcvd_date','11','Rcvd Date','Rcvd Date','1','DATE','100','','0','1','0.00','0',''),
('Sobctdhdh','plan_date','12','Plan Date','Plan Date','1','DATE','100','','0','1','0.00','0',''),
('Sobctdhdh','dvt','13','ĐVT','UOM','1','MA','100','','0','1','0.00','0',''),
('Sobctdhdh','status','14','','','0','','100','','0','1','0.00','0',''),
('Sobctdhdh','so_luong','15','','','0','','100','','0','1','0.00','0',''),
('Sobctdhdh','so_lan','17','','','0','','100','','0','1','0.00','0',''),
('Sobctdhdh','chenh_lech','16','Chênh lệch','Chênh lệch','1','SL','100','','0','1','0.00','0','');

COMMIT;