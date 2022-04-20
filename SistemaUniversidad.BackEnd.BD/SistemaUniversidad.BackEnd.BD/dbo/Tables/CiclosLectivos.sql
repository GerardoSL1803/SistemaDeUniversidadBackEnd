CREATE TABLE CiclosLectivos(
    CodigoCiclo INT IDENTITY(1,1) NOT NULL,
    NombreCiclo VARCHAR(20) NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE NOT NULL,
    Activo BIT DEFAULT 1,
    FechaCreacion DATETIME DEFAULT GETDATE(),
    FechaModificacion DATETIME,
    CreadoPor VARCHAR(60),
    ModificadoPor VARCHAR(60)
    CONSTRAINT PK_CiclosLectivos PRIMARY KEY(CodigoCiclo)
)
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Ciclo lectivo del curso', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
  	@level1type = N'Table',		@level1name = 'CiclosLectivos'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Codigo del ciclo lectivo', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CiclosLectivos',  
   	@level2type = N'Column',	@level2name = 'CodigoCiclo'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del ciclo lectivo', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CiclosLectivos',  
   	@level2type = N'Column',	@level2name = 'NombreCiclo'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de inicio del ciclo lectivo', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CiclosLectivos',  
   	@level2type = N'Column',	@level2name = 'FechaInicio'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha del fín del ciclo lectivo', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CiclosLectivos',  
   	@level2type = N'Column',	@level2name = 'FechaFin'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value ='Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CiclosLectivos',  
   	@level2type = N'Column',	@level2name = 'Activo'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de creación del registro', 
  	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CiclosLectivos',  
   	@level2type = N'Column',	@level2name = 'FechaCreacion'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CiclosLectivos',  
   	@level2type = N'Column',	@level2name = 'FechaModificacion'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CiclosLectivos',  
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'CiclosLectivos', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'