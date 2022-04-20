CREATE FUNCTION FN_Estudiantes_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Estudiantes_SeleccionarTodos