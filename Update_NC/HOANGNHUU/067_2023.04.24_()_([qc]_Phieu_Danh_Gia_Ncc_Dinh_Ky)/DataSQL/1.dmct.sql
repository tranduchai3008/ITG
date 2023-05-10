BEGIN;

DELETE FROM dmct WHERE ma_ct ='QC4';

INSERT INTO dmct (ma_phan_he,ma_ct,ten_ct,ten_ct2,ma_ct_me,so_ct,m_ma_nk,m_ma_gd,m_ma_td,ma_nt,tieu_de_ct,tieu_de_ct2,so_lien,ma_ct_in,form,stt_ct_nkc,stt_ctntxt,ct_nxt,m_ph,m_ct,m_status,post_type,m_sl_ct0,m_trung_so,m_loc_nsd,m_ong_ba,m_ngay_ct,procedur,stt,m_ma_td2,m_ma_td3,m_sl_td1,m_sl_td2,m_sl_td3,m_gc_td1,m_gc_td2,m_gc_td3,post2,post3,m_ngay_td1,m_ngay_td2,m_ngay_td3,dk_ctgs,status,date0,time0,user_id0,date2,time2,user_id2,fs_post,xstatus,so_ct_format,m_save_type,so_ct_create,so_ct_form,activity_yn,lock_yn,detail_yn,visible_copy) VALUES
('PO','QC4','PHIẾU ĐÁNH GIÁ NHÀ CUNG CẤP ĐỊNH KỲ','FORM  QUALITY  CONTROL  PRODUCTS ','QC4','1.00000000000000000000','QC4','1','0','VND','PHIẾU ĐÁNH GIÁ NHÀ CUNG CẤP ĐỊNH KỲ','FORM  QUALITY  CONTROL  PRODUCTS ','1','QC','POCTQC1','31','11','0','PHQC4','','1','0','1','4','1','0','0','','20','','','','','','','','','1','1','','','','','1','1900-01-01','00:00:00','0','2011-10-30','10:28:55','16','','','00000000','0','5','','0','0','0','0');

COMMIT;
