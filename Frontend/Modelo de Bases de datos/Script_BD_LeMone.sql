DROP DATABASE IF EXISTS LeMone;
CREATE DATABASE LeMone CHARACTER SET utf8mb4;
USE LeMone;

CREATE TABLE product (
    id integer not null,
    name text NOT NULL,
	price decimal(14, 2) NOT NULL,
	amount integer NOT NULL,
	sell integer NOT NULL,
    estado text not null,
    idusuario int not null,
    PRIMARY KEY(id)
);

CREATE TABLE usuario (
	id integer NOT NULL AUTO_INCREMENT,
    usuario nvarchar(50) not null,
    clave text not null,
    estado text not null,
    PRIMARY KEY(id)
);

ALTER TABLE product ADD FOREIGN KEY(idusuario) REFERENCES usuario(id);