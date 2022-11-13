DROP DATABASE IF EXISTS LeMone;
CREATE DATABASE LeMone CHARACTER SET utf8mb4;
USE LeMone;

CREATE TABLE Categorias (
    Id INT auto_increment not null,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(150) NOT NULL,
    Estado char(1) NOT NULL default 'A',
	FechaAlta datetime NOT NULL,
    IdUsuarioAlta INT NOT NULL,
    FechaModificacion datetime NULL,
	IdUsuarioModificacion INT NULL,
	FechaBaja datetime NULL,
    IdUsuarioDeBaja INT NULL,
    PRIMARY KEY(Id)
);

CREATE TABLE Productos (
    Id INT auto_increment not null,
    Codigo nvarchar(20) not null,
    Nombre nvarchar(50) not null,
    Descripcion nvarchar(250) not null,
    InventarioMinimo INT,
    PrecioDeCosto decimal(17, 2),
    PrecioDeVenta decimal(17, 2),
    IdCategoria INT,
    ActivoActualmente bit,
    Estado char(1) NOT NULL default 'A',
	FechaAlta datetime NOT NULL,
    IdUsuarioDeAlta INT NOT NULL,
	FechaModificacion datetime NULL,
	IdUsuarioModificacion INT NULL,
	FechaBaja datetime NULL,
    IdUsuarioDeBaja INT NULL,
    PRIMARY KEY(Id)
);

CREATE TABLE TiposDePersonas (
    Id INT not null,
    Nombre nvarchar(50) not null,
    PRIMARY KEY(Id)
);

CREATE TABLE Personas (
    Id INT auto_increment not null,
    Apellido nvarchar(50) not null,
    Nombre nvarchar(50) not null,
    Telefono numeric null,
    Email nvarchar(50) null,
    IdTipoDePersona Int,
    ActivoActualmente bit not null default 1,
    Estado char(1) NOT NULL default 'A',
	FechaAlta datetime NOT NULL,
    IdUsuarioDeAlta INT NOT NULL,
	FechaModificacion datetime NULL,
	IdUsuarioModificacion INT NULL,
    PRIMARY KEY(Id)
);

CREATE TABLE TiposDeOperacion (
    Id INT not null,
    Nombre nvarchar(50) not null,
    PRIMARY KEY(Id)
);

CREATE TABLE Operaciones (
    Id INT auto_increment not null,
    IdPersona int,
    IdTipoDeOperacion int,
    IdProducto int,
	Cantidad decimal(17, 2),    
    Estado char(1) NOT NULL default 'A',
	FechaAlta datetime NOT NULL,
    IdUsuarioDeAlta INT NOT NULL,
	FechaBaja datetime NULL,
    IdUsuarioDeBaja INT NULL,
    PRIMARY KEY(Id)
);

CREATE TABLE TiposDeUsuarios (
    Id INT not null,
    Nombre nvarchar(50) not null,
    PRIMARY KEY(Id)
);

CREATE TABLE Usuarios (
    Id INT auto_increment not null,
    Nombre nvarchar(50) not null,
    Apellido nvarchar(50) not null,
    NombreDeUsuario nvarchar(50) not null,
    Password nvarchar(50) not null,
    ActivoActualmente bit not null default 1,
    IdTipoDeUsuario int not null,
    Estado char(1) NOT NULL default 'A',
	FechaAlta datetime NOT NULL,
    IdUsuarioDeAlta INT NULL,
	FechaModificacion datetime NULL,
	IdUsuarioModificacion INT NULL,
    PRIMARY KEY(Id)
);

ALTER TABLE Usuarios ADD FOREIGN KEY(IdTipoDeUsuario) REFERENCES TiposDeUsuarios(Id);
ALTER TABLE Usuarios ADD FOREIGN KEY(IdUsuarioDeAlta) REFERENCES Usuarios(Id);
ALTER TABLE Operaciones ADD FOREIGN KEY(IdProducto) REFERENCES Productos(Id);
ALTER TABLE Operaciones ADD FOREIGN KEY(IdTipoDeOperacion) REFERENCES TiposDeOperacion(Id);
ALTER TABLE Operaciones ADD FOREIGN KEY(IdPersona) REFERENCES Personas(Id);
ALTER TABLE Operaciones ADD FOREIGN KEY(IdUsuarioDeAlta) REFERENCES Usuarios(Id);
ALTER TABLE Productos ADD FOREIGN KEY(IdCategoria) REFERENCES Categorias(Id);
ALTER TABLE Productos ADD FOREIGN KEY(IdUsuarioDeAlta) REFERENCES Usuarios(Id);
ALTER TABLE Personas ADD FOREIGN KEY(IdTipoDePersona) REFERENCES TiposDePersonas(Id);
ALTER TABLE Personas ADD FOREIGN KEY(IdUsuarioDeAlta) REFERENCES Usuarios(Id);

