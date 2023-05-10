BEGIN;

DELETE FROM message WHERE form = 'Dmpokhsx';

INSERT INTO message (form,mess_id,mess_text,mess_text2,df,df2) VALUES
('Dmpokhsx','001','Trạng thái','Status','Trạng thái','Status'),
('Dmpokhsx','002','1,1 - Còn sử dụng;0,0 - Không còn sử dụng','1,1 - Active;0,0 - Inactive','1,1 - Còn sử dụng;0,0 - Không còn sử dụng','1,1 - Active;0,0 - Inactive'),
('Dmpokhsx','003','&Lưu','&Ok','&Lưu','&Ok'),
('Dmpokhsx','004','&Hủy','&Cancel','&Hủy','&Cancel'),
('Dmpokhsx','005','PO KHSX','PO Plan','PO KHSX','PO Plan'),
('Dmpokhsx','006','Tên KHSX','Plan name','Tên KHSX','Plan name'),
('Dmpokhsx','007','Tên KHSX 2','Plan name 2','Tên KHSX 2','Plan name 2'),
('Dmpokhsx','008','Ghi chú','Note','Ghi chú','Note');

COMMIT;
