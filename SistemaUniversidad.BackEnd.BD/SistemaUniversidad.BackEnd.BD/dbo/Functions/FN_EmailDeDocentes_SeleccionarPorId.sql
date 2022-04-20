CREATE FUNCTION FN_EmailDeDocentes_SeleccionarPorId(
	@Identificacion VARCHAR(20)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_EmailDeDocentes_SeleccionarTodos AS EmailDeDocentes
		WHERE 
			EmailDeDocentes.Identificacion = @Identificacion