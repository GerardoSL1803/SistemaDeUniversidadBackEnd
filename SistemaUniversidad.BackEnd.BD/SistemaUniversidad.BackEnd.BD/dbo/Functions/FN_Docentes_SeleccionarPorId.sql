CREATE FUNCTION FN_Docentes_SeleccionarPorId(
	@Identificacion VARCHAR(20)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Docentes_SeleccionarTodos AS Docentes
		WHERE 
			Docentes.Identificacion = @Identificacion