BEGIN;

DELETE FROM repinfo WHERE form = 'Mfctqc2';

INSERT INTO repinfo (form,name,type,val,val2,df,df2) VALUES
('Mfctqc2','h_ten_sp','C','Tên sản phẩm','Tên sản phẩm','Tên sản phẩm','Tên sản phẩm'),
('Mfctqc2','h_ng_kt','C','Người kiểm tra','Người kiểm tra','Người kiểm tra','Người kiểm tra'),
('Mfctqc2','s_so_ct','C','Số phiếu','Số phiếu','Số phiếu','Số phiếu'),
('Mfctqc2','h_ma_vt','C','Mã vật tư','Mã vật tư','Mã vật tư','Mã vật tư'),
('Mfctqc2','h_ten_vt','C','Tên vật tư','Tên vật tư','Tên vật tư','Tên vật tư'),
('Mfctqc2','h_dvt','C','ĐVT','ĐVT','ĐVT','ĐVT'),
('Mfctqc2','h_sl_nhap','C','SL nhập','SL nhập','SL nhập','SL nhập'),
('Mfctqc2','h_sl_dat_yc','C','SL đạt YC','SL đạt YC','SL đạt YC','SL đạt YC'),
('Mfctqc2','h_sl_kdat_yc','C','SL không đạt YC','SL không đạt YC','SL không đạt YC','SL không đạt YC'),
('Mfctqc2','h_ghi_chu','C','Ghi chú','Ghi chú','Ghi chú','Ghi chú'),
('Mfctqc2','s_ten_ncc','C','Nhà cung cấp:','Nhà cung cấp:','Nhà cung cấp:','Nhà cung cấp:'),
('Mfctqc2','s_so_dh','C','Số đơn hàng:','Số đơn hàng:','Số đơn hàng:','Số đơn hàng:'),
('Mfctqc2','s_ngay_nh','C','Ngày nhập hàng:','Ngày nhập hàng:','Ngày nhập hàng:','Ngày nhập hàng:'),
('Mfctqc2','s_ngay_lct','C','Ngày lập phiếu:','Ngày lập phiếu:','Ngày lập phiếu:','Ngày lập phiếu:'),
('Mfctqc2','s_ngay_bd','C','Ngày bắt đầu KT:','Ngày bắt đầu KT:','Ngày bắt đầu:','Ngày bắt đầu KT:'),
('Mfctqc2','s_ngay_kt','C','Ngày kết thúc KT:','Ngày kết thúc KT:','Ngày kết thúc KT:','Ngày kết thúc KT:'),
('Mfctqc2','c_nl','C','Người lập','Người lập','Người lập','Người lập'),
('Mfctqc2','c_tpqc','C','Trưởng Phòng QC','Trưởng Phòng','Trưởng Phòng','Trưởng Phòng'),
('Mfctqc2','c_gd','C','Giám đốc','Giám đốc','Giám đốc','Giám đốc'),
('Mfctqc2','c_gdsx','C','Giám đốc sản xuất','Giám đốc sản xuất','Giám đốc sản xuất','Giám đốc sản xuất'),
('Mfctqc2','h_so_lsx','C','Số lệnh SX','Số lệnh SX','Số lệnh SX','Số lệnh SX'),
('Mfctqc2','h_ma_sp','C','Mã sản phẩm','Mã sản phẩm','Mã sản phẩm','Mã sản phẩm'),
('Mfctqc2','h_sl_sx_thu','C','SL sản phẩm SX thử','SL sản phẩm SX thử','SL sản phẩm SX thử','SL sản phẩm SX thử'),
('Mfctqc2','h_sl_sp_ht','C','SL sản phẩm hoàn thành','SL sản phẩm hoàn thành','SL sản phẩm hoàn thành','SL sản phẩm hoàn thành'),
('Mfctqc2','h_sl_tp','C','SL thành phẩm','SL thành phẩm','SL thành phẩm','SL thành phẩm'),
('Mfctqc2','h_sl_pp','C','SL phế phẩm','SL phế phẩm','SL phế phẩm','SL phế phẩm'),
('Mfctqc2','h_po_khsx','C','PO KHSX','PO KHSX','PO KHSX','PO KHSX'),
('Mfctqc2','h_dau_tuan','C','Dấu tuần','Dấu tuần','Dấu tuần','Dấu tuần');

COMMIT;
