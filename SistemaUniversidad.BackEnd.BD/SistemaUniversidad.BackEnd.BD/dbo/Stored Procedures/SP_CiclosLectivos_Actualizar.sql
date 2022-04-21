CREATE PROCEDURE SP_CiclosLectivos_Actualizar
			@CodigoCiclo INT,
			@NombreCiclo VARCHAR(20),
			@FechaInicio DATE,
			@FechaFin DATE,
			@ModificadoPor VARCHAR(60),
			@ExisteError BIT OUTPUT,
			@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteCodigoCiclo BIT
		
			SET @ExisteCodigoCiclo = dbo.FN_CiclosLectivos_VerificaExistenciaPorId(@CodigoCiclo)
		
			IF(@ExisteCodigoCiclo = 1)
				BEGIN
					UPDATE CiclosLectivos
					SET
						NombreCiclo = @NombreCiclo,
						FechaInicio = @FechaInicio,
						FechaFin = @FechaFin,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						CodigoCiclo = @CodigoCiclo

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'El Ciclo Lectivo: ' + CONVERT(VARCHAR , @CodigoCiclo) +'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al actulizar el Ciclo Lectivo: '+ CONVERT(VARCHAR , @CodigoCiclo)	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH