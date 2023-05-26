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

_______________________________________________________________________________________________________________________________________________________________
	create database db_lagu

use db_lagu

select * from tb_lagu

select * from tb_album

select * from tb_penjualan

create table tb_lagu(kd_lagu char(50) primary key, judul_lagu varchar(50), penyanyi varchar(50), tahun_lagu varchar(50))

create table tb_album(kd_album char(50) primary key, nama_album varchar(50), tahun_relase varchar(20))

create table tb_penjualan(id_penjualan int identity(1,1) primary key , kd_lagu char(50) foreign key references tb_lagu(kd_lagu), 
kd_album char(50) foreign key references tb_album(kd_album), record_fisik_terjual int, streaming_view int)   

//insert table lagu;

insert into tb_lagu values ('L0001', 'Ternyata Cinta', 'Padi', '1999')
insert into tb_lagu values ('L0002', 'Masih Tetap Tersenyum', 'Padi', '2000')
insert into tb_lagu values ('L0003', 'Siapa Gerangan Dirinya', 'Padi', '2005')

insert into tb_lagu values ('L0004', 'Atas Nama Cinta', 'Dewa 19', '2000')
insert into tb_lagu values ('L0005', 'Cinta Gila', 'Dewa 19', '2002')
insert into tb_lagu values ('L0006', 'Pangeran Cinta', 'Dewa 19', '2003')

insert into tb_lagu values ('L0007', 'Jadikan aku pacarmu', 'Sheila on 7', '2003')
insert into tb_lagu values ('L0008', 'Dan', 'Sheila on 7', '2004')
insert into tb_lagu values ('L0009', 'Tertatih', 'Sheila on 7', '2005')

//insert table album;

insert into tb_album values ('A0001', 'Indra Keenam', '2019')
insert into tb_album values ('A0002', 'Laskar Cinta', '1999')
insert into tb_album values ('A0003', 'Sheila on 7', '1999')

//insert table penjualan;

insert into tb_penjualan values ('L0001', 'A0001', 50000, 300000)
insert into tb_penjualan values ('L0002', 'A0001', 53000, 326700)
insert into tb_penjualan values ('L0003', 'A0001', 65000, 333900)
insert into tb_penjualan values ('L0004', 'A0002', 76000, 435600)
insert into tb_penjualan values ('L0005', 'A0002', 100000, 1300000)
insert into tb_penjualan values ('L0006', 'A0002', 150000, 967000)
insert into tb_penjualan values ('L0007', 'A0003', 51000, 535000)
insert into tb_penjualan values ('L0008', 'A0003', 31000, 615000)
insert into tb_penjualan values ('L0009', 'A0003', 29000, 423000)

SELECT  l.judul_lagu, l.penyanyi, l.tahun_lagu, a.nama_album, a.tahun_relase, p.record_fisik_terjual, p.streaming_view 

FROM tb_penjualan as p

INNER JOIN tb_album as a on a.kd_album = p.kd_album  

INNER JOIN tb_lagu as l on l.kd_lagu = p.kd_lagu

____________________________________________________________________________________________________________________________________________________________

create database dbobat

use dbobat

select * from tb_pembeli

select * from tb_obat

select * from tb_karyawan

create table tb_pembeli(no_nota varchar(8) primary key not null, nama varchar(25) null, total int) 

create table tb_obat(kode_obat varchar(8) primary key not null, nama_obat varchar(25) not null, jenis varchar(8) not null,keluhan varchar(30) not null)

create table tb_karyawan(nik varchar(8) primary key not null, nama varchar(25) not null, alamat varchar(40) not null, bagian varchar(15) null)


create table tb_banyak(no_nota varchar(8) foreign key references tb_pembeli(no_nota) not null, kode_obat varchar(8) foreign key references tb_obat(kode_obat) not null, banyak int not null, sub_total int)

create table tb_login(nik varchar(8) foreign key references tb_karyawan(nik) not null, username varchar(20)  primary key not null, passwordd varchar(20) not null)

create table tb_stok(kode_obat varchar(8) foreign key references tb_obat(kode_obat) not null, stok int not null, harga int not null) 

//tb_pembeli
insert into tb_pembeli values ('A001', 'Mikhael', '')
insert into tb_pembeli values ('A002', 'Fawzan', '')
insert into tb_pembeli values ('A003', 'Bebin', '')

//tb_obat
insert into tb_obat values('B001', 'paramex', 'pusing', 'pusing')
insert into tb_obat values('B002', 'woods', 'batuk', 'batuk')
insert into tb_obat values('B003', 'paracetamol', 'demam', 'demam')

//tb_karyawan
insert into tb_karyawan values('C001', 'dinda', 'MDP01', 'admind')
insert into tb_karyawan values('C002', 'putri', 'MDP02', 'gudang01')
insert into tb_karyawan values('C003', 'nur', 'MDP03', 'gudang02')


