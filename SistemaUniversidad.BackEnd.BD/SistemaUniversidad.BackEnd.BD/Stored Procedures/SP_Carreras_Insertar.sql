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