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