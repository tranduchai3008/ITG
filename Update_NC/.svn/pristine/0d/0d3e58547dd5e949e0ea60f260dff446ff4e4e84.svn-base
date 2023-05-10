BEGIN;

DELETE FROM formmenu WHERE form = 'PSTran';

INSERT INTO formmenu (form,menu_stt,menu_level,menu_text,menu_text2,menu_function,hide_yn,ds_gd) VALUES
('PSTran','1','1','Lấy số liệu từ phiếu yêu cầu','Get data from the request form','RetrieveItemsFromRQ2','0','2,4'),
('PSTran','8','1','Tồn theo kho','Item Physical Availability by warehouse','ItemPhysicalAvailabilityByWarehouse','1','2,4'),
('PSTran','7','1','Tồn kho hiệu lực theo kho','Item Availability by warehouse','ItemAvailabilityByWarehouse','1','2,4'),
('PSTran','0','0','Chức năng','Function','','0',''),
('PSTran','6','1','Tồn kho hiệu lực theo kỳ','Item Availability by period','ItemAvailabilityByPeriod','0','2,4'),
('PSTran','2','1','Lấy số liệu từ phiếu nhập mua trong nước','Get data from purchasing domestic stock import','RetrieveItemsFromPNA','1','2,4'),
('PSTran','3','1','Lấy số liệu từ phiếu nhập khẩu','Get data from the imported stock','RetrieveItemsFromPNB','1','2,4'),
('PSTran','4','1','Lấy số liệu từ lệnh vận chuyển','Get data from tranport command','RetrieveItemsFromTO2','1','2,4'),
('PSTran','5','0','Chi tiết','Detail','','0','');

COMMIT;
