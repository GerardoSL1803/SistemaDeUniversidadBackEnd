CREATE DATABASE Universidades
GO

USE Universidades
GO

CREATE TABLE ErroresBD(
	IdError INT IDENTITY(1, 1),
    NumeroDeError INT,
	MensajeDelError VARCHAR(MAX),
	LineaDelError INT,	
	FechaCreacion DATETIME DEFAULT GETDATE() NOT NULL,	
	CreadoPor VARCHAR(60),
	CONSTRAINT PK_ErroresBD PRIMARY KEY(IdError)
)
GO

EXEC sp_addextendedproperty
	@name = N'MS_Description',	@value = 'Errores que se generen a nivel de Base de Datos',
   	@level0type = N'Schema',	@level0name = 'dbo',
  	@level1type = N'Table',		@level1name = 'ErroresBD'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Identificador único de cada error que se presente a nivel de base de datos',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'ErroresBD', 
   	@level2type = N'Column',	@level2name = 'IdError'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Número de error del SGBD para cada error que se presente a nivel de base de datos',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'ErroresBD', 
   	@level2type = N'Column',	@level2name = 'NumeroDeError'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Mensaje de error del SGBD para cada error que se presente a nivel de base de datos',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'ErroresBD', 
   	@level2type = N'Column',	@level2name = 'MensajeDelError'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Línea del código donde está el problema para cada error que se presente a nivel de base de datos',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'ErroresBD', 
   	@level2type = N'Column',	@level2name = 'LineaDelError'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de creación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'ErroresBD', 
   	@level2type = N'Column',	@level2name = 'FechaCreacion'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario conectado a la BD que crea el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'ErroresBD', 
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO

CREATE PROCEDURE SP_ErroresBD_Insertar
	@CreadoPor VARCHAR(60)
	AS 
	BEGIN
		INSERT INTO ErroresBD (NumeroDeError, MensajeDelError, LineaDelError, CreadoPor)
		VALUES (ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE(), @CreadoPor)

		RETURN @@IDENTITY
	END
	GO

CREATE TABLE Universidades(
    CodigoUniversidad INT IDENTITY(1,1),
    Nombre VARCHAR(50) NOT NULL,
    Telefono VARCHAR(20) NOT NULL,
    Email VARCHAR(20) NOT NULL,
    Activo BIT DEFAULT 1,
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
    FechaModificacion DATETIME,
    CreadoPor VARCHAR(60),
    ModificadoPor VARCHAR(60)
    CONSTRAINT PK_Universidades PRIMARY KEY(CodigoUniversidad)
)
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Universidades del sistema.',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Universidades'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Código de la Universidad',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Universidades', 
    @level2type = N'Column'	,@level2name = 'CodigoUniversidad'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Nombre de la Universidad',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Universidades', 
    @level2type = N'Column'	,@level2name = 'Nombre'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Teléfono de la Universidad',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Universidades', 
    @level2type = N'Column'	,@level2name = 'Telefono'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Email de la Universidad',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Universidades', 
    @level2type = N'Column'	,@level2name = 'Email'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Universidades', 
    @level2type = N'Column'	,@level2name = 'Activo'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Fecha de creación del registro',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Universidades', 
    @level2type = N'Column'	,@level2name = 'FechaCreacion'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Fecha de modificación del registro',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Universidades', 
    @level2type = N'Column'	,@level2name = 'FechaModificacion'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Nombre del usuario que crea el registro',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Universidades', 
    @level2type = N'Column'	,@level2name = 'CreadoPor'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Nos indica quíen alteró la tabla.',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Universidades', 
    @level2type = N'Column'	,@level2name = 'ModificadoPor'
GO

CREATE FUNCTION FN_Universidades_VerificaExistenciaPorId(@CodigoUniversidad INT)
	RETURNS BIT AS
BEGIN 
	DECLARE @ExisteUniversidad BIT;
	SET @ExisteUniversidad =(SELECT COUNT(CodigoUniversidad) FROM Universidades WHERE CodigoUniversidad = @CodigoUniversidad)

RETURN @ExisteUniversidad
END
GO

CREATE PROCEDURE SP_Universidades_Insertar
	@Nombre VARCHAR(50),
	@Telefono VARCHAR(20),
	@Email VARCHAR(20),
	@CreadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO Universidades(Nombre,Telefono,Email,CreadoPor)
			VALUES (@Nombre,@Telefono,@Email,@CreadoPor)

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando la Universidad. Número de Error: ' + @NumeroDeError
		
	END CATCH
	GO

	CREATE PROCEDURE SP_Universidades_Actualizar
   	@CodigoUniversidad INT,
	@Nombre VARCHAR(50),
	@Telefono VARCHAR(20),
	@Email VARCHAR(20),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteUniversidad BIT
		
			SET @ExisteUniversidad = dbo.FN_Universidades_VerificaExistenciaPorId(@CodigoUniversidad)
		
			IF(@ExisteUniversidad = 1)
				BEGIN
					UPDATE Universidades
					SET
						Nombre = @Nombre,
						Telefono = @Telefono,
						Email = @Email,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						CodigoUniversidad = @CodigoUniversidad

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Univerisidad: '+	@CodigoUniversidad	+'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al actualizar la Universidad: '+	@CodigoUniversidad	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH
	GO

CREATE PROCEDURE SP_Universidades_Desactivar
	@CodigoUniversidad INT,
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteAula BIT

			SET @ExisteAula = dbo.FN_Universidades_VerificaExistenciaPorId(@CodigoUniversidad)

			IF(@ExisteAula = 1)
				BEGIN
					UPDATE Universidades 
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						CodigoUniversidad = @CodigoUniversidad

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Universidad: '+ @CodigoUniversidad +'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar la Universidad: '+	@CodigoUniversidad	+ '. Número de Error: ' + @NumeroDeError

	END CATCH
	GO

CREATE VIEW VW_Universidades_SeleccionarTodos
AS 
	SELECT * FROM Universidades WHERE Activo = 1
GO

