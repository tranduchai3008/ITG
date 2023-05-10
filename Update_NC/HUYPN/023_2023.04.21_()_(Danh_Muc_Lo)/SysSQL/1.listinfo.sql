BEGIN;

DELETE FROM listinfo WHERE code = 'Lot';

INSERT INTO listinfo (code,cfield,ctable,corder,ckey,cinitkey,fields,fields2,headers,headers2,formats,widths,title,title2,title0,title02,title1,title12,tablesref,coderef,cbasetable,nfielddf,noprdf,valueref) VALUES
('Lot','ma_vt, ma_lo','dmlo','ma_vt, ma_lo','1=1','1=1','ma_vt, ten_vt, ma_lo, ten_lo, po_khsx, dau_tuan, user_name0, date0, time0, user_name2, date2, time2','ma_vt, ten_vt2, ma_lo, ten_lo2, po_khsx, dau_tuan, user_id0, date0, time0, user_id2, date2, time2','Mã vật tư, Tên vật tư, Số lô, Tên lô, PO KHSX, Dấu tuần, Người tạo, Ngày tạo, Giờ tạo, Người sửa, Ngày sửa, Giờ sửa','Item id, Item name, Lot number, Description, PO KHSX, Dấu tuần, Cr by, Cr Date, Cr time, Md by, Last date, Last time',', , , , , , , DATE, TIME, , DATE, TIME','80, 250, 80, 250, 100, 100, 80, 80, 80, 80, 80, 80','Danh mục lô','Lots list','Thêm lô','Add information','Sửa lô','Edit information','ma_lo,ctlo;ma_lo,ct70b','ma_lo','','0','0','ma_lo');

COMMIT;
