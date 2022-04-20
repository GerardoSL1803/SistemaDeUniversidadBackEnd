CREATE TABLE Matriculas(
    CodigoMatricula INT IDENTITY(1,1) NOT NULL,
    CodigoCiclo INT NOT NULL,
    IdentificacionEstudiante VARCHAR(20) NOT NULL,
    MontoDeCurso DECIMAL(18,3) NOT NULL DEFAULT 0,
    MontoMatricula DECIMAL(18,3) NOT NULL,
    MontoTotal AS (MontoDeCurso + MontoMatricula),
    Activo BIT DEFAULT 1,
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
    FechaModificacion DATETIME,
    CreadoPor VARCHAR(60),
    ModificadoPor VARCHAR(60)
    CONSTRAINT PK_Matriculas PRIMARY KEY(CodigoMatricula),
    CONSTRAINT FK_Matriculas_CodigoCiclo FOREIGN KEY(CodigoCiclo) REFERENCES CiclosLectivos(CodigoCiclo),
    CONSTRAINT FK_Matriculas_Identificacion FOREIGN KEY(IdentificacionEstudiante) REFERENCES Estudiantes(Identificacion)
)
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Matricula del curso.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
  	@level1type = N'Table',		@level1name = 'Matriculas'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Codigo de la matricula.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Matriculas',  
   	@level2type = N'Column',	@level2name = 'CodigoMatricula'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Codigo del ciclo lectivo de la matricula.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Matriculas',  
   	@level2type = N'Column',	@level2name = 'CodigoCiclo'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Identificacion del estudiante que hace la matricula.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Matriculas',  
   	@level2type = N'Column',	@level2name = 'IdentificacionEstudiante'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Monto del Curso.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Matriculas',  
   	@level2type = N'Column',	@level2name = 'MontoDeCurso'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Monto de la Matricula.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Matriculas',  
   	@level2type = N'Column',	@level2name = 'MontoMatricula'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Suma total del monto del curso y monto de la matricula.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Matriculas',  
   	@level2type = N'Column',	@level2name = 'MontoTotal'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Matriculas',  
   	@level2type = N'Column',	@level2name = 'Activo'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de creación del registro', 
  	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Matriculas',  
   	@level2type = N'Column',	@level2name = 'FechaCreacion'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Matriculas',  
   	@level2type = N'Column',	@level2name = 'FechaModificacion'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Matriculas',  
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Matriculas', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'