CREATE FUNCTION FN_Universidades_VerificaExistenciaPorId(@CodigoUniversidad INT)
	RETURNS BIT AS
BEGIN 
	DECLARE @ExisteUniversidad BIT;
	SET @ExisteUniversidad =(SELECT COUNT(CodigoUniversidad) FROM Universidades WHERE CodigoUniversidad = @CodigoUniversidad)

RETURN @ExisteUniversidad
END