CREATE FUNCTION FN_Univerisidades_SeleccionarPorId(
	@CodigoUniversidad INT
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Universidades_SeleccionarTodos AS Universidades
		WHERE 
			Universidades.CodigoUniversidad = @CodigoUniversidad
GO
CREATE FUNCTION FN_Universidades_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Universidades_SeleccionarTodos
GO	

CREATE TABLE Sedes(
    CodigoSede INT IDENTITY(1,1),
    CodigoUniversidad INT NOT NULL,
    Direccion VARCHAR(500) NOT NULL,
    Email VARCHAR(20) NOT NULL,
    Telefono VARCHAR(20) NOT NULL,
    Activo BIT DEFAULT 1,
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
    FechaModificacion DATETIME,
    CreadoPor VARCHAR(60),
    ModificadoPor VARCHAR(60)
    CONSTRAINT PK_Sedes PRIMARY KEY(CodigoSede),
    CONSTRAINT FK_Sedes_CodigoUniversidad FOREIGN KEY(CodigoUniversidad) REFERENCES Universidades(CodigoUniversidad)
)
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Sede de las Universidades.',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Sedes'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Código de la Universidad a la que pertenece la Sede',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Sedes', 
    @level2type = N'Column'	,@level2name = 'CodigoUniversidad'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Dirección de la Sede',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Sedes', 
    @level2type = N'Column'	,@level2name = 'Direccion'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Email de la Sede',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Sedes', 
    @level2type = N'Column'	,@level2name = 'Email'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Teléfono de la Sede',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Sedes', 
    @level2type = N'Column'	,@level2name = 'Telefono'
GO


EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Sedes', 
    @level2type = N'Column'	,@level2name = 'Activo'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Fecha de creación del registro',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Sedes', 
    @level2type = N'Column'	,@level2name = 'FechaCreacion'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Fecha de modificación del registro',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Sedes', 
    @level2type = N'Column'	,@level2name = 'FechaModificacion'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Nombre del usuario que crea el registro',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Sedes', 
    @level2type = N'Column'	,@level2name = 'CreadoPor'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Nos indica quíen alteró la tabla',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Sedes', 
    @level2type = N'Column'	,@level2name = 'ModificadoPor'
GO

CREATE FUNCTION FN_Sedes_VerificaExistenciaPorId(@CodigoSede INT)
	RETURNS BIT AS
BEGIN 
	DECLARE @ExisteSede BIT;
	SET @ExisteSede =(SELECT COUNT(@ExisteSede) FROM Sedes WHERE CodigoSede = @CodigoSede)

RETURN @ExisteSede
END
GO

CREATE PROCEDURE SP_Sedes_Insertar
    @CodigoUniversidad INT,
    @Direccion VARCHAR(500),
    @Email VARCHAR(20),
    @Telefono VARCHAR(20),
	@CreadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO Sedes(CodigoUniversidad,Direccion,Email,Telefono,CreadoPor)
			VALUES (@CodigoUniversidad,@Direccion,@Email,@Telefono,@CreadoPor)

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando la sede. Número de Error: ' + @NumeroDeError
		
	END CATCH
	GO

	CREATE PROCEDURE SP_Sedes_Actualizar
    @CodigoSede INT,
    @CodigoUniversidad INT,
    @Direccion VARCHAR(500),
    @Email VARCHAR(20),
    @Telefono VARCHAR(20),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteSede BIT
		
			SET @ExisteSede = dbo.FN_Sedes_VerificaExistenciaPorId(@CodigoSede)
		
			IF(@ExisteSede = 1)
				BEGIN
					UPDATE Sedes
					SET
						CodigoUniversidad=@CodigoUniversidad,
						Direccion = @Direccion,
						Email = @Email,
						Telefono=@Telefono,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						CodigoSede = @CodigoSede

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Sede: '+	@CodigoSede	+'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al actualizar la sede: '+	@CodigoSede	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH
	GO

CREATE PROCEDURE SP_Sedes_Desactivar
	@CodigoSede INT OUTPUT,
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteAula BIT

			SET @ExisteAula = dbo.FN_Sedes_VerificaExistenciaPorId(@CodigoSede)

			IF(@ExisteAula = 1)
				BEGIN
					UPDATE Sedes 
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						CodigoSede = @CodigoSede

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Aula: '+	@CodigoSede	+'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar la sede: '+	@CodigoSede	+ '. Número de Error: ' + @NumeroDeError

	END CATCH
	GO

	CREATE VIEW VW_Sedes_SeleccionarTodos
AS 
	SELECT * FROM Sedes WHERE Activo = 1
GO

CREATE FUNCTION FN_Sedes_SeleccionarPorId(
	@CodigoSede INT
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Sedes_SeleccionarTodos AS Sedes
		WHERE 
			Sedes.CodigoSede = @CodigoSede
GO
CREATE FUNCTION FN_Sedes_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Sedes_SeleccionarTodos
GO	
CREATE TABLE Carreras(
    CodigoCarrera INT IDENTITY(1,1),
	CodigoSede INT,
    Nombre VARCHAR(50) NOT NULL,
    Activo BIT DEFAULT 1,
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
    FechaModificacion DATETIME,
    CreadoPor VARCHAR(60),
    ModificadoPor VARCHAR(60)
    CONSTRAINT PK_Carreras PRIMARY KEY(CodigoCarrera)
	CONSTRAINT FK_Carreras_CodigoSede FOREIGN KEY(CodigoSede) REFERENCES Sedes(CodigoSede)
)
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Carreras Universitarias',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Carreras'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Código de la Carrera Universitaria',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Carreras', 
    @level2type = N'Column'	,@level2name = 'CodigoCarrera'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Código de la Sede Universitaria',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Carreras', 
    @level2type = N'Column'	,@level2name = 'CodigoSede'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Nombre de la Carrera Universitaria',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Carreras', 
    @level2type = N'Column'	,@level2name = 'Nombre'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'El campo activo muestra 1:Si la Carrera esta activa o 0:Si la Carrera esta inactiva.',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Carreras', 
    @level2type = N'Column'	,@level2name = 'Activo'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Fecha de creación del registro',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Carreras', 
    @level2type = N'Column'	,@level2name = 'FechaCreacion'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Fecha de modificación del registro',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Carreras', 
    @level2type = N'Column'	,@level2name = 'FechaModificacion'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value ='Nombre del usuario que crea el registro',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Carreras', 
    @level2type = N'Column'	,@level2name = 'CreadoPor'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Nos indica quien alteró el campo',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Carreras', 
    @level2type = N'Column'	,@level2name = 'ModificadoPor'
GO

CREATE FUNCTION FN_Carreras_VerificaExistenciaPorId(@CodigoCarrera INT)
	RETURNS BIT AS
BEGIN 
	DECLARE @ExisteCarrera BIT;
	SET @ExisteCarrera =(SELECT COUNT(CodigoCarrera) FROM Carreras WHERE CodigoCarrera = @CodigoCarrera)

RETURN @ExisteCarrera
END
GO

CREATE PROCEDURE SP_Carreras_Insertar
    @CodigoSede INT,
	@Nombre VARCHAR(50),
	@CreadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO Carreras(CodigoSede,Nombre,CreadoPor)
			VALUES (@CodigoSede,@Nombre,@CreadoPor)

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando la Carrera. Número de Error: ' + @NumeroDeError
		
	END CATCH
	GO

	CREATE PROCEDURE SP_Carreras_Actualizar
   	@CodigoCarrera INT,
	@Nombre VARCHAR(50),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteCarrera BIT
		
			SET @ExisteCarrera = dbo.FN_Carreras_VerificaExistenciaPorId(@CodigoCarrera)
		
			IF(@ExisteCarrera = 1)
				BEGIN
					UPDATE Carreras
					SET
						Nombre = @Nombre,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						CodigoCarrera = @CodigoCarrera

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Carrera: '+@CodigoCarrera	+'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al actualizar la Carrera: '+	@CodigoCarrera	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH
	GO

CREATE PROCEDURE SP_Carreras_Desactivar
	@CodigoCarrera INT,
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteCarrera BIT

			SET @ExisteCarrera = dbo.FN_Carreras_VerificaExistenciaPorId(@CodigoCarrera)

			IF(@ExisteCarrera = 1)
				BEGIN
					UPDATE Carreras 
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						CodigoCarrera = @CodigoCarrera

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Carrera: '+ @CodigoCarrera +'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar la Carrera: '+	@CodigoCarrera	+ '. Número de Error: ' + @NumeroDeError

	END CATCH
	GO

CREATE VIEW VW_Carreras_SeleccionarTodos
AS 
	SELECT * FROM Carreras WHERE Activo = 1
GO

CREATE FUNCTION FN_Carreras_SeleccionarPorId(
	@CodigoCarrera INT
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Carreras_SeleccionarTodos AS Carreras
		WHERE 
			Carreras.CodigoCarrera = @CodigoCarrera
GO
CREATE FUNCTION FN_Carreras_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Carreras_SeleccionarTodos
GO

CREATE TABLE Cursos(
    CodigoCurso INT IDENTITY(1,1),
    Nombre VARCHAR(20) NOT NULL,
    MontoCurso DECIMAL(18,3) NOT NULL,
    Activo BIT DEFAULT 1,
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
    FechaModificacion DATETIME,
    CreadoPor VARCHAR(60),
    ModificadoPor VARCHAR(60)
    CONSTRAINT PK_Cursos PRIMARY KEY(CodigoCurso)
)
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Cursos a llevar en la Carrera',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Cursos'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Nombre del curso',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Cursos', 
    @level2type = N'Column'	,@level2name = 'Nombre'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Monto o valor del curso.',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Cursos', 
    @level2type = N'Column'	,@level2name = 'MontoCurso'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Cursos', 
    @level2type = N'Column'	,@level2name = 'Activo'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Fecha de creación del registro',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Cursos', 
    @level2type = N'Column'	,@level2name = 'FechaCreacion'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value ='Fecha de modificación del registro',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Cursos', 
    @level2type = N'Column'	,@level2name = 'FechaModificacion'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Nombre del usuario que crea el registro',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Cursos', 
    @level2type = N'Column'	,@level2name = 'CreadoPor'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Nos indica quien alteró el campo',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Cursos', 
    @level2type = N'Column'	,@level2name = 'ModificadoPor'
GO

CREATE FUNCTION FN_Cursos_VerificaExistenciaPorId(@CodigoCurso INT)
	RETURNS BIT AS
BEGIN 
	DECLARE @ExisteCurso BIT;
	SET @ExisteCurso =(SELECT COUNT(CodigoCurso) FROM Cursos WHERE CodigoCurso = @CodigoCurso)

RETURN @ExisteCurso
END
GO

CREATE PROCEDURE SP_Cursos_Insertar
	 @Nombre VARCHAR(20),
     @MontoCurso DECIMAL(18,3),
	 @CreadoPor VARCHAR(60),
	 @ExisteError BIT OUTPUT,
	 @DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO Cursos(Nombre,MontoCurso, CreadoPor)
			VALUES (@Nombre,@MontoCurso ,@CreadoPor)

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando el Curso. Número de Error: ' + @NumeroDeError
		
	END CATCH
	GO
	CREATE PROCEDURE SP_Cursos_Actualizar
   	@CodigoCurso INT,
	@Nombre VARCHAR(20),
    @MontoCurso DECIMAL(18,3),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteCurso BIT
		
			SET @ExisteCurso = dbo.FN_Cursos_VerificaExistenciaPorId(@CodigoCurso)
		
			IF(@ExisteCurso = 1)
				BEGIN
					UPDATE Cursos
					SET
						Nombre = @Nombre,
						MontoCurso = @MontoCurso,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						CodigoCurso = @CodigoCurso

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Curso: '+@CodigoCurso	+'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al actualizar el Curso: '+	@CodigoCurso	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH
	GO

CREATE PROCEDURE SP_Cursos_Desactivar
	@CodigoCurso INT,
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteCarrera BIT

			SET @ExisteCarrera = dbo.FN_Cursos_VerificaExistenciaPorId(@CodigoCurso)

			IF(@ExisteCarrera = 1)
				BEGIN
					UPDATE Cursos 
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						CodigoCurso = @CodigoCurso

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Curso: '+ @CodigoCurso +'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar el Curso: '+	@CodigoCurso + '. Número de Error: ' + @NumeroDeError

	END CATCH
	GO

			CREATE VIEW VW_Cursos_SeleccionarTodos
AS 
	SELECT * FROM Cursos WHERE Activo = 1
GO


CREATE TABLE Estudiantes(
    Identificacion VARCHAR(20) NOT NULL,
    Nombres VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    Telefono VARCHAR(20)NOT NULL,
    TelefonoSecundario VARCHAR(20),
    FechaIngreso DATE DEFAULT GETDATE(),
    Activo BIT DEFAULT 1,
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
    FechaModificacion DATETIME,
    CreadoPor VARCHAR(60),
    ModificadoPor VARCHAR(60)
    CONSTRAINT PK_Estudiantes PRIMARY KEY(Identificacion)
)
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Estudiante de la Universidad',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Estudiantes'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Numero de identificacion del Estudiante',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Estudiantes', 
    @level2type = N'Column'	,@level2name = 'Identificacion'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Primer y segundo nombre del Estudiante segun sea el caso',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Estudiantes', 
    @level2type = N'Column'	,@level2name = 'Nombres'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Apellido completo del Estudiante',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Estudiantes', 
    @level2type = N'Column'	,@level2name = 'Apellidos'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Telefono del Estudiante',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Estudiantes', 
    @level2type = N'Column'	,@level2name = 'Telefono'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Numero de telefono secundario del estudiante si este fuera necesario',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Estudiantes', 
    @level2type = N'Column'	,@level2name = 'TelefonoSecundario'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Fecha de ingreso del Estudiante',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Estudiantes', 
    @level2type = N'Column'	,@level2name = 'FechaIngreso'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Estudiantes', 
    @level2type = N'Column'	,@level2name = 'Activo'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Fecha de creación del registro',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Estudiantes', 
    @level2type = N'Column'	,@level2name = 'FechaCreacion'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value ='Fecha de modificación del registro',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Estudiantes', 
    @level2type = N'Column'	,@level2name = 'FechaModificacion'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Nombre del usuario que crea el registro',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Estudiantes', 
    @level2type = N'Column'	,@level2name = 'CreadoPor'
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Nos indica quien altero la tabla',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Estudiantes', 
    @level2type = N'Column'	,@level2name = 'ModificadoPor'
GO

CREATE FUNCTION FN_Estudiantes_VerificaExistenciaPorId(@Identificacion VARCHAR(20))
	RETURNS BIT AS
BEGIN 
	DECLARE @ExisteEstudiante BIT;
	SET @ExisteEstudiante =(SELECT COUNT(Identificacion) FROM Estudiantes WHERE Identificacion = @Identificacion)

RETURN @ExisteEstudiante
END
GO

CREATE PROCEDURE SP_Estudiantes_Insertar
	@Identificacion VARCHAR(20),
	@Nombres VARCHAR(50),
	@Apellidos VARCHAR(50),
	@Telefono VARCHAR(20),
	@TelefonoSecundario VARCHAR(20),
	@CreadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO Estudiantes(Identificacion,Nombres, Apellidos,Telefono,TelefonoSecundario,CreadoPor)
			VALUES (@Identificacion,@Nombres,@Apellidos,@Telefono,@TelefonoSecundario ,@CreadoPor)

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando el Estudiante. Número de Error: ' + @NumeroDeError
		
	END CATCH
	GO

	

	CREATE PROCEDURE SP_Estudiantes_Actualizar
	@Identificacion VARCHAR(20),
	@Nombres VARCHAR(50),
	@Apellidos VARCHAR(50),
	@Telefono VARCHAR(20),
	@TelefonoSecundario VARCHAR(20),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteEstudiante BIT
		
			SET @ExisteEstudiante = dbo.FN_Estudiantes_VerificaExistenciaPorId(@Identificacion)
		
			IF(@ExisteEstudiante = 1)
				BEGIN
					UPDATE Estudiantes
					SET
						Nombres = @Nombres,
						Apellidos = @Apellidos,
						Telefono = @Telefono,
						TelefonoSecundario = TelefonoSecundario,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						Identificacion = @Identificacion

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Estudiante: '+@Identificacion	+'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al actualizar el Estudiante: '+	@Identificacion	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH
	GO

CREATE PROCEDURE SP_Estudiantes_Desactivar
	@Identificacion VARCHAR (20),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteCarrera BIT

			SET @ExisteCarrera = dbo.FN_Estudiantes_VerificaExistenciaPorId(@Identificacion)

			IF(@ExisteCarrera = 1)
				BEGIN
					UPDATE Estudiantes 
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						Identificacion = @Identificacion

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Estudiante: '+ @Identificacion +'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar el Estudiante: '+	@Identificacion	+ '. Número de Error: ' + @NumeroDeError

	END CATCH
	GO

			CREATE VIEW VW_Estudiantes_SeleccionarTodos
AS 
	SELECT * FROM Estudiantes WHERE Activo = 1
GO

CREATE FUNCTION FN_Estudiantes_SeleccionarPorId(
	@Identificacion VARCHAR(20)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Estudiantes_SeleccionarTodos AS Estudiantes
		WHERE 
			Estudiantes.Identificacion = @Identificacion
GO
CREATE FUNCTION FN_Estudiantes_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Estudiantes_SeleccionarTodos
GO

CREATE TABLE EmailDeEstudiantes(
    Identificacion VARCHAR(20) NOT NULL,
    EmailUniversidad VARCHAR(50) NOT NULL,
    EmailPersonal VARCHAR(50),
    Activo BIT DEFAULT 1,
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
    FechaModificacion DATETIME,
    CreadoPor VARCHAR(60),
    ModificadoPor VARCHAR(60)
    CONSTRAINT FK_EmailDeEstudiantes_Identificacion FOREIGN KEY(Identificacion) REFERENCES Estudiantes(Identificacion),
    CONSTRAINT PK_EmailDeEstudiantes PRIMARY KEY(Identificacion)
)
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Tabla para registrar los email de los estudiantes.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
  	@level1type = N'Table',		@level1name = 'EmailDeEstudiantes' 
GO 
 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Numero de identificacion del estudiante', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'EmailDeEstudiantes',  
   	@level2type = N'Column',	@level2name = 'Identificacion' 
GO 
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Email Universitario del Estudiante', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'EmailDeEstudiantes',  
   	@level2type = N'Column',	@level2name = 'EmailUniversidad' 
GO 
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Email personal del estudiante', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'EmailDeEstudiantes',  
   	@level2type = N'Column',	@level2name = 'EmailPersonal' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'EmailDeEstudiantes',  
   	@level2type = N'Column',	@level2name = 'Activo' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de creación del registro', 
  	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'EmailDeEstudiantes',  
   	@level2type = N'Column',	@level2name = 'FechaCreacion' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'EmailDeEstudiantes',  
   	@level2type = N'Column',	@level2name = 'FechaModificacion' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'EmailDeEstudiantes',  
   	@level2type = N'Column',	@level2name = 'CreadoPor' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'EmailDeEstudiantes', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor' 
GO 

CREATE FUNCTION FN_EmailDeEstudiantes_VerificaExistenciaPorId(@Identificacion VARCHAR(20))
	RETURNS BIT AS
BEGIN 
	DECLARE @ExisteEmailDeEstudiante BIT;
	SET @ExisteEmailDeEstudiante =(SELECT COUNT(Identificacion) FROM EmailDeEstudiantes WHERE Identificacion = @Identificacion)

RETURN @ExisteEmailDeEstudiante
END
GO

CREATE PROCEDURE SP_EmailDeEstudiantes_Insertar
    @Identificacion VARCHAR(20),
    @EmailUniversidad VARCHAR(50),
    @EmailPersonal VARCHAR(50),
	@CreadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO EmailDeEstudiantes(Identificacion,EmailUniversidad,EmailPersonal,CreadoPor)
			VALUES (@Identificacion,@EmailUniversidad,@EmailPersonal,@CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando el Email del Estudiante. Número de Error: ' + @NumeroDeError
		
	END CATCH
GO

CREATE PROCEDURE SP_EmailDeEstudiantes_Actualizar
    @Identificacion VARCHAR(20),
    @EmailUniversidad VARCHAR(50),
    @EmailPersonal VARCHAR(50),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteAula BIT
		
			SET @ExisteAula = dbo.FN_EmailDeEstudiantes_VerificaExistenciaPorId(@Identificacion)
		
			IF(@ExisteAula = 1)
				BEGIN
					UPDATE EmailDeEstudiantes
					SET
						EmailUniversidad = @EmailUniversidad,
						EmailPersonal = @EmailPersonal,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						Identificacion = @Identificacion

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Estudiante: '+	@Identificacion	+'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al actualizar los email del estudiante: '+	@Identificacion	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH
GO
CREATE PROCEDURE SP_EmailDeEstudiantes_Desactivar
	@Identificacion VARCHAR(20),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteEmailDeEstudiante BIT

			SET @ExisteEmailDeEstudiante = dbo.FN_EmailDeEstudiantes_VerificaExistenciaPorId(@Identificacion)

			IF(@ExisteEmailDeEstudiante = 1)
				BEGIN
					UPDATE EmailDeEstudiantes
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						Identificacion = @Identificacion

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Email del estudiante: '+	@Identificacion	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar Email de estudiante: '+	@Identificacion	+ '. Número de Error: ' + @NumeroDeError

	END CATCH
GO	

		CREATE VIEW VW_EmailDeEstudiantes_SeleccionarTodos
AS 
	SELECT * FROM EmailDeEstudiantes WHERE Activo = 1
GO

CREATE FUNCTION FN_EmailDeEstudiantes_SeleccionarPorId(
	@Identificacion VARCHAR(20)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_EmailDeEstudiantes_SeleccionarTodos AS EmailDeEstudiantes
		WHERE 
			EmailDeEstudiantes.Identificacion = @Identificacion
GO
CREATE FUNCTION FN_EmailDeEstudiantes_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_EmailDeEstudiantes_SeleccionarTodos
GO

CREATE TABLE Docentes(
    Identificacion VARCHAR(20) NOT NULL,
    Nombres VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    Telefono VARCHAR(20) NOT NULL,
    TelefonoSecundario VARCHAR(20),
    Activo BIT DEFAULT 1,
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
    FechaModificacion DATETIME,
    CreadoPor VARCHAR(60),
    ModificadoPor VARCHAR(60)
    CONSTRAINT PK_Docentes PRIMARY KEY(Identificacion)
)
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Docente de la universidad.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
  	@level1type = N'Table',		@level1name = 'Docentes' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Numero de identificación del docente.', 
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Docentes',  
   	@level2type = N'Column',	@level2name = 'Identificacion' 
GO 
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombres del docente.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Docentes',  
   	@level2type = N'Column',	@level2name = 'Nombres' 
GO 
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Apellidos del docente.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Docentes',  
   	@level2type = N'Column',	@level2name = 'Apellidos' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Teléfono principal del docente.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Docentes',  
   	@level2type = N'Column',	@level2name = 'Telefono' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Teléfono secundario del docente.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Docentes',  
   	@level2type = N'Column',	@level2name = 'TelefonoSecundario' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Docentes',  
   	@level2type = N'Column',	@level2name = 'Activo' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de creación del registro', 
  	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Docentes',  
   	@level2type = N'Column',	@level2name = 'FechaCreacion' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Docentes',  
   	@level2type = N'Column',	@level2name = 'FechaModificacion' 
GO 

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Docentes',  
   	@level2type = N'Column',	@level2name = 'CreadoPor' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Docentes', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'
GO

CREATE FUNCTION FN_Docentes_VerificaExistenciaPorId(@Identificacion VARCHAR(20))
	RETURNS BIT AS
BEGIN 
	DECLARE @ExisteDocente BIT;
	SET @ExisteDocente =(SELECT COUNT(Identificacion) FROM Docentes WHERE Identificacion = @Identificacion)

RETURN @ExisteDocente
END
GO

CREATE PROCEDURE SP_Docentes_Insertar
    @Identificacion VARCHAR(20),
    @Nombres VARCHAR(50),
    @Apellidos VARCHAR(50),
    @Telefono VARCHAR(20),
    @TelefonoSecundario VARCHAR(20),
	@CreadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO Docentes(Identificacion,Nombres,Apellidos,Telefono,TelefonoSecundario,CreadoPor)
			VALUES(@Identificacion,@Nombres,@Apellidos,@Telefono,@TelefonoSecundario,@CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando Docente. Número de Error: ' + @NumeroDeError
		
	END CATCH
GO

CREATE PROCEDURE SP_Docentes_Actualizar
    @Identificacion VARCHAR(20),
    @Nombres VARCHAR(50),
    @Apellidos VARCHAR(50),
    @Telefono VARCHAR(20),
    @TelefonoSecundario VARCHAR(20),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteDocente BIT
		
			SET @ExisteDocente = dbo.FN_Docentes_VerificaExistenciaPorId(@Identificacion)
		
			IF(@ExisteDocente = 1)
				BEGIN
					UPDATE Docentes 
					SET
						Nombres = @Nombres,
						Apellidos = @Apellidos,
						Telefono = @Telefono,
						TelefonoSecundario = @TelefonoSecundario,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						Identificacion = @Identificacion

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Docente: '+ @Identificacion +' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al actualizar al Docente: '+	@Identificacion	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH
GO

CREATE PROCEDURE SP_Docentes_Desactivar
	@Identificacion VARCHAR(20),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteDocente BIT

			SET @ExisteDocente = dbo.FN_Docentes_VerificaExistenciaPorId(@Identificacion)

			IF(@ExisteDocente = 1)
				BEGIN
					UPDATE Docentes
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						Identificacion = @Identificacion

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Docente: '+	@Identificacion	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar al docente: '+	@Identificacion	+ '. Número de Error: ' + @NumeroDeError

	END CATCH
GO

CREATE VIEW VW_Docentes_SeleccionarTodos
AS 
	SELECT * FROM Docentes WHERE Activo = 1
GO

CREATE FUNCTION FN_Docentes_SeleccionarPorId(
	@Identificacion VARCHAR(20)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Docentes_SeleccionarTodos AS Docentes
		WHERE 
			Docentes.Identificacion = @Identificacion
GO
CREATE FUNCTION FN_Docentes_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Docentes_SeleccionarTodos
GO

CREATE TABLE EmailDeDocentes(
    Identificacion VARCHAR(20) NOT NULL,
    EmailUniversidad VARCHAR(50)NOT NULL,
    EmailPersonal VARCHAR(50),
    Activo BIT DEFAULT 1,
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
    FechaModificacion DATETIME,
    CreadoPor VARCHAR(60),
    ModificadoPor VARCHAR(60)
    CONSTRAINT FK_EmailDeDocentes_Identificacion FOREIGN KEY(Identificacion) REFERENCES Docentes(Identificacion),
    CONSTRAINT PK_EmailDeDocentes PRIMARY KEY(Identificacion)
)
GO


EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Email del docente', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
  	@level1type = N'Table',		@level1name = 'EmailDeDocentes' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Numero de identificacion de email del docente', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'EmailDeDocentes',  
   	@level2type = N'Column',	@level2name = 'Identificacion' 
GO 
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Email universitario del docente', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'EmailDeDocentes',  
   	@level2type = N'Column',	@level2name = 'EmailUniversidad' 
GO 
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Email personal del docente', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'EmailDeDocentes',  
   	@level2type = N'Column',	@level2name = 'EmailPersonal' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'EmailDeDocentes',  
   	@level2type = N'Column',	@level2name = 'Activo' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de creación del registro', 
  	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'EmailDeDocentes',  
   	@level2type = N'Column',	@level2name = 'FechaCreacion' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'EmailDeDocentes',  
   	@level2type = N'Column',	@level2name = 'FechaModificacion' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'EmailDeDocentes',  
   	@level2type = N'Column',	@level2name = 'CreadoPor' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'EmailDeDocentes', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'
GO

CREATE FUNCTION FN_EmailDeDocentes_VerificaExistenciaPorId(@Identificacion VARCHAR(20))
	RETURNS BIT AS
BEGIN 
	DECLARE @ExisteEmailDeDocente BIT;
	SET @ExisteEmailDeDocente =(SELECT COUNT(Identificacion) FROM EmailDeDocentes WHERE Identificacion = @Identificacion)

RETURN @ExisteEmailDeDocente
END
GO

CREATE PROCEDURE SP_EmailDeDocentes_Insertar
	@Identificacion VARCHAR(20),
	@EmailUniversidad VARCHAR(50),
	@EmailPersonal VARCHAR(50),
	@CreadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO EmailDeDocentes(Identificacion,EmailUniversidad,EmailPersonal,CreadoPor)
			VALUES (@Identificacion,@EmailUniversidad,@EmailPersonal,@CreadoPor)

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando el Email del Docente. Número de Error: ' + @NumeroDeError
		
	END CATCH
	GO

	CREATE PROCEDURE SP_EmailDeDocentes_Actualizar
		@Identificacion VARCHAR(20),
		@EmailUniversidad VARCHAR(50),
		@EmailPersonal VARCHAR(50),
		@ModificadoPor VARCHAR(60),
		@ExisteError BIT OUTPUT,
		@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteEmailDeDocente BIT
		
			SET @ExisteEmailDeDocente = dbo.FN_EmailDeDocentes_VerificaExistenciaPorId(@Identificacion)
		
			IF(@ExisteEmailDeDocente = 1)
				BEGIN
					UPDATE EmailDeDocentes
					SET
						EmailUniversidad = @EmailUniversidad,
						EmailPersonal = @EmailPersonal,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						Identificacion = @Identificacion

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Email de Docente: ' + @Identificacion +'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al actulizar el Email del Docente: '+ @Identificacion	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH
	GO

CREATE PROCEDURE SP_EmailDeDocentes_Desactivar
	@Identificacion VARCHAR (20) OUTPUT,
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteEmailDeDocente BIT

			SET @ExisteEmailDeDocente = dbo.FN_EmailDeDocentes_VerificaExistenciaPorId(@Identificacion)

			IF(@ExisteEmailDeDocente = 1)
				BEGIN
					UPDATE EmailDeDocentes 
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						Identificacion = @Identificacion

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Email del Docente: '+	@Identificacion	+'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar el Email del Docente '+	@Identificacion	+ '. Número de Error: ' + @NumeroDeError

	END CATCH
	GO

CREATE VIEW VW_EmailDeDocentes_SeleccionarTodos
AS 
	SELECT * FROM EmailDeDocentes WHERE Activo = 1
GO

CREATE FUNCTION FN_EmailDeDocentes_SeleccionarPorId(
	@Identificacion VARCHAR(20)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_EmailDeDocentes_SeleccionarTodos AS EmailDeDocentes
		WHERE 
			EmailDeDocentes.Identificacion = @Identificacion
GO
CREATE FUNCTION FN_EmailDeDocentes_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_EmailDeDocentes_SeleccionarTodos
GO
	
CREATE TABLE CiclosLectivos(
    CodigoCiclo INT IDENTITY(1,1) NOT NULL,
    NombreCiclo VARCHAR(20) NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE NOT NULL,
    Activo BIT DEFAULT 1,
    FechaCreacion DATETIME DEFAULT GETDATE(),
    FechaModificacion DATETIME,
    CreadoPor VARCHAR(60),
    ModificadoPor VARCHAR(60)
    CONSTRAINT PK_CiclosLectivos PRIMARY KEY(CodigoCiclo)
)
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Ciclo lectivo del curso', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
  	@level1type = N'Table',		@level1name = 'CiclosLectivos' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Codigo del ciclo lectivo', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CiclosLectivos',  
   	@level2type = N'Column',	@level2name = 'CodigoCiclo' 
GO 
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del ciclo lectivo', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CiclosLectivos',  
   	@level2type = N'Column',	@level2name = 'NombreCiclo' 
GO 
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de inicio del ciclo lectivo', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CiclosLectivos',  
   	@level2type = N'Column',	@level2name = 'FechaInicio' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha del fín del ciclo lectivo', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CiclosLectivos',  
   	@level2type = N'Column',	@level2name = 'FechaFin' 
GO 


EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value ='Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CiclosLectivos',  
   	@level2type = N'Column',	@level2name = 'Activo' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de creación del registro', 
  	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CiclosLectivos',  
   	@level2type = N'Column',	@level2name = 'FechaCreacion' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CiclosLectivos',  
   	@level2type = N'Column',	@level2name = 'FechaModificacion' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CiclosLectivos',  
   	@level2type = N'Column',	@level2name = 'CreadoPor' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CiclosLectivos', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'
GO


CREATE FUNCTION FN_CiclosLectivos_VerificaExistenciaPorId(@CodigoCiclo INT)
	RETURNS BIT AS
BEGIN 
	DECLARE @ExisteCodigoCiclo BIT;
	SET @ExisteCodigoCiclo =(SELECT COUNT(CodigoCiclo) FROM CiclosLectivos WHERE CodigoCiclo = @CodigoCiclo)

RETURN @ExisteCodigoCiclo
END
GO

CREATE PROCEDURE SP_CiclosLectivos_Insertar
	@NombreCiclo VARCHAR(20),
	@FechaInicio DATE,
	@FechaFin DATE,
	@CreadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO CiclosLectivos(NombreCiclo,FechaInicio,FechaFin,CreadoPor)
			VALUES (@NombreCiclo,@FechaInicio,@FechaFin,@CreadoPor)

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando el Ciclo Lectivo. Número de Error: ' + @NumeroDeError
		
	END CATCH
	GO

	GO

	CREATE PROCEDURE SP_CiclosLectivos_Actualizar
			@CodigoCiclo INT,
			@NombreCiclo VARCHAR(20),
			@FechaInicio DATE,
			@FechaFin DATE,
			@ModificadoPor VARCHAR(60),
			@ExisteError BIT OUTPUT,
			@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteCodigoCiclo BIT
		
			SET @ExisteCodigoCiclo = dbo.FN_CiclosLectivos_VerificaExistenciaPorId(@CodigoCiclo)
		
			IF(@ExisteCodigoCiclo = 1)
				BEGIN
					UPDATE CiclosLectivos
					SET
						NombreCiclo = @NombreCiclo,
						FechaInicio = @FechaInicio,
						FechaFin = @FechaFin,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						CodigoCiclo = @CodigoCiclo

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'El Ciclo Lectivo: ' + @CodigoCiclo +'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al actulizar el Ciclo Lectivo: '+ @CodigoCiclo	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH
	GO

CREATE PROCEDURE SP_CiclosLectivos_Desactivar
	@CodigoCiclo INT OUTPUT,
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteCodigoCiclo BIT

			SET @ExisteCodigoCiclo = dbo.FN_CiclosLectivos_VerificaExistenciaPorId(@CodigoCiclo)

			IF(@ExisteCodigoCiclo = 1)
				BEGIN
					UPDATE CiclosLectivos 
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						CodigoCiclo = @CodigoCiclo

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Ciclo Lectivo: '+	@CodigoCiclo	+'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar el Ciclo Lectivo '+	@CodigoCiclo	+ '. Número de Error: ' + @NumeroDeError

	END CATCH
	GO

CREATE VIEW VW_CiclosLectivos_SeleccionarTodos
AS 
	SELECT * FROM CiclosLectivos WHERE Activo = 1
GO

CREATE FUNCTION FN_CiclosLectivos_SeleccionarPorId(
	@CodigoCiclo INT
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_CiclosLectivos_SeleccionarTodos AS CiclosLectivos
		WHERE 
			CiclosLectivos.CodigoCiclo = @CodigoCiclo
GO
CREATE FUNCTION FN_CiclosLectivos_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_CiclosLectivos_SeleccionarTodos
GO

CREATE TABLE Matriculas(
    CodigoMatricula INT IDENTITY(1,1) NOT NULL,
    CodigoCiclo INT NOT NULL,
    IdentificacionEstudiante VARCHAR(20) NOT NULL,
    MontoDeCurso DECIMAL(18,3) NOT NULL DEFAULT 0,
    MontoMatricula DECIMAL(18,3) NOT NULL,
    MontoTotal AS (MontoDeCurso + MontoMatricula),
    Activo BIT DEFAULT 1,
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
    FechaModificacion DATETIME,
    CreadoPor VARCHAR(60),
    ModificadoPor VARCHAR(60)
    CONSTRAINT PK_Matriculas PRIMARY KEY(CodigoMatricula),
    CONSTRAINT FK_Matriculas_CodigoCiclo FOREIGN KEY(CodigoCiclo) REFERENCES CiclosLectivos(CodigoCiclo),
    CONSTRAINT FK_Matriculas_Identificacion FOREIGN KEY(IdentificacionEstudiante) REFERENCES Estudiantes(Identificacion)
)
GO


EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Matricula del curso.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
  	@level1type = N'Table',		@level1name = 'Matriculas' 
GO 
 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Codigo de la matricula.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Matriculas',  
   	@level2type = N'Column',	@level2name = 'CodigoMatricula' 
GO 
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Codigo del ciclo lectivo de la matricula.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Matriculas',  
   	@level2type = N'Column',	@level2name = 'CodigoCiclo' 
GO 
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Identificacion del estudiante que hace la matricula.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Matriculas',  
   	@level2type = N'Column',	@level2name = 'IdentificacionEstudiante' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Monto del Curso.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Matriculas',  
   	@level2type = N'Column',	@level2name = 'MontoDeCurso' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Monto de la Matricula.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Matriculas',  
   	@level2type = N'Column',	@level2name = 'MontoMatricula' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Suma total del monto del curso y monto de la matricula.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Matriculas',  
   	@level2type = N'Column',	@level2name = 'MontoTotal' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Matriculas',  
   	@level2type = N'Column',	@level2name = 'Activo' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de creación del registro', 
  	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Matriculas',  
   	@level2type = N'Column',	@level2name = 'FechaCreacion' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Matriculas',  
   	@level2type = N'Column',	@level2name = 'FechaModificacion' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Matriculas',  
   	@level2type = N'Column',	@level2name = 'CreadoPor' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Matriculas', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'
GO


CREATE FUNCTION FN_Matriculas_VerificaExistenciaPorId(@CodigoMatricula INT)
RETURNS BIT AS
BEGIN
	DECLARE @ExisteMatricula BIT;
	
	SET @ExisteMatricula = (SELECT count(CodigoMatricula) FROM Matriculas WHERE CodigoMatricula = @CodigoMatricula)
	 
    RETURN @ExisteMatricula
END
GO


CREATE PROCEDURE SP_Matriculas_Insertar
	@CodigoCiclo INT,
	@IdentificacionEstudiante VARCHAR(20),
	@MontoMatricula DECIMAL(18,3),
	@CreadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
AS
BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO Matriculas(CodigoCiclo, IdentificacionEstudiante, MontoMatricula,CreadoPor)
			VALUES(@CodigoCiclo, @IdentificacionEstudiante, @MontoMatricula,@CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando la Matricula. Número de Error: ' + @NumeroDeError
		
	END CATCH
GO

CREATE PROCEDURE SP_Matriculas_Actualizar
    @CodigoMatricula INT,
	@CodigoCiclo INT,
	@IdentificacionEstudiante VARCHAR(20),
	@MontoDeCurso DECIMAL(18,3),
	@MontoMatricula DECIMAL(18,3),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteMatricula BIT
		
			SET @ExisteMatricula = dbo.FN_Matriculas_VerificaExistenciaPorId(@CodigoMatricula)
		
			IF(@ExisteMatricula = 1)
				BEGIN
					UPDATE Matriculas 
					SET
						IdentificacionEstudiante = @IdentificacionEstudiante,
						MontoDeCurso = @MontoDeCurso,
						MontoMatricula = @MontoMatricula,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						CodigoMatricula = @CodigoMatricula

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Matricula: '+	@CodigoMatricula	+' , No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizando la Matricula: '+	@CodigoMatricula	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH	
	GO
	
	CREATE PROCEDURE SP_Matriculas_Desactivar
	@CodigoMatricula INT,
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteMatricula BIT

			SET @ExisteMatricula = dbo.FN_Matriculas_VerificaExistenciaPorId(@CodigoMatricula)

			IF(@ExisteMatricula = 1)
				BEGIN
					UPDATE Matriculas 
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						CodigoMatricula = @CodigoMatricula

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Matricula: '+	@CodigoMatricula	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar la Matricula: '+	@CodigoMatricula	+ '. Número de Error: ' + @NumeroDeError

	END CATCH
GO

CREATE VIEW VW_Matriculas_SeleccionarTodos
AS 
	SELECT * FROM Matriculas WHERE Activo = 1
GO

CREATE FUNCTION FN_Matriculas_SeleccionarPorId(
	@CodigoMatricula INT
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Matriculas_SeleccionarTodos AS Matriculas
		WHERE 
			Matriculas.CodigoMatricula = @CodigoMatricula
GO
CREATE FUNCTION FN_Matriculas_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Matriculas_SeleccionarTodos
GO

CREATE TABLE CursosEnMatricula(
    CodigoMatricula INT NOT NULL,
    CodigoCurso INT NOT NULL,
	MontoDeCurso DECIMAL(18,3),
    Activo BIT DEFAULT 1,
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
    FechaModificacion DATETIME,
    CreadoPor VARCHAR(60),
    ModificadoPor VARCHAR(60),
    CONSTRAINT FK_CursosEnMatricula_CodigoMatricula FOREIGN KEY(CodigoMatricula) REFERENCES Matriculas(CodigoMatricula),
    CONSTRAINT FK_CursosEnMatricula_CodigoCurso FOREIGN KEY(CodigoCurso) REFERENCES Cursos(CodigoCurso),
    CONSTRAINT PK_CursosEnMatricula PRIMARY KEY(CodigoMatricula,CodigoCurso)
)
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Cursos matriculados.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
  	@level1type = N'Table',		@level1name = 'CursosEnMatricula' 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Código de la matricula.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnMatricula',  
   	@level2type = N'Column',	@level2name = 'CodigoMatricula' 
GO 
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Código del curso matriculado.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnMatricula',  
   	@level2type = N'Column',	@level2name = 'CodigoCurso' 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Monto historico del curso.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnMatricula',  
   	@level2type = N'Column',	@level2name = 'MontoDeCurso' 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnMatricula',  
   	@level2type = N'Column',	@level2name = 'Activo' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de creación del registro', 
  	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnMatricula',  
   	@level2type = N'Column',	@level2name = 'FechaCreacion' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnMatricula',  
   	@level2type = N'Column',	@level2name = 'FechaModificacion' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnMatricula',  
   	@level2type = N'Column',	@level2name = 'CreadoPor' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnMatricula', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'
GO

CREATE FUNCTION FN_CursosEnMatricula_VerificaExistenciaPorId (
	@CodigoMatricula INT,
	@CodigoCurso INT )
RETURNS BIT AS
BEGIN
	DECLARE @ExisteCursosEnMatricula BIT;
	
	SET @ExisteCursosEnMatricula = (SELECT count(CodigoMatricula) FROM CursosEnMatricula WHERE CodigoMatricula = @CodigoMatricula AND CodigoCurso = @CodigoCurso)
	 
    RETURN @ExisteCursosEnMatricula
END
GO

CREATE PROCEDURE SP_CursosEnMatricula_Insertar
	@CodigoMatricula INT,
 	@CodigoCurso INT,
	@CreadoPor VARCHAR (60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
AS
BEGIN TRY	
		BEGIN TRANSACTION
			
			DECLARE @MontoCurso DECIMAL(18,3)
			SET @MontoCurso = (SELECT MontoCurso FROM Cursos WHERE CodigoCurso = @CodigoCurso)

			INSERT INTO CursosEnMatricula
				(CodigoMatricula,CodigoCurso,MontoDeCurso,CreadoPor)
			VALUES
				(@CodigoMatricula,@CodigoCurso,@MontoCurso,@CreadoPor)		

			DECLARE @SumaPreciosDeCursos DECIMAL(18,3)
			SET @SumaPreciosDeCursos = (SELECT SUM(MontoDeCurso) FROM CursosEnMatricula WHERE Activo=1 AND CodigoMatricula = @CodigoMatricula)
			
			UPDATE Matriculas SET MontoDeCurso = @SumaPreciosDeCursos WHERE CodigoMatricula = @CodigoMatricula
			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando Curso en Matricula. Número de Error: ' + @NumeroDeError
		
	END CATCH
GO



CREATE PROCEDURE SP_CursosEnMatricula_Actualizar
    @CodigoMatricula INT,
 	@CodigoCurso INT,
	@FechaModificacion DATE= GETDATE,
	@ModificadoPor VARCHAR (60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteCursoEnMatricula BIT
		
			SET @ExisteCursoEnMatricula = dbo.FN_CursosEnMatricula_VerificaExistenciaPorId(@CodigoMatricula,@CodigoCurso)
		
			IF(@ExisteCursoEnMatricula = 1)
				BEGIN
					UPDATE CursosEnMatricula 
					SET
						CodigoMatricula = @CodigoMatricula,
						CodigoCurso = @CodigoCurso,
						FechaModificacion = @FechaModificacion,
						ModificadoPor = @ModificadoPor
					WHERE 
						CodigoMatricula = @CodigoMatricula AND CodigoCurso = @CodigoCurso

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'El Curso en Matricula: '+	@CodigoMatricula + ' , '+ @CodigoCurso	+', No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizando el Curso en Matricula: '+	@CodigoMatricula + ' , '+ @CodigoCurso	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH	
	GO

	CREATE PROCEDURE SP_CursosEnMatricula_Eliminar
	@CodigoMatricula INT,
	@CodigoCurso INT,
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteAula BIT

			SET @ExisteAula = dbo.FN_CursosEnMatricula_VerificaExistenciaPorId(@CodigoMatricula,@CodigoCurso)

			IF(@ExisteAula = 1)
				BEGIN
					DELETE FROM CursosEnMatricula WHERE CodigoMatricula=@CodigoMatricula AND CodigoCurso = @CodigoCurso
					         
					DECLARE @SumaPreciosDeCursos DECIMAL(18,3)
					SET @SumaPreciosDeCursos = (SELECT SUM(MontoDeCurso) FROM CursosEnMatricula WHERE Activo=1 AND CodigoMatricula = @CodigoMatricula)
			
					UPDATE Matriculas SET MontoDeCurso = @SumaPreciosDeCursos WHERE CodigoMatricula = @CodigoMatricula

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Curso en Matricula: '+	@CodigoMatricula + ' , '+ @CodigoCurso	+'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar Curso en Matricula: '+	@CodigoMatricula + ' , ' + @CodigoCurso	+ '. Número de Error: ' + @NumeroDeError

	END CATCH
	GO
	CREATE VIEW VW_CursosEnMatricula_SeleccionarTodos
	AS 
	SELECT * FROM CursosEnMatricula WHERE Activo = 1
GO

	CREATE FUNCTION FN_CursosEnMatricula_SeleccionarPorId(
	@CodigoMatricula INT,
	@CodigoCurso INT
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_CursosEnMatricula_SeleccionarTodos AS CursosEnMatricula
		WHERE 
			CursosEnMatricula.CodigoCurso = @CodigoCurso
			AND
			CursosEnMatricula.CodigoMatricula = @CodigoMatricula
GO
CREATE FUNCTION FN_CursosEnMatricula_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_CursosEnMatricula_SeleccionarTodos
GO

CREATE TABLE CursosDocentes(
    Codigo INT IDENTITY NOT NULL,
    Curso INT NOT NULL,
    Identificacion VARCHAR(20) NOT NULL,
    CicloLectivo INT NOT NULL,
    Activo BIT DEFAULT 1,
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
    FechaModificacion DATETIME,
    CreadoPor VARCHAR(60),
    ModificadoPor VARCHAR(60),
    CONSTRAINT PK_CursosDocentes PRIMARY KEY (Codigo),
    CONSTRAINT FK_CursosDocentes_CodigoCurso FOREIGN KEY(Curso) REFERENCES Cursos(CodigoCurso),
    CONSTRAINT FK_CursosDocentes_Identificacion FOREIGN KEY(Identificacion) REFERENCES Docentes(Identificacion),
    CONSTRAINT FK_CursosDocentese_CodigoCiclo FOREIGN KEY(CicloLectivo) REFERENCES CiclosLectivos(CodigoCiclo)
)
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Curso impartido por el docente.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
  	@level1type = N'Table',		@level1name = 'CursosDocentes' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Código del curso del docente.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosDocentes',  
   	@level2type = N'Column',	@level2name = 'Codigo' 
GO 
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Curso del docente.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosDocentes',  
   	@level2type = N'Column',	@level2name = 'Curso' 
GO 
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Número de identificación del curso.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosDocentes',  
   	@level2type = N'Column',	@level2name = 'Identificacion' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Ciclo lectivo del curso.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosDocentes',  
   	@level2type = N'Column',	@level2name = 'CicloLectivo' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosDocentes',  
   	@level2type = N'Column',	@level2name = 'Activo' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de creación del registro', 
  	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosDocentes',  
   	@level2type = N'Column',	@level2name = 'FechaCreacion' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosDocentes',  
   	@level2type = N'Column',	@level2name = 'FechaModificacion' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosDocentes',  
   	@level2type = N'Column',	@level2name = 'CreadoPor' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosDocentes', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'
GO


CREATE FUNCTION FN_CursosDocentes_VerificaExistenciaPorId(@Codigo INT)
	RETURNS BIT AS
BEGIN 
	DECLARE @ExisteCursosDocentes BIT;
	SET @ExisteCursosDocentes =(SELECT COUNT(Codigo) FROM CursosDocentes WHERE Codigo = @Codigo)

RETURN @ExisteCursosDocentes
END
GO

CREATE PROCEDURE SP_CursosDocentes_Insertar
		@Curso INT OUTPUT,
		@Identificacion VARCHAR(20),
		@CicloLectivo INT,
		@CreadoPor VARCHAR(60),
		@ExisteError BIT OUTPUT,
		@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO CursosDocentes(Curso,Identificacion,CicloLectivo,CreadoPor)
			VALUES (@Curso,@Identificacion,@CicloLectivo,@CreadoPor)

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando el Curso del Docente. Número de Error: ' + @NumeroDeError
		
	END CATCH
	GO

	CREATE PROCEDURE SP_CursosDocentes_Actualizar
	        @Codigo INT,
			@Curso INT,
			@Identificacion VARCHAR(20),
			@CicloLectivo INT,
			@ModificadoPor VARCHAR(60),
			@ExisteError BIT OUTPUT,
			@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteCursosDocentes BIT
		
			SET @ExisteCursosDocentes = dbo.FN_CursosDocentes_VerificaExistenciaPorId(@Codigo)
		
			IF(@ExisteCursosDocentes = 1)
				BEGIN
					UPDATE CursosDocentes
					SET
						Curso = @Curso,
                        Identificacion = Identificacion,
						CicloLectivo = @CicloLectivo,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						Codigo = @Codigo

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Número de código  ' + @Codigo +'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al actulizar. Número de código: '+ @Codigo	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH
	GO

CREATE PROCEDURE SP_CursosDocentes_Desactivar
	@Codigo INT,
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteCursosDocentes BIT

			SET @ExisteCursosDocentes = dbo.FN_CursosDocentes_VerificaExistenciaPorId(@Codigo)

			IF(@ExisteCursosDocentes = 1)
				BEGIN
					UPDATE CursosDocentes 
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						Codigo = @Codigo

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'El Código: '+	@Codigo	+'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar. Número de Código: '+	@Codigo	+ '. Número de Error: ' + @NumeroDeError

	END CATCH
	GO

		CREATE VIEW VW_CursosDocentes_SeleccionarTodos
AS 
	SELECT * FROM CursosDocentes WHERE Activo = 1
GO

CREATE FUNCTION FN_CursosDocentes_SeleccionarPorId(
	@Codigo INT
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_CursosDocentes_SeleccionarTodos AS CursosDocentes
		WHERE 
			CursosDocentes.Codigo = @Codigo
GO
CREATE FUNCTION FN_CursosDocentes_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_CursosDocentes_SeleccionarTodos
GO

CREATE TABLE Aulas(
    NumeroDeAula INT NOT NULL,
    NombreDeAula VARCHAR(20) NOT NULL,
    Activo BIT DEFAULT 1,
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
    FechaModificacion DATETIME,
    CreadoPor VARCHAR(60),
    ModificadoPor VARCHAR(60),
    CONSTRAINT PK_Aulas PRIMARY KEY(NumeroDeAula)
)
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Aulas donde se imparten los cursos.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
  	@level1type = N'Table',		@level1name = 'Aulas' 
GO 


EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Numero del aula.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Aulas',  
   	@level2type = N'Column',	@level2name = 'NumeroDeAula' 
GO 
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del aula.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Aulas',  
   	@level2type = N'Column',	@level2name = 'NombreDeAula' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Aulas',  
   	@level2type = N'Column',	@level2name = 'Activo' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de creación del registro', 
  	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Aulas',  
   	@level2type = N'Column',	@level2name = 'FechaCreacion' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Aulas',  
   	@level2type = N'Column',	@level2name = 'FechaModificacion' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Aulas',  
   	@level2type = N'Column',	@level2name = 'CreadoPor' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Aulas', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'
GO
CREATE FUNCTION FN_Aulas_VerificaExistenciaPorId (
	@NumeroDeAula INT )
RETURNS BIT AS
BEGIN
	DECLARE @ExisteAula BIT;
	
	SET @ExisteAula = (SELECT count(NumeroDeAula) FROM Aulas WHERE NumeroDeAula = @NumeroDeAula)

	 
    RETURN @ExisteAula
END
GO


CREATE PROCEDURE SP_Aulas_Insertar
	@NumeroDeAula INT,
	@NombreDeAula VARCHAR(20),
	@CreadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
AS
BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO Aulas(NumeroDeAula, NombreDeAula,CreadoPor)
			VALUES(@NumeroDeAula, @NombreDeAula, @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando el Aula. Número de Error: ' + @NumeroDeError
		
	END CATCH
GO

CREATE PROCEDURE SP_Aulas_Actualizar
   	@NumeroDeAula INT,
	@NombreDeAula VARCHAR(20),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteAula BIT
		
			SET @ExisteAula = dbo.FN_Aulas_VerificaExistenciaPorId(@NumeroDeAula)
		
			IF(@ExisteAula = 1)
				BEGIN
					UPDATE Aulas 
					SET
						NumeroDeAula = @NumeroDeAula,
						NombreDeAula = @NombreDeAula,
						ModificadoPor = @ModificadoPor,
						FechaModificacion = GETDATE()
						
					WHERE 
						NumeroDeAula = @NumeroDeAula

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Aula: '+	@NumeroDeAula	+' , No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizando el Aula: '+	@NumeroDeAula	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH	
	GO
	
	CREATE PROCEDURE SP_Aulas_Desactivar
	@NumeroDeAula INT,
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteAula BIT

			SET @ExisteAula = dbo.FN_Aulas_VerificaExistenciaPorId(@NumeroDeAula)

			IF(@ExisteAula = 1)
				BEGIN
					UPDATE Aulas 
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						NumeroDeAula = @NumeroDeAula

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Aula: '+	@NumeroDeAula	+', No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar el Aula: '+	@NumeroDeAula	+ '. Número de Error: ' + @NumeroDeError

	END CATCH
GO

CREATE VIEW VW_Aulas_SeleccionarTodos
AS 
	SELECT * FROM Aulas WHERE Activo = 1
GO

CREATE FUNCTION FN_Aulas_SeleccionarPorId(
	@NumeroDeAula INT
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Aulas_SeleccionarTodos AS Aulas
		WHERE 
			Aulas.NumeroDeAula = @NumeroDeAula
GO
CREATE FUNCTION FN_Aulas_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Aulas_SeleccionarTodos
GO

CREATE TABLE CursosEnAulas(
    CodigoCurso INT NOT NULL,
    NumeroDeAula INT NOT NULL,
    CodigoCiclo INT NOT NULL,
    DiaLectivo VARCHAR(10) NOT NULL,
    HoraInicio VARCHAR(10) NOT NULL,
    HoraFin VARCHAR(10) NOT NULL,
    Activo BIT DEFAULT 1,
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
    FechaModificacion DATETIME,
    CreadoPor VARCHAR(60),
    ModificadoPor VARCHAR(60),
    CONSTRAINT FK_CursosEnAulas_CodigoCurso FOREIGN KEY(CodigoCurso) REFERENCES Cursos(CodigoCurso),
    CONSTRAINT FK_CursosEnAulas_NumeroDeAula FOREIGN KEY(NumeroDeAula) REFERENCES Aulas(NumeroDeAula),
    CONSTRAINT FK_CursosEnAulas_CodigoCiclo FOREIGN KEY(CodigoCiclo) REFERENCES CiclosLectivos(CodigoCiclo),
    CONSTRAINT PK_CursosEnAulas PRIMARY KEY(NumeroDeAula,CodigoCurso,CodigoCiclo)
)
GO


EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Cursos que se imparten en las aulas.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
  	@level1type = N'Table',		@level1name = 'CursosEnAulas' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Codigo del curso del curso.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnAulas',  
   	@level2type = N'Column',	@level2name = 'CodigoCurso' 
GO 
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Numero del aula.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnAulas',  
   	@level2type = N'Column',	@level2name = 'NumeroDeAula' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Dia lectivo del curso.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnAulas',  
   	@level2type = N'Column',	@level2name = 'DiaLectivo' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Hora de inicio de los cursos.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnAulas',  
   	@level2type = N'Column',	@level2name = 'HoraInicio' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Hora del fín de los cursos.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnAulas',  
   	@level2type = N'Column',	@level2name = 'HoraFin' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Codigo del ciclo.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnAulas',  
   	@level2type = N'Column',	@level2name = 'CodigoCiclo' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnAulas',  
   	@level2type = N'Column',	@level2name = 'Activo' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de creación del registro', 
  	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnAulas',  
   	@level2type = N'Column',	@level2name = 'FechaCreacion' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnAulas',  
   	@level2type = N'Column',	@level2name = 'FechaModificacion' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnAulas',  
   	@level2type = N'Column',	@level2name = 'CreadoPor' 
GO 

EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnAulas', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'
GO

CREATE FUNCTION FN_CursosEnAulas_VerificaExistenciaPorId (
	@NumeroDeAula INT,@CodigoCurso INT,@CodigoCiclo INT )
RETURNS BIT AS
BEGIN
	DECLARE @ExisteCursoEnAula BIT;
	
	SET @ExisteCursoEnAula = (SELECT count(NumeroDeAula) FROM CursosEnAulas WHERE NumeroDeAula = @NumeroDeAula AND CodigoCurso = @CodigoCurso AND CodigoCiclo = @CodigoCiclo)
    
    RETURN @ExisteCursoEnAula
END
GO


CREATE PROCEDURE SP_CursosEnAulas_Insertar
		@CodigoCurso INT,
		@NumeroDeAula INT,
		@DiaLectivo VARCHAR(10),
		@HoraInicio VARCHAR(10),
		@HoraFin VARCHAR(10),
		@CodigoCiclo INT,
		@CreadoPor VARCHAR(60),
		@ExisteError BIT OUTPUT,
		@DetalleError VARCHAR(60) OUTPUT
AS
BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO CursosEnAulas
	(CodigoCurso, NumeroDeAula,DiaLectivo,HoraInicio,HoraFin,CodigoCiclo,CreadoPor)
VALUES(@CodigoCurso, @NumeroDeAula, @DiaLectivo, @HoraInicio, @HoraFin, @CodigoCiclo, @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando Cursos en Aulas. Número de Error: ' + @NumeroDeError
		
	END CATCH
GO

CREATE PROCEDURE SP_CursosEnAulas_Actualizar
   		@CodigoCurso INT,
		@NumeroDeAula INT,
		@DiaLectivo VARCHAR(10),
		@HoraInicio VARCHAR(10),
		@HoraFin VARCHAR(10),
		@CodigoCiclo INT,
		@ModificadoPor VARCHAR(60),
		@ExisteError BIT OUTPUT,
		@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteCursoEnAula BIT
		
			SET @ExisteCursoEnAula = dbo.FN_CursosEnAulas_VerificaExistenciaPorId(@NumeroDeAula,@CodigoCurso,@CodigoCiclo)
		
			IF(@ExisteCursoEnAula = 1)
				BEGIN
					UPDATE CursosEnAulas 
					SET
						CodigoCurso = @CodigoCurso, 
						NumeroDeAula = @NumeroDeAula,
						DiaLectivo = @DiaLectivo,
						HoraInicio = @HoraInicio,
						HoraFin = @HoraFin,
						CodigoCiclo = @CodigoCiclo,
						ModificadoPor = @ModificadoPor,
						FechaModificacion = GETDATE()
						
					WHERE 
						NumeroDeAula = @NumeroDeAula AND CodigoCurso = @CodigoCurso AND CodigoCiclo = @CodigoCiclo

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Curso con número de Aula: '+	@NumeroDeAula +', Código de Curso: ' + @CodigoCurso	+ ' y Codigo de Ciclo: '+ @CodigoCiclo + '. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizando Cursos en Aulas: '+	@NumeroDeAula +', Código de Curso: ' + @CodigoCurso	+ ' y Codigo de Ciclo: '+ @CodigoCiclo +' Error: ' + @NumeroDeError		

	END CATCH	
	GO
	
	CREATE PROCEDURE SP_CursosEnAulas_Desactivar
		@CodigoCurso INT,
		@NumeroDeAula INT,
		@CodigoCiclo INT,
		@ModificadoPor VARCHAR(60),
		@ExisteError BIT OUTPUT,
		@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteAula BIT
			DECLARE @ExisteCursoEnAula BIT

			SET @ExisteCursoEnAula = dbo.FN_CursosEnAulas_VerificaExistenciaPorId(@NumeroDeAula,@CodigoCurso,@CodigoCiclo)

			IF(@ExisteAula = 1)
				BEGIN
					UPDATE CursosEnAulas
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						NumeroDeAula = @NumeroDeAula AND CodigoCurso = @CodigoCurso AND CodigoCiclo = @CodigoCiclo

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Curso en Aula: ' +	@NumeroDeAula+', ' + @CodigoCurso+', ' + @CodigoCiclo	+', No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar Curso En Aula: '+	@NumeroDeAula+', ' + @CodigoCurso+', ' + @CodigoCiclo	+'. Error: ' + @NumeroDeError

	END CATCH
GO

CREATE VIEW VW_CursosEnAulas_SeleccionarTodos
AS 
	SELECT * FROM CursosEnAulas WHERE Activo = 1
GO

CREATE FUNCTION FN_CursosEnAulas_SeleccionarPorId(
	@NumeroDeAula INT,
	@CodigoCurso INT,
	@CodigoCiclo INT
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_CursosEnAulas_SeleccionarTodos AS CursosEnAulas
		WHERE 
			CursosEnAulas.NumeroDeAula = @NumeroDeAula 
			AND 
				CursosEnAulas.CodigoCurso = @CodigoCurso
			AND 
				CursosEnAulas.CodigoCiclo = @CodigoCiclo
GO
CREATE FUNCTION FN_CursosEnAulas_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_CursosEnAulas_SeleccionarTodos
GO