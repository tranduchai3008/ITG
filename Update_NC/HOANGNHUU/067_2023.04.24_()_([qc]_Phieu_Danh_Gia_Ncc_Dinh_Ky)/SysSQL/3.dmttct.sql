BEGIN;

DELETE FROM dmttct WHERE ma_ct in ('QC4');

INSERT INTO dmttct (ma_ct,loai_gd,status,statusname,statusname2,xdefault,right_yn,xdel,xedit) VALUES
('QC4','0','0','Lập ctừ ','No action ','1','0','0','0'),
('QC4','0','1','Thực hiện','Process','0','1','0','1'),
('QC4','0','2','Hoàn thành','Close','0','1','0','1');

COMMIT;
