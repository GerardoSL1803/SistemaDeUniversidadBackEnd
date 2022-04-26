CREATE FUNCTION FN_CursosEnAulas_SeleccionarPorId(
	@NumeroDeAula INT,
	@CodigoCurso INT,
	@CodigoCiclo INT
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_CursosEnAulas_SeleccionarTodos AS CursosEnAulas
		WHERE 
			CursosEnAulas.NumeroDeAula = @NumeroDeAula 
			AND 
				CursosEnAulas.CodigoCurso = @CodigoCurso
			AND 
				CursosEnAulas.CodigoCiclo = @CodigoCiclo