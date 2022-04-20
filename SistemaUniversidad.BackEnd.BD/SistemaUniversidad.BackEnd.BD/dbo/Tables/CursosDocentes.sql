CREATE TABLE CursosDocentes(
    Codigo INT IDENTITY NOT NULL,
    Curso INT NOT NULL,
    Identificacion VARCHAR(20) NOT NULL,
    CicloLectivo INT NOT NULL,
    Activo BIT DEFAULT 1,
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
    FechaModificacion DATETIME,
    CreadoPor VARCHAR(60),
    ModificadoPor VARCHAR(60),
    CONSTRAINT PK_CursosDocentes PRIMARY KEY (Codigo),
    CONSTRAINT FK_CursosDocentes_CodigoCurso FOREIGN KEY(Curso) REFERENCES Cursos(CodigoCurso),
    CONSTRAINT FK_CursosDocentes_Identificacion FOREIGN KEY(Identificacion) REFERENCES Docentes(Identificacion),
    CONSTRAINT FK_CursosDocentese_CodigoCiclo FOREIGN KEY(CicloLectivo) REFERENCES CiclosLectivos(CodigoCiclo)
)
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Curso impartido por el docente.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
  	@level1type = N'Table',		@level1name = 'CursosDocentes'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Código del curso del docente.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosDocentes',  
   	@level2type = N'Column',	@level2name = 'Codigo'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Curso del docente.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosDocentes',  
   	@level2type = N'Column',	@level2name = 'Curso'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Número de identificación del curso.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosDocentes',  
   	@level2type = N'Column',	@level2name = 'Identificacion'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Ciclo lectivo del curso.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosDocentes',  
   	@level2type = N'Column',	@level2name = 'CicloLectivo'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosDocentes',  
   	@level2type = N'Column',	@level2name = 'Activo'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de creación del registro', 
  	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosDocentes',  
   	@level2type = N'Column',	@level2name = 'FechaCreacion'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosDocentes',  
   	@level2type = N'Column',	@level2name = 'FechaModificacion'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosDocentes',  
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosDocentes', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'