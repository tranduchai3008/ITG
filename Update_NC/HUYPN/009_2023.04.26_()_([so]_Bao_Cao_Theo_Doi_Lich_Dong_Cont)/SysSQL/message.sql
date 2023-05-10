BEGIN;
DELETE FROM message WHERE form = 'Sobctdldc';
INSERT INTO message(
            form, mess_id, mess_text, mess_text2, df, df2)
VALUES ('Sobctdldc', '000', 'Báo cáo theo dõi lịch đóng cont', 'Báo cáo theo dõi lịch đóng cont', 'Báo cáo theo dõi lịch đóng cont', 'Báo cáo theo dõi lịch đóng cont');           
INSERT INTO message(
            form, mess_id, mess_text, mess_text2, df, df2)
VALUES ('Sobctdldc', '001', '&Xem', '&View', '&Xem', '&View');           
INSERT INTO message(
            form, mess_id, mess_text, mess_text2, df, df2)
VALUES ('Sobctdldc', '002', '&Đóng', '&Close', '&Đóng', '&Close');           
INSERT INTO message(
            form, mess_id, mess_text, mess_text2, df, df2)
VALUES ('Sobctdldc', '003', 'Mẫu báo cáo', 'Report form', 'Mẫu báo cáo', 'Report form');           
INSERT INTO message(
            form, mess_id, mess_text, mess_text2, df, df2)
VALUES ('Sobctdldc', '004', 'Tiêu đề', 'Title', 'Tiêu đề', 'Title');           
INSERT INTO message(
            form, mess_id, mess_text, mess_text2, df, df2)
VALUES ('Sobctdldc', '100', 'Điều kiện lọc', 'Filter', 'Điều kiện lọc', 'Filter');           
INSERT INTO message(
            form, mess_id, mess_text, mess_text2, df, df2)
VALUES ('Sobctdldc', '005', 'Từ ngày', 'From', 'Từ ngày', 'From');           
INSERT INTO message(
            form, mess_id, mess_text, mess_text2, df, df2)
VALUES ('Sobctdldc', '006', 'Đến ngày', 'To', 'Đến ngày', 'To');           
INSERT INTO message(
            form, mess_id, mess_text, mess_text2, df, df2)
VALUES ('Sobctdldc', '007', 'Mã khách hàng', 'Cus id', 'Mã khách hàng', 'Cus id');           
INSERT INTO message(
            form, mess_id, mess_text, mess_text2, df, df2)
VALUES ('Sobctdldc', '008', 'Nhóm KH1', 'KH1 Gr', 'Nhóm KH1', 'KH1 Gr');           
INSERT INTO message(
            form, mess_id, mess_text, mess_text2, df, df2)
VALUES ('Sobctdldc', '009', 'Nhóm KH2', 'KH2 Gr', 'Nhóm KH2', 'KH2 Gr');           
INSERT INTO message(
            form, mess_id, mess_text, mess_text2, df, df2)
VALUES ('Sobctdldc', '010', 'Nhóm KH3', 'KH3 Gr', 'Nhóm KH3', 'KH3 Gr');           
INSERT INTO message(
            form, mess_id, mess_text, mess_text2, df, df2)
VALUES ('Sobctdldc', '011', 'Mã ĐVCS', 'Unit id', 'Mã ĐVCS', 'Unit id');           


COMMIT;
