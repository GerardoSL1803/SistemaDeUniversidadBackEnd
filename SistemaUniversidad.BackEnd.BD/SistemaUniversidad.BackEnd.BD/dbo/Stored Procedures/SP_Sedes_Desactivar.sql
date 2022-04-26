CREATE PROCEDURE SP_Sedes_Desactivar
	@CodigoSede INT OUTPUT,
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteAula BIT

			SET @ExisteAula = dbo.FN_Sedes_VerificaExistenciaPorId(@CodigoSede)

			IF(@ExisteAula = 1)
				BEGIN
					UPDATE Sedes 
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						CodigoSede = @CodigoSede

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Aula: '+	CONVERT(VARCHAR , @CodigoSede)	+'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar la sede: '+	CONVERT(VARCHAR , @CodigoSede)	+ '. Número de Error: ' +  CONVERT(VARCHAR ,@NumeroDeError)

	END CATCH