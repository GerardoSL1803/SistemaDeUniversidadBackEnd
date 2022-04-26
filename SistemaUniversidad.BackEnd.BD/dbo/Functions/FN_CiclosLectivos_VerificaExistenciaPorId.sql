CREATE FUNCTION FN_CiclosLectivos_VerificaExistenciaPorId(@CodigoCiclo INT)
	RETURNS BIT AS
BEGIN 
	DECLARE @ExisteCodigoCiclo BIT;
	SET @ExisteCodigoCiclo =(SELECT COUNT(CodigoCiclo) FROM CiclosLectivos WHERE CodigoCiclo = @CodigoCiclo)

RETURN @ExisteCodigoCiclo
END