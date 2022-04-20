CREATE FUNCTION FN_Docentes_VerificaExistenciaPorId(@Identificacion VARCHAR(20))
	RETURNS BIT AS
BEGIN 
	DECLARE @ExisteDocente BIT;
	SET @ExisteDocente =(SELECT COUNT(Identificacion) FROM Docentes WHERE Identificacion = @Identificacion)

RETURN @ExisteDocente
END