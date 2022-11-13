USE LeMone;
/*INSERT DE TABLA USUARIO*/

insert into TiposDeOperacion(Id, Nombre)  values (1, "Entrada");
insert into TiposDeOperacion(Id, Nombre)  values (2, "Salida");

insert into TiposDePersonas(Id, Nombre)  values (1, "Cliente");
insert into TiposDePersonas(Id, Nombre)  values (2, "Proveedor");

insert into TiposDeUsuarios(Id, Nombre)  values (1, "Administrador");
insert into TiposDeUsuarios(Id, Nombre)  values (2, "Usuario");
    
insert into Usuarios(Nombre, Apellido, NombreDeUsuario, Password, ActivoActualmente, IdTipoDeUsuario, Estado, FechaAlta, IdUsuarioDeAlta) values ("Melisa", "Apaz", "mapaz", "123456", 1, 1, "A", NOW(), NULL);
insert into Usuarios(Nombre, Apellido, NombreDeUsuario, Password, ActivoActualmente, IdTipoDeUsuario, Estado, FechaAlta, IdUsuarioDeAlta) values ("Marcelo", "Apaz", "marceloapaz", "123456", 1, 2, "A", NOW(), 1);
insert into Usuarios(Nombre, Apellido, NombreDeUsuario, Password, ActivoActualmente, IdTipoDeUsuario, Estado, FechaAlta, IdUsuarioDeAlta) values ("Fabiola", "Benitez", "fbenitez", "123456", 1,  2, "A", NOW(), 1);
insert into Usuarios(Nombre, Apellido, NombreDeUsuario, Password, ActivoActualmente, IdTipoDeUsuario, Estado, FechaAlta, IdUsuarioDeAlta) values ("Eugenia", "Abregu", "eugeniaabregu", "123456", 1, 2, "A", NOW(), 1);

/*USUARIOS:*/
select * from Usuarios;

insert into Categorias(Nombre, Descripcion, Estado, IdUsuarioAlta, FechaAlta)  values ("Categoria A", "Descripcion de categoría A", "A", 1, NOW());
insert into Categorias(Nombre, Descripcion, Estado, IdUsuarioAlta, FechaAlta)  values ("Categoria B", "Descripcion de categoría B", "A", 1, NOW());
insert into Categorias(Nombre, Descripcion, Estado, IdUsuarioAlta, FechaAlta)  values ("Categoria C", "Descripcion de categoría C", "A", 1, NOW());
insert into Categorias(Nombre, Descripcion, Estado, IdUsuarioAlta, FechaAlta)  values ("Categoria D", "Descripcion de categoría D", "A", 1, NOW());

/*CATEGORÍAS:*/
select * from Categorias;
    
