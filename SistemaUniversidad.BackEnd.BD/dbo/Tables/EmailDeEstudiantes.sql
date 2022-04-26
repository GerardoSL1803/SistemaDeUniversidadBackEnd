CREATE TABLE EmailDeEstudiantes(
    Identificacion VARCHAR(20) NOT NULL,
    EmailUniversidad VARCHAR(50) NOT NULL,
    EmailPersonal VARCHAR(50),
    Activo BIT DEFAULT 1,
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
    FechaModificacion DATETIME,
    CreadoPor VARCHAR(60),
    ModificadoPor VARCHAR(60)
    CONSTRAINT FK_EmailDeEstudiantes_Identificacion FOREIGN KEY(Identificacion) REFERENCES Estudiantes(Identificacion),
    CONSTRAINT PK_EmailDeEstudiantes PRIMARY KEY(Identificacion)
)
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Tabla para registrar los email de los estudiantes.', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
  	@level1type = N'Table',		@level1name = 'EmailDeEstudiantes'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Numero de identificacion del estudiante', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'EmailDeEstudiantes',  
   	@level2type = N'Column',	@level2name = 'Identificacion'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Email Universitario del Estudiante', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'EmailDeEstudiantes',  
   	@level2type = N'Column',	@level2name = 'EmailUniversidad'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Email personal del estudiante', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'EmailDeEstudiantes',  
   	@level2type = N'Column',	@level2name = 'EmailPersonal'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'EmailDeEstudiantes',  
   	@level2type = N'Column',	@level2name = 'Activo'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de creación del registro', 
  	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'EmailDeEstudiantes',  
   	@level2type = N'Column',	@level2name = 'FechaCreacion'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'EmailDeEstudiantes',  
   	@level2type = N'Column',	@level2name = 'FechaModificacion'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'EmailDeEstudiantes',  
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO
EXEC sp_addextendedproperty  
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro', 
   	@level0type = N'Schema',	@level0name = 'dbo', 
   	@level1type = N'Table',		@level1name = 'EmailDeEstudiantes', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'