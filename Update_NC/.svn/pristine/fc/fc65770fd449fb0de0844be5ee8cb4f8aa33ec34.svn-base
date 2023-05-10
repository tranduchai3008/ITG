BEGIN;

DELETE FROM formmenu WHERE form = 'Mfcttk1';

INSERT INTO formmenu (form,menu_stt,menu_level,menu_text,menu_text2,menu_function,hide_yn,ds_gd) VALUES
('Mfcttk1','1','1','Lấy số liệu','Extract from Production Order','RetrieveItemsFromOtherVoucher','0','1'),
('Mfcttk1','2','1','Lấy số liệu từ phiếu Sorting/Rework','Get data from the stock Rework','RetrieveItemsFromREW','0','2,3'),
('Mfcttk1','3','1','Lấy số liệu từ tồn công đoạn sx','Get the data from the sx fragment','RetrieveItemsFromCDSX','0','3,4'),
('Mfcttk1','4','1','Import tồn cđsx kiểm kê','Import existing inventory','RetrieveItemsFromCDKK','0','3'),
('Mfcttk1','6','1',' Lấy số liệu từ kết nối máy',' Lấy số liệu từ kết nối máy','RetrieveItemsFromKNM','1','1,2,3'),
('Mfcttk1','0','0','Chức năng','Function','','0',''),
('Mfcttk1','5','1','Import từ Excel','Import from Excel','RetrieveItemsFromEXCEL','1','1,3');

COMMIT;
