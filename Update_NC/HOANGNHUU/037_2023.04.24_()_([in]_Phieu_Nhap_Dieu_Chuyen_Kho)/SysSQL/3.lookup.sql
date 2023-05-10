

----------[lookup]--------

BEGIN;

DELETE FROM lookup WHERE code in ('dmpokhsx');

INSERT INTO lookup (code,lfield,lname,lname2,ltable,lorder,lkey,title,title2,fields,fields2,headers,headers2,formats,widths,sysfields,sysfields2,sysheaders,sysheaders2,sysformats,syswidths,asmfile,classname,editfile,textsearchable_index_col_name,lfields,lookup_fast) VALUES
('dmpokhsx','po_khsx','ten_khsx','ten_khsx2','dmpokhsx','po_khsx','status=''1''','Danh mục PO KHSX','PO KHSX list','po_khsx, ten_khsx','po_khsx, ten_khsx2','PO KHSX, Tên PO KHSX','PO KHSX, Tên PO KHSX',',','80, 250','po_khsx, ten_khsx','po_khsx, ten_khsx2','PO KHSX, Tên PO KHSX','PO KHSX, Tên PO KHSX',',','80, 250','dmpokhsx.exe','Dmpokhsx','','','po_khsx, ten_khsx, ten_khsx2','0');

COMMIT;