/*INSERT DE TABLA PRODUCT*/
insert into Productos(Codigo, Nombre, Descripcion, InventarioMinimo, PrecioDeCosto, PrecioDeVenta, IdCategoria, ActivoActualmente, Estado, FechaAlta, IdUsuarioDeAlta) values ("123X", "Flor de Caña", "Centenario 25 años 750ml", 10, 150, 250, 1, 1, "A", NOW(), 2);
insert into Productos(Codigo, Nombre, Descripcion, InventarioMinimo, PrecioDeCosto, PrecioDeVenta, IdCategoria, ActivoActualmente, Estado, FechaAlta, IdUsuarioDeAlta) values ("48874475", "Malbec", "Angélica Zapata Alta Malbec 750 ml", 10, 170, 350, 1, 1, "A", NOW(), 2);
insert into Productos(Codigo, Nombre, Descripcion, InventarioMinimo, PrecioDeCosto, PrecioDeVenta, IdCategoria, ActivoActualmente, Estado, FechaAlta, IdUsuarioDeAlta) values ("53239732", "Champenoise", "Caja x 6 - El Esteco Champenoise", 10, 150, 250, 2, 1, "A", NOW(), 2);
insert into Productos(Codigo, Nombre, Descripcion, InventarioMinimo, PrecioDeCosto, PrecioDeVenta, IdCategoria, ActivoActualmente, Estado, FechaAlta, IdUsuarioDeAlta) values ("54469453", "Cruzat Cuvee ", "Cruzat Cuvee Extra Brunt Rose 750ml", 10, 189, 562, 3, 1, "A", NOW(), 2);
insert into Productos(Codigo, Nombre, Descripcion, InventarioMinimo, PrecioDeCosto, PrecioDeVenta, IdCategoria, ActivoActualmente, Estado, FechaAlta, IdUsuarioDeAlta) values ("69338222", "Champenoise Plus", "Escorihuela Gascon Extra Brunt Champenoise 750 ml", 10, 1150, 2250, 4, 1, "A", NOW(), 2);
insert into Productos(Codigo, Nombre, Descripcion, InventarioMinimo, PrecioDeCosto, PrecioDeVenta, IdCategoria, ActivoActualmente, Estado, FechaAlta, IdUsuarioDeAlta) values ("86262287", "Escorihuela Gascon Extra Brunt Champenoise 750 ml", "Centenario 25 años 750ml", 10, 150, 250, 4, 1, "A", NOW(), 2);
insert into Productos(Codigo, Nombre, Descripcion, InventarioMinimo, PrecioDeCosto, PrecioDeVenta, IdCategoria, ActivoActualmente, Estado, FechaAlta, IdUsuarioDeAlta) values ("37342245", "Gin", "Gin Brockmans 700 ml", 10, 150, 250, 1, 1, "A", NOW(), 3);
insert into Productos(Codigo, Nombre, Descripcion, InventarioMinimo, PrecioDeCosto, PrecioDeVenta, IdCategoria, ActivoActualmente, Estado, FechaAlta, IdUsuarioDeAlta) values ("98443339", "Licor", "Licor de Whisky Drambuie 750 ml", 10, 1680, 2950, 2, 1, "A", NOW(), 3);
insert into Productos(Codigo, Nombre, Descripcion, InventarioMinimo, PrecioDeCosto, PrecioDeVenta, IdCategoria, ActivoActualmente, Estado, FechaAlta, IdUsuarioDeAlta) values ("34327954", "Singleton", "ingleton 12 años 700 ml", 10, 1895, 5525, 1, 1, "A", NOW(), 3);

/*PRODUCTOS:*/
select * from Productos;

insert into Personas(Apellido, Nombre, Telefono, Email, IdTipoDePersona, ActivoActualmente, Estado, FechaAlta, IdUsuarioDeAlta) values ("Perez", "Juan", 3512553895, "juanperez@gmail.com", 2, 1, "A", NOW(), 2);
insert into Personas(Apellido, Nombre, Telefono, Email, IdTipoDePersona, ActivoActualmente, Estado, FechaAlta, IdUsuarioDeAlta) values ("García", "Ramón", 3512583895, "ramongarcia@gmail.com", 2, 1, "A", NOW(), 2);
insert into Personas(Apellido, Nombre, Telefono, Email, IdTipoDePersona, ActivoActualmente, Estado, FechaAlta, IdUsuarioDeAlta) values ("Alfonzo", "Pedro", 3512553895, "pedroalfornzo@gmail.com", 1, 1, "A", NOW(), 2);
insert into Personas(Apellido, Nombre, Telefono, Email, IdTipoDePersona, ActivoActualmente, Estado, FechaAlta, IdUsuarioDeAlta) values ("Sanchez", "Camila", 3512553885, "camilasanchez@gmail.com", 1, 1, "A", NOW(), 2);

/*PERSONAS:*/
select * from Personas;

