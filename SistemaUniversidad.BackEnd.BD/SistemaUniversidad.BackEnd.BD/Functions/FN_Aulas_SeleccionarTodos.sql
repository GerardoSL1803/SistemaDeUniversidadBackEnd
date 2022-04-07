CREATE FUNCTION FN_Aulas_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Aulas_SeleccionarTodos