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
		SET @DetalleError = 'Error insertando la Universidad. Número de Error: ' +  CONVERT(VARCHAR ,@NumeroDeError)
		
	END CATCH