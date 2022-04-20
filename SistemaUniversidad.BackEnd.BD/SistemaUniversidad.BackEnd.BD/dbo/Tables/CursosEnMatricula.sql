CREATE TABLE CursosEnMatricula(
    CodigoMatricula INT NOT NULL,
    CodigoCurso INT NOT NULL,
	MontoDeCurso DECIMAL(18,3),
    Activo BIT DEFAULT 1,
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
    FechaModificacion DATETIME,
    CreadoPor VARCHAR(60),
    ModificadoPor VARCHAR(60),
    CONSTRAINT FK_CursosEnMatricula_CodigoMatricula FOREIGN KEY(CodigoMatricula) REFERENCES Matriculas(CodigoMatricula),
    CONSTRAINT FK_CursosEnMatricula_CodigoCurso FOREIGN KEY(CodigoCurso) REFERENCES Cursos(CodigoCurso),
    CONSTRAINT PK_CursosEnMatricula PRIMARY KEY(CodigoMatricula,CodigoCurso)
)
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Cursos matriculados.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
  	@level1type = N'Table',		@level1name = 'CursosEnMatricula'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Código de la matricula.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnMatricula',  
   	@level2type = N'Column',	@level2name = 'CodigoMatricula'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Código del curso matriculado.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnMatricula',  
   	@level2type = N'Column',	@level2name = 'CodigoCurso'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Monto historico del curso.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnMatricula',  
   	@level2type = N'Column',	@level2name = 'MontoDeCurso'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnMatricula',  
   	@level2type = N'Column',	@level2name = 'Activo'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de creación del registro', 
  	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnMatricula',  
   	@level2type = N'Column',	@level2name = 'FechaCreacion'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnMatricula',  
   	@level2type = N'Column',	@level2name = 'FechaModificacion'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnMatricula',  
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CursosEnMatricula', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'