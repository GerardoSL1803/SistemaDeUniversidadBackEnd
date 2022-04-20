CREATE TABLE Cursos(
    CodigoCurso INT IDENTITY(1,1),
	CodigoCarrera INT,
    Nombre VARCHAR(20) NOT NULL,
    MontoCurso DECIMAL(18,3) NOT NULL,
    Activo BIT DEFAULT 1,
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
    FechaModificacion DATETIME,
    CreadoPor VARCHAR(60),
    ModificadoPor VARCHAR(60)
    CONSTRAINT PK_Cursos PRIMARY KEY(CodigoCurso)
	CONSTRAINT FK_Cursos_CodigoCarrera FOREIGN KEY(CodigoCarrera) REFERENCES Carreras(CodigoCarrera)
)
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Cursos a llevar en la Carrera',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Cursos'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Código del curso.',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Cursos', 
    @level2type = N'Column'	,@level2name = 'CodigoCurso'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Código de la carrera.',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Cursos', 
    @level2type = N'Column'	,@level2name = 'CodigoCarrera'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Nombre del curso',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Cursos', 
    @level2type = N'Column'	,@level2name = 'Nombre'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Monto o valor del curso.',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Cursos', 
    @level2type = N'Column'	,@level2name = 'MontoCurso'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Cursos', 
    @level2type = N'Column'	,@level2name = 'Activo'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Fecha de creación del registro',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Cursos', 
    @level2type = N'Column'	,@level2name = 'FechaCreacion'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value ='Fecha de modificación del registro',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Cursos', 
    @level2type = N'Column'	,@level2name = 'FechaModificacion'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Nombre del usuario que crea el registro',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Cursos', 
    @level2type = N'Column'	,@level2name = 'CreadoPor'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Nos indica quien alteró el campo',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Cursos', 
    @level2type = N'Column'	,@level2name = 'ModificadoPor'