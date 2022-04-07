CREATE PROCEDURE SP_EmailDeEstudiantes_Actualizar
    @Identificacion VARCHAR(20),
    @EmailUniversidad VARCHAR(50),
    @EmailPersonal VARCHAR(50),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteAula BIT
		
			SET @ExisteAula = dbo.FN_EmailDeEstudiantes_VerificaExistenciaPorId(@Identificacion)
		
			IF(@ExisteAula = 1)
				BEGIN
					UPDATE EmailDeEstudiantes
					SET
						EmailUniversidad = @EmailUniversidad,
						EmailPersonal = @EmailPersonal,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						Identificacion = @Identificacion

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Estudiante: '+	@Identificacion	+'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al actualizar los email del estudiante: '+	@Identificacion	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH