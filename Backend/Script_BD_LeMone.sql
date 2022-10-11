DROP DATABASE IF EXISTS LeMone;
CREATE DATABASE LeMone CHARACTER SET utf8mb4;
USE LeMone;

CREATE TABLE TiposDeUsuarios (
    Id INT not null,
    Nombre VARCHAR(25) NOT NULL,
    Estado char(1) NOT NULL default 'A',
	FechaAlta datetime NOT NULL,
    IdUsuarioDeAlta INT NOT NULL,
    PRIMARY KEY(Id)
);

CREATE TABLE Usuarios (
    Id INT not null,
    NombreInicioSecion nvarchar(50) not null,
    Password nvarchar(50) not null,
    ActivoActualmente bit not null default 1,
    Bloqueado bit not null default 0,
    BlanquearContraseña bit not null default 0,
    IdTipoDeUsuario int not null,
    Estado char(1) NOT NULL default 'A',
	FechaAlta datetime NOT NULL,
    IdUsuarioDeAlta INT NOT NULL,
    PRIMARY KEY(Id)
);

ALTER TABLE Usuarios ADD FOREIGN KEY(IdTipoDeUsuario) REFERENCES TiposDeUsuarios(Id);
ALTER TABLE Usuarios ADD FOREIGN KEY(IdUsuarioDeAlta) REFERENCES Usuarios(Id);
ALTER TABLE TiposDeUsuarios ADD FOREIGN KEY(IdUsuarioDeAlta) REFERENCES Usuarios(Id);

CREATE TABLE Categorias (
    Id INT not null,
    Nombre VARCHAR(25) NOT NULL,
    Estado char(1) NOT NULL default 'A',
	FechaAlta datetime NOT NULL,
    IdUsuarioDeAlta INT NOT NULL,
    PRIMARY KEY(Id)
);
ALTER TABLE Categorias ADD FOREIGN KEY(IdUsuarioDeAlta) REFERENCES Usuarios(Id);

CREATE TABLE TiposDeDocumento (
    Id INT not null,
    Nombre VARCHAR(25) NOT NULL,
    Estado char(1) NOT NULL default 'A',
	FechaAlta datetime NOT NULL,
    IdUsuarioDeAlta INT NOT NULL,
    PRIMARY KEY(Id)
);
ALTER TABLE TiposDeDocumento ADD FOREIGN KEY(IdUsuarioDeAlta) REFERENCES Usuarios(Id);

CREATE TABLE TiposDeProductos (
    Id INT not null,
    Nombre VARCHAR(25) NOT NULL,
    Estado char(1) NOT NULL default 'A',
	FechaAlta datetime NOT NULL,
    IdUsuarioDeAlta INT NOT NULL,
    PRIMARY KEY(Id)
);

ALTER TABLE TiposDeProductos ADD FOREIGN KEY(IdUsuarioDeAlta) REFERENCES Usuarios(Id);

CREATE TABLE Proveedores (
    Id INT not null,
    Nombre VARCHAR(50) NOT NULL,
	RazonSocial VARCHAR(100) NOT NULL,
    Telefono numeric not null,
    Email nvarchar(50) null,
	ActivoActualmente bit not null default 1,
    Estado char(1) NOT NULL default 'A',
	FechaAlta datetime NOT NULL,
    IdUsuarioDeAlta INT NOT NULL,
    PRIMARY KEY(Id)
);
ALTER TABLE Proveedores ADD FOREIGN KEY(IdUsuarioDeAlta) REFERENCES Usuarios(Id);

CREATE TABLE Productos (
    Id INT not null,
    Codigo nvarchar(20) not null,
    IdProveedor int not null,
    Nombre nvarchar(50) not null,
    IdCategoria int not null,
    CantidadEnStock int not null,
    PrecioUnitario decimal(17,2) not null,
    Bodega nvarchar(50) null,
    Cosecha int null,
    IdTipoDeProducto int not null,
    ActivoActualmente bit not null default 1,
    Estado char(1) NOT NULL default 'A',
	FechaAlta datetime NOT NULL,
    IdUsuarioDeAlta INT NOT NULL,
    PRIMARY KEY(Id)
);

