Trabajo relacionado con #TK10 Modelado de DB. DER. Modelo Relacional:

La base de datos del sistema LeMone está conformada por 8 tablas las cuales son:

•	Categorias
•	Productos
•	TiposDePersonas
•	Personas
•	TiposDeOperacion
•	Operaciones
•	TiposDeUsuarios
•	Usuarios

Detalle de cada tabla:

# Categorias:

    La tabla Categorias sirve para las categorías de los productos del sistema y cuenta con los siguientes campos:

	Id: Id auto incremental (llave primaria)
	Nombre: Nombre de la categoría, el que se muestra en el sistema
	Descripcion: Descripción de la categoría
	Estado: Estado del registro: "A" activo, "B" eliminado (no se consultarán categorías en B)
	FechaDeAlta: Fecha de creación
    IdUsuarioAlta: almacena el id del usuario que da de alta la categoría
    FechaModificacion: Fecha de modificación de la categoría
    IdUsuarioModificacion: almacena el id del usuario que modifica la categoría
    FechaBaja: Fecha de baja lógica (el registro pasa a estado "B")
    IdUsuarioBaja: almacena el id del usuario que elimina la categoría (el registro pasa a estado "B")

    En la tabla Productos existe un campo llamado IdCategoria que se relaciona con el Id de una categoría.

# Productos:

    La tabla Productos es la tabla principal de la base de datos, la tabla Productos simboliza los productos y cuenta con los siguientes campos:

	Id: Id auto incremental (llave primaria)
	Codigo: código del producto
	Nombre: el nombre del producto
	Descripcion: una breve descripción del producto
	InventarioMinimo: almacena el valor de cantidad mínima en inventario
	PrecioDeCosto: el precio de entrada o precio de compra 
	PrecioDeVenta: precio de salida o precio de venta
	IdCategoria: id de la categoría a la cual pertenece el producto
	ActivoActualmente: indica si el producto está activo o inactivo
	Estado: Estado del registro: "A" activo, "B" eliminado (no se consultarán productos en B)
	FechaDeAlta: Fecha de creación
    IdUsuarioAlta: almacena el id del usuario que da de alta el producto
    FechaModificacion: Fecha de modificación el producto
    IdUsuarioModificacion: almacena el id del usuario que modifica el producto
    FechaBaja: Fecha de eliminación de un producto (Baja lógica: el registro pasa a estado "B")
    IdUsuarioBaja: almacena el id del usuario que elimina el producto (Baja lógica: el registro pasa a estado "B")

    En la tabla Operaciones existe un campo llamado IdProducto que se relaciona con el Id de un Producto.
	
# TiposDePersonas:

	La tabla TiposDePersonas contiene los tipos de personas del sistema.

    Datos por defecto:
	1= Cliente
	2= Proveedor

    Campos:
	Id: Id o llave primaria
	Nombre: Nombre del tipo de persona

    Los valores de la tabla TiposDePersonas estan definidos por default y no se pueden cambiar, en caso de que se cambien pueden afectar el funcionamiento normal del sistema.

    En la tabla Personas existe un campo llamado IdTipoDePersona que se relaciona con el Id de un TiposDePersonas.
	
# Personas:

    La tabla personas simboliza un tipo de persona dentro del sistema, las “personas” por default son: clientes y proveedores, los campos son:

	Id: Id o llave primaria
	Nombre: nombre completo de la persona
	Apellido: apellido de la persona
	Telefono: teléfono
	Email: correo electrónico
	IdTipoDePersona: tipo de persona
	ActivoActualmente: indica si la persona esta activa o inactiva
	Estado: Estado del registro: "A" activo, "B" eliminado (no se consultarán personas en B)
	Estado: Estado del registro: "A" activo, "B" eliminado (no se consultarán productos en B)
	FechaDeAlta: Fecha de creación
    IdUsuarioAlta: almacena el id del usuario que da de alta la persona
    FechaModificacion: Fecha de modificación de la persona
    IdUsuarioModificacion: almacena el id del usuario que modifica la persona

# TiposDeOperacion:

	La tabla TiposDeOperacion contiene los tipos de operación del sistema.

    Datos por defecto:
	1= Entrada
	2= Salida

    Campos:
	Id: Id o llave primaria
	Nombre: Nombre del tipo de operación

    Los valores de la tabla TiposDeOperacion estan definidos por default y no se pueden cambiar, en caso de que se cambien pueden afectar el funcionamiento normal del sistema.

    En la tabla Operaciones existe un campo llamado IdTipoDeOperacion que se relaciona con el Id de un TiposDeOperacion.

# Operaciones:

    La tabla Operaciones es la tabla que agrupa las operaciones de nuestro sitio, esta relacionado con las ventas o abastecimientos según el Id del tipo de operación, los campos de la tabla son:

	Id: Id auto incremental (llave primaria)
	IdPersona: el id del cliente para ventas o proveedor en abastecimientos
	IdTipoDeOperacion: el tipo de operacion, entrada o salida
	IdProducto: el producto de la operación
	Cantidad: cantidad 
	Total: el total de la venta o abastecimiento
	Estado: Estado del registro: "A" activo, "B" eliminado (no se consultarán operaciones en B)
	FechaAlta: fecha de creacion de la operación
	IdUsuarioDeAlta: almacena el id del usuario que da de alta la operación
    FechaBaja: Fecha de eliminación de una operación (Baja lógica: el registro pasa a estado "B")
    IdUsuarioBaja: almacena el id del usuario que elimina una operación (Baja lógica: el registro pasa a estado "B")

# TiposDeUsuarios:

	La tabla TiposDeUsuarios contiene los tipos de usuarios del sistema.

    Datos por defecto:
	1= Administrador
	2= Usuario

    Campos:
	Id: Id o llave primaria
	Nombre: Nombre del tipo de usuario

    Los valores de la tabla TiposDeUsuarios estan definidos por default y no se pueden cambiar, en caso de que se cambien pueden afectar el funcionamiento normal del sistema.

    En la tabla TiposDeUsuarios existe un campo llamado IdTipoDeUsuario que se relaciona con el Id de un TiposDeUsuarios.
	
# Usuarios:

    La tabla usuarios sirve para almacenar los usuarios que tienen acceso al sistema, los campos son:

	Id: Id auto incremental (llave primaria)
	Nombre: nombre del usuario
	Apellido: apellido del usuario
	NombreDeUsuario: nombre de usuario
	Password: contraseña de acceso
	ActivoActualmente: indica si el usuario está activo o inactivo
	IdTipoDeUsuario: tipo de usuario
	Estado: Estado del registro: "A" activo, "B" eliminado (no se consultarán usuarios en B)
	FechaAlta: fecha de creación del usuario
    IdUsuarioDeAlta: almacena el id del usuario que da de alta el usuario (salvo el primer usuario que se registre en el sistema, correspondiente al primer administrador)
    FechaModificacion: Fecha de modificación del usuario
    IdUsuarioModificacion: almacena el id del usuario que modifica un usuario

    # El script de generación de la base de datos es: Script_DeCreacion_BD_LeMone.sql
    # El script de consultas de manipulación de datos de la base de datos es: Consultas_De_BD.sql

    Tarea realizada por:
        Grupo Header: melisapaz (Melisa Apaz)