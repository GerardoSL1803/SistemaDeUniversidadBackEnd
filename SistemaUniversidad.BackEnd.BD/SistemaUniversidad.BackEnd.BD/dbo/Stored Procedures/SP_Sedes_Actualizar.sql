CREATE PROCEDURE SP_Sedes_Actualizar
    @CodigoSede INT,
    @CodigoUniversidad INT,
    @Direccion VARCHAR(500),
    @Email VARCHAR(20),
    @Telefono VARCHAR(20),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteSede BIT
		
			SET @ExisteSede = dbo.FN_Sedes_VerificaExistenciaPorId(@CodigoSede)
		
			IF(@ExisteSede = 1)
				BEGIN
					UPDATE Sedes
					SET
						CodigoUniversidad=@CodigoUniversidad,
						Direccion = @Direccion,
						Email = @Email,
						Telefono=@Telefono,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						CodigoSede = @CodigoSede

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Sede: '+	CONVERT(VARCHAR , @CodigoSede)	+'. No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al actualizar la sede: '+	CONVERT(VARCHAR , @CodigoSede)	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH