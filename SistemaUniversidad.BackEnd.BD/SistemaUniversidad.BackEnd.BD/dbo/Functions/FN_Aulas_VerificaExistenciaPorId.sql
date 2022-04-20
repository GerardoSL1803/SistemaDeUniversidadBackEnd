CREATE FUNCTION FN_Aulas_VerificaExistenciaPorId (
	@NumeroDeAula INT )
RETURNS BIT AS
BEGIN
	DECLARE @ExisteAula BIT;
	
	SET @ExisteAula = (SELECT count(NumeroDeAula) FROM Aulas WHERE NumeroDeAula = @NumeroDeAula)

	 
    RETURN @ExisteAula
END