CREATE PROCEDURE SP_CursosDocentes_Desactivar
	@Codigo INT,
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteCursosDocentes BIT

			SET @ExisteCursosDocentes = dbo.FN_CursosDocentes_VerificaExistenciaPorId(@Codigo)

			IF(@ExisteCursosDocentes = 1)
				BEGIN
					UPDATE CursosDocentes 
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						Codigo = @Codigo

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'El Código: '+	CONVERT(VARCHAR , @Codigo)	+'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar. Número de Código: '+	CONVERT(VARCHAR , @Codigo)	+ '. Número de Error: ' + @NumeroDeError

	END CATCH