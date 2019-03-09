--Drop Table Medicos

--GO

--Drop Table Examenes

--GO

--Drop Table Muestras
--GO

--Drop Table TipoMuestras
--GO
--Drop Table Aseguradoras
--GO
--Drop Table Pacientes
--GO
--Drop Table OrdenServicio
--GO
--Drop Table Laboratoristas

--Drop Table Resultados
--GO

--Create database Laboratory
--GO
--Use Laboratory

CREATE TABLE Areas
(
IdArea bigint Identity(1,1) Primary key,
CodigoArea nvarchar(4),
NombreAreas nvarchar(50),
Categoria int,
SubCategoria int
);

Go

CREATE TABLE Facturas(
IdFactura bigint Identity(1, 1) Primary key,
NroFactura nvarchar(30),
Pago decimal(18,2),
IdOrdenServicio bigint
);

GO
Create 	table Medicos(
IdMedico	bigint	identity PRIMARY KEY,
CodMedico	VARCHAR(12),
NombreMedico	VARCHAR(20),
ApellidoMedico	VARCHAR(20),
Especialidad	VARCHAR(14))

GO
		
Create Table Muestras(	
IdMuestra	bigint	identity PRIMARY KEY,
IdExamen	bigint,
IdTipoMuestra bigint
)	
GO

Create Table	Examenes(		
IdExamen	bigint	identity Primary key,
IdArea bigint,
CodigoExamen VARCHAR(15),
NombreExamen	VARCHAR(94),	
NivelAtencion	INT,	
SignificanciaClinica	VARCHAR(30),
PrecioExamen	decimal(18,2),
CodigoCUPS	VARCHAR(20))	


GO		

Create Table TipoMuestras(	
IdTipoMuestra bigint	identity PRIMARY KEY,
NombreTipoMuestra VARCHAR(40) )
GO		


Create Table	Aseguradoras(
IdAseguradora bigint	identity PRIMARY KEY,
CodigoAseguradora	VARCHAR(8),
NombreAseguradora	VARCHAR(120))

GO
		
	
Create Table Pacientes(	
IdPaciente	bigint	identity PRIMARY KEY,
IdMedico bigint,
IdExamen bigint,
NroIdentificacionPaciente INT,
Nombres	VARCHAR(12),
PrimerApellido	VARCHAR(7),
SegundoApellido	VARCHAR(7),
Sexo	INT,
Hclinica	VARCHAR(9),
FechaNacimiento	VARCHAR(19),
Edad	INT	,
Direccion	VARCHAR(21)	,
Telefono	INT	)
		
GO

Create	Table	OrdenServicio(
IdOrdenServicio bigint	identity PRIMARY KEY,
IdPaciente	bigint	FOREIGN KEY (IdPaciente) REFERENCES Pacientes(IdPaciente),
IdAseguradora	bigint	FOREIGN KEY (IdAseguradora) REFERENCES Aseguradoras(IdAseguradora),
IdExamen bigInt,
NroRegistro	INT,
IngresoPor	VARCHAR(16),
IdMedico	INT,
FechaEntrega	DateTime,
FechaRecepcion	DateTime)

GO

CREATE TABLE OrdenServicioDetalle(
IdOrdenServicioDetalle bigint Identity PRIMARY KEY,
IdOrdenServicio bigint,
IdExamen bigint,
EstadoMuestra varchar(max)
)

GO

Create Table Laboratoristas(
IdLaboratorista	bigint	identity PRIMARY KEY,
NombreLaboratorista	VARCHAR(10)	,
Apellido	VARCHAR(8)	,
NroRegistro	INT	,
Clave	VARCHAR(7))

GO
Create Table	Resultados(
IdResultado	bigint	identity PRIMARY KEY,
IdRegistro	bigint	FOREIGN KEY (IdRegistro) REFERENCES OrdenServicio(IdOrdenServicio),
IdLaboratorista	bigint	FOREIGN KEY (IdLaboratorista) REFERENCES Laboratoristas(IdLaboratorista),
IdExamen bigint
)

GO


CREATE TABLE ResultadosDetalle(
IdResultadoDetalle bigint IDENTITY PRIMARY KEY,
IdResultado bigint,
IdExamen bigint,
IdPrueba bigint,
IdValorReferencia bigint,
ValorResultado	VARCHAR(15)
);

GO

Create Table ValoresReferencia	(
IdValorReferencia	bigint	identity PRIMARY KEY,
LimiteInferiorEdad	DECIMAL(10, 2),
LimiteSuperiorEdad	DECIMAL(10, 2),
LimiteInferiorSexo	DECIMAL(10, 2),
LimiteSuperiorSexo	DECIMAL(10, 2),
unidad	VARCHAR(20)	,
TipoValor1 VARCHAR(20),
TipoValor2 VARCHAR(20))

GO

CREATE TABLE Pruebas(
IdPrueba bigint Identity(1,1) Primary Key,
IdExamen bigint,
NombrePrueba nvarchar(50),
IdValorReferencia bigint
);



GO
ALTER TABLE FACTURAS ADD CONSTRAINT FK_Facturas_OrdenServicio FOREIGN KEY (IdOrdenServicio) REFERENCES OrdenServicio(IdOrdenServicio)

ALTER TABLE Pruebas ADD CONSTRAINT FK_Prueba_VlrRef
Foreign key (IdValorReferencia) References ValoresReferencia(IdValorReferencia);

GO

ALTER TABLE EXAMENES ADD CONSTRAINT FK_Examenes_Area Foreign key (IdArea) References Areas(IdArea);

GO
ALTER TABLE Pacientes ADD CONSTRAINT FK_Paciente_Medico FOREIGN KEY (IdMedico) REFERENCES MEDICOS(IdMedico);

GO

ALTER TABLE OrdenServicio ADD CONSTRAINT FK_RegPaciente_Examenes FOREIGN KEY (IdExamen) REFERENCES Examenes(IdExamen);

GO

ALTER TABLE MUESTRAS ADD CONSTRAINT FK_Muestras_Examenes FOREIGN KEY (IdExamen) REFERENCES Examenes(IdExamen);

GO

ALTER TABLE Pruebas ADD CONSTRAINT FK_Pruebas_Examenes FOREIGN KEY (IdExamen) REFERENCES Examenes(IdExamen);

GO

ALTER TABLE MUESTRAS ADD CONSTRAINT FK_Muestras_TipoMuestras FOREIGN KEY (IdTipoMuestra) REFERENCES TipoMuestras(IdTipoMuestra)

GO

ALTER TABLE RESULTADOS ADD CONSTRAINT FK_Resultados_Examenes FOREIGN KEY (IdExamen) REFERENCES Examenes(IdExamen)

GO

ALTER TABLE OrdenServicioDetalle ADD CONSTRAINT FK_OrdenServicio_OrdenServicioDetalle FOREIGN KEY (IdOrdenServicio) REFERENCES OrdenServicio(IdOrdenServicio)

GO

ALTER TABLE ResultadosDetalle ADD CONSTRAINT FK_ResultadosDetalle_Resultado FOREIGN KEY (IdResultado) REFERENCES RESULTADOS(IdResultado)

GO

SET IDENTITY_INSERT [dbo].[Areas] ON
INSERT INTO [dbo].[Areas] ([IdArea], [CodigoArea], [NombreAreas], [Categoria], [SubCategoria]) VALUES (1, N'90.1', N'MICROBIOLOGIA', 6, 88)
INSERT INTO [dbo].[Areas] ([IdArea], [CodigoArea], [NombreAreas], [Categoria], [SubCategoria]) VALUES (2, N'90.2', N'HEMATOLOGIA', 3, 97)
INSERT INTO [dbo].[Areas] ([IdArea], [CodigoArea], [NombreAreas], [Categoria], [SubCategoria]) VALUES (3, N'90.3', N'QUIMICA SANGUINEA Y FLUIDOS CORPORALES', 9, 195)
INSERT INTO [dbo].[Areas] ([IdArea], [CodigoArea], [NombreAreas], [Categoria], [SubCategoria]) VALUES (4, N'90.4', N'ENDOCRINOLOGIA', 9, 69)
INSERT INTO [dbo].[Areas] ([IdArea], [CodigoArea], [NombreAreas], [Categoria], [SubCategoria]) VALUES (5, N'90.5', N'MONITOREO DE MEDICAMENTOS Y TOXICOLOG�A', NULL, NULL)
INSERT INTO [dbo].[Areas] ([IdArea], [CodigoArea], [NombreAreas], [Categoria], [SubCategoria]) VALUES (6, N'90.6', N'INMUNOLOGIA Y MARCADORES TUMORALES', 10, 368)
INSERT INTO [dbo].[Areas] ([IdArea], [CodigoArea], [NombreAreas], [Categoria], [SubCategoria]) VALUES (7, N'90.7', N'MICROSCOPIA', 3, 21)
INSERT INTO [dbo].[Areas] ([IdArea], [CodigoArea], [NombreAreas], [Categoria], [SubCategoria]) VALUES (8, N'90.8', N'GEN�TICA Y ERRORES METAB�LICOS', 8, 76)
INSERT INTO [dbo].[Areas] ([IdArea], [CodigoArea], [NombreAreas], [Categoria], [SubCategoria]) VALUES (9, N'91.1', N'BANCO DE SANGRE', 4, 44)
INSERT INTO [dbo].[Areas] ([IdArea], [CodigoArea], [NombreAreas], [Categoria], [SubCategoria]) VALUES (10, N'91.2', N'MEDICINA TRANSFUSIONAL', 1, 9)
INSERT INTO [dbo].[Areas] ([IdArea], [CodigoArea], [NombreAreas], [Categoria], [SubCategoria]) VALUES (11, N'99.0', N'UROLOGIA', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Areas] OFF

GO