/*INSERT DE TABLA MOVIMIENTOS DE STOCK*/
insert into Operaciones(IdPersona, IdTipoDeOperacion, IdProducto, Cantidad, estado, FechaAlta, IdUsuarioDeAlta) values (1, 1, 1, 10, "A", NOW(), 2);
insert into Operaciones(IdPersona, IdTipoDeOperacion, IdProducto, Cantidad, estado, FechaAlta, IdUsuarioDeAlta) values (1, 1, 2, 10, "A", NOW(), 2);
insert into Operaciones(IdPersona, IdTipoDeOperacion, IdProducto, Cantidad, estado, FechaAlta, IdUsuarioDeAlta) values (1, 1, 3, 10, "A", NOW(), 2);
insert into Operaciones(IdPersona, IdTipoDeOperacion, IdProducto, Cantidad, estado, FechaAlta, IdUsuarioDeAlta) values (1, 1, 4, 10, "A", NOW(), 2);
insert into Operaciones(IdPersona, IdTipoDeOperacion, IdProducto, Cantidad, estado, FechaAlta, IdUsuarioDeAlta) values (1, 1, 5, 10, "A", NOW(), 2);
insert into Operaciones(IdPersona, IdTipoDeOperacion, IdProducto, Cantidad, estado, FechaAlta, IdUsuarioDeAlta) values (1, 1, 6, 10, "A", NOW(), 3);
insert into Operaciones(IdPersona, IdTipoDeOperacion, IdProducto, Cantidad, estado, FechaAlta, IdUsuarioDeAlta) values (1, 1, 7, 10, "A", NOW(), 3);
insert into Operaciones(IdPersona, IdTipoDeOperacion, IdProducto, Cantidad, estado, FechaAlta, IdUsuarioDeAlta) values (3, 2, 1, 3, "A", NOW(), 3);
insert into Operaciones(IdPersona, IdTipoDeOperacion, IdProducto, Cantidad, estado, FechaAlta, IdUsuarioDeAlta) values (3, 2, 2, 2, "A", NOW(), 4);
insert into Operaciones(IdPersona, IdTipoDeOperacion, IdProducto, Cantidad, estado, FechaAlta, IdUsuarioDeAlta) values (4, 2, 5, 1, "A", NOW(), 2);
insert into Operaciones(IdPersona, IdTipoDeOperacion, IdProducto, Cantidad, estado, FechaAlta, IdUsuarioDeAlta) values (4, 2, 6, 4, "A", NOW(), 4);

/*OPERACIONES:*/
select * from Operaciones;

/************CONSULTAS************************/

/*CONSULTA DE PRODUCTOS*/
select p.Codigo, p.Nombre, p.Descripcion, p.InventarioMinimo, p.PrecioDeCosto, p.PrecioDeVenta, c.Nombre as Categoria
from Productos p
inner join categorias c on c.Id = p.IdCategoria
where p.estado = "A"
AND p.ActivoActualmente = 1; /*Sólo productos activos*/

/*VENTAS/SALIDAS POR AÑO Y MES Y VENDEDOR*/
SET lc_time_names = 'es_ES';
SELECT year(o.FechaAlta) as Ano, 
MONTHNAME(o.FechaAlta) Mes, 
u.NombreDeUsuario as Vendedor,
SUM(p.PrecioDeVenta * IFNULL(o.cantidad, 0)) Total
FROM Operaciones o
inner join Productos p on p.id = o.IdProducto
inner join tiposdeoperacion ot on ot.Id = o.idtipodeoperacion
inner join usuarios u on o.IdUsuarioDeAlta = u.Id
where o.Estado = "A"
and o.IdTipoDeOperacion = 2 /*Salida*/
GROUP BY year(o.FechaAlta), MONTHNAME(o.FechaAlta), u.NombreDeUsuario
ORDER BY year(o.FechaAlta) asc, month(o.FechaAlta) asc, u.NombreDeUsuario;

/*INGRESOS POR Y FECHA*/
SET lc_time_names = 'es_ES';
SELECT MONTHNAME(o.FechaAlta) Mes, 
CONCAT(per.Apellido, ", ", per.Nombre) as Proveedor,
p.Nombre as Producto,
SUM(o.Cantidad) as Cantidad
FROM Operaciones o
inner join Productos p on p.id = o.IdProducto
inner join tiposdeoperacion ot on ot.Id = o.idtipodeoperacion
inner join personas per on per.Id = o.IdPersona
where o.Estado = "A"
and o.IdTipoDeOperacion = 1 /*Entrada*/
and per.IdTipoDePersona = 2 /*Proveedor*/
and o.fechaalta between "20221101" and "20221130"
GROUP BY MONTHNAME(o.FechaAlta), per.Apellido, per.Nombre, p.Nombre
ORDER BY month(o.FechaAlta) asc, p.nombre;

/*UPDATE PRODUCTOS*/
update Productos set PrecioDeVenta = 8965.50 where id = 8;
update Productos set estado = "B", FechaBaja = now(), IdUsuarioDeBaja = 1 where id = 9; /*Baja lógica de un producto*/

update Usuarios set password = "jones123", FechaModificacion = NOW(), IdUsuarioModificacion = 2 where id = 2; /*Modificación de un usuario*/
update Usuarios set password = "joselyn87" where id = 3;
