CREATE FUNCTION FN_CursosEnMatricula_VerificaExistenciaPorId (
	@CodigoMatricula INT,
	@CodigoCurso INT )
RETURNS BIT AS
BEGIN
	DECLARE @ExisteCursosEnMatricula BIT;
	
	SET @ExisteCursosEnMatricula = (SELECT count(CodigoMatricula) FROM CursosEnMatricula WHERE CodigoMatricula = @CodigoMatricula AND CodigoCurso = @CodigoCurso)
	 
    RETURN @ExisteCursosEnMatricula
END