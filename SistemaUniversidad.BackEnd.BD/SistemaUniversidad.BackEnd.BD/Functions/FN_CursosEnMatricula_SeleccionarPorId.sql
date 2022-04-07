CREATE FUNCTION FN_CursosEnMatricula_SeleccionarPorId(
	@CodigoMatricula INT,
	@CodigoCurso INT
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_CursosEnMatricula_SeleccionarTodos AS CursosEnMatricula
		WHERE 
			CursosEnMatricula.CodigoCurso = @CodigoCurso
			AND
			CursosEnMatricula.CodigoMatricula = @CodigoMatricula