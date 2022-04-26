CREATE TABLE Estudiantes(
    Identificacion VARCHAR(20) NOT NULL,
    Nombres VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    Telefono VARCHAR(20)NOT NULL,
    TelefonoSecundario VARCHAR(20),
    FechaIngreso DATE DEFAULT GETDATE(),
    Activo BIT DEFAULT 1,
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
    FechaModificacion DATETIME,
    CreadoPor VARCHAR(60),
    ModificadoPor VARCHAR(60)
    CONSTRAINT PK_Estudiantes PRIMARY KEY(Identificacion)
)
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Estudiante de la Universidad',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Estudiantes'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Numero de identificacion del Estudiante',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Estudiantes', 
    @level2type = N'Column'	,@level2name = 'Identificacion'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Primer y segundo nombre del Estudiante segun sea el caso',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Estudiantes', 
    @level2type = N'Column'	,@level2name = 'Nombres'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Apellido completo del Estudiante',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Estudiantes', 
    @level2type = N'Column'	,@level2name = 'Apellidos'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Telefono del Estudiante',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Estudiantes', 
    @level2type = N'Column'	,@level2name = 'Telefono'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Numero de telefono secundario del estudiante si este fuera necesario',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Estudiantes', 
    @level2type = N'Column'	,@level2name = 'TelefonoSecundario'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Fecha de ingreso del Estudiante',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Estudiantes', 
    @level2type = N'Column'	,@level2name = 'FechaIngreso'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Estudiantes', 
    @level2type = N'Column'	,@level2name = 'Activo'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Fecha de creación del registro',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Estudiantes', 
    @level2type = N'Column'	,@level2name = 'FechaCreacion'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value ='Fecha de modificación del registro',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Estudiantes', 
    @level2type = N'Column'	,@level2name = 'FechaModificacion'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Nombre del usuario que crea el registro',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Estudiantes', 
    @level2type = N'Column'	,@level2name = 'CreadoPor'
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description',@value = 'Nos indica quien altero la tabla',
    @level0type = N'Schema'	,@level0name = 'dbo',
    @level1type = N'Table'	,@level1name = 'Estudiantes', 
    @level2type = N'Column'	,@level2name = 'ModificadoPor'