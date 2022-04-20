CREATE FUNCTION FN_Matriculas_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Matriculas_SeleccionarTodos