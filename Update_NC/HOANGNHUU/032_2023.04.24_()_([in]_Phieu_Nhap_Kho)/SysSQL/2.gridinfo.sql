BEGIN;

DELETE FROM gridinfo WHERE gridid in ('PNDTranPXA');

INSERT INTO gridinfo (gridid,fieldname,fieldposition,fieldcaption,fieldcaption2,visible,style,width,lang,auto,excel_visible,excel_width,dashboard_values_yn,merge_caption) VALUES
('PNDTranPXA','tag','1','Chọn','Select','1','CHECKBOX','50','','0','1','0.00','0',''),
('PNDTranPXA','ma_vt','2','Mã vt','Item id','1','','100','','0','1','0.00','0',''),
('PNDTranPXA','ten_vt','3','Tên vt','Item name','1','','150','','0','1','0.00','0',''),
('PNDTranPXA','sl_nhap_qt','8','Số lượng','Import quantity','1','SL','100','','0','1','0.00','0',''),
('PNDTranPXA','so_ct_pd1','12','Số lệnh SX','Uom','1','','100','','0','1','0.00','0',''),
('PNDTranPXA','po_khsx','4','PO KHSX','PO KHSX','1','','150','','0','1','0.00','0',''),
('PNDTranPXA','ma_vv_i','10','Mã VV','Uom','1','','80','','0','1','0.00','0',''),
('PNDTranPXA','dvt','6','Đvt','Uom','1','','60','','0','1','0.00','0',''),
('PNDTranPXA','ma_kho','7','Mã kho','Uom','1','','80','','0','1','0.00','0',''),
('PNDTranPXA','dau_tuan','5','Dấu tuần','Week','1','','150','','0','1','0.00','0',''),
('PNDTranPXA','tk_vt_i','9','TK vật tư','Uom','1','','80','','0','1','0.00','0',''),
('PNDTranPXA','ma_nx_i','11','Mã nx','Uom','1','','80','','0','1','0.00','0',''),
('PNDTranPXA','so_ct_dxv','13','Số YC xuất NVL','Uom','1','','100','','0','1','0.00','0','');

COMMIT;
