CREATE TABLE EmailDeDocentes(
    Identificacion VARCHAR(20) NOT NULL,
    EmailUniversidad VARCHAR(50)NOT NULL,
    EmailPersonal VARCHAR(50),
    Activo BIT DEFAULT 1,
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
    FechaModificacion DATETIME,
    CreadoPor VARCHAR(60),
    ModificadoPor VARCHAR(60)
    CONSTRAINT FK_EmailDeDocentes_Identificacion FOREIGN KEY(Identificacion) REFERENCES Docentes(Identificacion),
    CONSTRAINT PK_EmailDeDocentes PRIMARY KEY(Identificacion)
)
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Email del docente', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
  	@level1type = N'Table',		@level1name = 'EmailDeDocentes'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Numero de identificacion de email del docente', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'EmailDeDocentes',  
   	@level2type = N'Column',	@level2name = 'Identificacion'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Email universitario del docente', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'EmailDeDocentes',  
   	@level2type = N'Column',	@level2name = 'EmailUniversidad'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Email personal del docente', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'EmailDeDocentes',  
   	@level2type = N'Column',	@level2name = 'EmailPersonal'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'EmailDeDocentes',  
   	@level2type = N'Column',	@level2name = 'Activo'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de creación del registro', 
  	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'EmailDeDocentes',  
   	@level2type = N'Column',	@level2name = 'FechaCreacion'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'EmailDeDocentes',  
   	@level2type = N'Column',	@level2name = 'FechaModificacion'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'EmailDeDocentes',  
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'EmailDeDocentes', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'