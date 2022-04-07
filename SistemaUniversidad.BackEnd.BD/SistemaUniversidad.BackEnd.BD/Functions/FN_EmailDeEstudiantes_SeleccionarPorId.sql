CREATE FUNCTION FN_EmailDeEstudiantes_SeleccionarPorId(
	@Identificacion VARCHAR(20)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_EmailDeEstudiantes_SeleccionarTodos AS EmailDeEstudiantes
		WHERE 
			EmailDeEstudiantes.Identificacion = @Identificacion