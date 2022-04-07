CREATE FUNCTION FN_CursosEnMatricula_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_CursosEnMatricula_SeleccionarTodos