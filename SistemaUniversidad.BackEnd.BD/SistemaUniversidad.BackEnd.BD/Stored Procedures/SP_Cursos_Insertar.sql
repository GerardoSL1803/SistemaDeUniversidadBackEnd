CREATE PROCEDURE SP_Cursos_Insertar
	 @Nombre VARCHAR(20),
     @MontoCurso DECIMAL(18,3),
	 @CreadoPor VARCHAR(60),
	 @ExisteError BIT OUTPUT,
	 @DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO Cursos(Nombre,MontoCurso, CreadoPor)
			VALUES (@Nombre,@MontoCurso ,@CreadoPor)

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando el Curso. Número de Error: ' + @NumeroDeError
		
	END CATCH