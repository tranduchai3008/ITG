BEGIN;
DELETE FROM repinfo WHERE form = 'Sobctdldc';
INSERT INTO repinfo(
            form, name, type, val, val2, df, df2)
VALUES ('Sobctdldc', 'h_sysorder', 'C', '', '', '', '');           
INSERT INTO repinfo(
            form, name, type, val, val2, df, df2)
VALUES ('Sobctdldc', 'h_sysprint', 'C', '', '', '', '');           
INSERT INTO repinfo(
            form, name, type, val, val2, df, df2)
VALUES ('Sobctdldc', 'h_systotal', 'C', '', '', '', '');           
INSERT INTO repinfo(
            form, name, type, val, val2, df, df2)
VALUES ('Sobctdldc', 'h_ma_kh', 'C', 'Mã khách hàng', 'Cus id', 'Mã khách hàng', '');           
INSERT INTO repinfo(
            form, name, type, val, val2, df, df2)
VALUES ('Sobctdldc', 'h_ten_kh', 'C', 'Tên khách hàng', 'Customer name', 'Tên khách hàng', '');           
INSERT INTO repinfo(
            form, name, type, val, val2, df, df2)
VALUES ('Sobctdldc', 'h_so_dh', 'C', 'Số ĐH', 'Số ĐH', 'Số ĐH', '');           
INSERT INTO repinfo(
            form, name, type, val, val2, df, df2)
VALUES ('Sobctdldc', 'h_ma_vt', 'C', 'Mã hàng', 'Item Code', 'Mã hàng', '');           
INSERT INTO repinfo(
            form, name, type, val, val2, df, df2)
VALUES ('Sobctdldc', 'h_ten_vt', 'C', 'Tên hàng', 'Item Name', 'Tên hàng', '');           
INSERT INTO repinfo(
            form, name, type, val, val2, df, df2)
VALUES ('Sobctdldc', 'h_ma_noi_nhan', 'C', 'Nơi đến', 'Nơi đến', 'Nơi đến', '');           
INSERT INTO repinfo(
            form, name, type, val, val2, df, df2)
VALUES ('Sobctdldc', 'h_so_ecis', 'C', 'Số ECIS', 'Số ECIS', 'Số ECIS', '');           
INSERT INTO repinfo(
            form, name, type, val, val2, df, df2)
VALUES ('Sobctdldc', 'h_ngay_gh', 'C', 'Ngày giao hàng', 'Ngày giao hàng', 'Ngày giao hàng', '');           
INSERT INTO repinfo(
            form, name, type, val, val2, df, df2)
VALUES ('Sobctdldc', 'h_ngay_giao_thuc_te', 'C', 'Ngày giao thực tế', 'Ngày giao thực tế', 'Ngày giao thực tế', '');           
INSERT INTO repinfo(
            form, name, type, val, val2, df, df2)
VALUES ('Sobctdldc', 'h_so_luong', 'C', 'Số lượng', 'Số lượng', 'Số lượng', '');           
INSERT INTO repinfo(
            form, name, type, val, val2, df, df2)
VALUES ('Sobctdldc', 'h_so_pallet', 'C', 'Số Pallet', 'Số Pallet', 'Số Pallet', '');           
INSERT INTO repinfo(
            form, name, type, val, val2, df, df2)
VALUES ('Sobctdldc', 'h_so_top', 'C', 'Số lượng TO', 'Số lượng TO', 'Số lượng TO', '');           


COMMIT;
