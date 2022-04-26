CREATE PROCEDURE SP_EmailDeEstudiantes_Desactivar
	@Identificacion VARCHAR(20),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteEmailDeEstudiante BIT

			SET @ExisteEmailDeEstudiante = dbo.FN_EmailDeEstudiantes_VerificaExistenciaPorId(@Identificacion)

			IF(@ExisteEmailDeEstudiante = 1)
				BEGIN
					UPDATE EmailDeEstudiantes
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
					SET @DetalleError = 'Email del estudiante: '+	@Identificacion	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar Email de estudiante: '+	@Identificacion	+ '. Número de Error: ' +  CONVERT(VARCHAR ,@NumeroDeError)

	END CATCH