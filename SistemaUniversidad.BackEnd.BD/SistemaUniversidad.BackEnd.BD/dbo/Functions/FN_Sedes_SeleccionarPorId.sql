CREATE FUNCTION FN_Sedes_SeleccionarPorId(
	@CodigoSede INT
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Sedes_SeleccionarTodos AS Sedes
		WHERE 
			Sedes.CodigoSede = @CodigoSede