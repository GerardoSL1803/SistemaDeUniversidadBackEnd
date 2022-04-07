CREATE FUNCTION FN_EmailDeDocentes_VerificaExistenciaPorId(@Identificacion VARCHAR(20))
	RETURNS BIT AS
BEGIN 
	DECLARE @ExisteEmailDeDocente BIT;
	SET @ExisteEmailDeDocente =(SELECT COUNT(Identificacion) FROM EmailDeDocentes WHERE Identificacion = @Identificacion)

RETURN @ExisteEmailDeDocente
END