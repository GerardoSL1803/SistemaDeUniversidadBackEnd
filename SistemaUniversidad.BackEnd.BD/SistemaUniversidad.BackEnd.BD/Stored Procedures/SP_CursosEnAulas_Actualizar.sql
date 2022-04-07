CREATE PROCEDURE SP_CursosEnAulas_Actualizar
   		@CodigoCurso INT,
		@NumeroDeAula INT,
		@DiaLectivo VARCHAR(10),
		@HoraInicio VARCHAR(10),
		@HoraFin VARCHAR(10),
		@CodigoCiclo INT,
		@ModificadoPor VARCHAR(60),
		@ExisteError BIT OUTPUT,
		@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteCursoEnAula BIT
		
			SET @ExisteCursoEnAula = dbo.FN_CursosEnAulas_VerificaExistenciaPorId(@NumeroDeAula,@CodigoCurso,@CodigoCiclo)
		
			IF(@ExisteCursoEnAula = 1)
				BEGIN
					UPDATE CursosEnAulas 
					SET
						CodigoCurso = @CodigoCurso, 
						NumeroDeAula = @NumeroDeAula,
						DiaLectivo = @DiaLectivo,
						HoraInicio = @HoraInicio,
						HoraFin = @HoraFin,
						CodigoCiclo = @CodigoCiclo,
						ModificadoPor = @ModificadoPor,
						FechaModificacion = GETDATE()
						
					WHERE 
						NumeroDeAula = @NumeroDeAula AND CodigoCurso = @CodigoCurso AND CodigoCiclo = @CodigoCiclo

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Curso con número de Aula: '+	@NumeroDeAula +', Código de Curso: ' + @CodigoCurso	+ ' y Codigo de Ciclo: '+ @CodigoCiclo + '. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizando Cursos en Aulas: '+	@NumeroDeAula +', Código de Curso: ' + @CodigoCurso	+ ' y Codigo de Ciclo: '+ @CodigoCiclo +' Error: ' + @NumeroDeError		

	END CATCH