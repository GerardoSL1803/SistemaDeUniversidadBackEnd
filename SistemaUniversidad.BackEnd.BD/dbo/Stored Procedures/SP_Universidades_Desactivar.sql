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
					SET @DetalleError = 'Universidad: '+ CONVERT(VARCHAR , @CodigoUniversidad) +'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar la Universidad: '+	CONVERT(VARCHAR , @CodigoUniversidad)	+ '. Número de Error: ' +  CONVERT(VARCHAR ,@NumeroDeError)

	END CATCH