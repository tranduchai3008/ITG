BEGIN;

DELETE FROM gridinfo WHERE gridid in ('Soctso1update');

INSERT INTO gridinfo (gridid,fieldname,fieldposition,fieldcaption,fieldcaption2,visible,style,width,lang,auto,excel_visible,excel_width,dashboard_values_yn,merge_caption) VALUES
('Soctso1update','cap_do','8','SL','SL','1','','150','','0','1','0.00','0',''),
('Soctso1update','dh_uu_tien','9','Act Order','Act Order','1','CHECKBOX','150','','0','1','0.00','0',''),
('Soctso1update','ma_loai_noi_nhan','6','Rcv Type','Rcv Type','1','','100','','0','1','0.00','0',''),
('Soctso1update','ma_qg_cuoi','24','EndRcvCty','EndRcvCty','1','','100','','0','1','0.00','0',''),
('Soctso1update','ma_loai_nn_cuoi','23','EndRcvType','EndRcvType','1','','100','','0','1','0.00','0',''),
('Soctso1update','ma_noi_nhan_cuoi','22','EndRcv','EndRcv','1','','100','','0','1','0.00','0',''),
('Soctso1update','cach_giao_hang','21','Transit','Transit','1','','150','','0','1','0.00','0',''),
('Soctso1update','so_ct_dh2','20','Order2','Order2','1','','150','','0','1','0.00','0',''),
('Soctso1update','sl_consignment','19','Tot Csm Qty','Tot Csm Qty','1','SL','150','','0','1','0.00','0',''),
('Soctso1update','loai_hang','17','T','T','1','','150','','0','1','0.00','0',''),
('Soctso1update','sl_pallet','16','L','L','1','SL','150','','0','1','0.00','0',''),
('Soctso1update','so_luong','11','TotOrd','TotOrd','1','SL','150','','0','1','0.00','0',''),
('Soctso1update','ngay_phai_gh','15','Orig Date','Orig Date','1','DATE','100','','0','1','0.00','0',''),
('Soctso1update','ngay_kh_gh','10','Plan Date','Plan Date','1','DATE','100','','0','1','0.00','0',''),
('Soctso1update','ma_vt','3','Art No','Art No','1','MA','150','','0','1','0.00','0',''),
('Soctso1update','ten_vt','4','Description','Description','1','TEN','150','','0','1','0.00','0',''),
('Soctso1update','ma_noi_nhan','5','Rcv','Rcv','1','','100','','0','1','0.00','0',''),
('Soctso1update','ma_qg_nhan','7','RcvCty','RcvCty','1','','100','','0','1','0.00','0',''),
('Soctso1update','so_po','2','Order','Order','1','SO_CT','100','','0','1','0.00','0',''),
('Soctso1update','trang_thai','1','STATUS','STATUS','1','MA','100','','0','1','0.00','0',''),
('Soctso1update','sl_can_bang','12','TotBal','TotBal','1','SL','150','','0','1','0.00','0',''),
('Soctso1update','sl_da_giao','13','TotDsp','TotDsp','1','SL','150','','0','1','0.00','0',''),
('Soctso1update','sl_da_book','14','TotBook','TotBook','1','SL','150','','0','1','0.00','0',''),
('Soctso1update','rcvd_date','18','Rcvd Date','Rcvd Date','1','DATE','100','','0','1','0.00','0','');

COMMIT;
