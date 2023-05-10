BEGIN;

DELETE FROM dmxlct WHERE ma_ct in ('QC3');

INSERT INTO dmxlct (ma_ct,loai_gd,status,action_id,actionname,actionname2,right_yn) VALUES
('QC3','0','0','0','Lập ctừ ','No action ','0'),
('QC3','0','1','1','Thực hiện','Processing','1'),
('QC3','0','2','2','Hoàn thành','Close','1');

COMMIT;
