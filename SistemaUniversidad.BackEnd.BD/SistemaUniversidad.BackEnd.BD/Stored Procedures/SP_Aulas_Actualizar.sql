CREATE PROCEDURE SP_Aulas_Actualizar
   	@NumeroDeAula INT,
	@NombreDeAula VARCHAR(20),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteAula BIT
		
			SET @ExisteAula = dbo.FN_Aulas_VerificaExistenciaPorId(@NumeroDeAula)
		
			IF(@ExisteAula = 1)
				BEGIN
					UPDATE Aulas 
					SET
						NumeroDeAula = @NumeroDeAula,
						NombreDeAula = @NombreDeAula,
						ModificadoPor = @ModificadoPor,
						FechaModificacion = GETDATE()
						
					WHERE 
						NumeroDeAula = @NumeroDeAula

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Aula: '+	@NumeroDeAula	+' , No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizando el Aula: '+	@NumeroDeAula	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH