CREATE PROCEDURE SP_CursosEnAulas_Insertar
		@CodigoCurso INT,
		@NumeroDeAula INT,
		@DiaLectivo VARCHAR(10),
		@HoraInicio VARCHAR(10),
		@HoraFin VARCHAR(10),
		@CodigoCiclo INT,
		@CreadoPor VARCHAR(60),
		@ExisteError BIT OUTPUT,
		@DetalleError VARCHAR(60) OUTPUT
AS
BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO CursosEnAulas
	(CodigoCurso, NumeroDeAula,DiaLectivo,HoraInicio,HoraFin,CodigoCiclo,CreadoPor)
VALUES(@CodigoCurso, @NumeroDeAula, @DiaLectivo, @HoraInicio, @HoraFin, @CodigoCiclo, @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando Cursos en Aulas. Número de Error: ' + @NumeroDeError
		
	END CATCH