BEGIN;

DELETE FROM command WHERE sysid in ('QC4Tran');

INSERT INTO command (menuid0,menuid,text,text2,ma_ct,report,command,title,title2,basicright,picture1,picture2,type,sysid,syscode,hide_yn,hide_yn2,ds_dvcs) VALUES
('76.01.06','76.01.00','Phiếu đánh giá NCC định kỳ','Voucher product quality inspection','QC4','','poctdgncc.exe QC4','Phiếu đánh giá NCC định kỳ','Voucher product quality inspection','0','ITGVOUCHER.png','ITGVOUCHER.png','V','QC4Tran','QC4','0','0','');

COMMIT;
