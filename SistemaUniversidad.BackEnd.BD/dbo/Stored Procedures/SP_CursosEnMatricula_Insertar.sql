CREATE PROCEDURE SP_CursosEnMatricula_Insertar
	@CodigoMatricula INT,
 	@CodigoCurso INT,
	@CreadoPor VARCHAR (60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
AS
BEGIN TRY	
		BEGIN TRANSACTION
			
			DECLARE @MontoCurso DECIMAL(18,3)
			SET @MontoCurso = (SELECT MontoCurso FROM Cursos WHERE CodigoCurso = @CodigoCurso)

			INSERT INTO CursosEnMatricula
				(CodigoMatricula,CodigoCurso,MontoDeCurso,CreadoPor)
			VALUES
				(@CodigoMatricula,@CodigoCurso,@MontoCurso,@CreadoPor)		

			DECLARE @SumaPreciosDeCursos DECIMAL(18,3)
			SET @SumaPreciosDeCursos = (SELECT SUM(MontoDeCurso) FROM CursosEnMatricula WHERE Activo=1 AND CodigoMatricula = @CodigoMatricula)
			
			UPDATE Matriculas SET MontoDeCurso = @SumaPreciosDeCursos WHERE CodigoMatricula = @CodigoMatricula
			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando Curso en Matricula. Número de Error: ' +  CONVERT(VARCHAR ,@NumeroDeError)
		
	END CATCH