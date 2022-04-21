CREATE PROCEDURE SP_CursosEnAulas_Desactivar
		@CodigoCurso INT,
		@NumeroDeAula INT,
		@CodigoCiclo INT,
		@ModificadoPor VARCHAR(60),
		@ExisteError BIT OUTPUT,
		@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteAula BIT
			DECLARE @ExisteCursoEnAula BIT

			SET @ExisteCursoEnAula = dbo.FN_CursosEnAulas_VerificaExistenciaPorId(@NumeroDeAula,@CodigoCurso,@CodigoCiclo)

			IF(@ExisteAula = 1)
				BEGIN
					UPDATE CursosEnAulas
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						NumeroDeAula = @NumeroDeAula AND CodigoCurso = @CodigoCurso AND CodigoCiclo = @CodigoCiclo

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Curso con número de Aula: '+	CONVERT(VARCHAR , @NumeroDeAula) +', Código de Curso: ' + CONVERT(VARCHAR , @CodigoCurso)	+ ' y Codigo de Ciclo: '+ CONVERT(VARCHAR , @CodigoCiclo) + '. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar Curso En Aula: '+	CONVERT(VARCHAR , @NumeroDeAula) +', Código de Curso: ' + CONVERT(VARCHAR , @CodigoCurso)	+ ' y Codigo de Ciclo: '+  CONVERT(VARCHAR , @CodigoCiclo) +' Error: ' + @NumeroDeError		

	END CATCH