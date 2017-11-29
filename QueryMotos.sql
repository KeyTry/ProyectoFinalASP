use [master]
go
if exists(select name from dbo.sysdatabases where name = 'Db_Motos')
drop database [Db_Motos]
go
create database [Db_Motos]
go
use [Db_Motos]
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
