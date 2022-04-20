CREATE FUNCTION FN_CursosDocentes_VerificaExistenciaPorId(@Codigo INT)
	RETURNS BIT AS
BEGIN 
	DECLARE @ExisteCursosDocentes BIT;
	SET @ExisteCursosDocentes =(SELECT COUNT(Codigo) FROM CursosDocentes WHERE Codigo = @Codigo)

RETURN @ExisteCursosDocentes
END