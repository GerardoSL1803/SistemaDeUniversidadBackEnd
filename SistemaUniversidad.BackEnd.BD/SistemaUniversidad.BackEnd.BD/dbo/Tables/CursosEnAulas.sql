CREATE TABLE CursosEnAulas(
    CodigoCurso INT NOT NULL,
    NumeroDeAula INT NOT NULL,
    CodigoCiclo INT NOT NULL,
    DiaLectivo VARCHAR(10) NOT NULL,
    HoraInicio VARCHAR(10) NOT NULL,
    HoraFin VARCHAR(10) NOT NULL,
    Activo BIT DEFAULT 1,
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
    FechaModificacion DATETIME,
    CreadoPor VARCHAR(60),
    ModificadoPor VARCHAR(60),
    CONSTRAINT FK_CursosEnAulas_CodigoCurso FOREIGN KEY(CodigoCurso) REFERENCES Cursos(CodigoCurso),
    CONSTRAINT FK_CursosEnAulas_NumeroDeAula FOREIGN KEY(NumeroDeAula) REFERENCES Aulas(NumeroDeAula),
    CONSTRAINT FK_CursosEnAulas_CodigoCiclo FOREIGN KEY(CodigoCiclo) REFERENCES CiclosLectivos(CodigoCiclo),
    CONSTRAINT PK_CursosEnAulas PRIMARY KEY(NumeroDeAula,CodigoCurso,CodigoCiclo)
)
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Cursos que se imparten en las aulas.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
  	@level1type = N'Table',		@level1name = 'CursosEnAulas'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Codigo del curso del curso.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnAulas',  
   	@level2type = N'Column',	@level2name = 'CodigoCurso'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Numero del aula.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnAulas',  
   	@level2type = N'Column',	@level2name = 'NumeroDeAula'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Dia lectivo del curso.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnAulas',  
   	@level2type = N'Column',	@level2name = 'DiaLectivo'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Hora de inicio de los cursos.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnAulas',  
   	@level2type = N'Column',	@level2name = 'HoraInicio'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Hora del fín de los cursos.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnAulas',  
   	@level2type = N'Column',	@level2name = 'HoraFin'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Codigo del ciclo.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnAulas',  
   	@level2type = N'Column',	@level2name = 'CodigoCiclo'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnAulas',  
   	@level2type = N'Column',	@level2name = 'Activo'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de creación del registro', 
  	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnAulas',  
   	@level2type = N'Column',	@level2name = 'FechaCreacion'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnAulas',  
   	@level2type = N'Column',	@level2name = 'FechaModificacion'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnAulas',  
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnAulas', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'