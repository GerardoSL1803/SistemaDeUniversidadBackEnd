CREATE FUNCTION FN_Docentes_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Docentes_SeleccionarTodos