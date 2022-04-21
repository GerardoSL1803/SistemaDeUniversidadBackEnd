CREATE PROCEDURE SP_CursosEnMatricula_Actualizar
    @CodigoMatricula INT,
 	@CodigoCurso INT,
	@FechaModificacion DATE= GETDATE,
	@ModificadoPor VARCHAR (60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteCursoEnMatricula BIT
		
			SET @ExisteCursoEnMatricula = dbo.FN_CursosEnMatricula_VerificaExistenciaPorId(@CodigoMatricula,@CodigoCurso)
		
			IF(@ExisteCursoEnMatricula = 1)
				BEGIN
					UPDATE CursosEnMatricula 
					SET
						CodigoMatricula = @CodigoMatricula,
						CodigoCurso = @CodigoCurso,
						FechaModificacion = @FechaModificacion,
						ModificadoPor = @ModificadoPor
					WHERE 
						CodigoMatricula = @CodigoMatricula AND CodigoCurso = @CodigoCurso

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'El Curso en Matricula: '+	CONVERT(VARCHAR , @CodigoMatricula) + ' , '+ CONVERT(VARCHAR , @CodigoCurso)	+', No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizando el Curso en Matricula: '+	CONVERT(VARCHAR , @CodigoMatricula) + ' , '+ CONVERT(VARCHAR , @CodigoCurso)	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH