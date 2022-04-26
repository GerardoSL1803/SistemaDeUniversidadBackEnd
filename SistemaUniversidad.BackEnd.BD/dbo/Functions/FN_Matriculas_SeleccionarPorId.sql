CREATE FUNCTION FN_Matriculas_SeleccionarPorId(
	@CodigoMatricula INT
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Matriculas_SeleccionarTodos AS Matriculas
		WHERE 
			Matriculas.CodigoMatricula = @CodigoMatricula