CREATE FUNCTION FN_Matriculas_VerificaExistenciaPorId(@CodigoMatricula INT)
RETURNS BIT AS
BEGIN
	DECLARE @ExisteMatricula BIT;
	
	SET @ExisteMatricula = (SELECT count(CodigoMatricula) FROM Matriculas WHERE CodigoMatricula = @CodigoMatricula)
	 
    RETURN @ExisteMatricula
END