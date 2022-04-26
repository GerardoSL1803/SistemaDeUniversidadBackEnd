CREATE PROCEDURE SP_Cursos_Actualizar
   	@CodigoCurso INT,
	@CodigoCarrera INT,
	@Nombre VARCHAR(20),
    @MontoCurso DECIMAL(18,3),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteCurso BIT
		
			SET @ExisteCurso = dbo.FN_Cursos_VerificaExistenciaPorId(@CodigoCurso)
		
			IF(@ExisteCurso = 1)
				BEGIN
					UPDATE Cursos
					SET
					    CodigoCarrera = @CodigoCarrera,
						Nombre = @Nombre,
						MontoCurso = @MontoCurso,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						CodigoCurso = @CodigoCurso

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Curso: '+ CONVERT(VARCHAR , @CodigoCurso)	+'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al actualizar el Curso: '+	CONVERT(VARCHAR , @CodigoCurso)	+ '. Número de Error: ' +  CONVERT(VARCHAR ,@NumeroDeError)		

	END CATCH