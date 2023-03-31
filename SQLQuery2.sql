create database pelatihan;
create table tblpelatihan(No int, Nama_Peserta varchar(50), Kode_Paket varchar(50),tgl_daftar date, tgl_masuk date ) ;

select * from tblpelatihan

INSERT INTO tblpelatihan(No, Nama_Peserta, Kode_Paket, tgl_daftar, tgl_masuk)
VALUES ('1', 'Yuliani', '243/A/B/A2', '09/12/2022', '10/15/2022');

INSERT INTO tblpelatihan(No, Nama_Peserta, Kode_Paket, tgl_daftar, tgl_masuk)
VALUES ('2', 'Mathilda', '245/B/A/B1', '09/14/2022', '10/18/2022');

INSERT INTO tblpelatihan(No, Nama_Peserta, Kode_Paket, tgl_daftar, tgl_masuk)
VALUES ('3', 'Johan', '244/C/B/C2', '09/14/2022', '10/17/2022');

INSERT INTO tblpelatihan(No, Nama_Peserta, Kode_Paket, tgl_daftar, tgl_masuk)
VALUES ('4', 'Rames', '245/B/A/B1', '09/16/2022', '10/18/2022');

INSERT INTO tblpelatihan(No, Nama_Peserta, Kode_Paket, tgl_daftar, tgl_masuk)
VALUES ('5', 'Brontolaras', '243/A/B/A2', '09/18/2022', '10/15/2022');

select * from tblpelatihan
//1
alter table tblpelatihan add angkatan varchar(50), Paket varchar(50), Biaya int, tgl_akhir date;
//2
update	tblpelatihan set angkatan= left(Kode_Paket, 3);
//3
update tblpelatihan set Paket= case
when substring(Kode_Paket,5,1)='A' then 'Microsoft Word'
when substring(Kode_Paket,5,1)='B' then 'Microsoft Excel'
when substring(Kode_Paket,5,1)='C' then 'Microsoft PowerPoint'
end
//4
update tblpelatihan set Biaya= case
when substring(Kode_Paket,5,1)='A' then 250000*2
when substring(Kode_Paket,5,1)='B' then 300000*2
when substring(Kode_Paket,5,1)='C' then 250000*1
end
//5
update tblpelatihan set tgl_akhir= case
when substring(Kode_Paket,5,1)='A' then dateadd(month,2, tgl_masuk)
when substring(Kode_Paket,5,1)='B' then dateadd(month,2, tgl_masuk)
when substring(Kode_Paket,5,1)='C' then dateadd(month,1, tgl_masuk)
end