CREATE FUNCTION FN_CursosEnAulas_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_CursosEnAulas_SeleccionarTodos