BEGIN;

DELETE FROM dmsoct WHERE ma_ct ='QC4';

INSERT INTO dmsoct (ma_dvcs,ma_ct_me,ma_ct,ten_ct,ten_ct2,so_ct_current,so_ct_format,macdinh_yn,thaydoi_yn,so_ct_from,so_ct_to,so_ct_warring,m_save_type,so_ct_create,so_ct_form,ma_td1,ma_td2,ma_td3,status,date0,time0,user_id0,date2,time2,user_id2) VALUES
('01','QC4','QC4','Phiếu đánh giá NCC định kỳ','Form  quality  control  products ','1.00000000000000000000','01--yy--mm--00000','0','0','0.00000000000000000000','0.00000000000000000000','0.00000000000000000000','0','1','','','','','1','1900-01-01','00:00:00','0','1900-01-01','00:00:00','1');

COMMIT;
