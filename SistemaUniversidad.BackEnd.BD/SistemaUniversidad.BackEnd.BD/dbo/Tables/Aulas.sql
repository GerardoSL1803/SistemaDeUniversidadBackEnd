CREATE TABLE Aulas(
    NumeroDeAula INT NOT NULL,
    NombreDeAula VARCHAR(20) NOT NULL,
    Activo BIT DEFAULT 1,
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
    FechaModificacion DATETIME,
    CreadoPor VARCHAR(60),
    ModificadoPor VARCHAR(60),
    CONSTRAINT PK_Aulas PRIMARY KEY(NumeroDeAula)
)
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Aulas donde se imparten los cursos.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
  	@level1type = N'Table',		@level1name = 'Aulas'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Numero del aula.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Aulas',  
   	@level2type = N'Column',	@level2name = 'NumeroDeAula'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del aula.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Aulas',  
   	@level2type = N'Column',	@level2name = 'NombreDeAula'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Aulas',  
   	@level2type = N'Column',	@level2name = 'Activo'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de creación del registro', 
  	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Aulas',  
   	@level2type = N'Column',	@level2name = 'FechaCreacion'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Aulas',  
   	@level2type = N'Column',	@level2name = 'FechaModificacion'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Aulas',  
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'Aulas', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'