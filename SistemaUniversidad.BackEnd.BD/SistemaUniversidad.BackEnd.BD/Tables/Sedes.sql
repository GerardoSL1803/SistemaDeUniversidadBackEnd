CREATE TABLE Sedes(
    CodigoSede INT IDENTITY(1,1),
    CodigoUniversidad INT NOT NULL,
    Direccion VARCHAR(500) NOT NULL,
    Email VARCHAR(20) NOT NULL,
    Telefono VARCHAR(20) NOT NULL,
    Activo BIT DEFAULT 1,
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
    FechaModificacion DATETIME,
    CreadoPor VARCHAR(60),
    ModificadoPor VARCHAR(60)
    CONSTRAINT PK_Sedes PRIMARY KEY(CodigoSede),
    CONSTRAINT FK_Sedes_CodigoUniversidad FOREIGN KEY(CodigoUniversidad) REFERENCES Universidades(CodigoUniversidad)
)
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Sede de las Universidades.',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Sedes'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Código de la Universidad a la que pertenece la Sede',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Sedes', 
    @level2type = N'Column'	,@level2name = 'CodigoUniversidad'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Dirección de la Sede',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Sedes', 
    @level2type = N'Column'	,@level2name = 'Direccion'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Email de la Sede',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Sedes', 
    @level2type = N'Column'	,@level2name = 'Email'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Teléfono de la Sede',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Sedes', 
    @level2type = N'Column'	,@level2name = 'Telefono'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Sedes', 
    @level2type = N'Column'	,@level2name = 'Activo'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Fecha de creación del registro',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Sedes', 
    @level2type = N'Column'	,@level2name = 'FechaCreacion'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Fecha de modificación del registro',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Sedes', 
    @level2type = N'Column'	,@level2name = 'FechaModificacion'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Nombre del usuario que crea el registro',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Sedes', 
    @level2type = N'Column'	,@level2name = 'CreadoPor'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Nos indica quíen alteró la tabla',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Sedes', 
    @level2type = N'Column'	,@level2name = 'ModificadoPor'