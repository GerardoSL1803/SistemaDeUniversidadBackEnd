CREATE PROCEDURE SP_Estudiantes_Actualizar
	@Identificacion VARCHAR(20),
	@Nombres VARCHAR(50),
	@Apellidos VARCHAR(50),
	@Telefono VARCHAR(20),
	@TelefonoSecundario VARCHAR(20),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteEstudiante BIT
		
			SET @ExisteEstudiante = dbo.FN_Estudiantes_VerificaExistenciaPorId(@Identificacion)
		
			IF(@ExisteEstudiante = 1)
				BEGIN
					UPDATE Estudiantes
					SET
						Nombres = @Nombres,
						Apellidos = @Apellidos,
						Telefono = @Telefono,
						TelefonoSecundario = TelefonoSecundario,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						Identificacion = @Identificacion

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Estudiante: '+@Identificacion	+'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al actualizar el Estudiante: '+	@Identificacion	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH