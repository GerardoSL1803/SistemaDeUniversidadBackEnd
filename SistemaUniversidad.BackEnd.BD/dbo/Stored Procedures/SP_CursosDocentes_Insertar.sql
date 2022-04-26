CREATE PROCEDURE SP_CursosDocentes_Insertar
		@Curso INT OUTPUT,
		@Identificacion VARCHAR(20),
		@CicloLectivo INT,
		@CreadoPor VARCHAR(60),
		@ExisteError BIT OUTPUT,
		@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO CursosDocentes(Curso,Identificacion,CicloLectivo,CreadoPor)
			VALUES (@Curso,@Identificacion,@CicloLectivo,@CreadoPor)

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando el Curso del Docente. Número de Error: ' +  CONVERT(VARCHAR ,@NumeroDeError)
		
	END CATCH