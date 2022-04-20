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