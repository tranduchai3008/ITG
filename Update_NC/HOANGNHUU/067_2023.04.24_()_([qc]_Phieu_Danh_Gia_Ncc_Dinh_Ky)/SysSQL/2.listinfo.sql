BEGIN;

DELETE FROM listinfo WHERE code in ('QC4Tran');

INSERT INTO listinfo (code,cfield,ctable,corder,ckey,cinitkey,fields,fields2,headers,headers2,formats,widths,title,title2,title0,title02,title1,title12,tablesref,coderef,cbasetable,nfielddf,noprdf,valueref) VALUES
('QC4Tran','so_ct','phxx','ngay_ct, so_ct','1=1','1=1','tag, ngay_ct,  so_ct, ma_kh, ten_kh, dia_chi,  dien_giai','tag, ngay_ct,  so_ct, ma_kh, ten_kh2, dia_chi, dien_giai','Chọn, Ngày ct,  Số ct, Mã ncc, Tên ncc, Địa chỉ, Diễn giải','Chọn, Ngày ct,  Số ct, Mã ncc, Tên ncc, Địa chỉ, Diễn giải','CHECKBOX, DATE,  , , , , ','40, 80,  80, 80, 200, 200, 200','Chọn','Select request','Thêm','Add','Sửa','Edit','','','','0','1','');

COMMIT;
