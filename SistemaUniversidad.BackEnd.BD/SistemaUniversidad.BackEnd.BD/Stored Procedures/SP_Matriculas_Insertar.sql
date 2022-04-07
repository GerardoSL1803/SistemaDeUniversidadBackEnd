CREATE PROCEDURE SP_Matriculas_Insertar
	@CodigoCiclo INT,
	@IdentificacionEstudiante VARCHAR(20),
	@MontoMatricula DECIMAL(18,3),
	@CreadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
AS
BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO Matriculas(CodigoCiclo, IdentificacionEstudiante, MontoMatricula,CreadoPor)
			VALUES(@CodigoCiclo, @IdentificacionEstudiante, @MontoMatricula,@CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando la Matricula. Número de Error: ' + @NumeroDeError
		
	END CATCH