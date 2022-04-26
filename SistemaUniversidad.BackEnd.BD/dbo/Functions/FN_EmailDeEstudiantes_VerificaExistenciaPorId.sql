CREATE FUNCTION FN_EmailDeEstudiantes_VerificaExistenciaPorId(@Identificacion VARCHAR(20))
	RETURNS BIT AS
BEGIN 
	DECLARE @ExisteEmailDeEstudiante BIT;
	SET @ExisteEmailDeEstudiante =(SELECT COUNT(Identificacion) FROM EmailDeEstudiantes WHERE Identificacion = @Identificacion)

RETURN @ExisteEmailDeEstudiante
END