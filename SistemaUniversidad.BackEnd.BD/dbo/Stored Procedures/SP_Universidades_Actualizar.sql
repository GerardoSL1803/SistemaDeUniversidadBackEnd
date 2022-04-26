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
					SET @DetalleError = 'Univerisidad: '+	CONVERT(VARCHAR , @CodigoUniversidad)	+'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al actualizar la Universidad: '+	CONVERT(VARCHAR , @CodigoUniversidad)	+ '. Número de Error: ' +  CONVERT(VARCHAR ,@NumeroDeError)		

	END CATCH