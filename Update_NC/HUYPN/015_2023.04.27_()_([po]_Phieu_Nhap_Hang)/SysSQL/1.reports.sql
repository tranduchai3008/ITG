BEGIN;

DELETE FROM reports WHERE form = 'PRTran';

INSERT INTO reports (form,rep_id,rep_text,rep_text2,rep_title,rep_title2,rep_file,gridid,title,title2,reportexcel,merge_yn,group_yn,hide_yn,create_xsd_yn,pdf_yn) VALUES
('PRTran','002','Phiếu hoàn thành dịch vụ','Purchase Service','Phiếu hoàn thành dịch vụ','Purchase Service','poctpr1a','','','','0','0','0','1','0','0'),
('PRTran','003','Phiếu nhập hàng_mẫu cũ (không có giá)','Old purchase receipt','Phiếu nhập hàng','Purchase receipt','poctpr1_1','','','','0','0','0','0','0','0'),
('PRTran','004','Phiếu nhập hàng_mẫu cũ (có giá)','Old purchase receipt','Phiếu nhập hàng','Purchase receipt','poctpr1_1a','','','','0','0','0','0','0','0'),
('PRTran','005','Phiếu nhập hàng 1','Purchase receipt','Phiếu nhập hàng','Purchase receipt','poctpr1_2','','','','0','0','0','1','0','0'),
('PRTran','001','Phiếu nhập hàng','Purchase receipt','Phiếu nhập hàng','Purchase receipt','poctpr1','','','','0','0','0','1','0','0');

COMMIT;
