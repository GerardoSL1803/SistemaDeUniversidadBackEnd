CREATE FUNCTION FN_Universidades_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Universidades_SeleccionarTodos