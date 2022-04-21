CREATE PROCEDURE SP_Carreras_Actualizar
   	@CodigoCarrera INT,
	@Nombre VARCHAR(50),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteCarrera BIT
		
			SET @ExisteCarrera = dbo.FN_Carreras_VerificaExistenciaPorId(@CodigoCarrera)
		
			IF(@ExisteCarrera = 1)
				BEGIN
					UPDATE Carreras
					SET
						Nombre = @Nombre,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						CodigoCarrera = @CodigoCarrera

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Carrera: '+ CONVERT(VARCHAR , @CodigoCarrera)	+'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al actualizar la Carrera: '+	CONVERT(VARCHAR , @CodigoCarrera)	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH