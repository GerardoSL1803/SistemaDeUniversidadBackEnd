CREATE FUNCTION FN_Sedes_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Sedes_SeleccionarTodos