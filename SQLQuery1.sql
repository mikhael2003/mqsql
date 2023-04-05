use perusahaan

select * from perusahaan;

get date
datepart
dateadd
datediff
convert


use dbmhsiswa;
select * from tbmhs;

select datepart(week, tgl_lahir), datepart(weekday, tgl_lahir) from tbmhs;

select datepart(week,getdate())
select datepart(weekday,getdate())

select datepart(MONTH,getdate())
select dateadd( month,1, '11/09/2023');
select dateadd(month,1,'05/26/2003');

select datepart(week, '05/26/2003')
select datename(dw, '05/26/2003') as hariini	

select datediff(day, '2023-05-07', '2023-06-08')

select convert(date, '2023-09-20')
select convert(datetime, '2023-09-20')

select * from tbmhs

ALTER TABLE tbmhs ADD hr_lahir varchar (50),umur int,thn_kuliah varchar (50),lama_kuliah varchar (50);
alter table tbmhs add thn_lulus varchar (50);
ALTER TABLE tbmhs ALTER COLUMN thn_kuliah int ;
ALTER TABLE tbmhs ALTER COLUMN thn_lulus int ;

update tbmhs set hr_lahir= datename(dw, tgl_lahir); 
update tbmhs set umur = year(getdate())-year(tgl_lahir);
update tbmhs set thn_kuliah = left(npm,2)+2000;
update tbmhs set thn_lulus = (substring(npm,5,2)+2000)
update tbmhs set lama_kuliah= thn_lulus-thn_kuliah;
_________________________________________________________________________________________________________________________________

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

______________________________________________________________________________________________________________________________________

use dbmahasiswa
select * from tbmhs

create view vmhs as select npm,nama,prodi,umur from tbmhs

select * from vinfor

create view vinfor as select npm, nama, prodi, umur from tbmhs where substring(npm,5,2) = '25'

create view vnilai as select tbtrans.npm,
tbmhs.nama,tbmk.nama_mk,tbtrans.nilai from tbtrans, tbmhs, tbmk 
where tbtrans.npm=tbmhs.npm and tbtrans.kode_mk=tbmk.kode_mk 

select * from vnilai

create database dbjual
use dbjual

create table penjualan(idpenjual varchar(5) primary key, nama_penjual varchar(25),tgl_jual date, nilai_jual int)

create table barang(kd_barang varchar(5) primary key, nama_brg varchar(50), harga int, jumlah int, id_jual varchar(5) foreign key references penjualan(idpenjual))

insert into  penjualan values('P0001', 'Rohadi', '09/12/2022', 45000000)
insert into  penjualan values('P0002', 'Nurman', '09/12/2022', 45000000)
insert into  penjualan values('P0003', 'Johan', '02/17/2022', 42000000)
insert into  penjualan values('P0004', 'Januari', '05/19/2022', 17000000)
insert into  penjualan values('P0005', 'Budiman', '06/18/2022', 67000000)

insert into  barang values('BA211', 'Komputer', 7500000, 2, 'P0001')
insert into  barang values('BA201', 'Mouse', 75000, 10, 'P0003')
insert into  barang values('BA202', 'Keyboard', 100000, 15, 'P0005')
insert into  barang values('BA204', 'SSD', 3200000, 7, 'P0004')


select * from barang 
create view vtransaksi as 
select penjualan.nama_penjual,penjualan.nilai_jual, barang.nama_brg,barang.jumlah 
from barang,penjualan 
where penjualan.idpenjual=barang.id_jual
	
select *from vtransaksi


________________________________________________________________________________________

use finansial
select * from pelanggan

create table bayar(kd_bayar char(5) primary key, tgl_bayar date, nomor varchar(6), j_angsuran int, bunga int)
alter table bayar alter column nomor varchar(6)  foreign key references pelanggan(
select * from bayar

alter table pelanggan alter column nokontrak varchar(6) not null
alter table pelanggan add primary key (nokontrak)
alter table bayar add foreign key (nomor) references pelanggan(nokontrak)
create table bayar(kd_bayar char(5) primary key,tgl_bayar date, nomor varchar(6), j_angsuran int, bunga int)

insert into bayar values('B0001','09/13/2022','0003',250000,15000)
insert into bayar values('B0002','04/14/2022','0002',210000,12000)
insert into bayar values('B0003','08/15/2022','0001',215000,10000)
insert into bayar values('B0004','07/16/2022','0004',125000,13500)

create view vdaftar as select bayar.kd_bayar, pelanggan.nama, bayar.tgl_bayar
, bayar.j_angsuran from bayar,pelanggan where bayar.nomor = pelanggan.nokontrak

select * from vdaftar

create view view2 as select nama,hutang, case jkelamin when 'L' then 'Laki-Laki'
when 'P' then 'Perempuan' end as Jenis from pelanggan
select * from view2

create view vdaftar1 as select bayar.kd_bayar, pelanggan.nama, bayar.tgl_bayar
, bayar.j_angsuran, pelanggan.hutang-bayar.j_angsuran as sisahutang from bayar,pelanggan where bayar.nomor = pelanggan.nokontrak
select * from vdaftar1

