CREATE PROCEDURE SP_CursosEnMatricula_Eliminar
	@CodigoMatricula INT,
	@CodigoCurso INT,
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteAula BIT

			SET @ExisteAula = dbo.FN_CursosEnMatricula_VerificaExistenciaPorId(@CodigoMatricula,@CodigoCurso)

			IF(@ExisteAula = 1)
				BEGIN
					DELETE FROM CursosEnMatricula WHERE CodigoMatricula=@CodigoMatricula AND CodigoCurso = @CodigoCurso
					         
					DECLARE @SumaPreciosDeCursos DECIMAL(18,3)
					SET @SumaPreciosDeCursos = (SELECT SUM(MontoDeCurso) FROM CursosEnMatricula WHERE Activo=1 AND CodigoMatricula = @CodigoMatricula)
			
					UPDATE Matriculas SET MontoDeCurso = @SumaPreciosDeCursos WHERE CodigoMatricula = @CodigoMatricula

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
		SET @DetalleError = 'Error al eliminar Curso en Matricula: '+	CONVERT(VARCHAR , @CodigoMatricula) + ' , '+ CONVERT(VARCHAR , @CodigoCurso)	+ '. Número de Error: ' +  CONVERT(VARCHAR ,@NumeroDeError)		

	END CATCH