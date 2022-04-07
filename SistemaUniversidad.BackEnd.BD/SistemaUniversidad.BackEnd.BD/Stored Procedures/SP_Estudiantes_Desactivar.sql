CREATE PROCEDURE SP_Estudiantes_Desactivar
	@Identificacion VARCHAR (20),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteCarrera BIT

			SET @ExisteCarrera = dbo.FN_Estudiantes_VerificaExistenciaPorId(@Identificacion)

			IF(@ExisteCarrera = 1)
				BEGIN
					UPDATE Estudiantes 
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
					SET @DetalleError = 'Estudiante: '+ @Identificacion +'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar el Estudiante: '+	@Identificacion	+ '. Número de Error: ' + @NumeroDeError

	END CATCH