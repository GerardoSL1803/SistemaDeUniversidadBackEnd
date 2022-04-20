CREATE FUNCTION FN_Estudiantes_SeleccionarPorId(
	@Identificacion VARCHAR(20)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Estudiantes_SeleccionarTodos AS Estudiantes
		WHERE 
			Estudiantes.Identificacion = @Identificacion