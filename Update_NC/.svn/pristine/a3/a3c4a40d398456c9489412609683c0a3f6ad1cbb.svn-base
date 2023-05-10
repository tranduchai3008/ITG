BEGIN;

DELETE FROM formmenu WHERE form in ('IRTran');

INSERT INTO formmenu (form,menu_stt,menu_level,menu_text,menu_text2,menu_function,hide_yn,ds_gd) VALUES
('IRTran','15','0','Chi tiết','Detail','','1',''),
('IRTran','3','1','Lấy số liệu từ phiêu thống kê phân xưởng hàng hỏng','Get data from damaged goods production','RetrieveItemsFromTK1NG','0','2'),
('IRTran','4','1','Lấy số liệu từ hàng sản xuất hỏng (QC)','Get data from damaged goods production','RetrieveItemsFromQC2NG','1','2'),
('IRTran','2','1','Lấy số liệu từ  phiếu kiểm tra chất lượng sản phẩm','Get data from the stock check product quality','RetrieveItemsFromQC2','1','2'),
('IRTran','5','1','Lấy số liệu cân đối kiểm kê','Take inventory balance sheets','RetrieveItemsFromKK','0','3'),
('IRTran','19','1','Lấy số liệu từ phiếu xuất kho gia công','Get data from warranty','RetrieveItemsFromPXA','1','2,9,3,5,6,7,4,10,11,8,12'),
('IRTran','21','1','Lấy số liệu từ hàng đi gia công trả về','Get data from the QC check processing','RetrieveItemsFromPXAGC','1','2,9,3,5,6,7,4,10,11,8,12'),
('IRTran','22','1','Lấy số liệu đổi nguyên vật liệu NG','Get data for changing raw materials NG','RetrieveItemsFromPXANG','1','2,9,3,5,6,7,4,10,11,8,12'),
('IRTran','18','1','Lấy số liệu từ bảo hành','Get data from warranty','RetrieveItemsFromWXA','1','2,9,3,5,6,7,4,10,11,8,12'),
('IRTran','1','1','Lấy số liệu từ  phiếu thống kê sản xuất','Get the coupon data from production statistics','RetrieveItemsFromTK1','0','2'),
('IRTran','8','1','Lấy số liệu từ thống kê NVL hỏng','Get data from the QC check processing','RetrieveItemsFromTK1NVL','0','2'),
('IRTran','16','1','Tồn kho hiệu lực theo kho','Warehouse inventory effect under','ItemAvailabilityByWarehouse','1','2,9,3,5,6,7,4,10,11,8,12'),
('IRTran','17','1','Tồn theo kho','Item Physical Availability by warehouse','ItemPhysicalAvailabilityByWarehouse','1','2,9,3,5,6,7,4,10,11,8,12'),
('IRTran','20','1','Lấy số liệu từ  phiếu QC gia công','Get data from the QC check processing','RetrieveItemsFromQC1','1','2,9,3,5,6,7,4,10,11,8,12'),
('IRTran','9','1','Lấy số liệu từ Lệnh SX gia công','Get data from the command processing SX','RetrieveItemsFromPD1','0','6'),
('IRTran','10','1','Lấy số liệu từ đơn hàng vay','Get data from the loan application','RetrieveItemsFromPO1','0','10'),
('IRTran','0','0','Chức năng','Function','1','0',''),
('IRTran','12','1','Lấy dữ liệu từ Excel','Lấy dữ liệu từ Excel','RetrieveItemsFromExcel
','0','9'),
('IRTran','11','1','Lấy số liệu từ phiếu xuất kho – Nhập lại NVL thừa','Get data from the export voucher - Re-enter the excess NVL','RetrieveItemsFromPXANLNVL','0','2'),
('IRTran','6','1','Lấy số liệu cân đối hàng âm','Get the goods balance negative data','RetrieveItemsFromSD','0','9'),
('IRTran','7','1','Lấy số liệu từ phiếu xuất kho cho mượn','Get data from warranty','RetrieveItemsFromPXA1','1','7');

COMMIT;
