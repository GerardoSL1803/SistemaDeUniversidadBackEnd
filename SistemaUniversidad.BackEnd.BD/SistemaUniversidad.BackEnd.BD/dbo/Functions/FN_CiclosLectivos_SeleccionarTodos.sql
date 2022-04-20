CREATE FUNCTION FN_CiclosLectivos_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_CiclosLectivos_SeleccionarTodos