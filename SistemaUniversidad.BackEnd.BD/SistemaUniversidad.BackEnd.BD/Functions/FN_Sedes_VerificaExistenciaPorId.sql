CREATE FUNCTION FN_Sedes_VerificaExistenciaPorId(@CodigoSede INT)
	RETURNS BIT AS
BEGIN 
	DECLARE @ExisteSede BIT;
	SET @ExisteSede =(SELECT COUNT(@ExisteSede) FROM Sedes WHERE CodigoSede = @CodigoSede)

RETURN @ExisteSede
END