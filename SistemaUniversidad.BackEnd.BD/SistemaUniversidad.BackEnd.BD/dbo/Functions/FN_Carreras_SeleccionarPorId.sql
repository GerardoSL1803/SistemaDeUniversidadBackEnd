CREATE FUNCTION FN_Carreras_SeleccionarPorId(
	@CodigoCarrera INT
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Carreras_SeleccionarTodos AS Carreras
		WHERE 
			Carreras.CodigoCarrera = @CodigoCarrera