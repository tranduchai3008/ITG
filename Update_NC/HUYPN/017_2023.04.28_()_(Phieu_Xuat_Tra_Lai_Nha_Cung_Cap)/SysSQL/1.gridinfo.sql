

----------[gridinfo]--------

BEGIN;

DELETE FROM gridinfo WHERE gridid = 'ctqtthm' or gridid = 'ct86';

INSERT INTO gridinfo (gridid,fieldname,fieldposition,fieldcaption,fieldcaption2,visible,style,width,lang,auto,excel_visible,excel_width,dashboard_values_yn,merge_caption) VALUES
('ct86','stt_rec','0','','','0','','0','','0','1','0.00','0',''),
('ct86','ma_ct','0','','','0','','0','','0','1','0.00','0',''),
('ct86','tk_thue_i','0','','','0','','0','','0','1','0.00','0',''),
('ct86','dvt1','0','','','0','','0','','0','1','0.00','0',''),
('ct86','he_so1','0','','','0','','0','','0','1','0.00','0',''),
('ct86','ma_nx_i','0','','','0','','0','','0','1','0.00','0',''),
('ct86','ma_td_i','0','','','0','','0','','0','1','0.00','0',''),
('ct86','stt_rec_pn','0','','','0','','0','','0','1','0.00','0',''),
('ct86','thue','0','','','0','','0','','0','1','0.00','0',''),
('ct86','thue_nt','0','','','0','','0','','0','1','0.00','0',''),
('ct86','ln','0','','','0','','0','','0','1','0.00','0',''),
('ct86','ma_td2','0','','','0','','0','','0','1','0.00','0',''),
('ct86','ma_td3','0','','','0','','0','','0','1','0.00','0',''),
('ct86','gc_td1','0','','','0','','0','','0','1','0.00','0',''),
('ct86','gc_td2','0','','','0','','0','','0','1','0.00','0',''),
('ct86','gc_td3','0','','','0','','0','','0','1','0.00','0',''),
('ct86','ten_vt','2','Tên vật tư','Item Name','1','TEN','200','','0','1','0.00','0',''),
('ct86','ma_vt','1','Mã vật tư','Item ID','1','MA','100','','0','1','0.00','0',''),
('ct86','so_luong1','0','','','0','SL','0','','0','1','0.00','0',''),
('ct86','sl_td1','0','','','0','SL','0','','0','1','0.00','0',''),
('ct86','sl_td2','0','','','0','SL','0','','0','1','0.00','0',''),
('ct86','sl_td3','0','','','0','SL','0','','0','1','0.00','0',''),
('ct86','so_luong','7','Số lượng','Quantity','1','SL','100','','0','1','0.00','0',''),
('ct86','gia','11','Giá','Price','1','GIA','100','','0','1','0.00','0',''),
('ct86','gia_nt','8','Giá nt','FC Price','1','GIA_NT','100','','0','1','0.00','0',''),
('ctqtthm','ten_vt','4','Tên hàng hóa','Voucher Date','1','Ten','180','','0','1','0.00','0',''),
('ctqtthm','sl_nhap_qt','10','SL Yêu cầu','Request Q.Ty','1','SL','70','','0','1','0.00','0',''),
('ctqtthm','sl_xuat_qt','11','SL Đã xuất','Delivered','1','SL','70','','0','1','0.00','0',''),
('ctqtthm','sl_con_lai','12','SL Còn lại','Remain','1','SL','70','','0','1','0.00','0',''),
('ctqtthm','loai_vt_xuat','9','Hàng KM','Type','1','CHECKBOX','50','','0','1','0.00','0',''),
('ct86','so_ct','0','','','0','','110','','0','1','0.00','0',''),
('ctqtthm','ma_vt','2','Mã hàng','Vo. No','1','MA','100','','0','1','0.00','0',''),
('ct86','ngay_ct','0','','','0','DATE','0','','0','1','0.00','0',''),
('ct86','ngay_td1','0','','','0','DATE','0','','0','1','0.00','0',''),
('ct86','ngay_td2','0','','','0','DATE','0','','0','1','0.00','0',''),
('ct86','ngay_td3','0','','','0','DATE','0','','0','1','0.00','0',''),
('ctqtthm','dvt','8','Đvt','Unit','1','DVT','50','','0','1','0.00','0',''),
('ctqtthm','so_luong','13','SL Xuất lần này','Deliver This time','1','SL','70','','0','1','0.00','0',''),
('ctqtthm','po_khsx','5','PO KHSX','PO KHSX','1','MA','100','','0','1','0.00','0',''),
('ctqtthm','dau_tuan','6','Dấu tuần','Dấu tuần','1','MA','100','','0','1','0.00','0',''),
('ct86','dvt','5','Dvt','Unit','1','DVT','50','','0','1','0.00','0',''),
('ct86','ma_kho','6','Mã kho','Site ID','1','MA','100','','0','1','0.00','0',''),
('ct86','tien_nt','9','Tiền nt','FC Amount','1','TIEN_NT','100','','0','1','0.00','0',''),
('ct86','tk_vt','10','Tk Vt','Item acct','1','MA_TK','100','','0','1','0.00','0',''),
('ct86','tien','12','Tiền','Amount','1','TIEN','100','','0','1','0.00','0',''),
('ct86','ma_vv','13','Mã Vv','JobID','1','MA','100','','0','1','0.00','0',''),
('ct86','po_khsx','3','PO KHSX','PO KHSX','1','MA','100','','0','1','0.00','0',''),
('ct86','dau_tuan','4','Dấu tuần','Dấu tuần','1','MA','100','','0','1','0.00','0','');

COMMIT;