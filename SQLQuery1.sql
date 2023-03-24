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
