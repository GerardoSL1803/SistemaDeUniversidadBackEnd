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
					SET @DetalleError = 'Aula: '+	CONVERT(VARCHAR , @NumeroDeAula)	+', No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar el Aula: '+	CONVERT(VARCHAR , @NumeroDeAula)	+ '. Número de Error: ' + @NumeroDeError

	END CATCH