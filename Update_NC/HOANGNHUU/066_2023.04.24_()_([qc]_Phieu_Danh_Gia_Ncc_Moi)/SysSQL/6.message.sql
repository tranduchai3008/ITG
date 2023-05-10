

----------[message]--------

BEGIN;

DELETE FROM message WHERE form in ('QC3Tran');

INSERT INTO message (form,mess_id,mess_text,mess_text2,df,df2) VALUES
('QC3Tran','000','Phiếu đánh giá NCC mới','Quality inspection stock purchases','Phiếu đánh giá NCC mới','Quality inspection stock purchases'),
('QC3Tran','001','Thông tin chính','Main','Thông tin chính','Main'),
('QC3Tran','002','Tên NCC (*)','NCC name (*)','Tên NCC (*)','NCC name (*)'),
('QC3Tran','004','Địa chỉ (*)','Address (*)','Địa chỉ (*)','Address (*)'),
('QC3Tran','005','Điện thoại','Phone','Điện thoại','Phone'),
('QC3Tran','003','Người liên lạc','LH name','Người liên lạc','LH name'),
('QC3Tran','006','Diễn giải','Note','Diễn giải','Note'),
('QC3Tran','010','Điểm đánh giá (*)','Điểm đánh giá (*)','Điểm đánh giá (*)','Điểm đánh giá (*)'),
('QC3Tran','007','Người đánh giá (*)','Người đánh giá (*)','Người đánh giá (*)','Người đánh giá (*)'),
('QC3Tran','009','Mã hàng cung cấp (*)','Mã hàng cung cấp (*)','Mã hàng cung cấp (*)','Mã hàng cung cấp (*)'),
('QC3Tran','011','Đính kèm file','Đính kèm file','Đính kèm file','Đính kèm file'),
('QC3Tran','M01','1,1 – Kém;2,2 – Cần cải tiến;3,3 – Cần cải tiến một phần;4,4 – Tốt;5,5 – Hoàn hảo','1,1 – Kém;2,2 – Cần cải tiến;3,3 – Cần cải tiến một phần;4,4 – Tốt;5,5 – Hoàn hảo','1,1 – Kém;2,2 – Cần cải tiến;3,3 – Cần cải tiến một phần;4,4 – Tốt;5,5 – Hoàn hảo','1,1 – Kém;2,2 – Cần cải tiến;3,3 – Cần cải tiến một phần;4,4 – Tốt;5,5 – Hoàn hảo'),
('QC3Tran','012','ĐVCS','ĐVCS','ĐVCS','ĐVCS'),
('QC3Tran','013','Số CT','Số CT','Số CT','Số CT'),
('QC3Tran','014','Ngày lập','Ngày lập','Ngày lập','Ngày lập'),
('QC3Tran','015','Ngày hạch toán','Ngày hạch toán','Ngày hạch toán','Ngày hạch toán'),
('QC3Tran','016','Tỷ giá','Tỷ giá','Tỷ giá','Tỷ giá'),
('QC3Tran','017','Trạng thái','Trạng thái','Trạng thái','Trạng thái'),
('QC3Tran','018','Xử lý','Xử lý','Xử lý','Xử lý'),
('QC3Tran','501','Tiêu đề','Tiêu đề','Tiêu đề','Tiêu đề'),
('QC3Tran','502','Số liên','Số liên','Số liên','Số liên'),
('QC3Tran','503','Số CT','Số CT','Số CT','Số CT'),
('QC3Tran','506','Xem','Xem','Xem','Xem'),
('QC3Tran','505','In','In','In','In'),
('QC3Tran','504','Mẫu báo cáo','Mẫu báo cáo','Mẫu báo cáo','Mẫu báo cáo'),
('QC3Tran','507','Quay ra','Quay ra','Quay ra','Quay ra'),
('QC3Tran','102','Số CT từ/ đến','Số CT từ/ đến','Số CT từ/ đến','Số CT từ/ đến'),
('QC3Tran','103','Ngày CT từ/ đến','Ngày CT từ/ đến','Ngày CT từ/ đến','Ngày CT từ/ đến'),
('QC3Tran','114','Lọc','Lọc','Lọc','Lọc'),
('QC3Tran','115','Trạng thái','Status','Trạng thái','Status'),
('QC3Tran','116','Nhận','Nhận','Nhận','Nhận'),
('QC3Tran','117','Hủy','Hủy','Hủy','Hủy'),
('QC3Tran','100','Tìm kiếm đánh giá NCC mới','Tìm kiếm đánh giá NCC mới','Tìm kiếm đánh giá NCC mới','Tìm kiếm đánh giá NCC mới'),
('QC3Tran','008','Ngày đánh giá (*)','Ngày đánh giá (*)','Ngày đánh giá (*)','Ngày đánh giá (*)'),
('QC3Tran','101','Điều kiện lọc','Search','Điều kiện lọc','Search');

COMMIT;