ALTER TABLE Productos ADD FOREIGN KEY(IdCategoria)  REFERENCES Categorias(Id);
ALTER TABLE Productos ADD FOREIGN KEY(IdProveedor)  REFERENCES Proveedores(Id);
ALTER TABLE Productos ADD FOREIGN KEY(IdTipoDeProducto)  REFERENCES TiposDeProductos(Id);
ALTER TABLE Productos ADD FOREIGN KEY(IdUsuarioDeAlta) REFERENCES Usuarios(Id);

CREATE TABLE MovimientosDeStock (
    Id INT not null,
    IdProducto INT NOT NULL,
    Cantidad INT NOT NULL,
    Observaciones nvarchar(200) NULL,
    Estado char(1) NOT NULL default 'A',
	FechaAlta datetime NOT NULL,
    IdUsuarioDeAlta INT NOT NULL,
    PRIMARY KEY(Id)
);

ALTER TABLE MovimientosDeStock ADD FOREIGN KEY(IdProducto) REFERENCES Productos(Id);
ALTER TABLE MovimientosDeStock ADD FOREIGN KEY(IdUsuarioDeAlta) REFERENCES Usuarios(Id);


CREATE TABLE Personas (
    Id INT not null,
	IdUsuario int not null,
    IdTipoDeDocumento int not null,
    NumeroDeDocumento nvarchar(20) not null,
    Apellido nvarchar(50) not null,
    Nombre nvarchar(50) not null,
    Telefono numeric null,
    Email nvarchar(50) null,
    ActivoActualmente bit not null default 1,
    Estado char(1) NOT NULL default 'A',
	FechaAlta datetime NOT NULL,
    IdUsuarioDeAlta INT NOT NULL,
    PRIMARY KEY(Id)
);

ALTER TABLE Personas ADD FOREIGN KEY(IdUsuario) REFERENCES Usuarios(Id);
ALTER TABLE Personas ADD FOREIGN KEY(IdTipoDeDocumento) REFERENCES TiposDeDocumento(Id);
ALTER TABLE Personas ADD FOREIGN KEY(IdUsuarioDeAlta) REFERENCES Usuarios(Id);

CREATE TABLE Ordenes_Estados (
    Id INT not null,
    Nombre VARCHAR(25) NOT NULL,
    Estado char(1) NOT NULL default 'A',
	FechaAlta datetime NOT NULL,
    IdUsuarioDeAlta INT NOT NULL,
    PRIMARY KEY(Id)
);
ALTER TABLE Ordenes_Estados ADD FOREIGN KEY(IdUsuarioDeAlta) REFERENCES Usuarios(Id);

CREATE TABLE Ordenes (
    Id INT not null,
	IdEstado_Orden int not null,
    NumeroDeTransaccion numeric not null,
    FechaDeTransaccion datetime not null,
    Cliente_RazonSocial nvarchar(50) not null,
    Cliente_CUIT nvarchar(50) not null,
	Cliente_Domicilio nvarchar(100) null,
	Cliente_Telefono numeric null,
    Estado char(1) NOT NULL default 'A',
	FechaAlta datetime NOT NULL,
    IdUsuarioDeAlta INT NOT NULL,
    PRIMARY KEY(Id)
);

ALTER TABLE Ordenes ADD FOREIGN KEY(IdEstado_Orden) REFERENCES Ordenes_Estados(Id);
ALTER TABLE Ordenes ADD FOREIGN KEY(IdUsuarioDeAlta) REFERENCES Usuarios(Id);

CREATE TABLE Ordenes_Detalle (
    Id INT not null,
	IdOrden int not null,
    IdProducto int not null,
    Cantidad int not null,
    Estado char(1) NOT NULL default 'A',
	FechaAlta datetime NOT NULL,
    IdUsuarioDeAlta INT NOT NULL,
    PRIMARY KEY(Id)
);

ALTER TABLE Ordenes_Detalle ADD FOREIGN KEY(IdOrden) REFERENCES Ordenes(Id);
ALTER TABLE Ordenes_Detalle ADD FOREIGN KEY(IdProducto) REFERENCES Productos(Id);
ALTER TABLE Ordenes_Detalle ADD FOREIGN KEY(IdUsuarioDeAlta) REFERENCES Usuarios(Id);
