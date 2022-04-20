CREATE FUNCTION FN_Cursos_VerificaExistenciaPorId(@CodigoCurso INT)
	RETURNS BIT AS
BEGIN 
	DECLARE @ExisteCurso BIT;
	SET @ExisteCurso =(SELECT COUNT(CodigoCurso) FROM Cursos WHERE CodigoCurso = @CodigoCurso)

RETURN @ExisteCurso
END