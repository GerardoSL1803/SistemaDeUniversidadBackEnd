CREATE FUNCTION FN_Carreras_VerificaExistenciaPorId(@CodigoCarrera INT)
	RETURNS BIT AS
BEGIN 
	DECLARE @ExisteCarrera BIT;
	SET @ExisteCarrera =(SELECT COUNT(CodigoCarrera) FROM Carreras WHERE CodigoCarrera = @CodigoCarrera)

RETURN @ExisteCarrera
END