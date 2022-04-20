CREATE FUNCTION FN_CiclosLectivos_SeleccionarPorId(
	@CodigoCiclo INT
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_CiclosLectivos_SeleccionarTodos AS CiclosLectivos
		WHERE 
			CiclosLectivos.CodigoCiclo = @CodigoCiclo