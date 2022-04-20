CREATE FUNCTION FN_CursosDocentes_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_CursosDocentes_SeleccionarTodos