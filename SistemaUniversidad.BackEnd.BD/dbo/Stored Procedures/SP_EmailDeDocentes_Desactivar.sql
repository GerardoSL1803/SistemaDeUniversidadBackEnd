CREATE PROCEDURE SP_EmailDeDocentes_Desactivar
	@Identificacion VARCHAR (20) OUTPUT,
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteEmailDeDocente BIT

			SET @ExisteEmailDeDocente = dbo.FN_EmailDeDocentes_VerificaExistenciaPorId(@Identificacion)

			IF(@ExisteEmailDeDocente = 1)
				BEGIN
					UPDATE EmailDeDocentes 
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						Identificacion = @Identificacion

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Email del Docente: '+	@Identificacion	+'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar el Email del Docente '+	@Identificacion	+ '. Número de Error: ' +  CONVERT(VARCHAR ,@NumeroDeError)

	END CATCH