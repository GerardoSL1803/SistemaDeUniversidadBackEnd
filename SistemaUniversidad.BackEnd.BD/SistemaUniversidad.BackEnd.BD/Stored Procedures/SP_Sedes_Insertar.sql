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