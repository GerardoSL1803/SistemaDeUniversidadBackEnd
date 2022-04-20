CREATE FUNCTION FN_EmailDeEstudiantes_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_EmailDeEstudiantes_SeleccionarTodos