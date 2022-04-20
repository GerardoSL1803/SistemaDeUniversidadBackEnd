CREATE PROCEDURE SP_Matriculas_Actualizar
    @CodigoMatricula INT,
	@CodigoCiclo INT,
	@IdentificacionEstudiante VARCHAR(20),
	@MontoDeCurso DECIMAL(18,3),
	@MontoMatricula DECIMAL(18,3),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteMatricula BIT
		
			SET @ExisteMatricula = dbo.FN_Matriculas_VerificaExistenciaPorId(@CodigoMatricula)
		
			IF(@ExisteMatricula = 1)
				BEGIN
					UPDATE Matriculas 
					SET
						IdentificacionEstudiante = @IdentificacionEstudiante,
						MontoDeCurso = @MontoDeCurso,
						MontoMatricula = @MontoMatricula,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						CodigoMatricula = @CodigoMatricula

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Matricula: '+	@CodigoMatricula	+' , No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizando la Matricula: '+	@CodigoMatricula	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH