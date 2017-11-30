use [master]
go
if exists(select name from dbo.sysdatabases where name = 'Db_MotosAcme')
drop database [Db_MotosAcme]
go
create database [Db_MotosAcme]
go
use [Db_MotosAcme]
go
if exists(select name from dbo.sysobjects where name = 'Tbl_Usuarios')
drop  table [Tbl_Clientes]
go
create table [Tbl_Clientes](
idCliente  varchar(100) not null primary key,
nombre varchar(100) not null,
telefono varchar(15),
password varchar(max)not null,
direccion varchar(max)not null,
ubicacion varchar(100))
go
create procedure [Sp_Ins_Clientes](
@idCliente varchar(100),
@nombre varchar(100),
@telefono varchar(15),
@password varchar(max),
@direccion varchar(max),
@ubicacion varchar(100))
as
insert into Tbl_Clientes(idCliente,nombre,telefono,
password,direccion,ubicacion )
values(@idCliente,@nombre,@telefono,@password,@direccion,@ubicacion)
go
if exists(select name from dbo.sysobjects where name ='Tbl_Motos')
drop table [Tbl_Motos]
/*
Los Tipos de Motos(tipo):
Scooter
Cuadraciclo
Pandillera
Montannera
----------
modelo= modelo de la moto
annoModelo=año del modelo
motorSize= tamaño del motor en cc(Cm cbicos) tipícamente:
125-250-420-700
cylinders: cant de cilindros, tipícamente: 1-2-4
motorType: tiempos del motor: 2 tiempos o 4 tiempos
*/
go
create  table [Tbl_Motos](
modelo  varchar(30) not null primary key,
annoModelo  varchar(4) not null,
motorSize varchar(4) not null,
cylinders varchar(2) not null,
motorType varchar(20) not null,
tipo varchar(20) not null,
imgUrl varchar(100) not null,
price float not null,)
go
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('CB 190R','2017', '150', '1', '4 tiempos', 'Pandillera', 'img/models/cb190-sm.jpg' ,1900000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('CB 190R Repsol','2018', '150', '1', '4 tiempos', 'Pandillera', 'img/models/cb190-rp-sm.jpg' ,2100000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('GL 150 Cargo','2018', '150', '1', '4 tiempos', 'Pandillera', 'img/models/gl150-cargo-sm.jpg' ,1370000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('GL 150 WS','2018', '150', '1', '4 tiempos', 'Pandillera', 'img/models/gl150-ws-sm.jpg' ,1365000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('CB1 Sport','2018', '150', '1', '4 tiempos', 'Pandillera', 'img/models/cb1-sport-sm.jpg' ,995000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('CB1 TUF Plus','2018', '150', '1', '4 tiempos', 'Pandillera', 'img/models/cb1-tuf-sm.jpg' ,1025000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('CGL 125','2018', '125', '1', '4 tiempos', 'Pandillera', 'img/models/cgl125-sm.jpg' ,930000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('CBF160F','2018', '150', '1', '4 tiempos', 'Pandillera', 'img/models/cb160-sm.jpg' ,1550000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('Shadow 150','2018', '150', '1', '4 tiempos', 'Pandillera', 'img/models/shadow150-sm.jpg' ,1295000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('Unicorn 160','2018', '150', '1', '4 tiempos', 'Pandillera', 'img/models/unicorn160-sm.jpg' ,1295000);
go
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('TRX 420 FB','2017', '450', '1', '4 tiempos', 'Cuadraciclo', 'img/models/trx-fourtrax-sm.jpg' , 5100000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('TRX 420 FA','2017', '450', '1', '4 tiempos', 'Cuadraciclo', 'img/models/trx-fourtrax-sm.jpg' , 5550000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('TRX 420 FA2','2017', '450', '1', '4 tiempos', 'Cuadraciclo', 'img/models/trx-fourtrax-sm.jpg' , 6100000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('TRX 420 FA3','2017', '450', '1', '4 tiempos','Cuadraciclo', 'img/models/trx-fourtrax-sm.jpg' , 6150000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('TRX 420 FE','2017', '450', '1','4 tiempos','Cuadraciclo','img/models/trx-fourtrax-sm.jpg' , 400000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('TRX 420 TE','2017', '450', '1', '4 tiempos', 'Cuadraciclo', 'img/models/trx-fourtrax-sm.jpg' , 5100000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('TRX 420 TM','2017', '450', '1', '4 tiempos', 'Cuadraciclo', 'img/models/trx-fourtrax-sm.jpg' , 5500000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('TRX 420 TJ','2017', '450', '1', '4 tiempos', 'Cuadraciclo', 'img/models/trx-fourtrax-sm.jpg' , 5600000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('TRX 420 HE','2017', '450', '1', '4 tiempos', 'Cuadraciclo', 'img/models/trx-fourtrax-sm.jpg' , 6100000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('TRX 420 LUX','2017', '450', '1', '4 tiempos', 'Cuadraciclo', 'img/models/trx-fourtrax-sm.jpg' , 7000000);
go
DROP PROCEDURE [Cons_Moto_Tipo]; 
go
create  procedure [Cons_Moto_Tipo](
@tipo  varchar(20))
as
select   modelo, annoModelo,motorSize,cylinders,motorType, tipo,imgUrl,price
from  Tbl_Motos c
where tipo =@tipo
order  by  modelo 
go
exec [Cons_Moto_Tipo] Pandillera
go

create  procedure [Sp_Ver_MotoPorId](
@id varchar(30))
as
select annoModelo,motorSize,cylinders,motorType, tipo,imgUrl,price
from Tbl_Motos
where modelo = @id
go
exec [Sp_Ver_MotoPorId] 'CB 190R'
go

create  procedure [Sp_Pagar_Factura](
@subTotal double
@total double,
@banco varchar(50),
@numeroCheque varchar(50),
)
as
select annoModelo,motorSize,cylinders,motorType, tipo,imgUrl,price
from Tbl_Motos
where modelo = @id
go
exec [Sp_Ver_MotoPorId] 'CB 190R'
go