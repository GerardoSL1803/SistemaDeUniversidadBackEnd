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
					SET @DetalleError = 'Ciclo Lectivo: '+	CONVERT(VARCHAR , @CodigoCiclo)	+'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar el Ciclo Lectivo '+	CONVERT(VARCHAR , @CodigoCiclo)	+ '. Número de Error: ' + @NumeroDeError

	END CATCH