//tb_banyak
insert into tb_banyak values('A001', 'B001', '50', '60')
insert into tb_banyak values('A002', 'B002', '60', '70')
insert into tb_banyak values('A003', 'B003', '70', '80')

//tb_login
insert into tb_login values('C001', 'mikhael', 'mikhael01')
insert into tb_login values('C002', 'fawzan', 'fawzan02')
insert into tb_login values('C003', 'dinda', 'dinda03')

//tb_stok
insert into tb_stok values('B001', '50', '2000')
insert into tb_stok values('B002', '50', '10000')
insert into tb_stok values('B003', '50', '4000')

//3
select jenis from tb_obat

//4
select * from tb_obat where keluhan = 'pusing'

//5
select kode_obat from tb_banyak sum banyak 

//6
select from

//7 
select from



order by streaming_view desc

_________________________________________________________________________________________________________________________________________________

use dbpegawai
select * from tbkaryawan

create proc coba1
as
begin
if(exists(select * from tbkaryawan))
begin
select nip, nama, 
iif(kd_jenis='L', 'Laki-laki', 'Perempuan') as jenis_kelamin,
year(getdate())-year(tgl_lahir) as umur
from tbkaryawan
end
else
begin
print 'file tidak ada!'
end
end
go

exec coba1


create proc isian  @np varchar(5), @nm varchar(20),@tgl date, @gj int , @kdj char(1)
as
begin
if(exists(select * from tbkaryawan where nip=@np))
begin
print 'data sdh ada'
end
else
begin
insert into tbkaryawan values(@np,@nm,@tgl,@gj,@kdj)
print 'data berhasil masuk'
end
end 
go

exec isian '20192','Yuhana','12/09/1990',5000000,'p'

___________________________________________________________________________________________________________________________________________________

create database dbapotik

use dbapotik

create table tbpegawai(id_pegawai varchar(5) primary key, nama varchar(20), alamat varchar(20), notelp varchar(15), gaji int)

create table tbobat(id_obat varchar(5) primary key, nama_obat varchar(20), kategori varchar(20), ket varchar(20), harga_obat int, stok_obat int)

create table tbpelanggan(id_plg varchar(5) primary key, nama_plg varchar(20), alamat varchar(20), jk char(1), pekerjaan varchar(25))

create table tbtrans(id_tarans varchar(5), id_pegawai varchar(5) foreign key references tbpegawai(id_pegawai), id_obat varchar(5) foreign key references tbobat(id_obat),jumlah int, ttl int)

create proc masuk @idp varchar(5),@nm varchar(20), @alm varchar(20), @telp varchar(15), @gj int
as
begin
if(exists(select id_pegawai from tbpegawai where id_pegawai=@idp))
begin
print 'Data Sudah Ada'
end
else
begin
insert into tbpegawai values (@idp,@nm,@alm,@telp,@gj)
end
end
go

exec masuk 'A0001', 'Yohana S', 'sekip', '0711423441',3000000
exec masuk 'A0002', 'Panji S', 'plaju', '081377550441',27000000
exec masuk 'A0003', 'Bagus W', 'Perumnas', '21319273123',3500000

select * from tbpegawai

create proc masukobat @idob varchar(5),@nmobat varchar(20), @kat varchar(20), @ket varchar(15), @hrg int,@stok int
as
begin
if(exists(select id_obat from tbobat where id_obat=@idob))
begin
print 'Data Sudah Ada'
end
else
begin
insert into tbobat values (@idob,@nmobat,@kat,@ket,@hrg,@stok)
end
end
go

exec masukobat 'OB122', 'Aspirin', 'tanpa Resep', 'Obat Nyeri', 2500,30
exec masukobat 'OB123', 'paracetamol', 'tanpa Resep', 'Obat Demam', 4500,20

alter table tbtrans add id_plg varchar(5) foreign key references tbpelanggan(id_plg)

insert into tbpelanggan values('P0001','Udin','mars','L','makan')

insert into tbtrans values('T0001', 'A0001', 'OB122', 1, 2, 'P0001')

select * from  tbtrans

__________________________________________________________________________________________________________________________________

use elektro

select * from tblbarang

select * from tbljualan

select * from tblkasir

insert into tbljualan values('V0192', '12/05/2023', 'M1200', '001', 5)
insert into tbljualan values('V0193', '10/05/2023','M1201', '002', 2)

create proc masukjualan @nofax varchar(6), @tgl date, @kdb varchar(5), @kdk char(3), @jml int
as
begin
declare @st int
declare @sisa int
if(exists(select * from tbljualan))
begin
set @st=(select stok from tblbarang where kdbrg=@kdb)
if (@jml>=@st)
begin
print 'Stok tidak cukup!'
end
else
begin insert into tbljualan values(@nofax,@tgl,@kdb,@kdk,@jml)
update tblbarang set stok=@sisa where kdbrg=@kdb
print 'Data sdh masuk!'
end
end 
end
go

exec masukjualan 'VO187','2023-05-20', 'M1200', '002',2;
