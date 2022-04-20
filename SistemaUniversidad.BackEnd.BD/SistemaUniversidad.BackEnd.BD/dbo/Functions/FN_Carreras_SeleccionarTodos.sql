CREATE FUNCTION FN_Carreras_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Carreras_SeleccionarTodos