SET IDENTITY_INSERT [dbo].[ValoresReferencia] ON
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (1,CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'mm3', N'', N'')
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (2,CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'gr.%', NULL, NULL)
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (3,CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'%', NULL, NULL)
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (4,CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'MMG', NULL, NULL)
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (5,CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'%', NULL, NULL)
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (6,CAST(3.00 AS Decimal(10, 2)), CAST(8.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'MINUTOS', NULL, NULL)
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (7,CAST(5.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'MINUTOS', NULL, NULL)
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (8,CAST(10.00 AS Decimal(10, 2)), CAST(14.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N' SEGUNDOS', NULL, NULL)
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (9,CAST(28.00 AS Decimal(10, 2)), CAST(40.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N' SEGUNDOS', NULL, NULL)
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (10,CAST(150.00 AS Decimal(10, 2)), CAST(450.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'MIL/mm3', NULL, NULL)
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (11,CAST(1.00 AS Decimal(10, 2)), CAST(40.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL)
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (12,CAST(1.00 AS Decimal(10, 2)), CAST(80.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL)
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (13,CAST(1.00 AS Decimal(10, 2)), CAST(160.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL)
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (14,CAST(1.00 AS Decimal(10, 2)), CAST(320.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL)
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (15,CAST(1.00 AS Decimal(10, 2)), CAST(640.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), NULL, NULL, NULL)
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (16,CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'', N'TROF.', NULL)
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (17,CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'', N'QUISTE', NULL)
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (18,CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'', N'HELMINTOS', NULL)
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (19,CAST(10.00 AS Decimal(10, 2)), CAST(50.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'mg%', NULL, NULL)
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (20,CAST(140.00 AS Decimal(10, 2)), CAST(220.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'mg%', NULL, NULL)
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (21,CAST(10.00 AS Decimal(10, 2)), CAST(160.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'mg%', NULL, NULL)
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (22,CAST(0.00 AS Decimal(10, 2)), CAST(150.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'mg%', NULL, NULL)
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (23,CAST(0.00 AS Decimal(10, 2)), CAST(40.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'mg%', NULL, NULL)
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (24,CAST(70.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'mg%', NULL, NULL)
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (25,CAST(0.00 AS Decimal(10, 2)), CAST(200.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'mg%', NULL, NULL)
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (26,CAST(0.00 AS Decimal(10, 2)), CAST(200.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'mg%', NULL, NULL)
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (27,CAST(0.00 AS Decimal(10, 2)), CAST(140.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'mg%', NULL, NULL)
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (28,CAST(0.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'mg%', NULL, NULL)
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (29,CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'mg%', NULL, NULL)
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (30,CAST(0.00 AS Decimal(10, 2)), CAST(40.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'UL', NULL, NULL)
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (31,CAST(0.00 AS Decimal(10, 2)), CAST(40.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'UL', NULL, NULL)
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (32,CAST(22.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'UL', NULL, NULL)
INSERT INTO [dbo].[ValoresReferencia] ([IdValorReferencia], [LimiteInferiorEdad], [LimiteSuperiorEdad], [LimiteInferiorSexo], [LimiteSuperiorSexo], [unidad], [TipoValor1], [TipoValor2]) VALUES (9999, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'', NULL, NULL)

SET IDENTITY_INSERT [dbo].[ValoresReferencia] OFF


GO

SET IDENTITY_INSERT [dbo].[Pruebas] ON
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (1, N'ERITROCITOS', 1)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (2, N'HEMOGLOBINA', 2)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (3, N'HEMATOCRITO', 3)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (4, N'V.C.M.', 1)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (5, N'H.C.M.', 4)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (6, N'C.H.C.M.', 5)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (7, N'MORFOILOGIA', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (8, N'RETICULOCITO', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (9, N'ANISOCITOS', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (10, N'POIQUILOCITOSIS', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (11, N'LEUCOCITOS', 1)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (12, N'NEUTROFILOS', 3)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (13, N'LINFOCITOS.', 3)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (14, N'EOSINOFILOS', 3)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (15, N'MONOCITOS', 3)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (16, N'BASOFILOS', 3)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (17, N'METAMIELOCITOS', 3)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (18, N'JUVENILES', 3)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (19, N'CAYADOS', 3)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (20, N'BANDAS', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (21, N'Tiempo de DESANGRIA', 6)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (22, N'Tiempo de COAGULACION', 7)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (23, N'TP', 8)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (24, N'T.P.T.', 9)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (25, N'R.PLAQUETAS', 10)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (26, N'SEDIMENTACION EN UNA HORA', 1)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (27, N'V.D.R.L.', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (28, N'P. INMUN. EMBARAZO (PIE.)', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (29, N'PROTEINA C. REACT. (P C R.)', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (30, N'LATEX R. A. ', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (31, N'ANTIESTREPTOLISINAS (AELO.)', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (32, N'COOMBS DIRECTO', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (33, N'COOMBS INDIRECTO', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (34, N'GRUPO', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (35, N'RH.', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (36, N'ANTIGENOS FEBRILES Tifico Somatico (0)', 20)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (37, N'ANTIGENOS FEBRILES Tifico Somatico (0)', 21)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (38, N'ANTIGENOS FEBRILES Tifico Somatico (0)', 22)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (39, N'ANTIGENOS FEBRILES Tifico Somatico (0)', 23)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (40, N'ANTIGENOS FEBRILES Tifico Somatico (0)', 24)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (41, N'ANTIGENOS FEBRILES Tifico Flagelar (h) ', 20)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (42, N'ANTIGENOS FEBRILES Tifico Flagelar (h) ', 21)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (43, N'ANTIGENOS FEBRILES Tifico Flagelar (h) ', 22)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (44, N'ANTIGENOS FEBRILES Tifico Flagelar (h) ', 23)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (45, N'ANTIGENOS FEBRILES Tifico Flagelar (h) ', 24)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (46, N'ANTIGENOS FEBRILES Paratifica (a) ', 20)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (47, N'ANTIGENOS FEBRILES Paratifica (a) ', 21)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (48, N'ANTIGENOS FEBRILES Paratifica (a) ', 22)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (49, N'ANTIGENOS FEBRILES Paratifica (a) ', 23)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (50, N'ANTIGENOS FEBRILES Paratifica (a) ', 24)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (51, N'ANTIGENOS FEBRILES Paratifica (b)', 20)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (52, N'ANTIGENOS FEBRILES Paratifica (b)', 21)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (53, N'ANTIGENOS FEBRILES Paratifica (b)', 22)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (54, N'ANTIGENOS FEBRILES Paratifica (b)', 23)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (55, N'ANTIGENOS FEBRILES Paratifica (b)', 24)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (56, N'ANTIGENOS FEBRILES Brucella Abortus ', 20)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (57, N'ANTIGENOS FEBRILES Brucella Abortus ', 21)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (58, N'ANTIGENOS FEBRILES Brucella Abortus ', 22)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (59, N'ANTIGENOS FEBRILES Brucella Abortus ', 23)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (60, N'ANTIGENOS FEBRILES Brucella Abortus ', 24)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (61, N'ANTIGENOS FEBRILES Proteus 0 x 19 ', 20)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (62, N'ANTIGENOS FEBRILES Proteus 0 x 20', 21)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (63, N'ANTIGENOS FEBRILES Proteus 0 x 21', 22)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (64, N'ANTIGENOS FEBRILES Proteus 0 x 22', 23)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (65, N'ANTIGENOS FEBRILES Proteus 0 x 23', 24)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (66, N'LEUCOCITOS ', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (67, N'TRICHOMONAS', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (68, N'CELULAS GUIA ', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (69, N'ERITROCITOS ', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (70, N'HONGOS ', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (71, N'TEST DE AMINAS ', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (72, N'GRAM. DE VAGINA REACCION LEUCOCITARIA', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (73, N'GRAM. DE VAGINA GARDNERELLA ', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (74, N'GRAM. DE VAGINA MOBILUNCUS', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (75, N'GRAM. DE VAGINA COCOS GRAM POSIT. ', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (76, N'GRAM. DE VAGINA FLORA MIXTA ', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (77, N'GRAM. DE VAGINA LACTOBACILOS ', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (78, N'GRAM. DE VAGINA DIFTEROIDES ', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (79, N'GRAM. DE CERVIX: REACCION LEUCOCITARIA ', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (80, N'GRAM. DE CERVIX: ERITROCITOS ', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (81, N'GRAM. DE CERVIX: DIPLOCOCOS GRAM. NEG. INT.', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (82, N'GRAM. DE CERVIX: DIPLOCOCOS GRAM. NEG. EXT', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (83, N'COLOR', 26)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (84, N'OLOR', 26)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (85, N'GLUCOSA ', 26)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (86, N'BILIRRUBINA ', 26)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (87, N'CETONA ', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (88, N'DENSIDAD', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (89, N'SANGRE ', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (90, N'PH', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (91, N'PROTEINAS ', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (92, N'UROBILINOGENO ', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (93, N'NITRITOS', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (94, N'LEUCOCITOS', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (95, N'OTROS ', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (96, N'LEUCOCITOSxc. ', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (97, N'PIOCITOSxc. ', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (98, N'HEMATIESxc. ', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (99, N'CEL. EPIT. ALT. ', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (100, N'CEL. EPIT. BAJ.- ', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (101, N'CILINDROSxc. ', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (102, N'CRISTALES', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (103, N'MOCO', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (104, N'BACTERIAS', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (105, N'Moco', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (106, N'SANGRE', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (107, N'GRASAS', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (108, N'ALMIDONES', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (109, N'FIBRAS.', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (110, N'LEUCOCITOS', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (111, N'ERITROCITOS', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (112, N'ESPORAS', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (113, N'CONSISTENCIA', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (114, N'SANGRE OCULTA', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (115, N'PH', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (116, N'AZUCARES REDUCT.-', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (117, N'GRAM.', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (118, N'MUSC.', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (119, N'WRIGHT', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (120, N'HONGOS', 9999)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (121, N'ENTAMOEBA HISTOLYTIC. ', 25)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (122, N'ENTAMOEBA HISTOLYTIC. ', 26)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (123, N'ENTAMOEBA HISTOLYTIC. ', 27)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (124, N'ENTAEMOEBA COLI ', 25)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (125, N'ENTAEMOEBA COLI ', 26)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (126, N'ENTAEMOEBA COLI ', 27)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (127, N'ENDOLIMAX NANA', 25)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (128, N'ENDOLIMAX NANA', 26)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (129, N'ENDOLIMAX NANA', 27)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (130, N'IODAMOEBA BUTSCHLII ', 25)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (131, N'IODAMOEBA BUTSCHLII ', 26)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (132, N'IODAMOEBA BUTSCHLII ', 27)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (133, N'GIARDIA LAMBLIA ', 25)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (134, N'GIARDIA LAMBLIA ', 26)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (135, N'GIARDIA LAMBLIA ', 27)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (136, N'TRICHONOMAS HOMINIS ', 25)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (137, N'TRICHONOMAS HOMINIS ', 26)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (138, N'TRICHONOMAS HOMINIS ', 27)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (139, N'CHILOMASTIX MESNILI ', 25)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (140, N'CHILOMASTIX MESNILI ', 26)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (141, N'CHILOMASTIX MESNILI ', 27)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (142, N'BALANTIDIUM COLI', 25)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (143, N'BALANTIDIUM COLI', 26)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (144, N'BALANTIDIUM COLI', 27)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (145, N'BLASTOCISTIS HOMINIS ', 25)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (146, N'BLASTOCISTIS HOMINIS ', 26)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (147, N'BLASTOCISTIS HOMINIS ', 27)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (148, N'ASCARIS LUMBRICOIDES ', 25)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (149, N'ASCARIS LUMBRICOIDES ', 26)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (150, N'ASCARIS LUMBRICOIDES ', 27)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (151, N'TRICHIURIS TRICHIURA ', 25)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (152, N'TRICHIURIS TRICHIURA ', 26)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (153, N'TRICHIURIS TRICHIURA ', 27)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (154, N'UNCINARIAS ', 25)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (155, N'UNCINARIAS ', 26)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (156, N'UNCINARIAS ', 27)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (157, N'TENIA SOLIUM 0 SAGUINATA ', 25)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (158, N'TENIA SOLIUM 0 SAGUINATA ', 26)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (159, N'TENIA SOLIUM 0 SAGUINATA ', 27)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (160, N'STRONGYLOIDES STERCOLARIS ', 25)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (161, N'STRONGYLOIDES STERCOLARIS ', 26)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (162, N'STRONGYLOIDES STERCOLARIS ', 27)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (163, N'HYMENOLEPIS NANA ', 25)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (164, N'HYMENOLEPIS NANA ', 26)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (165, N'HYMENOLEPIS NANA ', 27)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (166, N'HYMENOLEPIS DIMINUTA ', 25)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (167, N'HYMENOLEPIS DIMINUTA ', 26)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (168, N'HYMENOLEPIS DIMINUTA ', 27)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (169, N'ENTEROBIUS VERMICULARIS ', 25)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (170, N'ENTEROBIUS VERMICULARIS ', 26)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (171, N'ENTEROBIUS VERMICULARIS ', 27)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (172, N'NIT UREICO (BUN.)', 11)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (173, N'AZOHEMIA(UREA)', 12)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (174, N'CREATININA', 13)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (175, N'COLESTEROL TOTAL ', 14)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (176, N'TRIGLICERIDOS', 15)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (177, N'COLESTEROL HDL ', 16)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (178, N'COLESTEROL LDL ', 17)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (179, N'COLESTREOL VLDL ', 18)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (180, N'ACIDO URICO', 19)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (181, N'GLICEMIA AYUNAS', 20)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (182, N'GLICEMIA 1/2 HORA', 21)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (183, N'GLICEMIA 1 HORA', 22)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (184, N'GLICEMIA 2 HORAS', 23)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (185, N'GLICEMIA 3 HORAS', 24)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (186, N'BILIRRUBINA TOTAL', 25)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (187, N'BILIRRUBINA DIRECTA', 26)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (188, N'FOSFATASAS ALCALINA', 27)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (189, N'BILIRRUBINA INDIRECTA', 28)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (190, N'TRANSAMINASAS G. P.', 29)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (191, N'TRANSAMINASAS G. 0.', 30)
INSERT INTO [dbo].[Pruebas] ([IdPrueba], [NombrePrueba], [IdValorReferencia]) VALUES (192, N'AMILASAS', 31)
SET IDENTITY_INSERT [dbo].[Pruebas] OFF
GO
SET IDENTITY_INSERT [dbo].[Examenes] ON
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (1, NULL, N'19001', N'Acetaminofen', 3, NULL, CAST(15000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (2, NULL, N'19002', N'Acetoacetato', 3, NULL, CAST(43300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (3, NULL, N'19003', N'Acido ascorbico', 3, NULL, CAST(4600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (4, NULL, N'19004', N'Acidos biliares', 3, NULL, CAST(16200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (5, NULL, N'19005', N'Acido delta aminolevulinico', 3, NULL, CAST(23500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (6, NULL, N'19006', N'Acido folico', 3, NULL, CAST(20300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (7, NULL, N'19007', N'Acidos grasos de cadena muy larga cuantificacion', 3, NULL, CAST(161200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (8, NULL, N'19008', N'Acido 5 Hidroxi indolacetico (Serotonina)', 3, NULL, CAST(13300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (9, NULL, N'19009', N'Acido homovanilico', 3, NULL, CAST(34900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (10, NULL, N'19010', N'Acido lactico', 3, NULL, CAST(13900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (11, NULL, N'19011', N'Acidos organicos, espectometria de masas', 3, NULL, CAST(80600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (12, NULL, N'19012', N'Acidos organicos en orina(cromatografia de gas)', 3, NULL, CAST(53500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (13, NULL, N'19013', N'Acido orotico', 3, NULL, CAST(21900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (14, NULL, N'19014', N'Acido piruvico', 3, NULL, CAST(27400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (15, NULL, N'19015', N'Acido sialico', 3, NULL, CAST(14400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (16, NULL, N'19016', N'Acido succinico', 3, NULL, CAST(8000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (17, 11, N'19017', N'Acido urico', 1, NULL, CAST(5400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (18, NULL, N'19019', N'Acido valproico', 3, NULL, CAST(20000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (19, NULL, N'19020', N'Acido vanil mandelico', 3, NULL, CAST(29600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (20, NULL, N'19021', N'Addis,recuento de', 3, NULL, CAST(5300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (21, NULL, N'19022', N'Adenosin de aminasa', 3, NULL, CAST(5400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (22, NULL, N'19025', N'Adrenocorticotropica hormona ACTH', 3, NULL, CAST(21700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (23, NULL, N'19026', N'Aglutininas ( en caliente y en frio)', 3, NULL, CAST(4700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (24, NULL, N'19027', N'Agregacion plaquetaria (cada muestra)', 3, NULL, CAST(9100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (25, NULL, N'19031', N'Agua, examen fisico -quimico', 3, NULL, CAST(17300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (26, NULL, N'19032', N'Agua, examen microbiologico', 3, NULL, CAST(17300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (27, NULL, N'19033', N'Albert coloracion (Loeffler)', 3, NULL, CAST(5600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (28, NULL, N'19036', N'Albumina', 3, NULL, CAST(3200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (29, NULL, N'19037', N'Albumina acida', 3, NULL, CAST(8000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (30, NULL, N'19038', N'Alcaloides', 3, NULL, CAST(17700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (31, NULL, N'19039', N'Alcohol etilico', 3, NULL, CAST(13000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (32, NULL, N'19043', N'Alcohol metilico', 3, NULL, CAST(13000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (33, NULL, N'19044', N'Aldolasa', 3, NULL, CAST(12900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (34, NULL, N'19045', N'Aldosterona', 3, NULL, CAST(42700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (35, NULL, N'19049', N'Alfa 1 antitripsina', 3, NULL, CAST(14500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (36, NULL, N'19050', N'Alfa 1 glicoproteina', 3, NULL, CAST(8200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (37, NULL, N'19051', N'Alfa 2 HS glicoproteina', 3, NULL, CAST(8200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (38, NULL, N'19055', N'Alfa 2 macroglobulina', 3, NULL, CAST(7800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (39, NULL, N'19056', N'Alfa fetoproteina', 3, NULL, CAST(26800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (40, NULL, N'19057', N'Alfa iduronidasa', 3, NULL, CAST(34900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (41, NULL, N'19058', N'Alucinogenos (LSD)', 3, NULL, CAST(15500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (42, NULL, N'19061', N'Amikacina', 3, NULL, CAST(13500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (43, NULL, N'19062', N'Amilasa', 3, NULL, CAST(6200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (44, NULL, N'19063', N'Aminoacidos en orina, por cromatografia', 3, NULL, CAST(23900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (45, NULL, N'19064', N'Aminoacidos en orina prueba cualitativa, cada uno', 3, NULL, CAST(7500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (46, NULL, N'19065', N'Aminoacidos en sangre, por cromatografia', 3, NULL, CAST(22000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (47, NULL, N'19066', N'Aminoacidograma', 3, NULL, CAST(161200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (48, NULL, N'19067', N'Aminotransferasas', 3, NULL, CAST(53800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (49, NULL, N'19068', N'Amitriptilina (Triptanol)', 3, NULL, CAST(20200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (50, NULL, N'19069', N'Amonio', 3, NULL, CAST(12400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (51, NULL, N'19070', N'Androstenediona', 3, NULL, CAST(40500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (52, NULL, N'19073', N'Androsterona', 3, NULL, CAST(27900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (53, NULL, N'19074', N'Anfetaminas', 3, NULL, CAST(19900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (54, NULL, N'19075', N'Antibiograma', 1, NULL, CAST(9900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (55, NULL, N'19079', N'Anticoagulantes circulantes', 3, NULL, CAST(20200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (56, NULL, N'19080', N'Anticoagulante lupico', 3, NULL, CAST(22100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (57, NULL, N'19081', N'Anticuerpos anti-acetilcolina', 3, NULL, CAST(24100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (58, NULL, N'19082', N'Anticuerpos anti-cardiolipina', 3, NULL, CAST(35500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (59, NULL, N'19083', N'Anticuerpos anti-celulas parietales', 3, NULL, CAST(22500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (60, NULL, N'19084', N'Anticuerpos anti-centromero', 3, NULL, CAST(33300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (61, NULL, N'19085', N'Anticuerpos anti-citoplasmaticos', 3, NULL, CAST(25500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (62, NULL, N'19086', N'Anticuerpos anti-DNA', 3, NULL, CAST(40000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (63, NULL, N'19087', N'Anti-nDNA', 3, NULL, CAST(24400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (64, NULL, N'19088', N'Anticuerpos anti Baar  Epstein', 3, NULL, CAST(29600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (65, NULL, N'19089', N'Anticuerpos anti-espermatozoides', 3, NULL, CAST(25600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (66, NULL, N'19090', N'Anticuerpos anti-fosfolipidos', 3, NULL, CAST(25100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (67, NULL, N'19091', N'Anticuerpos anti-insulina', 3, NULL, CAST(19900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (68, NULL, N'19092', N'Anticuerpos anti-islotes', 3, NULL, CAST(24400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (69, NULL, N'19093', N'Anticuerpos anti-mitocondria', 3, NULL, CAST(16200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (70, NULL, N'19094', N'Anticuerpos anti-musculo liso', 3, NULL, CAST(16200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (71, NULL, N'19097', N'Anticuerpos anti-nucleares', 3, NULL, CAST(22700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (72, NULL, N'19098', N'Anticuerpos anti-nucleares extractables totales(ENA)', 3, NULL, CAST(48400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (73, NULL, N'19099', N'Anticuerpos anti-plaquetas', 3, NULL, CAST(14700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (74, NULL, N'19103', N'Anticuerpos anti-PM1', 3, NULL, CAST(36400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (75, NULL, N'19104', N'Anticuerpos anti-PM2', 3, NULL, CAST(36400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (76, NULL, N'19105', N'Anticuerpos anti-PM/SCL', 3, NULL, CAST(36400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (77, NULL, N'19109', N'Anticuerpos anti-RNP y SM o RO y LA', 3, NULL, CAST(36400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (78, NULL, N'19110', N'Anticuerpos anti-SCL 70', 3, NULL, CAST(36400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (79, NULL, N'19111', N'Anticuerpos anti-SSA', 3, NULL, CAST(36400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (80, NULL, N'19115', N'Anticuerpos anti-SSB', 3, NULL, CAST(36400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (81, NULL, N'19116', N'Anticuerpos anti-tiroideos coloidales', 3, NULL, CAST(20300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (82, NULL, N'19117', N'Anticuerpos anti-tiroideos microsomales', 3, NULL, CAST(23400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (83, NULL, N'19121', N'Anticuerpos anti-tiroideos tiroglobulinicos', 3, NULL, CAST(23400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (84, NULL, N'19122', N'Anticuerpos citotoxicos', 3, NULL, CAST(92800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (85, NULL, N'19123', N'Anticuerpos heterofilos especificos o absorbidos', 3, NULL, CAST(6300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (86, NULL, N'19127', N'Anticuerpos heterofilos totales', 3, NULL, CAST(11500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (87, NULL, N'19128', N'Antiestreptolisinas O, prueba cualitativa', 3, NULL, CAST(11200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (88, NULL, N'19129', N'Antiestreptolisinas O, prueba cuantitativa', 3, NULL, CAST(13400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (89, NULL, N'19133', N'Antigeno 15-3 para cancer de mama', 3, NULL, CAST(61000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (90, NULL, N'19134', N'Antigeno 19-9 para cancer de tubo digestivo', 3, NULL, CAST(49100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (91, NULL, N'19135', N'Antigeno 125 para cancer de ovario', 3, NULL, CAST(49100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (92, NULL, N'19136', N'Antigenosbacterianos en LCR,orina o sangre (prueba de latex polivalente para meningitis)', 2, NULL, CAST(53800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (93, NULL, N'19139', N'Antigeno carcinoembrionario', 3, NULL, CAST(40500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (94, NULL, N'19140', N'Antigeno especifico para cancer de prostata', 3, NULL, CAST(49400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (95, NULL, N'19141', N'Antigenos microbianos', 3, NULL, CAST(19700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (96, NULL, N'19142', N'Antitrombina III', 3, NULL, CAST(23400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (97, NULL, N'19143', N'Apolipoproteinas A y B', 3, NULL, CAST(41900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (98, NULL, N'19144', N'Arbovirus (FA, EEV, Dengue) prueba presuntiva (IHA)', 3, NULL, CAST(33900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (99, NULL, N'19145', N'Arbovirus (FA, EEV, Dengue) prueba confirmatoria( neutralizacion)', 3, NULL, CAST(69100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (100, NULL, N'19146', N'Arilsulfatasa A, en leucocitos', 3, NULL, CAST(37100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (101, NULL, N'19147', N'Arilsulfatasa A, en suero', 3, NULL, CAST(25100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (102, NULL, N'19148', N'Arilsulfatasa B, en leucocitos', 3, NULL, CAST(38700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (103, NULL, N'19149', N'Arsenico', 3, NULL, CAST(11400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (104, NULL, N'19150', N'Aspartilcilasa, en leucocitos', 3, NULL, CAST(38700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (105, NULL, N'19151', N'Asparragina', 3, NULL, CAST(53800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (106, NULL, N'19152', N'Azucares por cromatografia', 3, NULL, CAST(16400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (107, NULL, N'19153', N'Azucares reductores', 3, NULL, CAST(3500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (108, NULL, N'19154', N'B galactocidasa, en leucocitos', 3, NULL, CAST(38700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (109, NULL, N'19155', N'B glucocidasa, en leucocitos', 3, NULL, CAST(38700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (110, NULL, N'19156', N'BH4', 3, NULL, CAST(277800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (111, NULL, N'19157', N'Baciloscopia', 1, NULL, CAST(5100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (112, NULL, N'19158', N'Bandas oligoclonales, en suero y LCR', 3, NULL, CAST(20300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (113, NULL, N'19159', N'Barbituricos', 3, NULL, CAST(17700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (114, NULL, N'19160', N'Benzodiazepinas', 3, NULL, CAST(18900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (115, NULL, N'19163', N'Beta 2 macroglobulina', 3, NULL, CAST(12300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (116, NULL, N'19164', N'Beta 2 microglobulina', 3, NULL, CAST(22400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (117, 4, N'19165', N'BetaHCG cuantitativa', 3, NULL, CAST(17500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (118, NULL, N'19166', N'Betahidroxibutirato', 3, NULL, CAST(40300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (119, 3, N'19169', N'Bilirrubina directa', 1, NULL, CAST(3300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (120, 3, N'19170', N'Bilirrubina total', 1, NULL, CAST(4300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (121, NULL, N'19171', N'Biotinidasa, en suero', 3, NULL, CAST(19400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (122, NULL, N'19175', N'Cadmio', 3, NULL, CAST(16700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (123, NULL, N'19176', N'Cafeina', 3, NULL, CAST(14500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (124, NULL, N'19177', N'Calcio colorimetrico', 3, NULL, CAST(6800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (125, NULL, N'19181', N'Calcitonina', 3, NULL, CAST(46300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (126, NULL, N'19182', N'Calculo biliar, fisico-quimico', 3, NULL, CAST(10800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (127, NULL, N'19183', N'Calculo renal, fisico-quimico', 3, NULL, CAST(24100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (128, NULL, N'19187', N'Campo oscuro (cualquier muestra)', 3, NULL, CAST(11000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (129, NULL, N'19188', N'Canabinoides', 3, NULL, CAST(9700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (130, NULL, N'19189', N'Carbamazepina', 3, NULL, CAST(29800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (131, 3, N'19190', N'Carbohidratos, determinacion( Benedict, Selliwanoff, glucosa oxidasa), cada uno', 3, NULL, CAST(10900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (132, NULL, N'19193', N'Carbono monoxido', 3, NULL, CAST(11500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (133, NULL, N'19194', N'Carotenos', 3, NULL, CAST(8800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (134, NULL, N'19195', N'Catecolaminas diferenciada', 3, NULL, CAST(12500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (135, NULL, N'19199', N'Ceruloplasmina', 3, NULL, CAST(15800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (136, NULL, N'19200', N'Cetonas', 3, NULL, CAST(3000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (137, NULL, N'19201', N'Cianuros', 3, NULL, CAST(11500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (138, NULL, N'19205', N'Ciclosporina', 3, NULL, CAST(29600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (139, NULL, N'19206', N'Cisticercosis determinacion de Ac', 3, NULL, CAST(20300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (140, NULL, N'19207', N'Citomegalovirus anticuerpos G', 3, NULL, CAST(21100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (141, NULL, N'19211', N'Citomegalovirus anticuerpos M', 3, NULL, CAST(21100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (142, NULL, N'19213', N'Clamidia tracomatis antigeno', 3, NULL, CAST(21100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (143, NULL, N'19217', N'Clasificacion inmunologica de leucemia', 3, NULL, CAST(45600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (144, NULL, N'19218', N'Clasificacion inmunologica de linfoma', 3, NULL, CAST(53800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (145, NULL, N'19219', N'Clonazepan', 3, NULL, CAST(20700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (146, NULL, N'19223', N'Clorpromacina', 3, NULL, CAST(13500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (147, NULL, N'19224', N'Cloruro', 3, NULL, CAST(3600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (148, NULL, N'19225', N'Clorurode cetil piritinium', 3, NULL, CAST(16200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (149, NULL, N'19226', N'Cloruro ferrico', 3, NULL, CAST(5500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (150, NULL, N'19227', N'Coagulacion, tiempo de', 3, NULL, CAST(4600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (151, NULL, N'19230', N'Coagulacion, tiempo de retraccion', 3, NULL, CAST(5100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (152, NULL, N'19231', N'Cobre', 3, NULL, CAST(16700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (153, NULL, N'19235', N'Cocaina (metabolito)', 3, NULL, CAST(18000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (154, NULL, N'19236', N'Coccidiomicosis, determinacion de Ac', 3, NULL, CAST(16200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (155, 3, N'19237', N'Colesterol HDL', 1, NULL, CAST(8000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (156, 3, N'19241', N'Colesterol LDL', 1, NULL, CAST(9500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (157, 3, N'19242', N'Colesterol Total', 3, NULL, CAST(9700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (158, NULL, N'19243', N'Colinesterasa, en globulos rojos', 3, NULL, CAST(11500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (159, NULL, N'19244', N'Colinesterasa, en sangre total', 3, NULL, CAST(12900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (160, NULL, N'19247', N'Colinesterasa, serica', 3, NULL, CAST(11500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (161, NULL, N'19248', N'Coloraciones especiales', 3, NULL, CAST(11200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (162, NULL, N'19249', N'Coloraciones inmuno-cito e Histoquimicas (peroxidasa, Otras)', 3, NULL, CAST(29000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (163, 4, N'19253', N'Coloracion para Baar (Zielh-Nielsen)', 3, NULL, CAST(5500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (164, NULL, N'19254', N'Complemento C3 o C4 cuantitativo', 3, NULL, CAST(32600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (165, NULL, N'19255', N'Complemento C3 o C4 semicuantitativo', 3, NULL, CAST(12900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (166, NULL, N'19259', N'Complemento hemolitico CH50', 3, NULL, CAST(24300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (167, NULL, N'19260', N'Coombs directo', 2, NULL, CAST(5900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (168, NULL, N'19261', N'Coombs indirecto, prueba cualitativa', 2, NULL, CAST(3500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (169, NULL, N'19265', N'Coombs indirecto, prueba cuantitativa', 2, NULL, CAST(5900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (170, NULL, N'19266', N'Coprocultivo', 3, NULL, CAST(25300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (171, 1, N'19267', N'Coprologico', 1, NULL, CAST(3200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (172, 1, N'19271', N'Coprologico, por concentracion', 1, NULL, CAST(4700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (173, 1, N'19272', N'Coproporfirinas', 3, NULL, CAST(9700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (174, 1, N'19273', N'Coproscopico (incluye:ph, sangre azucares reductores y parasitos)', 1, NULL, CAST(12400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (175, NULL, N'19277', N'Corticosteroides 17 hidroxi', 3, NULL, CAST(12500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (176, 4, N'19278', N'Cortisol', 3, NULL, CAST(22500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (177, 4, N'19279', N'Cortisol, prueba de estimulacion', 3, NULL, CAST(28800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (178, NULL, N'19280', N'Creatina', 1, NULL, CAST(5400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (179, 11, N'19283', N'Creatincinasa CK', 1, NULL, CAST(7400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (180, NULL, N'19284', N'Creatincinasa con separacion de isoenzimas', 1, NULL, CAST(17700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (181, NULL, N'19285', N'Creatincinasa fraccion MB', 1, NULL, CAST(10300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (182, 3, N'19289', N'Creatinina, depuracion', 1, NULL, CAST(7400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (183, NULL, N'19290', N'suero, orina y otros', 1, NULL, CAST(4600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (184, NULL, N'19291', N'Crecimiento hormona, con estimulo de clonidina post-ejercicio', 3, NULL, CAST(62800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (185, NULL, N'19292', N'Crecimiento hormona somatotropica', 3, NULL, CAST(29300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (186, NULL, N'19295', N'Crioglobulina', 3, NULL, CAST(4700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (187, NULL, N'19296', N'Crio hemolisinas', 3, NULL, CAST(4100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (188, NULL, N'19297', N'Criptococcus neoformans, Busqueda de antigeno por latex', 3, NULL, CAST(12900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (189, NULL, N'19301', N'Criptococcus neoformans, cultivo,', 3, NULL, CAST(12500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (190, NULL, N'19302', N'Criptococcus neoformans, examen directo por tinta china', 3, NULL, CAST(6200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (191, NULL, N'19303', N'Criptosporidiasis (coloracion Z-N modificada)', 3, NULL, CAST(9000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (192, 2, N'19304', N'Cuadro hematico o hemograma hematocrito y leucograma', 1, NULL, CAST(7900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (193, NULL, N'19307', N'Cuerpos de Heinz', 3, NULL, CAST(4200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (194, NULL, N'19308', N'Cultivo para anaerobios', 3, NULL, CAST(21100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (195, NULL, N'19309', N'Cultivo para hongos', 3, NULL, CAST(11200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (196, NULL, N'19313', N'Cultivo para mycobacterium', 3, NULL, CAST(22900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (197, NULL, N'19314', N'Cultivo para mycoplasma', 3, NULL, CAST(9700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (198, NULL, N'19315', N'Cultivo para virus', 3, NULL, CAST(70800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (199, NULL, N'19316', N'Cultivo y antibiograma para microorganismos', 3, NULL, CAST(18700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (200, NULL, N'19319', N'Cultivos especiales para microorganismos', 3, NULL, CAST(12900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (201, NULL, N'19320', N'Curva de agregacion plaquetaria', 3, NULL, CAST(51600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (202, NULL, N'19321', N'Curva de tolerancia a la fenilalaninapos estimulo con BH-4', 3, NULL, CAST(96700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (203, NULL, N'19322', N'Curva de tolerancia a la galactosa', 3, NULL, CAST(19400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (204, 3, N'19323', N'Curva de toleracia a la glucosa (5  muestras)', 1, NULL, CAST(21900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (205, NULL, N'19326', N'Dehidroepinandrosterona', 3, NULL, CAST(37100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (206, NULL, N'19327', N'Dehidroepinandrosterona sulfato', 3, NULL, CAST(29000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (207, NULL, N'19329', N'Deshidrogenasa hidroxibutirica HBDH', 3, NULL, CAST(19700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (208, NULL, N'19332', N'Deshidrogenasa lactica LDH', 3, NULL, CAST(5600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (209, NULL, N'19333', N'Deshidrogenasa lactica con separacion de isoenzimas', 3, NULL, CAST(17500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (210, NULL, N'19334', N'Desipramina', 3, NULL, CAST(24100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (211, NULL, N'19338', N'Digitoxina', 3, NULL, CAST(18700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (212, NULL, N'19339', N'Digoxina', 3, NULL, CAST(24700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (213, NULL, N'19340', N'Dinitrofenil Hidracina', 3, NULL, CAST(5800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (214, NULL, N'19341', N'Disopiramida', 3, NULL, CAST(14500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (215, NULL, N'19344', N'Drepanocitos', 3, NULL, CAST(3500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (216, NULL, N'19345', N'Dxilosa', 3, NULL, CAST(27400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (217, NULL, N'19350', N'Ecoli, identificacion serologica', 3, NULL, CAST(8800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (218, NULL, N'19351', N'Echinocoquiasis, determinacion de Ac', 3, NULL, CAST(12900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (219, NULL, N'19352', N'Elastasa', 3, NULL, CAST(17700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (220, NULL, N'19353', N'Embarazo, prueba cualitativa por (RIA, ELISA o en placa monoclonal)', 1, NULL, CAST(15400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (221, NULL, N'19354', N'Embarazo, prueba en placa (latex, policlonal)', 1, NULL, CAST(6300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (222, NULL, N'19355', N'Entamoeba histolitica, determinacion de Ac', 3, NULL, CAST(5900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (223, NULL, N'19356', N'Enterovirus, determinacion de Ac', 3, NULL, CAST(17500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (224, NULL, N'19357', N'Enzimas en suero-cuantificacion', 3, NULL, CAST(53800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (225, NULL, N'19358', N'Enzimas enfermedades de substancia blanca, c/u', 3, NULL, CAST(107500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (226, NULL, N'19359', N'Enzimas enfermedades de substancia gris, c/u', 3, NULL, CAST(107500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (227, NULL, N'19360', N'Enzimas glicoliticas, c/u', 3, NULL, CAST(107500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (228, NULL, N'19361', N'Enzimas lisosomales, medicion', 3, NULL, CAST(161200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (229, NULL, N'19362', N'Enzimas metabolismo del glicogeno', 3, NULL, CAST(107500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (230, NULL, N'19363', N'Enzimas mitocondriales', 3, NULL, CAST(161200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (231, NULL, N'19364', N'Eosinofilos, recuento (cualquier muestra)', 3, NULL, CAST(5100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (232, NULL, N'19365', N'Epinandrosterona', 3, NULL, CAST(22500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (233, NULL, N'19368', N'Escopolamina', 3, NULL, CAST(15000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (234, NULL, N'19369', N'Espermograma basico incluye: morfologia recuento)', 3, NULL, CAST(17300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (235, NULL, N'19370', N'Espermograma con bioquimica (incluye: acido citrico, fructuosa, gliceril-osforil-colina)', 3, NULL, CAST(30000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (236, NULL, N'19374', N'Esterasa isoenzimas', 3, NULL, CAST(16400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (237, NULL, N'19375', N'Esterasa pancreatica', 3, NULL, CAST(16400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (238, NULL, N'19376', N'Esteroides 17 Cetos', 3, NULL, CAST(24700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (239, 4, N'19380', N'Estradiol', 3, NULL, CAST(26200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (240, NULL, N'19381', N'Estreptomicina', 3, NULL, CAST(14700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (241, NULL, N'19382', N'Estricnina', 3, NULL, CAST(23200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (242, NULL, N'19386', N'Estriol', 3, NULL, CAST(25800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (243, NULL, N'19387', N'Estrogenos', 3, NULL, CAST(14700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (244, NULL, N'19388', N'Etosuximida', 3, NULL, CAST(13500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (245, 4, N'19389', N'FSH y LH post-gonarelina', 3, NULL, CAST(64500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (246, NULL, N'19393', N'Factor plaquetario  III (CELITE)', 3, NULL, CAST(14000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (247, 3, N'19394', N'Factor RA, prueba cuantitativa de alta precision', 3, NULL, CAST(8200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (248, 3, N'19395', N'Factor RA, prueba semicuantitativa', 3, NULL, CAST(5300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (249, 3, N'19399', N'Factor Rh anti D o factor D', 1, NULL, CAST(7500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (250, 3, N'19400', N'Factor Rh (C, c, E, e)', 1, NULL, CAST(8500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (251, NULL, N'19401', N'Factor V Labil', 3, NULL, CAST(9000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (252, NULL, N'19405', N'Factor VII', 3, NULL, CAST(9000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (253, NULL, N'19406', N'Factor VIII', 3, NULL, CAST(9000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (254, NULL, N'19407', N'Factor IX', 3, NULL, CAST(9000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (255, NULL, N'19411', N'Factor X', 3, NULL, CAST(9000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (256, NULL, N'19412', N'Factor XI', 3, NULL, CAST(9000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (257, NULL, N'19413', N'Factor XII', 3, NULL, CAST(9000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (258, NULL, N'19417', N'Factor XIII', 3, NULL, CAST(9000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (259, NULL, N'19418', N'Factor Von Willebrand', 3, NULL, CAST(9000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (260, 6, N'19419', N'Factores A1- A2-H y otros ligados a los grupos sanguineos', 3, NULL, CAST(2600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (261, NULL, N'19423', N'Fagocitosis, estudio de capacidad fagocitaria de leucocitos', 3, NULL, CAST(6500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (262, NULL, N'19424', N'Fenciclidina', 3, NULL, CAST(10800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (263, NULL, N'19425', N'Fenilalanina', 3, NULL, CAST(7500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (264, NULL, N'19426', N'Fenilalanina en sangre, prueba de inhibicion microbiologica (Test de Guthrie)', 3, NULL, CAST(38700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (265, NULL, N'19429', N'Fenil cetonuria', 3, NULL, CAST(5100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (266, 4, N'19430', N'Fenitoina (epamin, cumatil, hidanil difenilhidantoina)', 3, NULL, CAST(31200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (267, NULL, N'19431', N'Fenobarbital', 3, NULL, CAST(31200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (268, NULL, N'19435', N'Fenotiacinas', 3, NULL, CAST(13500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (269, NULL, N'19436', N'Ferritina', 3, NULL, CAST(18300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (270, NULL, N'19437', N'Fibrina', 3, NULL, CAST(4200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (271, NULL, N'19441', N'Fibrinogeno', 3, NULL, CAST(7300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (272, NULL, N'19442', N'Fibrinogeno, productos de degradacion', 3, NULL, CAST(11200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (273, NULL, N'19443', N'Fibrinolisis', 3, NULL, CAST(4000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (274, NULL, N'19444', N'Fibroblastos, cultivo', 3, NULL, CAST(214800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (275, NULL, N'19445', N'Fibroplastos, medicion enzimatica en cultivo de', 3, NULL, CAST(268600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (276, NULL, N'19446', N'Folatos', 3, NULL, CAST(25800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (277, 4, N'19447', N'Foliculo estimulante FSH', 3, NULL, CAST(29000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (278, 3, N'19448', N'Fosfatasa acida', 3, NULL, CAST(6800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (279, 3, N'19449', N'Fosfatasa acida determinacion en leucocitos', 3, NULL, CAST(14500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (280, 3, N'19453', N'Fosfatasa acida prostatica que detecte estado', 3, NULL, CAST(17700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (281, 3, N'19454', N'Fosfatasa alcalina', 3, NULL, CAST(5800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (282, 3, N'19455', N'Fosfatasa alcalina, determinacion en leucocitos', 3, NULL, CAST(14500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (283, 3, N'19459', N'Fosfatasa alcalina isoenzimas', 3, NULL, CAST(8800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (284, NULL, N'19460', N'Fosfatidil glicerol', 3, NULL, CAST(19400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (285, NULL, N'19461', N'Fosfatidil inositol', 3, NULL, CAST(19400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (286, NULL, N'19462', N'Fosfofructocinasa', 3, NULL, CAST(35500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (287, NULL, N'19463', N'Fosforilasa', 3, NULL, CAST(35500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (288, NULL, N'19465', N'Fosforo colorimetrico', 3, NULL, CAST(6400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (289, NULL, N'19466', N'Fragilidad capilar', 3, NULL, CAST(5100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (290, NULL, N'19467', N'Fragilidad osmotica (resistencia globular)', 3, NULL, CAST(5100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (291, NULL, N'19472', N'Frotis rectal, identificacion de trofozoitos', 3, NULL, CAST(7300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (292, NULL, N'19473', N'Fructosamina', 3, NULL, CAST(8900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (293, NULL, N'19478', N'Galactosa', 3, NULL, CAST(8800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (294, NULL, N'19479', N'Galactosa uridil transferasa', 3, NULL, CAST(24100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (295, NULL, N'19480', N'Gamaglutamil transferasa GGT', 3, NULL, CAST(9700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (296, NULL, N'19481', N'Gangliosidos en orina, por cromatografia', 3, NULL, CAST(26200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (297, NULL, N'19482', N'Gases arteriales', 3, NULL, CAST(17700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (298, NULL, N'19484', N'Gastrina', 3, NULL, CAST(43800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (299, NULL, N'19485', N'Gentamicina', 3, NULL, CAST(20500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (300, NULL, N'19486', N'Glicina', 3, NULL, CAST(37100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (301, 4, N'19487', N'Globulina trasportadora de T3, TBG', 3, NULL, CAST(23300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (302, 3, N'19488', N'Glucogeno, curva de estimulacion con glucagon, midiendo glucosa y acido lactico', 3, NULL, CAST(96700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (303, 3, N'19490', N'Glucosa (en suero, LCR, otros fluidos)', 3, NULL, CAST(4700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (304, 3, N'19491', N'Glucosa  6.  fofatasa', 3, NULL, CAST(36200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (305, 3, N'19492', N'Glucosa  6.  fosfato deshidrogenasa', 3, NULL, CAST(17300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (306, 3, N'19493', N'Glucosa pre y post carga o test de O''sullivan', 1, NULL, CAST(12100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (307, NULL, N'19496', N'Glucosuria y cetonuria', 1, NULL, CAST(3200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (308, NULL, N'19497', N'Gram, tincion y lectura (cualquier muestra)', 1, NULL, CAST(4100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (309, NULL, N'19498', N'Grasas neutras en MF', 3, NULL, CAST(6800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (310, NULL, N'19503', N'Ham, prueba', 3, NULL, CAST(8100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (311, NULL, N'19504', N'Haptoglobina', 3, NULL, CAST(10800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (312, NULL, N'19505', N'Hematocrito', 1, NULL, CAST(1400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (313, NULL, N'19509', N'Hemoclasificacion (grupo sanguineo y factor RH)', 1, NULL, CAST(10100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (314, NULL, N'19510', N'Hemoclasificacion, prueba globular', 1, NULL, CAST(4200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (315, NULL, N'19511', N'Hemoclasificacion, prueba serica', 1, NULL, CAST(11200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (316, NULL, N'19514', N'Hemocultivo', 3, NULL, CAST(22500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (317, 2, N'19515', N'Hemoglobina A2  por cromatografia de columna', 1, NULL, CAST(16800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (318, NULL, N'19516', N'Hemoglobina, alquilacion de', 1, NULL, CAST(13700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (319, NULL, N'19517', N'Hemoglobina, concentracion de', 1, NULL, CAST(3000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (320, 2, N'19518', N'Hemoglobina fetal', 1, NULL, CAST(10400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (321, NULL, N'19521', N'Hemoglobina, fracciones por electroforesis', 1, NULL, CAST(31800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (322, 2, N'19522', N'Hemoglobina glicosilada', 1, NULL, CAST(17500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (323, 2, N'19523', N'Hemoglobina libre en plasma', 1, NULL, CAST(15100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (324, 2, N'19527', N'Hemoglobina materna y fetal (APT)', 1, NULL, CAST(6800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (325, 2, N'19528', N'Hemoglobina materna y fetal (Kli Haner)', 1, NULL, CAST(6200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (326, NULL, N'19529', N'Hemoglobinuria', 3, NULL, CAST(8800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (327, NULL, N'19533', N'Hemolisinas', 3, NULL, CAST(10200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (328, NULL, N'19534', N'Hemoparasitos (frotis, gota gruesa)', 1, NULL, CAST(4100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (329, NULL, N'19535', N'Hemosiderina', 3, NULL, CAST(18000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (330, NULL, N'19539', N'Heparina, dosificacion de', 3, NULL, CAST(3200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (331, 6, N'19540', N'Hepatitis A, anticuerpo G', 3, NULL, CAST(34400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (332, 6, N'19541', N'Hepatitis A, anticuerpo M', 3, NULL, CAST(28200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (333, 6, N'19542', N'Hepatitis B, anticuerpo anti central G', 3, NULL, CAST(27400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (334, 6, N'19545', N'Hepatitis B, anticuerpo anti central M', 3, NULL, CAST(34400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (335, 6, N'19546', N'Hepatitis B, anticuerpo anti E', 3, NULL, CAST(34400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (336, 6, N'19547', N'Hepatitis B, anticuerpo anti superficial', 3, NULL, CAST(34400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (337, NULL, N'19548', N'Heridas: microscopico, cultivo y AB, germenes comunes', 3, NULL, CAST(53800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (338, NULL, N'19549', N'Heridas: microscopico, cultivo y AB, anaerobios', 3, NULL, CAST(60500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (339, 6, N'19551', N'Hepatitis B, antigeno de superficie', 3, NULL, CAST(34400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (340, 6, N'19552', N'Hepatitis B, antigeno E', 3, NULL, CAST(34400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (341, 6, N'19553', N'Hepatitis B, anti DNA polimerasa', 3, NULL, CAST(34400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (342, 6, N'19557', N'Hepatitis Delta anticuerpo', 3, NULL, CAST(28200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (343, 6, N'19558', N'Hepatitis Delta, antigeno', 3, NULL, CAST(28200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (344, 6, N'19559', N'Hepatitis C, anticuerpo G', 3, NULL, CAST(38700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (345, NULL, N'19563', N'Herpes I, anticuerpo G', 3, NULL, CAST(30400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (346, NULL, N'19564', N'Herpes II, anticuerpo G', 3, NULL, CAST(30400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (347, NULL, N'19565', N'Herpes, anticuerpo M', 3, NULL, CAST(30400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (348, NULL, N'19566', N'Herpes, antigeno', 3, NULL, CAST(21400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (349, NULL, N'19568', N'Hexosaminidasa A y B en leucocitos', 3, NULL, CAST(38700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (350, NULL, N'19569', N'Hexosaminidasa A y B en suero', 3, NULL, CAST(14500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (351, NULL, N'19570', N'Hidrocarburos', 3, NULL, CAST(10600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (352, NULL, N'19571', N'Hierro serico, capacidad de fijacion y combinacion', 3, NULL, CAST(13400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (353, NULL, N'19575', N'Histocompatibilidad, estudio completo (HLA, A BC DR, etc) y prueba cruzada', 3, NULL, CAST(773300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (354, NULL, N'19576', N'Histocompatibilidad, estudio parcial (HLA,AB)', 3, NULL, CAST(210600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (355, NULL, N'19577', N'Histocompatibilidad, estudio parcial (HLA, B27, B8, B5 etc ) cada uno', 3, NULL, CAST(92000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (356, NULL, N'19578', N'Histoplasma capsulatum, identificacion serologica', 3, NULL, CAST(12500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (357, NULL, N'19581', N'Hongos, alucinogenos', 3, NULL, CAST(26600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (358, NULL, N'19582', N'Hongos, examen directo (KOH)', 1, NULL, CAST(4600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (359, NULL, N'19583', N'Hongos, identificacion serologica', 3, NULL, CAST(28500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (360, 2, N'19584', N'HPRT, en eritrocitos', 3, NULL, CAST(24100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (361, NULL, N'19585', N'HPRT, en raices de cabello', 3, NULL, CAST(93500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (362, NULL, N'19587', N'HTLV I, anticuerpos presuntivos', 3, NULL, CAST(27400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (363, NULL, N'19588', N'HTLV I, prueba confirmatoria', 3, NULL, CAST(35500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (364, NULL, N'19593', N'Identificacion de anticuerpos irregulares', 3, NULL, CAST(12500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (365, NULL, N'19594', N'Imipramina', 3, NULL, CAST(15300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (366, NULL, N'19595', N'Inhibidor de C 1  esterasa', 3, NULL, CAST(16700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (367, NULL, N'19599', N'Inmunoelectroforesis', 3, NULL, CAST(31500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (368, 6, N'19600', N'Imunoglobulina IgA IgG IgM, (dosificacion de alta precision) c/u', 3, NULL, CAST(16200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (369, 6, N'19601', N'Inmunoglobulina IgA IgG IgM, (semicuantitativa) c/u', 3, NULL, CAST(10400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (370, NULL, N'19606', N'Inmunoglobulina IgE especifica, dosificacion (cada alergeno)', 3, NULL, CAST(24100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (371, NULL, N'19607', N'Inmunoglobulina IgE total, dosificacion', 3, NULL, CAST(20200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (372, NULL, N'19611', N'Insulina, cada muestra', 3, NULL, CAST(28500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (373, NULL, N'19612', N'Intradermorreaccion para comprobar inmunidad contra bacterias, hongos, parasitos o virus', 3, NULL, CAST(11200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (374, NULL, N'19613', N'Iontoforesis', 3, NULL, CAST(37600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (375, NULL, N'19614', N'Isoaglutininas', 3, NULL, CAST(8000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (376, NULL, N'19617', N'Isocitrato deshidrogenasa ICDH', 3, NULL, CAST(17000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (377, NULL, N'19618', N'Isoleucoaglutininas', 3, NULL, CAST(8900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (378, NULL, N'19621', N'Kanamicina', 3, NULL, CAST(13700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (379, NULL, N'19624', N'Lactato', 3, NULL, CAST(16200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (380, NULL, N'19625', N'Lactoferrina', 3, NULL, CAST(19900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (381, NULL, N'19626', N'Lactogeno placentario', 3, NULL, CAST(23200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (382, NULL, N'19629', N'LCarnitinina', 3, NULL, CAST(20200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (383, NULL, N'19630', N'Lecitina   esfingomielina, indice', 3, NULL, CAST(29000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (384, NULL, N'19631', N'Legionella, anticuerpo', 3, NULL, CAST(37400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (385, NULL, N'19632', N'Legionella, antigeno', 3, NULL, CAST(37400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (386, NULL, N'19636', N'Leishmaniasis, determinacion Ac', 3, NULL, CAST(5400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (387, NULL, N'19640', N'Leptospira, identificacion serologica', 3, NULL, CAST(11500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (388, NULL, N'19641', N'Leucina arilamidasa LAP', 3, NULL, CAST(19500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (389, NULL, N'19642', N'Leucocitos, recuento diferencial', 3, NULL, CAST(2300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (390, NULL, N'19646', N'Leucocitos, recuento total', 3, NULL, CAST(1800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (391, NULL, N'19647', N'Leucograma, recuento total y diferencial de leucocitos', 3, NULL, CAST(7600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (392, NULL, N'19648', N'Lesh Nyhan en leucocitos', 3, NULL, CAST(53800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (393, NULL, N'19649', N'Lesh Nyhan en raiz de cabello', 3, NULL, CAST(107500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (394, NULL, N'19650', N'Lidocaina', 3, NULL, CAST(13700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (395, NULL, N'19652', N'Linfocitos B, cuantificacion', 3, NULL, CAST(26000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (396, NULL, N'19653', N'Linfocitos CD4  (ayudadores)', 3, NULL, CAST(40500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (397, NULL, N'19654', N'Linfocitos CD8', 3, NULL, CAST(40500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (398, NULL, N'19658', N'Linfocitos CD11', 3, NULL, CAST(40500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (399, NULL, N'19659', N'Linfocitos, cultivo mixto', 3, NULL, CAST(48400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (400, NULL, N'19660', N'Linfocitos, numero absoluto', 3, NULL, CAST(3200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (401, NULL, N'19664', N'Linfocitos T, cuantificacion', 3, NULL, CAST(25800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (402, NULL, N'19665', N'Lipasa', 3, NULL, CAST(12200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (403, NULL, N'19666', N'Lipoproteinas   electroforesis', 3, NULL, CAST(27600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (404, 3, N'19670', N'Liquido amniotico, citoquimico (celulas  anaranjadas, test de Clemens y creatinina)', 3, NULL, CAST(16900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (405, NULL, N'19671', N'Liquido amniotico, curva espectral', 3, NULL, CAST(9700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (406, NULL, N'19672', N'Liquido ascitico, eaamen citoquimico', 3, NULL, CAST(20200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (407, 3, N'19676', N'Liquido cefalorraquideo, exam fisico y citoquimico-incluye glucosa,proteinas,cloruros-', 3, NULL, CAST(20900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (408, NULL, N'19677', N'Liquido pericardico, examen fisico y citoquimico-incluye densidad y proteinas-', 3, NULL, CAST(18500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (409, NULL, N'19678', N'Liquido peritoneal, examen fisico y citoquimico-incluye proteinas y tincion  Gram', 3, NULL, CAST(18500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (410, 3, N'19682', N'Liquido pleural, examen fisico y citoquimico-incluye: glucosa y LDH-', 3, NULL, CAST(20700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (411, NULL, N'19683', N'Liquido prostatico, examen microscopico', 3, NULL, CAST(11200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (412, 3, N'19684', N'Liquido sinovial, examen fisico y citoquimico incluye: glucosa y test de mucina)', 3, NULL, CAST(20200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (413, NULL, N'19685', N'Lisina, en plasma o en orina', 3, NULL, CAST(53800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (414, NULL, N'19688', N'Listeria, identificacion serologica', 3, NULL, CAST(14200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (415, NULL, N'19689', N'Litio por fotometria de llama', 3, NULL, CAST(7900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (416, NULL, N'19690', N'Lorazepan', 3, NULL, CAST(16400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (417, NULL, N'19694', N'Luteinizante hormona LH', 3, NULL, CAST(33300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (418, NULL, N'19698', N'Magnesio colorimetrico', 3, NULL, CAST(7400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (419, NULL, N'19699', N'Maltasa acida', 3, NULL, CAST(32800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (420, NULL, N'19700', N'Marcadores tumorales cada uno', 3, NULL, CAST(45200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (421, NULL, N'19701', N'Meperidina', 3, NULL, CAST(15300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (422, NULL, N'19705', N'Mercurio en cabello', 3, NULL, CAST(27400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (423, NULL, N'19706', N'Mercurio en orina', 3, NULL, CAST(24100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (424, NULL, N'19707', N'Mercurio en sangre', 3, NULL, CAST(24100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (425, NULL, N'19712', N'Mercurio en u?as', 3, NULL, CAST(27400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (426, NULL, N'19713', N'Metacualona', 3, NULL, CAST(15100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (427, NULL, N'19714', N'Metadona', 3, NULL, CAST(10200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (428, NULL, N'19718', N'Metaepinefrina', 3, NULL, CAST(12500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (429, NULL, N'19719', N'Metahemoglobina', 3, NULL, CAST(4700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (430, NULL, N'19720', N'Metales, por absorcion atomica, cada uno', 3, NULL, CAST(19400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (431, NULL, N'19721', N'Metotrexate', 3, NULL, CAST(13700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (432, NULL, N'19722', N'Microalbuminuria', 3, NULL, CAST(14500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (433, NULL, N'19723', N'Mielocultivo, con toma de muestra', 3, NULL, CAST(26400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (434, NULL, N'19725', N'Mielocultivo, sin toma de muestra', 3, NULL, CAST(16200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (435, NULL, N'19726', N'Mioglobina', 3, NULL, CAST(10300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (436, NULL, N'19727', N'Moco cervical, analisis (Sims Huhner)', 3, NULL, CAST(9900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (437, NULL, N'19728', N'Mono y disacaridos, cromatografia', 3, NULL, CAST(26800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (438, NULL, N'19729', N'Mono test (prueba de latex para mononucleosis infecciosa', 3, NULL, CAST(8200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (439, NULL, N'19731', N'Morfologia globular (serie roja)', 3, NULL, CAST(2900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (440, NULL, N'19732', N'Mucopolisacaridos, por cromatografia', 3, NULL, CAST(24400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (441, NULL, N'19733', N'Mucopolisacaridos, por electroforesis', 3, NULL, CAST(26200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (442, NULL, N'19734', N'Mycobacterium, identificacion', 3, NULL, CAST(32200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (443, NULL, N'19736', N'Mycobacterium, pruebas de sensibilidad', 3, NULL, CAST(63100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (444, NULL, N'19737', N'Mycoplasma neumonie, determinacion de Ac', 3, NULL, CAST(11000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (445, NULL, N'19742', N'N  Acetil procainamida', 3, NULL, CAST(9900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (446, NULL, N'19743', N'Neisseria gonorrea, cultivo de Thayer Martin', 1, NULL, CAST(19400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (447, NULL, N'19744', N'Neisseria gonorrea, determinacion de antigenos', 3, NULL, CAST(16200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (448, NULL, N'19748', N'Netilmicina', 3, NULL, CAST(17600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (449, NULL, N'19749', N'Nitrogeno ureico', 1, NULL, CAST(3800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (450, NULL, N'19750', N'Nitroprusiato', 3, NULL, CAST(5800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (451, NULL, N'19751', N'Nitrosonaftol', 3, NULL, CAST(5800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (452, NULL, N'19752', N'Nortriptilina', 3, NULL, CAST(17600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (453, NULL, N'19753', N'Oligosacaridos, en orina', 3, NULL, CAST(26200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (454, NULL, N'19755', N'Opiaceos', 3, NULL, CAST(18500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (455, NULL, N'19756', N'Organoclorados', 3, NULL, CAST(14700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (456, NULL, N'19757', N'Organofosforados', 3, NULL, CAST(19000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (457, NULL, N'19761', N'Osmolaridad', 3, NULL, CAST(6500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (458, NULL, N'19762', N'Oxiuros, frotis', 3, NULL, CAST(3800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (459, NULL, N'19767', N'Parainfluenza, determinacion de Ac', 3, NULL, CAST(12300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (460, NULL, N'19768', N'Paranitrofenol', 3, NULL, CAST(13500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (461, NULL, N'19769', N'Paraquat', 3, NULL, CAST(13500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (462, 1, N'19773', N'Parasitos en bilis, jugo duodenal, expectoraciones u otras secreciones', 3, NULL, CAST(3300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (463, NULL, N'19774', N'Paratohormona PTH', 3, NULL, CAST(37100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (464, NULL, N'19775', N'Parcial de orina, incluido sedimento', 1, NULL, CAST(5100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (465, NULL, N'19777', N'Pass, tincion y lectura', 3, NULL, CAST(6500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (466, NULL, N'19778', N'Piruvatocinasa', 3, NULL, CAST(15300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (467, NULL, N'19779', N'Piruvato deshidrogenasa', 3, NULL, CAST(14500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (468, NULL, N'19780', N'Plaquetas, recuento', 1, NULL, CAST(3200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (469, NULL, N'19781', N'Plasminogeno', 3, NULL, CAST(16200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (470, NULL, N'19785', N'Plomo, en sangre o en orina, cada uno', 3, NULL, CAST(19400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (471, NULL, N'19786', N'Pneumococcus, identificacion serologica', 3, NULL, CAST(7900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (472, NULL, N'19787', N'Porfirinas', 3, NULL, CAST(8000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (473, NULL, N'19791', N'Porfobilinogeno', 3, NULL, CAST(9700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (474, NULL, N'19792', N'Potasio', 3, NULL, CAST(11300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (475, NULL, N'19793', N'Primidona', 3, NULL, CAST(30400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (476, NULL, N'19797', N'Procainamida', 3, NULL, CAST(19700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (477, 4, N'19798', N'Progesterona', 3, NULL, CAST(26800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (478, 4, N'19799', N'Progesterona  17  hidroxi', 3, NULL, CAST(29000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (479, 4, N'19802', N'Prolactina', 3, NULL, CAST(25800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (480, 4, N'19803', N'Prolactina, prueba de estimulacion', 3, NULL, CAST(20900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (481, NULL, N'19804', N'Propoxifeno', 3, NULL, CAST(17600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (482, NULL, N'19805', N'Protamina', 3, NULL, CAST(20000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (483, NULL, N'19806', N'Proteina C reactiva PCR, prueba cuantitativa de alta precision', 3, NULL, CAST(16200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (484, NULL, N'19809', N'Proteina C reactiva PCR, prueba semicuantitativa', 3, NULL, CAST(4700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (485, NULL, N'19810', N'Proteina de Bence Jones', 3, NULL, CAST(4100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (486, NULL, N'19811', N'Proteinas fraccionadas albumina/globulina', 3, NULL, CAST(20200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (487, NULL, N'19815', N'Proteinas por electroforesis', 3, NULL, CAST(15400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (488, NULL, N'19816', N'Proteinas totales, en suero y otros fluidos', 3, NULL, CAST(3200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (489, 4, N'19817', N'Proteinas transportadora de testosterona PTHS', 3, NULL, CAST(35500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (490, NULL, N'19821', N'Proteinuria en  24  horas', 3, NULL, CAST(3600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (491, NULL, N'19822', N'Protoporfirina zinc eritrocitica Z PP', 3, NULL, CAST(13500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (492, NULL, N'19823', N'Protrombina, consumo', 3, NULL, CAST(4600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (493, NULL, N'19827', N'Protrombina, tiempo PT', 3, NULL, CAST(11500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (494, NULL, N'19828', N'Prueba de compatibilidad, cruzada mayor incluye-hemoclasificacion de donante receptor', 3, NULL, CAST(13500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (495, NULL, N'19829', N'Prueba de compatibilidad, cruzada menor incluye-hemoclasificacion de donante y receptor', 3, NULL, CAST(12900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (496, NULL, N'19830', N'Prueba rapida para streptococcus beta hemolitico', 3, NULL, CAST(16200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (497, NULL, N'19833', N'Pseudocolinesterasa', 3, NULL, CAST(12000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (498, NULL, N'19835', N'Pterinas, determinacion', 3, NULL, CAST(268600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (499, NULL, N'19838', N'Quinidina', 3, NULL, CAST(12000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (500, NULL, N'19839', N'Rabia, examen para antigenos (AF), inoculacion en raton o serologia', 3, NULL, CAST(73500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (501, NULL, N'19842', N'Rastreo de anticuerpos irregulares', 3, NULL, CAST(12900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (502, NULL, N'19843', N'Reaccion de Montenegro', 3, NULL, CAST(12300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (503, NULL, N'19844', N'Reclacificacion del plasma', 3, NULL, CAST(3200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (504, NULL, N'19845', N'Receptores estrogenicos, dosificacion en tejidos', 3, NULL, CAST(31300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (505, NULL, N'19849', N'Receptores estrogenicos, inmunocitoquimicos', 3, NULL, CAST(26700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (506, NULL, N'19850', N'Recuento de colonias, cualquier muestra', 3, NULL, CAST(8800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (507, NULL, N'19851', N'Recuento de Hamburger', 3, NULL, CAST(8000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (508, NULL, N'19852', N'Renina', 3, NULL, CAST(29000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (509, 2, N'19855', N'Reticulocitos, recuento', 3, NULL, CAST(5100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (510, NULL, N'19856', N'Rotavirus, determinacion de antigeno (latex)', 3, NULL, CAST(28500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (511, 6, N'19857', N'Rubeola, anticuerpo G', 3, NULL, CAST(26300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (512, 6, N'19861', N'Rubeola, anticuerpo M', 3, NULL, CAST(27600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (513, NULL, N'19866', N'Salicilatos', 3, NULL, CAST(11200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (514, NULL, N'19867', N'Salmonella, identificacion serologica', 3, NULL, CAST(12900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (515, NULL, N'19868', N'Sangre oculta en Materias Fecales', 1, NULL, CAST(2400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (516, NULL, N'19872', N'Sangria, tiempo de', 3, NULL, CAST(2000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (517, NULL, N'19873', N'Sarampion, determinacion de Ac', 3, NULL, CAST(13200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (518, NULL, N'19874', N'Secrecion nasal, ocular, otica, examen microscopico c/u', 3, NULL, CAST(8000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (519, NULL, N'19875', N'Secrecion uretral o vaginal, examen microscopico c/u', 3, NULL, CAST(16900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (520, NULL, N'19876', N'Shiguella, identificacion serologica', 3, NULL, CAST(10600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (521, 6, N'19878', N'Sida, anticuerpos VIH  1.', 3, NULL, CAST(27400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (522, 6, N'19879', N'Sida, anticuerpos VIH  2.', 3, NULL, CAST(27400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (523, NULL, N'19882', N'Sida, antigeno P24', 3, NULL, CAST(36200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (524, NULL, N'19884', N'Sida, prueba confirmatoria (Western Blot, otros)', 3, NULL, CAST(133000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (525, NULL, N'19885', N'Sifilis, serologia confirmatoria (FTA ABS)', 1, NULL, CAST(31600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (526, NULL, N'19886', N'Sifilis, serologia presuntiva (cardiolipina o VDRL)', 1, NULL, CAST(5100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (527, NULL, N'19889', N'Sincityal, determinacion de antigeno', 3, NULL, CAST(19100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (528, NULL, N'19890', N'Sistina, en orina', 3, NULL, CAST(22500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (529, NULL, N'19891', N'Sodio', 3, NULL, CAST(9300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (530, NULL, N'19892', N'Somatomedina C', 3, NULL, CAST(47600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (531, NULL, N'19896', N'Staphilococcus aureus, identificacion serologica', 3, NULL, CAST(10400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (532, NULL, N'19897', N'Streptococcus beta hemolitico, identificacion serologica', 3, NULL, CAST(7900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (533, NULL, N'19898', N'Sudan, tincion y lectura', 3, NULL, CAST(6800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (534, NULL, N'19899', N'Sulfitos, medicion en orina y sangre', 3, NULL, CAST(26800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (535, NULL, N'19902', N'Talio', 3, NULL, CAST(16800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (536, NULL, N'19903', N'Tejidos corporales, medicion enzimatica', 3, NULL, CAST(322400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (537, NULL, N'19904', N'Teofilina', 3, NULL, CAST(27900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (538, 4, N'19905', N'Testosterona libre', 3, NULL, CAST(27400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (539, 4, N'19907', N'Testosterona total', 3, NULL, CAST(25100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (540, NULL, N'19908', N'Thorn, prueba', 3, NULL, CAST(6800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (541, NULL, N'19910', N'Tiroidea estimulante (en neonato)', 3, NULL, CAST(23500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (542, 4, N'19911', N'Tiroidea estimulante TSH', 3, NULL, CAST(25100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (543, NULL, N'19912', N'Tirosina, cuantificacion', 3, NULL, CAST(53800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (544, NULL, N'19913', N'Tirosina, test con raiz de cabello', 3, NULL, CAST(80600.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (545, NULL, N'19915', N'Tiroxina, en sangre', 3, NULL, CAST(25100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (546, 4, N'19916', N'Tiroxina T4', 1, NULL, CAST(18800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (547, 4, N'19917', N'Tiroxina T4  libre', 1, NULL, CAST(19000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (548, NULL, N'19921', N'Titulo anti A', 3, NULL, CAST(9000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (549, NULL, N'19922', N'Titulo anti B', 3, NULL, CAST(9000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (550, NULL, N'19923', N'Titulo anti D', 3, NULL, CAST(12300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (551, NULL, N'19926', N'Tobramicina', 3, NULL, CAST(13700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (552, NULL, N'19927', N'Toxocara canis, anticuerpos', 3, NULL, CAST(38700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (553, NULL, N'19928', N'Toxoplasma, anticuerpo G', 3, NULL, CAST(29000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (554, NULL, N'19929', N'Toxoplasma, anticuerpo M', 3, NULL, CAST(29000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (555, NULL, N'19933', N'Transaminasa oxalacetica / ASA', 3, NULL, CAST(8200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (556, NULL, N'19934', N'Transaminasa piruvica / ALAT', 3, NULL, CAST(8200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (557, NULL, N'19935', N'Transferrina', 3, NULL, CAST(28500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (558, NULL, N'19939', N'Triciclicos', 3, NULL, CAST(15100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (559, NULL, N'19940', N'Trigliceridos', 3, NULL, CAST(5400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (560, NULL, N'19941', N'Tripanosoma Cruzi, prueba de Machado Guerreiro', 3, NULL, CAST(12000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (561, NULL, N'19945', N'Tripanosomiasis, determinacion de Ac', 3, NULL, CAST(22000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (562, NULL, N'19946', N'Tripsina', 3, NULL, CAST(8500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (563, NULL, N'19947', N'Triptofano', 3, NULL, CAST(24100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (564, 4, N'19948', N'Triyodotironina T3', 1, NULL, CAST(18700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (565, 4, N'19951', N'Triyodotironina T3  Up Take', 1, NULL, CAST(18700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (566, NULL, N'19952', N'Trombina, tiempo de', 1, NULL, CAST(3500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (567, NULL, N'19953', N'Tromboplastina, tiempo activado', 1, NULL, CAST(9700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (568, NULL, N'19957', N'Tromboplastina, tiempo de generacion', 1, NULL, CAST(6500.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (569, NULL, N'19958', N'Tromboplastina, tiempo parcial (PTT)', 1, NULL, CAST(11200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (570, NULL, N'19959', N'Troponina T', 1, NULL, CAST(24400.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (571, 4, N'19960', N'TSH pre y post TRH (dos muestras)', 1, NULL, CAST(82300.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (572, NULL, N'19964', N'Urea', 1, NULL, CAST(4200.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (573, NULL, N'19965', N'Urobilinogeno', 1, NULL, CAST(5100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (574, NULL, N'19966', N'Urocultivo con recuento de colonias', 1, NULL, CAST(20900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (575, NULL, N'19970', N'Uroporfirinas', 3, NULL, CAST(9900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (576, NULL, N'19975', N'Vancomicina', 3, NULL, CAST(19700.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (577, 6, N'19976', N'Varicela zoster, determinacion de Ac', 3, NULL, CAST(15100.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (578, NULL, N'19977', N'Velocidad de sedimentacion globular VSG', 3, NULL, CAST(1800.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (579, NULL, N'19981', N'Vitaminas, cada una', 3, NULL, CAST(41900.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (580, NULL, N'19986', N'Warfarina', 3, NULL, CAST(17000.00 AS Decimal(18, 2)), NULL)
INSERT INTO [dbo].[Examenes] ([IdExamen], [IdArea], [CodigoExamen], [NombreExamen], [NivelAtencion], [SignificanciaClinica], [PrecioExamen], [CodigoCUPS]) VALUES (581, NULL, N'19991', N'Zinc', 3, NULL, CAST(20200.00 AS Decimal(18, 2)), NULL)
SET IDENTITY_INSERT [dbo].[Examenes] OFF

GO

SET IDENTITY_INSERT [dbo].[TipoMuestras] ON
INSERT INTO [dbo].[TipoMuestras] ([IdTipoMuestra], [NombreTipoMuestra]) VALUES (1, N'Sangre')
INSERT INTO [dbo].[TipoMuestras] ([IdTipoMuestra], [NombreTipoMuestra]) VALUES (2, N'Orina')
INSERT INTO [dbo].[TipoMuestras] ([IdTipoMuestra], [NombreTipoMuestra]) VALUES (3, N'Fecal')
INSERT INTO [dbo].[TipoMuestras] ([IdTipoMuestra], [NombreTipoMuestra]) VALUES (4, N'Secrecion Faringea')
INSERT INTO [dbo].[TipoMuestras] ([IdTipoMuestra], [NombreTipoMuestra]) VALUES (5, N'Secrecion prostatica')
INSERT INTO [dbo].[TipoMuestras] ([IdTipoMuestra], [NombreTipoMuestra]) VALUES (6, N'Secrecion Vaginal')
INSERT INTO [dbo].[TipoMuestras] ([IdTipoMuestra], [NombreTipoMuestra]) VALUES (7, N'Secrecion conjuntival')
INSERT INTO [dbo].[TipoMuestras] ([IdTipoMuestra], [NombreTipoMuestra]) VALUES (8, N'Liquido sinovial')
INSERT INTO [dbo].[TipoMuestras] ([IdTipoMuestra], [NombreTipoMuestra]) VALUES (9, N'Sudor')
INSERT INTO [dbo].[TipoMuestras] ([IdTipoMuestra], [NombreTipoMuestra]) VALUES (10, N'Saliva')
INSERT INTO [dbo].[TipoMuestras] ([IdTipoMuestra], [NombreTipoMuestra]) VALUES (11, N'Fluidos Corporales')
SET IDENTITY_INSERT [dbo].[TipoMuestras] OFF

GO

SET IDENTITY_INSERT [dbo].[Muestras] ON
INSERT INTO [dbo].[Muestras] ([IdMuestra], [IdExamen], [IdTipoMuestra]) VALUES (1, 2, 1)
INSERT INTO [dbo].[Muestras] ([IdMuestra], [IdExamen], [IdTipoMuestra]) VALUES (2, 9, 2)
SET IDENTITY_INSERT [dbo].[Muestras] OFF

go