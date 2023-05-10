BEGIN;

DELETE FROM gridinfo WHERE gridid in ('PRBomList');

INSERT INTO gridinfo (gridid,fieldname,fieldposition,fieldcaption,fieldcaption2,visible,style,width,lang,auto,excel_visible,excel_width,dashboard_values_yn,merge_caption) VALUES
('PRBomList','ty_le_hao_hut','12','Tỷ lệ hao hụt','Rate of loss','0','SL','80','','0','1','0.00','0',''),
('PRBomList','dvt','3','Đvt','UOM','1','','60','','0','1','0.00','0',''),
('PRBomList','ten_vt','2','Tên vật tư','Item name','1','','150','','0','1','0.00','0',''),
('PRBomList','stt','0','Stt','No.','1','','50','','0','1','0.00','0',''),
('PRBomList','dien_giai','19','Diễn giải','Description','1','','200','','0','1','0.00','0',''),
('PRBomList','ma_vt','1','Mã vật tư','Item ID','1','MA','100','','0','1','0.00','0',''),
('PRBomList','so_luong_hao_hut','14','Số lượng hao hụt','Number of losses','0','SL','100','','0','1','0.00','0',''),
('PRBomList','ngay_ct1','16','Ngày bắt đầu','Start date','0','DATE','80','','0','1','0.00','0',''),
('PRBomList','ngay_ct2','17','Ngày kết thúc','End date','0','DATE','80','','0','1','0.00','0',''),
('PRBomList','so_luong1','10','Số lượng theo khối lượng','Quantity by weight','0','SL','130','','0','1','0.00','0',''),
('PRBomList','so_luong','11','Số lượng','Quantity','1','HE_SO','130','','0','1','0.00','0',''),
('PRBomList','ma_thao_tac','4','Mã công đoạn sx','Stage code','1','MA','100','','0','1','0.00','0',''),
('PRBomList','ten_thao_tac','5','Tên công đoạn sx','Stage name','1','TEN','150','','0','1','0.00','0',''),
('PRBomList','sl_sp','7','Số lượng SP','Quantity products','0','SL','100','','0','1','0.00','0',''),
('PRBomList','thoi_gian_th','15','T/G thực hiện','Excecution time','0','HE_SO','80','','0','1','0.00','0',''),
('PRBomList','vh_yn','18','Có vỏ','Has box?','0','CHECKBOX','60','','0','1','0.00','0',''),
('PRBomList','vttt_yn','20','Có vật tư thay thế','Has alternative material','0','CHECKBOX','100','','0','1','0.00','0',''),
('PRBomList','ty_le_hao_phi_kt','13','Hao hụt(%)','Rate of wastage','1','HE_SO','100','','0','1','0.00','0',''),
('PRBomList','ma_version','9','Version','Version ID','0','MA','100','','0','1','0.00','0',''),
('PRBomList','kieu_hop','6','Kiểu hộp','Box style','0','MA','100','','0','1','0.00','0',''),
('PRBomList','kieu_in','8','Kiểu in','Print style','0','MA','100','','0','1','0.00','0',''),
('PRBomList','ma_vt_yn','21','Vật tư chính','Key Item','1','CHECKBOX','100','','0','1','0.00','0','');

COMMIT;
