CREATE FUNCTION FN_Aulas_SeleccionarPorId(
	@NumeroDeAula INT
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Aulas_SeleccionarTodos AS Aulas
		WHERE 
			Aulas.NumeroDeAula = @NumeroDeAula