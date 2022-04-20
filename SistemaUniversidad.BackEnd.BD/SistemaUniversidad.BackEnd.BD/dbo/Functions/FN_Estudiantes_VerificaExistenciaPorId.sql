CREATE FUNCTION FN_Estudiantes_VerificaExistenciaPorId(@Identificacion VARCHAR(20))
	RETURNS BIT AS
BEGIN 
	DECLARE @ExisteEstudiante BIT;
	SET @ExisteEstudiante =(SELECT COUNT(Identificacion) FROM Estudiantes WHERE Identificacion = @Identificacion)

RETURN @ExisteEstudiante
END