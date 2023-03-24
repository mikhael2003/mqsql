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






