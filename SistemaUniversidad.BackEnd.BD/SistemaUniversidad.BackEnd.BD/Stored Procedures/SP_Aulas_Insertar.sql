CREATE PROCEDURE SP_Aulas_Insertar
	@NumeroDeAula INT,
	@NombreDeAula VARCHAR(20),
	@CreadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
AS
BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO Aulas(NumeroDeAula, NombreDeAula,CreadoPor)
			VALUES(@NumeroDeAula, @NombreDeAula, @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando el Aula. Número de Error: ' + @NumeroDeError
		
	END CATCH