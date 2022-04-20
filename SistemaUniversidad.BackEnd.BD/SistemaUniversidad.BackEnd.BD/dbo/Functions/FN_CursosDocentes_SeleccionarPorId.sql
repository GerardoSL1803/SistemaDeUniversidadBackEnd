CREATE FUNCTION FN_CursosDocentes_SeleccionarPorId(
	@Codigo INT
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_CursosDocentes_SeleccionarTodos AS CursosDocentes
		WHERE 
			CursosDocentes.Codigo = @Codigo