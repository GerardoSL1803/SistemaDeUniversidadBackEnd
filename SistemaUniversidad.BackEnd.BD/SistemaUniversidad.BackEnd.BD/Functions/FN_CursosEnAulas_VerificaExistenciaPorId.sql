CREATE FUNCTION FN_CursosEnAulas_VerificaExistenciaPorId (
	@NumeroDeAula INT,@CodigoCurso INT,@CodigoCiclo INT )
RETURNS BIT AS
BEGIN
	DECLARE @ExisteCursoEnAula BIT;
	
	SET @ExisteCursoEnAula = (SELECT count(NumeroDeAula) FROM CursosEnAulas WHERE NumeroDeAula = @NumeroDeAula AND CodigoCurso = @CodigoCurso AND CodigoCiclo = @CodigoCiclo)
    
    RETURN @ExisteCursoEnAula
END