CREATE PROCEDURE SP_EmailDeDocentes_Actualizar
		@Identificacion VARCHAR(20),
		@EmailUniversidad VARCHAR(50),
		@EmailPersonal VARCHAR(50),
		@ModificadoPor VARCHAR(60),
		@ExisteError BIT OUTPUT,
		@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteEmailDeDocente BIT
		
			SET @ExisteEmailDeDocente = dbo.FN_EmailDeDocentes_VerificaExistenciaPorId(@Identificacion)
		
			IF(@ExisteEmailDeDocente = 1)
				BEGIN
					UPDATE EmailDeDocentes
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
					SET @DetalleError = 'Email de Docente: ' + @Identificacion +'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al actulizar el Email del Docente: '+ @Identificacion	+ '. Número de Error: ' +  CONVERT(VARCHAR ,@NumeroDeError)		

	END CATCH