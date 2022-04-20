CREATE FUNCTION FN_EmailDeDocentes_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_EmailDeDocentes_SeleccionarTodos