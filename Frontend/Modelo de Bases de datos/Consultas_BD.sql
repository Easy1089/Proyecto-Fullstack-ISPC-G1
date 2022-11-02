USE LeMone;
/*INSERT DE TABLA USUARIO*/
insert into usuario(usuario, clave, estado) values ("thais", "thais", "A");
insert into usuario(usuario, clave, estado) values ("joselyn", "joselyn", "A");
insert into usuario(usuario, clave, estado) values ("jones", "jones", "A");
insert into usuario(usuario, clave, estado) values ("patrol", "patrol", "A");

/*INSERT DE TABLA PRODUCT*/
insert into product(id, name, price, amount, sell, estado, idusuario) values (37342245, "Gin Brockmans 700 ml", 13500.0, 45, 0, "A", 1);
insert into product(id, name, price, amount, sell, estado, idusuario) values (37342673, "Flor de Caña Centenario 25 años 750ml", 98500.0, 23, 0, "A", 1);
insert into product(id, name, price, amount, sell, estado, idusuario) values (45353987, "Flor de Cardon Malbec 750 ml", 1595.0, 19, 0, "A",1);
insert into product(id, name, price, amount, sell, estado, idusuario) values (48874475, "Angélica Zapata Alta Malbec 750 ml", 62100.0, 6, 0, "A", 1);
insert into product(id, name, price, amount, sell, estado, idusuario) values (53239732, "Caja x 6 - El Esteco Champenoise", 10080.0, 2, 7, "A", 1);
insert into product(id, name, price, amount, sell, estado, idusuario) values (54469453, "Cruzat Cuvee Extra Brunt Rose", 1500.0, 4, 1, "A", 2);
insert into product(id, name, price, amount, sell, estado, idusuario) values (69338222, "Escorihuela Gascon Extra Brunt Champenoise 750 ml", 2100.0, 83, 1, "A", 2);
insert into product(id, name, price, amount, sell, estado, idusuario) values (86262287, "Pommery Grand Cru Royal", 32698.0, 8, 0, "A", 3);
insert into product(id, name, price, amount, sell, estado, idusuario) values (97589332, "Alamos Brunt Rose", 1800.0, 90, 110, "A", 3);
insert into product(id, name, price, amount, sell, estado, idusuario) values (98443339, "Licor de Whisky Drambuie 750 ml", 9495.0, 14, 0, "A", 3);
insert into product(id, name, price, amount, sell, estado, idusuario) values (98443340, "Cordero con Piel de Lobo Cabermet Sauvignon", 895.0, 20, 0, "A", 3);
insert into product(id, name, price, amount, sell, estado, idusuario) values (98443341, "Scotch Only Trolley - Bar Edition", 63900.0, 2, 0, "A", 4);
insert into product(id, name, price, amount, sell, estado, idusuario) values (98443342, "Costa y Pampa (Mochila)", 43400.0, 3, 2, "A", 4);
insert into product(id, name, price, amount, sell, estado, idusuario) values (34327954, "Singleton 12 años 700 ml", 7195.0, 56, 0, "A", 4);

/*CONSULTA SELECT*/
select id AS Codigo, name as Nombre, price as Importe, amount as CantidadActual, sell as CantidadVendida
from product p
where p.estado = "A"; /*Sólo productos activos*/

select id as Id, usuario as NombreDeUsuario, clave as Password from usuario where estado = "A"; /*Sólo usuarios activos*/

/*CONSULTA USANDO JOIN*/
select p.id AS Codigo, p.name as Nombre, p.price as Importe, p.amount as CantidadActual, p.sell as CantidadVendida, u.usuario as UsuarioAltaDelProducto
from product p
inner join usuario u on u.id = p.idusuario
where p.estado = "A"; /*Sólo productos activos*/

/*UPDATE PRODUCT*/
update product set price = 62100.50 where id = 48874475;
update product set amount = 9 where id = 86262287;
update product set estado = "B" where id = 45353987; /*Baja lógica de un producto*/
update product set estado = "B" where id = 48874475; /*Baja lógica de un producto*/

update usuario set clave = "jones123" where id = 1;
update usuario set clave = "joselyn87" where id = 2;

/*DELETE PRODUCT*/
DELETE FROM product where id = 98443342