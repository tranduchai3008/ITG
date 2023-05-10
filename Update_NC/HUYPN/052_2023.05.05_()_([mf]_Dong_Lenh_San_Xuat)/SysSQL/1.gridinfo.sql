BEGIN;

DELETE FROM gridinfo WHERE gridid  = 'Mfctpd1close';

INSERT INTO gridinfo (gridid,fieldname,fieldposition,fieldcaption,fieldcaption2,visible,style,width,lang,auto,excel_visible,excel_width,dashboard_values_yn,merge_caption) VALUES
('Mfctpd1close','so_luong_khsx','15','SL KHSX ngày','SL KHSX ngày','1','SL','100','','0','1','0.00','0',''),
('Mfctpd1close','ten_vt','2','Tên sản phẩm','Item Name','1','','200','','0','1','0.00','0',''),
('Mfctpd1close','ma_vt','1','Mã sản phẩm','Item ID','1','','100','','0','1','0.00','0',''),
('Mfctpd1close','ma_loai_phu','10','Loại phủ','Coating type','1','','100','','0','1','0.00','0',''),
('Mfctpd1close','so_luong_cl','14','Chênh lệch','Difference
','1','SL','100','','0','1','0.00','0',''),
('Mfctpd1close','so_luong_khsx_con_lai','17','SL KHSX còn lại','SL KHSX còn lại','1','SL','100','','0','1','0.00','0',''),
('Mfctpd1close','dvt','12','Đvt','Unit','1','MA
','50','','0','1','0.00','0',''),
('Mfctpd1close','so_luong_da_th','16','SL đã thực hiện','SL đã thực hiện','0','SL','100','','0','1','0.00','0',''),
('Mfctpd1close','enddate','34','Ngày kt','End date','1','DATE','100','','0','1','0.00','0',''),
('Mfctpd1close','endtime','35','Giờ kt','End time','1','TIME','100','','0','1','0.00','0',''),
('Mfctpd1close','ngay_hoan_thanh','36','Ngày hoàn thành thực','Date of completion','1','DATE','100','','0','1','0.00','0',''),
('Mfctpd1close','ngay_xuat_kho','37','Ngày xuất NVL','Release date NVL','1','DATE','100','','0','1','0.00','0',''),
('Mfctpd1close','ma_vv','38','Mã V/v','Mã V/v','1','MA','100','','0','1','0.00','0',''),
('Mfctpd1close','so_ct_kh1','39','Số KHSX','Số KHSX','1','','100','','0','1','0.00','0',''),
('Mfctpd1close','dien_giai','40','Diễn giải','Electrolyte
','1','','150','','0','1','0.00','0',''),
('Mfctpd1close','ghi_chu','41','Ghi chú','Note','1','','150','','0','1','0.00','0',''),
('Mfctpd1close','so_ct_so1','42','Số đơn hàng SX','Số đơn hàng SX','1','','100','','0','1','0.00','0',''),
('Mfctpd1close','tag','0','Chọn','SELECT','1','CHECKBOX','40','','0','1','0.00','0',''),
('Mfctpd1close','close_yn','5','Đóng Job','Job close','1','CHECKBOX','60','','0','1','0.00','0',''),
('Mfctpd1close','dvt1','11','Đvt(Đvt2)','Unit','0','MA','50','','0','1','0.00','0',''),
('Mfctpd1close','so_luong_ca21','22','SL - Ca 2(Đvt2)','Số lượng - Ca 2','0','SL','100','','0','1','0.00','0',''),
('Mfctpd1close','so_luong_ca11','18','SL - Ca 1(Đvt2)','Số lượng - Ca 1','0','SL','100','','0','1','0.00','0',''),
('Mfctpd1close','so_luong_ca31','26','SL - Ca 3(Đvt2)','Số lượng - Ca 3','0','SL','100','','0','1','0.00','0',''),
('Mfctpd1close','so_luong1','30','Số lượng(Đvt2)','Quantity','0','SL','100','','0','1','0.00','0',''),
('Mfctpd1close','sl_sp','8','Số Part','No Part','0','SL','70','','0','1','0.00','0',''),
('Mfctpd1close','ma_version','9','Version','Version','0','','80','','0','1','0.00','0',''),
('Mfctpd1close','model','6','Model','Model','1','','100','','0','1','0.00','0',''),
('Mfctpd1close','ma_cau_truc','7','Mã cấu trúc','BOM ID','1','','100','','0','1','0.00','0',''),
('Mfctpd1close','ton13','13','Tồn','Existence','1','SL','100','','0','1','0.00','0',''),
('Mfctpd1close','so_luong_bu_hao_ca1','19','SL bù hao - Ca 1','SL bù hao(giấy sắc)','1','SL','100','','0','1','0.00','0',''),
('Mfctpd1close','so_luong_ca1','20','SL - Ca 1','Số lượng - Ca 1','1','SL','100','','0','1','0.00','0',''),
('Mfctpd1close','so_luong_hong_ca1','21','SL NG - Ca 1','Số lượng NG- Ca 1','1','SL','100','','0','1','0.00','0',''),
('Mfctpd1close','so_luong_bu_hao_ca2','23','SL bù hao - Ca 2','SL bù hao(giấy sắc)','1','SL','100','','0','1','0.00','0',''),
('Mfctpd1close','so_luong_ca2','24','SL - Ca 2','Số lượng - Ca 2','1','SL','100','','0','1','0.00','0',''),
('Mfctpd1close','so_luong_hong_ca2','25','SL NG - Ca 2','Số lượng NG- Ca 2','1','SL','100','','0','1','0.00','0',''),
('Mfctpd1close','so_luong_bu_hao_ca3','27','SL bù hao - Ca 3','SL bù hao - Ca 3','1','SL','100','','0','1','0.00','0',''),
('Mfctpd1close','so_luong_ca3','28','SL - Ca 3','Số lượng - Ca 3','1','SL','100','','0','1','0.00','0',''),
('Mfctpd1close','so_luong_hong_ca3','29','SL NG - Ca 3','Số lượng NG- Ca 3','1','SL','100','','0','1','0.00','0',''),
('Mfctpd1close','so_luong
','31','Số lượng','Quantity','1','SL','100','','0','1','0.00','0',''),
('Mfctpd1close','startdate','32','Ngày bđ','Start date','1','DATE','100','','0','1','0.00','0',''),
('Mfctpd1close','starttime','33','Giờ bđ','Start time','1','TIME','100','','0','1','0.00','0',''),
('Mfctpd1close','po_khsx','3','PO KHSX','PO KHSX','1','','100','','0','1','0.00','0',''),
('Mfctpd1close','dau_tuan','4','Dấu tuần','Dấu tuần','1','','100','','0','1','0.00','0','');

COMMIT;
