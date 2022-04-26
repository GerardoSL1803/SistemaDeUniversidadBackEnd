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
		SET @DetalleError = 'Error insertando el Email del Estudiante. Número de Error: ' +  CONVERT(VARCHAR ,@NumeroDeError)
		
	END CATCH