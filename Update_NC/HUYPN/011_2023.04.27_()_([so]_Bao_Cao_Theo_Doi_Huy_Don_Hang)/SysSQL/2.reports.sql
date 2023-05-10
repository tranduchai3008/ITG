BEGIN;

DELETE FROM reports WHERE form like 'Sobctdhdh%';

INSERT INTO reports (form,rep_id,rep_text,rep_text2,rep_title,rep_title2,rep_file,gridid,title,title2,reportexcel,merge_yn,group_yn,hide_yn,create_xsd_yn,pdf_yn) VALUES
('Sobctdhdh','001','Báo cáo theo dõi hủy đơn hàng','Báo cáo theo dõi hủy đơn hàng','BÁO CÁO THEO DÕI HỦY ĐƠN HÀNG','BÁO CÁO THEO DÕI HỦY ĐƠN HÀNG','sobctdhdh','Sobctdhdh','Báo cáo theo dõi hủy đơn hàng','Báo cáo theo dõi hủy đơn hàng','0','1','0','0','0','0'),
('SobctdhdhH','001','Báo cáo theo dõi hủy đơn hàng','Báo cáo theo dõi hủy đơn hàng','BÁO CÁO THEO DÕI HỦY ĐƠN HÀNG','BÁO CÁO THEO DÕI HỦY ĐƠN HÀNG','sobctdhdh','SobctdhdhH','Báo cáo theo dõi hủy đơn hàng','Báo cáo theo dõi hủy đơn hàng','0','1','0','0','0','0');

COMMIT;
