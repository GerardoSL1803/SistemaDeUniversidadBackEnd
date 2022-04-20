CREATE FUNCTION FN_Univerisidades_SeleccionarPorId(
	@CodigoUniversidad INT
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Universidades_SeleccionarTodos AS Universidades
		WHERE 
			Universidades.CodigoUniversidad = @CodigoUniversidad