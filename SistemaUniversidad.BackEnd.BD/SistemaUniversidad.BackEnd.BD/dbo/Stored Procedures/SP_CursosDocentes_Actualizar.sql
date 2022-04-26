CREATE PROCEDURE SP_CursosDocentes_Actualizar
	        @Codigo INT,
			@Curso INT,
			@Identificacion VARCHAR(20),
			@CicloLectivo INT,
			@ModificadoPor VARCHAR(60),
			@ExisteError BIT OUTPUT,
			@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteCursosDocentes BIT
		
			SET @ExisteCursosDocentes = dbo.FN_CursosDocentes_VerificaExistenciaPorId(@Codigo)
		
			IF(@ExisteCursosDocentes = 1)
				BEGIN
					UPDATE CursosDocentes
					SET
						Curso = @Curso,
                        Identificacion = Identificacion,
						CicloLectivo = @CicloLectivo,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						Codigo = @Codigo

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Número de código  ' + CONVERT(VARCHAR , @Codigo) +'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al actulizar. Número de código: '+ CONVERT(VARCHAR , @Codigo)	+ '. Número de Error: ' +  CONVERT(VARCHAR ,@NumeroDeError)	

	END CATCH