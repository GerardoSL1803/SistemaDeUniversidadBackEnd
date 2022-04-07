CREATE TABLE Carreras(
    CodigoCarrera INT IDENTITY(1,1),
	CodigoSede INT,
    Nombre VARCHAR(50) NOT NULL,
    Activo BIT DEFAULT 1,
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
    FechaModificacion DATETIME,
    CreadoPor VARCHAR(60),
    ModificadoPor VARCHAR(60)
    CONSTRAINT PK_Carreras PRIMARY KEY(CodigoCarrera)
	CONSTRAINT FK_Carreras_CodigoSede FOREIGN KEY(CodigoSede) REFERENCES Sedes(CodigoSede)
)
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Carreras Universitarias',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Carreras'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Código de la Carrera Universitaria',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Carreras', 
    @level2type = N'Column'	,@level2name = 'CodigoCarrera'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Código de la Sede Universitaria',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Carreras', 
    @level2type = N'Column'	,@level2name = 'CodigoSede'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Nombre de la Carrera Universitaria',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Carreras', 
    @level2type = N'Column'	,@level2name = 'Nombre'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'El campo activo muestra 1:Si la Carrera esta activa o 0:Si la Carrera esta inactiva.',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Carreras', 
    @level2type = N'Column'	,@level2name = 'Activo'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Fecha de creación del registro',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Carreras', 
    @level2type = N'Column'	,@level2name = 'FechaCreacion'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Fecha de modificación del registro',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Carreras', 
    @level2type = N'Column'	,@level2name = 'FechaModificacion'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value ='Nombre del usuario que crea el registro',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Carreras', 
    @level2type = N'Column'	,@level2name = 'CreadoPor'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Nos indica quien alteró el campo',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Carreras', 
    @level2type = N'Column'	,@level2name = 'ModificadoPor'