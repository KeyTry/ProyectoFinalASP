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
email varchar(100) not null,
nombre varchar(100) not null,
telefono varchar(15),
password varchar(max)not null,
direccion varchar(max)not null,
ubicacion varchar(100))
go
create procedure [Sp_Ins_Clientes](
@idCliente varchar(100),
@email varchar(100),
@nombre varchar(100),
@telefono varchar(15),
@password varchar(max),
@direccion varchar(max),
@ubicacion varchar(100))
as
insert into Tbl_Clientes(idCliente,email,nombre,telefono,
password,direccion,ubicacion )
values(@idCliente,@email,@nombre,@telefono,@password,@direccion,@ubicacion)
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
annoModelo=a�o del modelo
motorSize= tama�o del motor en cc(Cm cbicos) tip�camente:
125-250-420-700
cylinders: cant de cilindros, tip�camente: 1-2-4
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
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('TRX 420 FB','2017', '450', '1', '4 tiempos', 'Cuadraciclo', 'img/models/trx-fourtrax-sm.jpeg' , 5100000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('TRX 420 FA','2017', '450', '1', '4 tiempos', 'Cuadraciclo', 'img/models/trx-fourtrax-sm.jpeg' , 5550000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('TRX 420 FA2','2017', '450', '1', '4 tiempos', 'Cuadraciclo', 'img/models/trx-fourtrax-sm.jpeg' , 6100000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('TRX 420 FA3','2017', '450', '1', '4 tiempos','Cuadraciclo', 'img/models/trx-fourtrax-sm.jpeg' , 6150000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('TRX 420 FE','2017', '450', '1','4 tiempos','Cuadraciclo','img/models/trx-fourtrax-sm.jpeg' , 400000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('TRX 420 TE','2017', '450', '1', '4 tiempos', 'Cuadraciclo', 'img/models/trx-fourtrax-sm.jpeg' , 5100000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('TRX 420 TM','2017', '450', '1', '4 tiempos', 'Cuadraciclo', 'img/models/trx-fourtrax-sm.jpeg' , 5500000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('TRX 420 TJ','2017', '450', '1', '4 tiempos', 'Cuadraciclo', 'img/models/trx-fourtrax-sm.jpeg' , 5600000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('TRX 420 HE','2017', '450', '1', '4 tiempos', 'Cuadraciclo', 'img/models/trx-fourtrax-sm.jpeg' , 6100000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('TRX 420 LUX','2017', '450', '1', '4 tiempos', 'Cuadraciclo', 'img/models/trx-fourtrax-sm.jpeg' , 7000000);
go
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('Magic150','2017', '150', '1', '4 tiempos', 'Scooter', 'img/models/magic150.jpg' , 650000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('MagicMike','2017', '150', '1', '4 tiempos', 'Scooter', 'img/models/waveS.jpg' , 750000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('FIREHAWK 150','2017', '150', '1', '4 tiempos', 'Scooter', 'img/models/FIREHAWK 150.jpg' , 850000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('R8','2017', '150', '1', '4 tiempos', 'Scooter', 'img/models/R8.jpg' , 550000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('Diva 150','2017', '150', '1', '4 tiempos', 'Scooter', 'img/models/Diva 150.png' , 850000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('fascino-std','2017', '150', '1', '4 tiempos', 'Scooter', 'img/models/fascino-std.png' , 850000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('X-MAX','2017', '150', '1', '4 tiempos', 'Scooter', 'img/models/X-MAX.png' , 1050000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('X-MAX PRO','2017', '150', '1', '4 tiempos', 'Scooter', 'img/models/X-MAX PRO.png' , 1300000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('Aprilia','2017', '150', '1', '4 tiempos', 'Scooter', 'img/models/Aprilia.png' , 730000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('Urban','2017', '150', '1', '4 tiempos', 'Scooter', 'img/models/Urban.png' , 675000);
go
/*
Montannera
*/
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('XR 250 R','2017', '250', '1', '4 tiempos', 'Montannera', 'img/models/XR 250 R.png' , 2750000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('XY200','2017', '200', '1', '4 tiempos', 'Montannera', 'img/models/XY200.png' , 2950000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('XRF','2017', '200', '1', '4 tiempos', 'Montannera', 'img/models/XRF.png' , 1350000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('XTZ','2017', '250', '1', '4 tiempos', 'Montannera', 'img/models/XTZ.png' , 1750000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('Super','2017', '250', '1', '4 tiempos', 'Montannera', 'img/models/Super.png' , 1430000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('KW','2017', '250', '1', '4 tiempos', 'Montannera', 'img/models/KW.png' , 1430000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('KKW','2017', '450', '1', '4 tiempos', 'Montannera', 'img/models/KW.png' , 2550000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('YZ','2017', '450', '1', '4 tiempos', 'Montannera', 'img/models/YZ.png' , 3500000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('CRF','2017', '450', '1', '4 tiempos', 'Montannera', 'img/models/CRF.png' , 3100000);
insert into Tbl_Motos(modelo,annoModelo,motorSize,cylinders,motorType,tipo,imgUrl,price)values('XT 125','2017', '125', '1', '4 tiempos', 'Montannera', 'img/models/XT 125.png' , 1100000);
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
exec [Cons_Moto_Tipo] Cuadraciclo
go
SELECT * FROM Tbl_Clientes;
go
EXEC Sp_Ins_Clientes '324','toor@gmail.com','Toor','43787578','root','Heredia','lolidk'
go
CREATE PROCEDURE [Sp_Cns_Cliente](@email varchar(100))
as
SELECT idCliente,email,nombre,telefono,password,direccion,ubicacion FROM Tbl_Clientes
WHERE email = @email
go
EXEC Sp_Cns_Cliente 'toor@gmail.com'


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