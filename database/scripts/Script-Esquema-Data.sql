CREATE TABLE [dbo].[Ciudad](
	[CiudadId] [int] IDENTITY(1,1) NOT NULL,
	[DepartamentoId] [int] NOT NULL,
	[CiudadNombre] [nvarchar](250) NOT NULL,
	[Descripcion] [nvarchar](500) NULL,
	[FechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_Ciudad] PRIMARY KEY CLUSTERED 
(
	[CiudadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ciudadanos]    Script Date: 27/06/2026 2:46:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudadanos](
	[CiudadanoId] [int] IDENTITY(1,1) NOT NULL,
	[NombresCompletos] [nvarchar](200) NOT NULL,
	[FechaNacimiento] [datetime] NULL,
	[LugarNacimiento] [nvarchar](150) NULL,
	[Email] [nvarchar](150) NULL,
	[Celular] [nvarchar](30) NULL,
	[TieneWhatsapp] [bit] NULL,
	[ParametroIdDondeVive] [int] NULL,
	[PuestoVotacion] [nvarchar](150) NULL,
	[ParametroIdTipoIdentificacion] [int] NULL,
	[NumeroIdentificacion] [nvarchar](50) NULL,
	[Direccion] [nvarchar](250) NULL,
	[DepartamentoId] [int] NULL,
	[MunicipioId] [int] NULL,
	[ParametroIdGrupoEdad] [int] NULL,
	[ParametroIdGenero] [int] NULL,
	[ParametroIdSoy] [int] NULL,
	[CodigoReferido] [nvarchar](50) NULL,
	[CiudadanoReferidorId] [int] NULL,
	[TieneAcceso] [bit] NOT NULL,
	[ParametroIdVereda] [int] NULL,
	[Estado] [bit] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
	[Celular2] [nvarchar](30) NULL,
	[TieneWhatsapp2] [bit] NULL,
	[ParametroIdTipoDiscapacidad] [int] NULL,
	[ParametroIdEstadoCivil] [int] NULL,
	[TieneHijos] [bit] NULL,
	[Cuantos] [int] NULL,
	[TieneVehiculo] [bit] NULL,
	[ParametroIdTipoVehiculo] [int] NULL,
	[ParametroIdReligion] [int] NULL,
	[EsEmpleado] [bit] NULL,
 CONSTRAINT [PK__Ciudadan__819E4DDDA77E6889] PRIMARY KEY CLUSTERED 
(
	[CiudadanoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clase]    Script Date: 27/06/2026 2:46:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clase](
	[ClaseId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](500) NOT NULL,
	[Estado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_Clase] PRIMARY KEY CLUSTERED 
(
	[ClaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 27/06/2026 2:46:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[DepartamentoId] [int] IDENTITY(1,1) NOT NULL,
	[DepartamentoNombre] [nvarchar](250) NOT NULL,
	[Descripcion] [nvarchar](500) NULL,
	[FechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_Departamento] PRIMARY KEY CLUSTERED 
(
	[DepartamentoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NoPermitidos]    Script Date: 27/06/2026 2:46:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoPermitidos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CiudadanoId] [int] NOT NULL,
	[Cedula] [nvarchar](20) NOT NULL,
	[Nombres] [nvarchar](50) NOT NULL,
	[Apellidos] [nvarchar](50) NOT NULL,
	[FechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_NoPermitidos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parametros]    Script Date: 27/06/2026 2:46:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parametros](
	[ParametroId] [int] IDENTITY(1,1) NOT NULL,
	[ClaseId] [int] NOT NULL,
	[Descripcion] [nvarchar](500) NOT NULL,
	[Observacion] [nvarchar](max) NULL,
	[Estado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_Parametros] PRIMARY KEY CLUSTERED 
(
	[ParametroId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 27/06/2026 2:46:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[UsuarioId] [int] IDENTITY(1,1) NOT NULL,
	[CiudadanoId] [int] NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[PasswordHash] [nvarchar](max) NOT NULL,
	[Rol] [nvarchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ciudad] ON 
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1, 1, N'Leticia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (2, 1, N'Puerto Nariño', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (3, 2, N'Abejorral', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (4, 2, N'Abriaquí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (5, 2, N'Alejandría', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (6, 2, N'Amagá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (7, 2, N'Amalfi', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (8, 2, N'Andes', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (9, 2, N'Angelópolis', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (10, 2, N'Angostura', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (11, 2, N'Anorí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (12, 2, N'Anzá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (13, 2, N'Apartadó', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (14, 2, N'Arboletes', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (15, 2, N'Argelia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (16, 2, N'Armenia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (17, 2, N'Barbosa', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (18, 2, N'Bello', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (19, 2, N'Belmira', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (20, 2, N'Betania', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (21, 2, N'Betulia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (22, 2, N'Briceño', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (23, 2, N'Buriticá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (24, 2, N'Cáceres', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (25, 2, N'Caicedo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (26, 2, N'Caldas', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (27, 2, N'Campamento', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (28, 2, N'Cañasgordas', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (29, 2, N'Caracolí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (30, 2, N'Caramanta', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (31, 2, N'Carepa', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (32, 2, N'Carolina del Príncipe', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (33, 2, N'Caucasia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (34, 2, N'Chigorodó', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (35, 2, N'Cisneros', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (36, 2, N'Ciudad Bolívar', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (37, 2, N'Cocorná', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (38, 2, N'Concepción', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (39, 2, N'Concordia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (40, 2, N'Copacabana', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (41, 2, N'Dabeiba', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (42, 2, N'Donmatías', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (43, 2, N'Ebéjico', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (44, 2, N'El Bagre', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (45, 2, N'El Carmen de Viboral', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (46, 2, N'El Peñol', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (47, 2, N'El Retiro', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (48, 2, N'El Santuario', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (49, 2, N'Entrerríos', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (50, 2, N'Envigado', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (51, 2, N'Fredonia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (52, 2, N'Frontino', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (53, 2, N'Giraldo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (54, 2, N'Girardota', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (55, 2, N'Gómez Plata', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (56, 2, N'Granada', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (57, 2, N'Guadalupe', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (58, 2, N'Guarne', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (59, 2, N'Guatapé', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (60, 2, N'Heliconia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (61, 2, N'Hispania', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (62, 2, N'Itagüí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (63, 2, N'Ituango', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (64, 2, N'Jardín', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (65, 2, N'Jericó', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (66, 2, N'La Ceja', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (67, 2, N'La Estrella', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (68, 2, N'La Pintada', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (69, 2, N'La Unión', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (70, 2, N'Liborina', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (71, 2, N'Maceo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (72, 2, N'Marinilla', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (73, 2, N'Medellín', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (74, 2, N'Montebello', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (75, 2, N'Murindó', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (76, 2, N'Mutatá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (77, 2, N'Nariño', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (78, 2, N'Nechí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (79, 2, N'Necoclí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (80, 2, N'Olaya', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (81, 2, N'Peque', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (82, 2, N'Pueblorrico', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (83, 2, N'Puerto Berrío', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (84, 2, N'Puerto Nare', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (85, 2, N'Puerto Triunfo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (86, 2, N'Remedios', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (87, 2, N'Rionegro', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (88, 2, N'Sabanalarga', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (89, 2, N'Sabaneta', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (90, 2, N'Salgar', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (91, 2, N'San Andrés de Cuerquia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (92, 2, N'San Carlos', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (93, 2, N'San Francisco', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (94, 2, N'San Jerónimo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (95, 2, N'San José de la Montaña', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (96, 2, N'San Juan de Urabá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (97, 2, N'San Luis', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (98, 2, N'San Pedro de Urabá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (99, 2, N'San Pedro de los Milagros', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (100, 2, N'San Rafael', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (101, 2, N'San Roque', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (102, 2, N'San Vicente', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (103, 2, N'Santa Bárbara', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (104, 2, N'Santa Fe de Antioquia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (105, 2, N'Santa Rosa de Osos', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (106, 2, N'Santo Domingo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (107, 2, N'Segovia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (108, 2, N'Sonsón', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (109, 2, N'Sopetrán', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (110, 2, N'Támesis', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (111, 2, N'Tarazá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (112, 2, N'Tarso', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (113, 2, N'Titiribí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (114, 2, N'Toledo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (115, 2, N'Turbo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (116, 2, N'Uramita', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (117, 2, N'Urrao', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (118, 2, N'Valdivia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (119, 2, N'Valparaíso', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (120, 2, N'Vegachí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (121, 2, N'Venecia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (122, 2, N'Vigía del Fuerte', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (123, 2, N'Yalí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (124, 2, N'Yarumal', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (125, 2, N'Yolombó', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (126, 2, N'Yondó', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (127, 2, N'Zaragoza', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (128, 3, N'Arauca', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (129, 3, N'Arauquita', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (130, 3, N'Cravo Norte', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (131, 3, N'Fortul', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (132, 3, N'Puerto Rondón', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (133, 3, N'Saravena', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (134, 3, N'Tame', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (135, 4, N'Baranoa', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (136, 4, N'Barranquilla', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (137, 4, N'Campo de la Cruz', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (138, 4, N'Candelaria', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (139, 4, N'Galapa', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (140, 4, N'Juan de Acosta', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (141, 4, N'Luruaco', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (142, 4, N'Malambo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (143, 4, N'Manatí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (144, 4, N'Palmar de Varela', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (145, 4, N'Piojó', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (146, 4, N'Polonuevo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (147, 4, N'Ponedera', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (148, 4, N'Puerto Colombia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (149, 4, N'Repelón', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (150, 4, N'Sabanagrande', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (151, 4, N'Sabanalarga', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (152, 4, N'Santa Lucía', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (153, 4, N'Santo Tomás', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (154, 4, N'Soledad', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (155, 4, N'Suán', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (156, 4, N'Tubará', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (157, 4, N'Usiacurí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (158, 5, N'Achí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (159, 5, N'Altos del Rosario', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (160, 5, N'Arenal', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (161, 5, N'Arjona', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (162, 5, N'Arroyohondo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (163, 5, N'Barranco de Loba', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (164, 5, N'Brazuelo de Papayal', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (165, 5, N'Calamar', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (166, 5, N'Cantagallo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (167, 5, N'Cartagena de Indias', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (168, 5, N'Cicuco', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (169, 5, N'Clemencia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (170, 5, N'Córdoba', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (171, 5, N'El Carmen de Bolívar', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (172, 5, N'El Guamo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (173, 5, N'El Peñón', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (174, 5, N'Hatillo de Loba', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (175, 5, N'Magangué', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (176, 5, N'Mahates', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (177, 5, N'Margarita', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (178, 5, N'María la Baja', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (179, 5, N'Mompós', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (180, 5, N'Montecristo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (181, 5, N'Morales', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (182, 5, N'Norosí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (183, 5, N'Pinillos', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (184, 5, N'Regidor', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (185, 5, N'Río Viejo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (186, 5, N'San Cristóbal', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (187, 5, N'San Estanislao', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (188, 5, N'San Fernando', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (189, 5, N'San Jacinto del Cauca', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (190, 5, N'San Jacinto', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (191, 5, N'San Juan Nepomuceno', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (192, 5, N'San Martín de Loba', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (193, 5, N'San Pablo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (194, 5, N'Santa Catalina', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (195, 5, N'Santa Rosa', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (196, 5, N'Santa Rosa del Sur', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (197, 5, N'Simití', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (198, 5, N'Soplaviento', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (199, 5, N'Talaigua Nuevo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (200, 5, N'Tiquisio', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (201, 5, N'Turbaco', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (202, 5, N'Turbaná', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (203, 5, N'Villanueva', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (204, 5, N'Zambrano', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (205, 6, N'Almeida', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (206, 6, N'Aquitania', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (207, 6, N'Arcabuco', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (208, 6, N'Belén', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (209, 6, N'Berbeo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (210, 6, N'Betéitiva', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (211, 6, N'Boavita', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (212, 6, N'Boyacá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (213, 6, N'Briceño', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (214, 6, N'Buenavista', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (215, 6, N'Busbanzá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (216, 6, N'Caldas', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (217, 6, N'Campohermoso', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (218, 6, N'Cerinza', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (219, 6, N'Chinavita', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (220, 6, N'Chiquinquirá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (221, 6, N'Chíquiza', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (222, 6, N'Chiscas', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (223, 6, N'Chita', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (224, 6, N'Chitaraque', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (225, 6, N'Chivatá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (226, 6, N'Chivor', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (227, 6, N'Ciénega', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (228, 6, N'Cómbita', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (229, 6, N'Coper', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (230, 6, N'Corrales', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (231, 6, N'Covarachía', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (232, 6, N'Cubará', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (233, 6, N'Cucaita', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (234, 6, N'Cuítiva', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (235, 6, N'Duitama', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (236, 6, N'El Cocuy', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (237, 6, N'El Espino', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (238, 6, N'Firavitoba', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (239, 6, N'Floresta', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (240, 6, N'Gachantivá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (241, 6, N'Gámeza', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (242, 6, N'Garagoa', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (243, 6, N'Guacamayas', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (244, 6, N'Guateque', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (245, 6, N'Guayatá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (246, 6, N'Güicán', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (247, 6, N'Iza', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (248, 6, N'Jenesano', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (249, 6, N'Jericó', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (250, 6, N'La Capilla', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (251, 6, N'La Uvita', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (252, 6, N'La Victoria', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (253, 6, N'Labranzagrande', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (254, 6, N'Macanal', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (255, 6, N'Maripí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (256, 6, N'Miraflores', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (257, 6, N'Mongua', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (258, 6, N'Monguí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (259, 6, N'Moniquirá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (260, 6, N'Motavita', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (261, 6, N'Muzo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (262, 6, N'Nobsa', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (263, 6, N'Nuevo Colón', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (264, 6, N'Oicatá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (265, 6, N'Otanche', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (266, 6, N'Pachavita', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (267, 6, N'Páez', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (268, 6, N'Paipa', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (269, 6, N'Pajarito', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (270, 6, N'Panqueba', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (271, 6, N'Pauna', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (272, 6, N'Paya', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (273, 6, N'Paz del Río', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (274, 6, N'Pesca', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (275, 6, N'Pisba', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (276, 6, N'Puerto Boyacá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (277, 6, N'Quípama', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (278, 6, N'Ramiriquí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (279, 6, N'Ráquira', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (280, 6, N'Rondón', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (281, 6, N'Saboyá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (282, 6, N'Sáchica', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (283, 6, N'Samacá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (284, 6, N'San Eduardo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (285, 6, N'San José de Pare', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (286, 6, N'San Luis de Gaceno', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (287, 6, N'San Mateo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (288, 6, N'San Miguel de Sema', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (289, 6, N'San Pablo de Borbur', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (290, 6, N'Santa María', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (291, 6, N'Santa Rosa de Viterbo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (292, 6, N'Santa Sofía', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (293, 6, N'Santana', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (294, 6, N'Sativanorte', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (295, 6, N'Sativasur', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (296, 6, N'Siachoque', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (297, 6, N'Soatá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (298, 6, N'Socha', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (299, 6, N'Socotá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (300, 6, N'Sogamoso', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (301, 6, N'Somondoco', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (302, 6, N'Sora', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (303, 6, N'Soracá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (304, 6, N'Sotaquirá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (305, 6, N'Susacón', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (306, 6, N'Sutamarchán', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (307, 6, N'Sutatenza', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (308, 6, N'Tasco', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (309, 6, N'Tenza', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (310, 6, N'Tibaná', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (311, 6, N'Tibasosa', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (312, 6, N'Tinjacá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (313, 6, N'Tipacoque', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (314, 6, N'Toca', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (315, 6, N'Togüí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (316, 6, N'Tópaga', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (317, 6, N'Tota', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (318, 6, N'Tunja', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (319, 6, N'Tununguá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (320, 6, N'Turmequé', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (321, 6, N'Tuta', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (322, 6, N'Tutazá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (323, 6, N'Úmbita', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (324, 6, N'Ventaquemada', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (325, 6, N'Villa de Leyva', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (326, 6, N'Viracachá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (327, 6, N'Zetaquira', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (328, 7, N'Aguadas', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (329, 7, N'Anserma', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (330, 7, N'Aranzazu', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (331, 7, N'Belalcázar', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (332, 7, N'Chinchiná', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (333, 7, N'Filadelfia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (334, 7, N'La Dorada', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (335, 7, N'La Merced', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (336, 7, N'Manizales', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (337, 7, N'Manzanares', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (338, 7, N'Marmato', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (339, 7, N'Marquetalia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (340, 7, N'Marulanda', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (341, 7, N'Neira', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (342, 7, N'Norcasia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (343, 7, N'Pácora', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (344, 7, N'Palestina', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (345, 7, N'Pensilvania', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (346, 7, N'Riosucio', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (347, 7, N'Risaralda', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (348, 7, N'Salamina', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (349, 7, N'Samaná', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (350, 7, N'San José', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (351, 7, N'Supía', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (352, 7, N'Victoria', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (353, 7, N'Villamaría', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (354, 7, N'Viterbo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (355, 8, N'Albania', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (356, 8, N'Belén de los Andaquíes', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (357, 8, N'Cartagena del Chairá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (358, 8, N'Curillo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (359, 8, N'El Doncello', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (360, 8, N'El Paujil', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (361, 8, N'Florencia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (362, 8, N'La Montañita', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (363, 8, N'Milán', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (364, 8, N'Morelia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (365, 8, N'Puerto Rico', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (366, 8, N'San José del Fragua', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (367, 8, N'San Vicente del Caguán', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (368, 8, N'Solano', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (369, 8, N'Solita', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (370, 8, N'Valparaíso', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (371, 9, N'Aguazul', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (372, 9, N'Chámeza', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (373, 9, N'Hato Corozal', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (374, 9, N'La Salina', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (375, 9, N'Maní', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (376, 9, N'Monterrey', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (377, 9, N'Nunchía', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (378, 9, N'Orocué', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (379, 9, N'Paz de Ariporo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (380, 9, N'Pore', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (381, 9, N'Recetor', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (382, 9, N'Sabanalarga', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (383, 9, N'Sácama', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (384, 9, N'San Luis de Palenque', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (385, 9, N'Támara', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (386, 9, N'Tauramena', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (387, 9, N'Trinidad', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (388, 9, N'Villanueva', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (389, 9, N'Yopal', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (390, 10, N'Almaguer', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (391, 10, N'Argelia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (392, 10, N'Balboa', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (393, 10, N'Bolívar', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (394, 10, N'Buenos Aires', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (395, 10, N'Cajibío', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (396, 10, N'Caldono', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (397, 10, N'Caloto', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (398, 10, N'Corinto', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (399, 10, N'El Tambo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (400, 10, N'Florencia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (401, 10, N'Guachené', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (402, 10, N'Guapí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (403, 10, N'Inzá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (404, 10, N'Jambaló', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (405, 10, N'La Sierra', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (406, 10, N'La Vega', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (407, 10, N'López de Micay', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (408, 10, N'Mercaderes', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (409, 10, N'Miranda', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (410, 10, N'Morales', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (411, 10, N'Padilla', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (412, 10, N'Páez', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (413, 10, N'Patía', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (414, 10, N'Piamonte', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (415, 10, N'Piendamó', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (416, 10, N'Popayán', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (417, 10, N'Puerto Tejada', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (418, 10, N'Puracé', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (419, 10, N'Rosas', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (420, 10, N'San Sebastián', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (421, 10, N'Santa Rosa', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (422, 10, N'Santander de Quilichao', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (423, 10, N'Silvia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (424, 10, N'Sotará', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (425, 10, N'Suárez', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (426, 10, N'Sucre', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (427, 10, N'Timbío', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (428, 10, N'Timbiquí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (429, 10, N'Toribío', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (430, 10, N'Totoró', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (431, 10, N'Villa Rica', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (432, 11, N'Aguachica', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (433, 11, N'Agustín Codazzi', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (434, 11, N'Astrea', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (435, 11, N'Becerril', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (436, 11, N'Bosconia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (437, 11, N'Chimichagua', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (438, 11, N'Chiriguaná', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (439, 11, N'Curumaní', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (440, 11, N'El Copey', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (441, 11, N'El Paso', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (442, 11, N'Gamarra', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (443, 11, N'González', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (444, 11, N'La Gloria (Cesar)', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (445, 11, N'La Jagua de Ibirico', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (446, 11, N'La Paz', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (447, 11, N'Manaure Balcón del Cesar', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (448, 11, N'Pailitas', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (449, 11, N'Pelaya', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (450, 11, N'Pueblo Bello', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (451, 11, N'Río de Oro', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (452, 11, N'San Alberto', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (453, 11, N'San Diego', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (454, 11, N'San Martín', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (455, 11, N'Tamalameque', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (456, 11, N'Valledupar', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (457, 12, N'Acandí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (458, 12, N'Alto Baudó', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (459, 12, N'Bagadó', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (460, 12, N'Bahía Solano', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (461, 12, N'Bajo Baudó', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (462, 12, N'Bojayá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (463, 12, N'Cantón de San Pablo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (464, 12, N'Cértegui', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (465, 12, N'Condoto', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (466, 12, N'El Atrato', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (467, 12, N'El Carmen de Atrato', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (468, 12, N'El Carmen del Darién', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (469, 12, N'Istmina', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (470, 12, N'Juradó', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (471, 12, N'Litoral de San Juan', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (472, 12, N'Lloró', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (473, 12, N'Medio Atrato', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (474, 12, N'Medio Baudó', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (475, 12, N'Medio San Juan', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (476, 12, N'Nóvita', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (477, 12, N'Nuquí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (478, 12, N'Quibdó', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (479, 12, N'Río Iró', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (480, 12, N'Río Quito', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (481, 12, N'Riosucio', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (482, 12, N'San José del Palmar', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (483, 12, N'Sipí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (484, 12, N'Tadó', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (485, 12, N'Unión Panamericana', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (486, 12, N'Unguía', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (487, 13, N'Ayapel', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (488, 13, N'Buenavista', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (489, 13, N'Canalete', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (490, 13, N'Cereté', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (491, 13, N'Chimá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (492, 13, N'Chinú', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (493, 13, N'Ciénaga de Oro', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (494, 13, N'Cotorra', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (495, 13, N'La Apartada', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (496, 13, N'Lorica', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (497, 13, N'Los Córdobas', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (498, 13, N'Momil', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (499, 13, N'Montelíbano', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (500, 13, N'Montería', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (501, 13, N'Moñitos', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (502, 13, N'Planeta Rica', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (503, 13, N'Pueblo Nuevo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (504, 13, N'Puerto Escondido', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (505, 13, N'Puerto Libertador', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (506, 13, N'Purísima', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (507, 13, N'Sahagún', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (508, 13, N'San Andrés de Sotavento', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (509, 13, N'San Antero', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (510, 13, N'San Bernardo del Viento', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (511, 13, N'San Carlos', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (512, 13, N'San José de Uré', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (513, 13, N'San Pelayo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (514, 13, N'Tierralta', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (515, 13, N'Tuchín', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (516, 13, N'Valencia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (517, 14, N'Agua de Dios', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (518, 14, N'Albán', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (519, 14, N'Anapoima', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (520, 14, N'Anolaima', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (521, 14, N'Apulo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (522, 14, N'Arbeláez', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (523, 14, N'Beltrán', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (524, 14, N'Bituima', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (525, 14, N'Bojacá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (526, 14, N'Cabrera', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (527, 14, N'Cachipay', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (528, 14, N'Cajicá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (529, 14, N'Caparrapí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (530, 14, N'Cáqueza', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (531, 14, N'Carmen de Carupa', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (532, 14, N'Chaguaní', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (533, 14, N'Chía', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (534, 14, N'Chipaque', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (535, 14, N'Choachí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (536, 14, N'Chocontá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (537, 14, N'Cogua', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (538, 14, N'Cota', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (539, 14, N'Cucunubá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (540, 14, N'El Colegio', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (541, 14, N'El Peñón', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (542, 14, N'El Rosal', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (543, 14, N'Facatativá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (544, 14, N'Fómeque', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (545, 14, N'Fosca', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (546, 14, N'Funza', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (547, 14, N'Fúquene', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (548, 14, N'Fusagasugá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (549, 14, N'Gachalá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (550, 14, N'Gachancipá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (551, 14, N'Gachetá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (552, 14, N'Gama', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (553, 14, N'Girardot', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (554, 14, N'Granada', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (555, 14, N'Guachetá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (556, 14, N'Guaduas', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (557, 14, N'Guasca', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (558, 14, N'Guataquí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (559, 14, N'Guatavita', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (560, 14, N'Guayabal de Síquima', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (561, 14, N'Guayabetal', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (562, 14, N'Gutiérrez', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (563, 14, N'Jerusalén', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (564, 14, N'Junín', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (565, 14, N'La Calera', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (566, 14, N'La Mesa', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (567, 14, N'La Palma', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (568, 14, N'La Peña', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (569, 14, N'La Vega', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (570, 14, N'Lenguazaque', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (571, 14, N'Machetá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (572, 14, N'Madrid', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (573, 14, N'Manta', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (574, 14, N'Medina', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (575, 14, N'Mosquera', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (576, 14, N'Nariño', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (577, 14, N'Nemocón', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (578, 14, N'Nilo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (579, 14, N'Nimaima', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (580, 14, N'Nocaima', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (581, 14, N'Pacho', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (582, 14, N'Paime', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (583, 14, N'Pandi', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (584, 14, N'Paratebueno', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (585, 14, N'Pasca', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (586, 14, N'Puerto Salgar', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (587, 14, N'Pulí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (588, 14, N'Quebradanegra', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (589, 14, N'Quetame', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (590, 14, N'Quipile', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (591, 14, N'Ricaurte', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (592, 14, N'San Antonio del Tequendama', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (593, 14, N'San Bernardo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (594, 14, N'San Cayetano', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (595, 14, N'San Francisco', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (596, 14, N'San Juan de Rioseco', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (597, 14, N'Sasaima', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (598, 14, N'Sesquilé', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (599, 14, N'Sibaté', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (600, 14, N'Silvania', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (601, 14, N'Simijaca', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (602, 14, N'Soacha', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (603, 14, N'Sopó', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (604, 14, N'Subachoque', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (605, 14, N'Suesca', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (606, 14, N'Supatá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (607, 14, N'Susa', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (608, 14, N'Sutatausa', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (609, 14, N'Tabio', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (610, 14, N'Tausa', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (611, 14, N'Tena', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (612, 14, N'Tenjo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (613, 14, N'Tibacuy', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (614, 14, N'Tibirita', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (615, 14, N'Tocaima', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (616, 14, N'Tocancipá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (617, 14, N'Topaipí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (618, 14, N'Ubalá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (619, 14, N'Ubaque', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (620, 14, N'Ubaté', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (621, 14, N'Une', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (622, 14, N'Útica', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (623, 14, N'Venecia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (624, 14, N'Vergara', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (625, 14, N'Vianí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (626, 14, N'Villagómez', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (627, 14, N'Villapinzón', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (628, 14, N'Villeta', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (629, 14, N'Viotá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (630, 14, N'Yacopí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (631, 14, N'Zipacón', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (632, 14, N'Zipaquirá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (633, 15, N'Inírida', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (634, 16, N'Calamar', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (635, 16, N'El Retorno', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (636, 16, N'Miraflores', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (637, 16, N'San José del Guaviare', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (638, 17, N'Acevedo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (639, 17, N'Agrado', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (640, 17, N'Aipe', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (641, 17, N'Algeciras', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (642, 17, N'Altamira', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (643, 17, N'Baraya', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (644, 17, N'Campoalegre', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (645, 17, N'Colombia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (646, 17, N'El Pital', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (647, 17, N'Elías', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (648, 17, N'Garzón', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (649, 17, N'Gigante', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (650, 17, N'Guadalupe', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (651, 17, N'Hobo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (652, 17, N'Íquira', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (653, 17, N'Isnos', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (654, 17, N'La Argentina', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (655, 17, N'La Plata', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (656, 17, N'Nátaga', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (657, 17, N'Neiva', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (658, 17, N'Oporapa', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (659, 17, N'Paicol', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (660, 17, N'Palermo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (661, 17, N'Palestina', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (662, 17, N'Pitalito', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (663, 17, N'Rivera', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (664, 17, N'Saladoblanco', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (665, 17, N'San Agustín', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (666, 17, N'Santa María', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (667, 17, N'Suaza', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (668, 17, N'Tarqui', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (669, 17, N'Tello', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (670, 17, N'Teruel', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (671, 17, N'Tesalia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (672, 17, N'Timaná', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (673, 17, N'Villavieja', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (674, 17, N'Yaguará', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (675, 18, N'Albania', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (676, 18, N'Barrancas', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (677, 18, N'Dibulla', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (678, 18, N'Distracción', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (679, 18, N'El Molino', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (680, 18, N'Fonseca', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (681, 18, N'Hatonuevo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (682, 18, N'La Jagua del Pilar', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (683, 18, N'Maicao', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (684, 18, N'Manaure', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (685, 18, N'Riohacha', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (686, 18, N'San Juan del Cesar', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (687, 18, N'Uribia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (688, 18, N'Urumita', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (689, 18, N'Villanueva', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (690, 19, N'Algarrobo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (691, 19, N'Aracataca', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (692, 19, N'Ariguaní', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (693, 19, N'Cerro de San Antonio', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (694, 19, N'Chibolo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (695, 19, N'Ciénaga', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (696, 19, N'Concordia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (697, 19, N'El Banco', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (698, 19, N'El Piñón', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (699, 19, N'El Retén', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (700, 19, N'Fundación', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (701, 19, N'Guamal', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (702, 19, N'Nueva Granada', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (703, 19, N'Pedraza', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (704, 19, N'Pijiño del Carmen', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (705, 19, N'Pivijay', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (706, 19, N'Plato', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (707, 19, N'Pueblo Viejo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (708, 19, N'Remolino', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (709, 19, N'Sabanas de San Ángel', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (710, 19, N'Salamina', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (711, 19, N'San Sebastián de Buenavista', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (712, 19, N'San Zenón', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (713, 19, N'Santa Ana', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (714, 19, N'Santa Bárbara de Pinto', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (715, 19, N'Santa Marta', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (716, 19, N'Sitionuevo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (717, 19, N'Tenerife', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (718, 19, N'Zapayán', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (719, 19, N'Zona Bananera', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (720, 20, N'Acacías', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (721, 20, N'Barranca de Upía', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (722, 20, N'Cabuyaro', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (723, 20, N'Castilla la Nueva', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (724, 20, N'Cubarral', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (725, 20, N'Cumaral', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (726, 20, N'El Calvario', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (727, 20, N'El Castillo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (728, 20, N'El Dorado', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (729, 20, N'Fuente de Oro', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (730, 20, N'Granada', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (731, 20, N'Guamal', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (732, 20, N'La Macarena', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (733, 20, N'La Uribe', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (734, 20, N'Lejanías', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (735, 20, N'Mapiripán', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (736, 20, N'Mesetas', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (737, 20, N'Puerto Concordia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (738, 20, N'Puerto Gaitán', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (739, 20, N'Puerto Lleras', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (740, 20, N'Puerto López', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (741, 20, N'Puerto Rico', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (742, 20, N'Restrepo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (743, 20, N'San Carlos de Guaroa', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (744, 20, N'San Juan de Arama', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (745, 20, N'San Juanito', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (746, 20, N'San Martín', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (747, 20, N'Villavicencio', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (748, 20, N'Vista Hermosa', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (749, 21, N'Aldana', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (750, 21, N'Ancuyá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (751, 21, N'Arboleda', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (752, 21, N'Barbacoas', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (753, 21, N'Belén', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (754, 21, N'Buesaco', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (755, 21, N'Chachagüí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (756, 21, N'Colón', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (757, 21, N'Consacá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (758, 21, N'Contadero', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (759, 21, N'Córdoba', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (760, 21, N'Cuaspud', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (761, 21, N'Cumbal', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (762, 21, N'Cumbitara', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (763, 21, N'El Charco', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (764, 21, N'El Peñol', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (765, 21, N'El Rosario', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (766, 21, N'El Tablón', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (767, 21, N'El Tambo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (768, 21, N'Francisco Pizarro', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (769, 21, N'Funes', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (770, 21, N'Guachucal', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (771, 21, N'Guaitarilla', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (772, 21, N'Gualmatán', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (773, 21, N'Iles', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (774, 21, N'Imués', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (775, 21, N'Ipiales', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (776, 21, N'La Cruz', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (777, 21, N'La Florida', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (778, 21, N'La Llanada', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (779, 21, N'La Tola', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (780, 21, N'La Unión', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (781, 21, N'Leiva', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (782, 21, N'Linares', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (783, 21, N'Los Andes', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (784, 21, N'Magüí Payán', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (785, 21, N'Mallama', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (786, 21, N'Mosquera', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (787, 21, N'Nariño', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (788, 21, N'Olaya Herrera', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (789, 21, N'Ospina', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (790, 21, N'Pasto', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (791, 21, N'Policarpa', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (792, 21, N'Potosí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (793, 21, N'Providencia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (794, 21, N'Puerres', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (795, 21, N'Pupiales', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (796, 21, N'Ricaurte', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (797, 21, N'Roberto Payán', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (798, 21, N'Samaniego', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (799, 21, N'San Bernardo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (800, 21, N'San José de Albán', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (801, 21, N'San Lorenzo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (802, 21, N'San Pablo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (803, 21, N'San Pedro de Cartago', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (804, 21, N'Sandoná', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (805, 21, N'Santa Bárbara', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (806, 21, N'Santacruz', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (807, 21, N'Sapuyes', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (808, 21, N'Taminango', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (809, 21, N'Tangua', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (810, 21, N'Tumaco', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (811, 21, N'Túquerres', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (812, 21, N'Yacuanquer', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (813, 22, N'Ábrego', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (814, 22, N'Arboledas', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (815, 22, N'Bochalema', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (816, 22, N'Bucarasica', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (817, 22, N'Cáchira', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (818, 22, N'Cácota', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (819, 22, N'Chinácota', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (820, 22, N'Chitagá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (821, 22, N'Convención', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (822, 22, N'Cúcuta', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (823, 22, N'Cucutilla', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (824, 22, N'Durania', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (825, 22, N'El Carmen', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (826, 22, N'El Tarra', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (827, 22, N'El Zulia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (828, 22, N'Gramalote', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (829, 22, N'Hacarí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (830, 22, N'Herrán', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (831, 22, N'La Esperanza', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (832, 22, N'La Playa de Belén', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (833, 22, N'Labateca', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (834, 22, N'Los Patios', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (835, 22, N'Lourdes', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (836, 22, N'Mutiscua', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (837, 22, N'Ocaña', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (838, 22, N'Pamplona', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (839, 22, N'Pamplonita', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (840, 22, N'Puerto Santander', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (841, 22, N'Ragonvalia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (842, 22, N'Salazar de Las Palmas', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (843, 22, N'San Calixto', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (844, 22, N'San Cayetano', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (845, 22, N'Santiago', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (846, 22, N'Santo Domingo de Silos', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (847, 22, N'Sardinata', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (848, 22, N'Teorama', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (849, 22, N'Tibú', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (850, 22, N'Toledo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (851, 22, N'Villa Caro', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (852, 22, N'Villa del Rosario', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (853, 23, N'Colón', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (854, 23, N'Mocoa', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (855, 23, N'Orito', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (856, 23, N'Puerto Asís', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (857, 23, N'Puerto Caicedo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (858, 23, N'Puerto Guzmán', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (859, 23, N'Puerto Leguízamo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (860, 23, N'San Francisco', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (861, 23, N'San Miguel', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (862, 23, N'Santiago', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (863, 23, N'Sibundoy', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (864, 23, N'Valle del Guamuez', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (865, 23, N'Villagarzón', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (866, 24, N'Armenia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (867, 24, N'Buenavista', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (868, 24, N'Calarcá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (869, 24, N'Circasia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (870, 24, N'Córdoba', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (871, 24, N'Filandia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (872, 24, N'Génova', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (873, 24, N'La Tebaida', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (874, 24, N'Montenegro', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (875, 24, N'Pijao', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (876, 24, N'Quimbaya', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (877, 24, N'Salento', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (878, 25, N'Apía', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (879, 25, N'Balboa', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (880, 25, N'Belén de Umbría', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (881, 25, N'Dosquebradas', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (882, 25, N'Guática', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (883, 25, N'La Celia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (884, 25, N'La Virginia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (885, 25, N'Marsella', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (886, 25, N'Mistrató', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (887, 25, N'Pereira', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (888, 25, N'Pueblo Rico', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (889, 25, N'Quinchía', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (890, 25, N'Santa Rosa de Cabal', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (891, 25, N'Santuario', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (892, 26, N'Providencia y Santa Catalina Islas', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (893, 26, N'San Andrés', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (894, 27, N'Aguada', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (895, 27, N'Albania', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (896, 27, N'Aratoca', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (897, 27, N'Barbosa', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (898, 27, N'Barichara', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (899, 27, N'Barrancabermeja', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (900, 27, N'Betulia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (901, 27, N'Bolívar', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (902, 27, N'Bucaramanga', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (903, 27, N'Cabrera', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (904, 27, N'California', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (905, 27, N'Capitanejo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (906, 27, N'Carcasí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (907, 27, N'Cepitá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (908, 27, N'Cerrito', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (909, 27, N'Charalá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (910, 27, N'Charta', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (911, 27, N'Chima', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (912, 27, N'Chipatá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (913, 27, N'Cimitarra', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (914, 27, N'Concepción', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (915, 27, N'Confines', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (916, 27, N'Contratación', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (917, 27, N'Coromoro', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (918, 27, N'Curití', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (919, 27, N'El Carmen de Chucurí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (920, 27, N'El Guacamayo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (921, 27, N'El Peñón', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (922, 27, N'El Playón', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (923, 27, N'El Socorro', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (924, 27, N'Encino', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (925, 27, N'Enciso', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (926, 27, N'Florián', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (927, 27, N'Floridablanca', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (928, 27, N'Galán', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (929, 27, N'Gámbita', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (930, 27, N'Girón', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (931, 27, N'Guaca', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (932, 27, N'Guadalupe', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (933, 27, N'Guapotá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (934, 27, N'Guavatá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (935, 27, N'Güepsa', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (936, 27, N'Hato', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (937, 27, N'Jesús María', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (938, 27, N'Jordán', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (939, 27, N'La Belleza', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (940, 27, N'La Paz', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (941, 27, N'Landázuri', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (942, 27, N'Lebrija', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (943, 27, N'Los Santos', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (944, 27, N'Macaravita', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (945, 27, N'Málaga', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (946, 27, N'Matanza', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (947, 27, N'Mogotes', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (948, 27, N'Molagavita', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (949, 27, N'Ocamonte', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (950, 27, N'Oiba', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (951, 27, N'Onzaga', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (952, 27, N'Palmar', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (953, 27, N'Palmas del Socorro', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (954, 27, N'Páramo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (955, 27, N'Piedecuesta', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (956, 27, N'Pinchote', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (957, 27, N'Puente Nacional', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (958, 27, N'Puerto Parra', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (959, 27, N'Puerto Wilches', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (960, 27, N'Rionegro', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (961, 27, N'Sabana de Torres', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (962, 27, N'San Andrés', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (963, 27, N'San Benito', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (964, 27, N'San Gil', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (965, 27, N'San Joaquín', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (966, 27, N'San José de Miranda', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (967, 27, N'San Miguel', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (968, 27, N'San Vicente de Chucurí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (969, 27, N'Santa Bárbara', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (970, 27, N'Santa Helena del Opón', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (971, 27, N'Simacota', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (972, 27, N'Suaita', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (973, 27, N'Sucre', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (974, 27, N'Suratá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (975, 27, N'Tona', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (976, 27, N'Valle de San José', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (977, 27, N'Vélez', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (978, 27, N'Vetas', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (979, 27, N'Villanueva', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (980, 27, N'Zapatoca', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (981, 28, N'Buenavista', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (982, 28, N'Caimito', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (983, 28, N'Chalán', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (984, 28, N'Colosó', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (985, 28, N'Corozal', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (986, 28, N'Coveñas', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (987, 28, N'El Roble', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (988, 28, N'Galeras', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (989, 28, N'Guaranda', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (990, 28, N'La Unión', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (991, 28, N'Los Palmitos', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (992, 28, N'Majagual', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (993, 28, N'Morroa', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (994, 28, N'Ovejas', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (995, 28, N'Sampués', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (996, 28, N'San Antonio de Palmito', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (997, 28, N'San Benito Abad', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (998, 28, N'San Juan de Betulia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (999, 28, N'San Marcos', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1000, 28, N'San Onofre', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1001, 28, N'San Pedro', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1002, 28, N'Sincé', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1003, 28, N'Sincelejo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1004, 28, N'Sucre', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1005, 28, N'Tolú', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1006, 28, N'Tolú Viejo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1007, 29, N'Alpujarra', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1008, 29, N'Alvarado', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1009, 29, N'Ambalema', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1010, 29, N'Anzoátegui', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1011, 29, N'Armero', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1012, 29, N'Ataco', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1013, 29, N'Cajamarca', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1014, 29, N'Carmen de Apicalá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1015, 29, N'Casabianca', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1016, 29, N'Chaparral', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1017, 29, N'Coello', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1018, 29, N'Coyaima', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1019, 29, N'Cunday', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1020, 29, N'Dolores', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1021, 29, N'El Espinal', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1022, 29, N'Falán', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1023, 29, N'Flandes', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1024, 29, N'Fresno', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1025, 29, N'Guamo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1026, 29, N'Herveo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1027, 29, N'Honda', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1028, 29, N'Ibagué', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1029, 29, N'Icononzo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1030, 29, N'Lérida', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1031, 29, N'Líbano', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1032, 29, N'Mariquita', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1033, 29, N'Melgar', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1034, 29, N'Murillo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1035, 29, N'Natagaima', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1036, 29, N'Ortega', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1037, 29, N'Palocabildo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1038, 29, N'Piedras', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1039, 29, N'Planadas', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1040, 29, N'Prado', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1041, 29, N'Purificación', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1042, 29, N'Rioblanco', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1043, 29, N'Roncesvalles', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1044, 29, N'Rovira', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1045, 29, N'Saldaña', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1046, 29, N'San Antonio', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1047, 29, N'San Luis', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1048, 29, N'Santa Isabel', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1049, 29, N'Suárez', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1050, 29, N'Valle de San Juan', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1051, 29, N'Venadillo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1052, 29, N'Villahermosa', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1053, 29, N'Villarrica', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1054, 30, N'Alcalá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1055, 30, N'Andalucía', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1056, 30, N'Ansermanuevo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1057, 30, N'Argelia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1058, 30, N'Bolívar', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1059, 30, N'Buenaventura', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1060, 30, N'Buga', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1061, 30, N'Bugalagrande', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1062, 30, N'Caicedonia', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1063, 30, N'Cali', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1064, 30, N'Calima', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1065, 30, N'Candelaria', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1066, 30, N'Cartago', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1067, 30, N'Dagua', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1068, 30, N'El Águila', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1069, 30, N'El Cairo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1070, 30, N'El Cerrito', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1071, 30, N'El Dovio', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1072, 30, N'Florida', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1073, 30, N'Ginebra', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1074, 30, N'Guacarí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1075, 30, N'Jamundí', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1076, 30, N'La Cumbre', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1077, 30, N'La Unión', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1078, 30, N'La Victoria', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1079, 30, N'Obando', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1080, 30, N'Palmira', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1081, 30, N'Pradera', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1082, 30, N'Restrepo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1083, 30, N'Riofrío', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1084, 30, N'Roldanillo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1085, 30, N'San Pedro', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1086, 30, N'Sevilla', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1087, 30, N'Toro', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1088, 30, N'Trujillo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1089, 30, N'Tuluá', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1090, 30, N'Ulloa', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1091, 30, N'Versalles', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1092, 30, N'Vijes', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1093, 30, N'Yotoco', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1094, 30, N'Yumbo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1095, 30, N'Zarzal', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1096, 31, N'Carurú', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1097, 31, N'Mitú', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1098, 31, N'Taraira', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1099, 32, N'Cumaribo', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1100, 32, N'La Primavera', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1101, 32, N'Puerto Carreño', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1102, 32, N'Santa Rosalía', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [FechaCreacion]) VALUES (1103, 33, N'Bogotá D.C.', NULL, CAST(N'2026-06-15T00:01:22.690' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Ciudad] OFF
GO
SET IDENTITY_INSERT [dbo].[Ciudadanos] ON 
GO
INSERT [dbo].[Ciudadanos] ([CiudadanoId], [NombresCompletos], [FechaNacimiento], [LugarNacimiento], [Email], [Celular], [TieneWhatsapp], [ParametroIdDondeVive], [PuestoVotacion], [ParametroIdTipoIdentificacion], [NumeroIdentificacion], [Direccion], [DepartamentoId], [MunicipioId], [ParametroIdGrupoEdad], [ParametroIdGenero], [ParametroIdSoy], [CodigoReferido], [CiudadanoReferidorId], [TieneAcceso], [ParametroIdVereda], [Estado], [FechaRegistro], [Celular2], [TieneWhatsapp2], [ParametroIdTipoDiscapacidad], [ParametroIdEstadoCivil], [TieneHijos], [Cuantos], [TieneVehiculo], [ParametroIdTipoVehiculo], [ParametroIdReligion], [EsEmpleado]) VALUES (3, N'Pablo Emilio Otero Miranda', CAST(N'1993-08-28T00:00:00.000' AS DateTime), N'Planeta Rica Córdoba', N'pabloeoterom@gmail.com', N' 3104648863', 1, 4, N'', 1, N'1003125506', N'Barrio Cornaliza', 13, 502, 6, 7, 10, N'RV-211F4FBEDEFA', 3, 1, 14, 1, CAST(N'2026-06-15T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Ciudadanos] OFF
GO
SET IDENTITY_INSERT [dbo].[Clase] ON 
GO
INSERT [dbo].[Clase] ([ClaseId], [Descripcion], [Estado], [FechaCreacion]) VALUES (1, N'Tipo Documento', 1, CAST(N'2026-06-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [Descripcion], [Estado], [FechaCreacion]) VALUES (2, N'Donde Vive', 1, CAST(N'2026-06-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [Descripcion], [Estado], [FechaCreacion]) VALUES (3, N'Grupo Edad', 1, CAST(N'2026-06-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [Descripcion], [Estado], [FechaCreacion]) VALUES (4, N'Genero', 1, CAST(N'2026-06-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [Descripcion], [Estado], [FechaCreacion]) VALUES (5, N'Quien Soy', 1, CAST(N'2026-06-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [Descripcion], [Estado], [FechaCreacion]) VALUES (6, N'Veredas', 1, CAST(N'2026-06-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [Descripcion], [Estado], [FechaCreacion]) VALUES (7, N'Tipo Discapacidad', 1, CAST(N'2026-06-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [Descripcion], [Estado], [FechaCreacion]) VALUES (8, N'Estado Civil', 1, CAST(N'2026-06-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [Descripcion], [Estado], [FechaCreacion]) VALUES (9, N'Tipo Vehiculo', 1, CAST(N'2026-06-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [Descripcion], [Estado], [FechaCreacion]) VALUES (10, N'Religion', 1, CAST(N'2026-06-24T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Clase] OFF
GO
SET IDENTITY_INSERT [dbo].[Departamento] ON 
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (1, N'Amazonas', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (2, N'Antioquia', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (3, N'Arauca', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (4, N'Atlántico', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (5, N'Bolívar', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (6, N'Boyacá', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (7, N'Caldas', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (8, N'Caquetá', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (9, N'Casanare', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (10, N'Cauca', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (11, N'Cesar', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (12, N'Chocó', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (13, N'Córdoba', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (14, N'Cundinamarca', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (15, N'Guainía', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (16, N'Guaviare', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (17, N'Huila', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (18, N'La Guajira', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (19, N'Magdalena', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (20, N'Meta', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (21, N'Nariño', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (22, N'Norte de Santander', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (23, N'Putumayo', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (24, N'Quindío', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (25, N'Risaralda', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (26, N'San Andrés y Providencia', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (27, N'Santander', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (28, N'Sucre', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (29, N'Tolima', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (30, N'Valle del Cauca', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (31, N'Vaupés', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (32, N'Vichada', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [DepartamentoNombre], [Descripcion], [FechaCreacion]) VALUES (33, N'Bogotá D.C.', NULL, CAST(N'2026-06-14T23:56:39.607' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Departamento] OFF
GO
SET IDENTITY_INSERT [dbo].[Parametros] ON 
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (1, 1, N'Cédula de Ciudadanía', NULL, 1, CAST(N'2026-06-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (2, 1, N'Tarjeta de Identidad', NULL, 1, CAST(N'2026-06-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (3, 2, N'Urbano', NULL, 1, CAST(N'2026-06-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (4, 2, N'Rural', NULL, 1, CAST(N'2026-06-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (5, 3, N'Entre 18-25', NULL, 1, CAST(N'2026-06-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (6, 3, N'Entre 26-35', NULL, 1, CAST(N'2026-06-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (7, 4, N'Hombre', NULL, 1, CAST(N'2026-06-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (8, 4, N'Mujer', NULL, 1, CAST(N'2026-06-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (9, 4, N'LGBTIQ+', NULL, 1, CAST(N'2026-06-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (10, 5, N'Me Considero Lider', NULL, 1, CAST(N'2026-06-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (13, 5, N'Soy Votante', NULL, 1, CAST(N'2026-06-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (14, 6, N'Casco Urbano El Bagre', NULL, 1, CAST(N'2026-06-17T10:25:20.613' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (15, 6, N'Corregimiento Puerto Claver', NULL, 1, CAST(N'2026-06-17T10:25:20.613' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (16, 6, N'Corregimiento Puerto Lopez', NULL, 1, CAST(N'2026-06-17T10:25:20.613' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (17, 6, N'Vereda Algarrobo', NULL, 1, CAST(N'2026-06-17T10:25:20.613' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (18, 6, N'Vereda Alto de Berrugoso', NULL, 1, CAST(N'2026-06-17T10:25:20.613' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (19, 6, N'Vereda Alto de Popana', NULL, 1, CAST(N'2026-06-17T10:25:20.613' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (20, 6, N'Vereda Alto de Sabalito', NULL, 1, CAST(N'2026-06-17T10:25:20.613' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (21, 6, N'Vereda Amaceri', NULL, 1, CAST(N'2026-06-17T10:25:20.613' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (22, 6, N'Vereda Anita', NULL, 1, CAST(N'2026-06-17T10:25:20.613' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (23, 6, N'Vereda Arenales', NULL, 1, CAST(N'2026-06-17T10:25:20.613' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (24, 6, N'Vereda Arenas Blancas', NULL, 1, CAST(N'2026-06-17T10:25:20.613' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (25, 6, N'Vereda Bamba', NULL, 1, CAST(N'2026-06-17T10:25:20.617' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (26, 6, N'Vereda Bocas de Chicamoque', NULL, 1, CAST(N'2026-06-17T10:25:20.617' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (27, 6, N'Vereda Bocas de La Llana', NULL, 1, CAST(N'2026-06-17T10:25:20.617' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (28, 6, N'Vereda Bocas del Guamo', NULL, 1, CAST(N'2026-06-17T10:25:20.617' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (29, 6, N'Vereda Borrachera', NULL, 1, CAST(N'2026-06-17T10:25:20.617' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (30, 6, N'Vereda Brojola', NULL, 1, CAST(N'2026-06-17T10:25:20.617' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (31, 6, N'Vereda Caño Claro', NULL, 1, CAST(N'2026-06-17T10:25:20.617' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (32, 6, N'Vereda Caño Ñeque', NULL, 1, CAST(N'2026-06-17T10:25:20.617' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (33, 6, N'Vereda Chirita', NULL, 1, CAST(N'2026-06-17T10:25:20.617' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (34, 6, N'Vereda Coroncoro', NULL, 1, CAST(N'2026-06-17T10:25:20.617' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (35, 6, N'Vereda Dos Bocas', NULL, 1, CAST(N'2026-06-17T10:25:20.617' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (36, 6, N'Vereda El Castillo', NULL, 1, CAST(N'2026-06-17T10:25:20.617' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (37, 6, N'Vereda El Cimarron', NULL, 1, CAST(N'2026-06-17T10:25:20.617' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (38, 6, N'Vereda El Coral', NULL, 1, CAST(N'2026-06-17T10:25:20.617' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (39, 6, N'Vereda El Oso', NULL, 1, CAST(N'2026-06-17T10:25:20.617' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (40, 6, N'Vereda El Pedral', NULL, 1, CAST(N'2026-06-17T10:25:20.617' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (41, 6, N'Vereda El Perico', NULL, 1, CAST(N'2026-06-17T10:25:20.617' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (42, 6, N'Vereda El Pital', NULL, 1, CAST(N'2026-06-17T10:25:20.617' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (43, 6, N'Vereda El Puente del Tigui', NULL, 1, CAST(N'2026-06-17T10:25:20.617' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (44, 6, N'Vereda El Real', NULL, 1, CAST(N'2026-06-17T10:25:20.620' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (45, 6, N'Vereda El Socorro', NULL, 1, CAST(N'2026-06-17T10:25:20.620' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (46, 6, N'Vereda El Socorro Arriba', NULL, 1, CAST(N'2026-06-17T10:25:20.620' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (47, 6, N'Vereda El Tesoro', NULL, 1, CAST(N'2026-06-17T10:25:20.620' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (48, 6, N'Vereda El Tigre', NULL, 1, CAST(N'2026-06-17T10:25:20.620' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (49, 6, N'Vereda Guachí', NULL, 1, CAST(N'2026-06-17T10:25:20.620' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (50, 6, N'Vereda La Ahuyama', NULL, 1, CAST(N'2026-06-17T10:25:20.620' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (51, 6, N'Vereda La Arenosa', NULL, 1, CAST(N'2026-06-17T10:25:20.620' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (52, 6, N'Vereda La Bonga', NULL, 1, CAST(N'2026-06-17T10:25:20.620' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (53, 6, N'Vereda La Capilla', NULL, 1, CAST(N'2026-06-17T10:25:20.620' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (54, 6, N'Vereda La Chaparrosa', NULL, 1, CAST(N'2026-06-17T10:25:20.620' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (55, 6, N'Vereda La Cinco', NULL, 1, CAST(N'2026-06-17T10:25:20.620' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (56, 6, N'Vereda La Concha', NULL, 1, CAST(N'2026-06-17T10:25:20.620' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (57, 6, N'Vereda La Corona', NULL, 1, CAST(N'2026-06-17T10:25:20.620' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (58, 6, N'Vereda La Duana', NULL, 1, CAST(N'2026-06-17T10:25:20.620' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (59, 6, N'Vereda La Llana', NULL, 1, CAST(N'2026-06-17T10:25:20.620' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (60, 6, N'Vereda La Lucha', NULL, 1, CAST(N'2026-06-17T10:25:20.620' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (61, 6, N'Vereda La Rica', NULL, 1, CAST(N'2026-06-17T10:25:20.620' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (62, 6, N'Vereda La Unión', NULL, 1, CAST(N'2026-06-17T10:25:20.620' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (63, 6, N'Vereda Las Claras', NULL, 1, CAST(N'2026-06-17T10:25:20.620' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (64, 6, N'Vereda Las Claritas', NULL, 1, CAST(N'2026-06-17T10:25:20.620' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (65, 6, N'Vereda Las Claritas Arriba', NULL, 1, CAST(N'2026-06-17T10:25:20.620' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (66, 6, N'Vereda Las Dantas', NULL, 1, CAST(N'2026-06-17T10:25:20.620' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (67, 6, N'Vereda Las Negritas', NULL, 1, CAST(N'2026-06-17T10:25:20.620' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (68, 6, N'Vereda Las Primavera', NULL, 1, CAST(N'2026-06-17T10:25:20.620' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (69, 6, N'Vereda Las Sardinas', NULL, 1, CAST(N'2026-06-17T10:25:20.620' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (70, 6, N'Vereda Los Aguacates', NULL, 1, CAST(N'2026-06-17T10:25:20.620' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (71, 6, N'Vereda Luis Cano', NULL, 1, CAST(N'2026-06-17T10:25:20.620' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (72, 6, N'Vereda Matanza', NULL, 1, CAST(N'2026-06-17T10:25:20.623' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (73, 6, N'Vereda Medios de Manicería', NULL, 1, CAST(N'2026-06-17T10:25:20.623' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (74, 6, N'Vereda Mellizos', NULL, 1, CAST(N'2026-06-17T10:25:20.623' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (75, 6, N'Vereda Muqui', NULL, 1, CAST(N'2026-06-17T10:25:20.623' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (76, 6, N'Vereda Negras Intermedias', NULL, 1, CAST(N'2026-06-17T10:25:20.623' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (77, 6, N'Vereda Nueva Esperanza', NULL, 1, CAST(N'2026-06-17T10:25:20.623' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (78, 6, N'Vereda Ocuru Medio', NULL, 1, CAST(N'2026-06-17T10:25:20.623' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (79, 6, N'Vereda Pindora', NULL, 1, CAST(N'2026-06-17T10:25:20.623' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (80, 6, N'Vereda Piscingo', NULL, 1, CAST(N'2026-06-17T10:25:20.623' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (81, 6, N'Vereda Rio Viejo', NULL, 1, CAST(N'2026-06-17T10:25:20.623' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (82, 6, N'Vereda Sabalito Sinaí', NULL, 1, CAST(N'2026-06-17T10:25:20.623' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (83, 6, N'Vereda San Carlos', NULL, 1, CAST(N'2026-06-17T10:25:20.623' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (84, 6, N'Vereda San Cayetano', NULL, 1, CAST(N'2026-06-17T10:25:20.623' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (85, 6, N'Vereda San Pedro', NULL, 1, CAST(N'2026-06-17T10:25:20.623' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (86, 6, N'Vereda Santa Barbara', NULL, 1, CAST(N'2026-06-17T10:25:20.623' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (87, 6, N'Vereda Santa Barbarita', NULL, 1, CAST(N'2026-06-17T10:25:20.623' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (88, 6, N'Vereda Santa Isabel', NULL, 1, CAST(N'2026-06-17T10:25:20.623' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (89, 6, N'Vereda Santa Margarita', NULL, 1, CAST(N'2026-06-17T10:25:20.623' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (90, 6, N'Vereda Santa Rosa', NULL, 1, CAST(N'2026-06-17T10:25:20.623' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (91, 6, N'Vereda Santa Teresa', NULL, 1, CAST(N'2026-06-17T10:25:20.623' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (92, 6, N'Vereda Sentada de Ocuru', NULL, 1, CAST(N'2026-06-17T10:25:20.623' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (93, 6, N'Vereda Sentada de Villa', NULL, 1, CAST(N'2026-06-17T10:25:20.627' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (94, 6, N'Vereda Sohaibado', NULL, 1, CAST(N'2026-06-17T10:25:20.627' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (95, 6, N'Vereda Tarachica', NULL, 1, CAST(N'2026-06-17T10:25:20.627' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (96, 6, N'Vereda Villa Chica', NULL, 1, CAST(N'2026-06-17T10:25:20.627' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (97, 6, N'Vereda Villa Grande', NULL, 1, CAST(N'2026-06-17T10:25:20.627' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (98, 6, N'Vereda Villa Hermosa', NULL, 1, CAST(N'2026-06-17T10:25:20.627' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (99, 6, N'Vereda Villa Ocuru', NULL, 1, CAST(N'2026-06-17T10:25:20.627' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (100, 6, N'Resguardo El Noventa', NULL, 1, CAST(N'2026-06-17T10:25:20.627' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (101, 6, N'Resguardo Los Almendros', NULL, 1, CAST(N'2026-06-17T10:25:20.627' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (102, 6, N'Corregimiento Buenos Aires Palizada (Zaragoza)', NULL, 1, CAST(N'2026-06-17T10:25:20.627' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (103, 6, N'Vereda Cordero Icacal (Zaragoza)', NULL, 1, CAST(N'2026-06-17T10:25:20.627' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (104, 6, N'Vereda Caño La Tres (Zaragoza)', NULL, 1, CAST(N'2026-06-17T10:25:20.627' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (105, 6, N'VeredaMalena (Segovia)', NULL, 1, CAST(N'2026-06-17T10:25:20.627' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (106, 5, N'Voluntario ayuda logística de la Campaña', NULL, 1, CAST(N'2026-06-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (107, 7, N'Física', N'Discapacidad Física', 1, CAST(N'2026-06-24T11:59:39.337' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (108, 7, N'Visual', N'Discapacidad Visual', 1, CAST(N'2026-06-24T11:59:39.337' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (109, 7, N'Auditiva', N'Discapacidad Auditiva', 1, CAST(N'2026-06-24T11:59:39.337' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (110, 7, N'Sordo Ceguera', N'Discapacidad Sordo Ceguera', 1, CAST(N'2026-06-24T11:59:39.337' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (111, 7, N'Intelectual', N'Discapacidad Intelectual', 1, CAST(N'2026-06-24T11:59:39.337' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (112, 7, N'Psicosocial', N'Discapacidad Psicosocial', 1, CAST(N'2026-06-24T11:59:39.337' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (113, 7, N'Múltiple', N'Discapacidad Múltiple', 1, CAST(N'2026-06-24T11:59:39.337' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (114, 8, N'Casado(a)', N'Estado Civil Casado(a)', 1, CAST(N'2026-06-24T12:07:53.270' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (115, 8, N'Unión Libre', N'Estado Civil Unión Libre', 1, CAST(N'2026-06-24T12:07:53.270' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (116, 8, N'Soltero(a)', N'Estado Civil Soltero(a)', 1, CAST(N'2026-06-24T12:07:53.270' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (117, 8, N'Viudo(a)', N'Estado Civil Viudo(a)', 1, CAST(N'2026-06-24T12:07:53.270' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (118, 9, N'Carro', N'Carro', 1, CAST(N'2026-06-24T12:09:11.097' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (119, 9, N'Moto', N'Moto', 1, CAST(N'2026-06-24T12:09:11.097' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (120, 10, N'Cristiano Católico', N'Religión Cristiano Católico', 1, CAST(N'2026-06-24T12:13:14.143' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (121, 10, N'Cristiano Evangélico', N'Religión Cristiano Evangélico', 1, CAST(N'2026-06-24T12:13:14.143' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (122, 10, N'Cristiano Adventista', N'Religión Cristiano Adventista', 1, CAST(N'2026-06-24T12:13:14.143' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (123, 10, N'Cristiano Testigo de Jehová', N'Religión Cristiano Testigo de Jehová', 1, CAST(N'2026-06-24T12:13:14.143' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (124, 10, N'Cristiano Anglicano', N'Religión Cristiano Anglicano', 1, CAST(N'2026-06-24T12:13:14.143' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (125, 10, N'Sin religión', N'Sin religión registrada', 1, CAST(N'2026-06-24T12:13:14.143' AS DateTime))
GO
INSERT [dbo].[Parametros] ([ParametroId], [ClaseId], [Descripcion], [Observacion], [Estado], [FechaCreacion]) VALUES (126, 7, N'Sin Discapacidad', N'Sin Discapacidad', 1, CAST(N'2026-06-24T21:11:14.080' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Parametros] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [CiudadanoId], [Email], [PasswordHash], [Rol], [Estado], [FechaCreacion]) VALUES (1, 3, N'pabloeoterom@gmail.com', N'PBKDF2-SHA256$100000$NZ0vkOl7c+pOoZTcN+2QxA==$LG5gtMqfwz6bue8xv2py/81+BlhoGS5/N7dz7QRyeOA=', N'ADMIN', 1, CAST(N'2026-06-15T20:31:56.527' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Ciudadan__DE4F7F567E9ED49D]    Script Date: 27/06/2026 2:46:51 p. m. ******/
ALTER TABLE [dbo].[Ciudadanos] ADD  CONSTRAINT [UQ__Ciudadan__DE4F7F567E9ED49D] UNIQUE NONCLUSTERED 
(
	[CodigoReferido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Usuarios__819E4DDC58BDD0BC]    Script Date: 27/06/2026 2:46:51 p. m. ******/
ALTER TABLE [dbo].[Usuarios] ADD UNIQUE NONCLUSTERED 
(
	[CiudadanoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Usuarios__A9D1053444DB54CC]    Script Date: 27/06/2026 2:46:51 p. m. ******/
ALTER TABLE [dbo].[Usuarios] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ciudad] ADD  CONSTRAINT [DF_Ciudad_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Ciudadanos] ADD  CONSTRAINT [DF__Ciudadano__Tiene__38996AB5]  DEFAULT ((0)) FOR [TieneAcceso]
GO
ALTER TABLE [dbo].[Ciudadanos] ADD  CONSTRAINT [DF__Ciudadano__Estad__398D8EEE]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Ciudadanos] ADD  CONSTRAINT [DF__Ciudadano__Fecha__3A81B327]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Clase] ADD  CONSTRAINT [DF_Clase_Estado]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Clase] ADD  CONSTRAINT [DF_Clase_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Departamento] ADD  CONSTRAINT [DF_Departamento_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Parametros] ADD  CONSTRAINT [DF_Parametros_Estado]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Parametros] ADD  CONSTRAINT [DF_Parametros_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ('Ciudadano') FOR [Rol]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Ciudad]  WITH CHECK ADD  CONSTRAINT [FK_Ciudad_Departamento] FOREIGN KEY([DepartamentoId])
REFERENCES [dbo].[Departamento] ([DepartamentoId])
GO
ALTER TABLE [dbo].[Ciudad] CHECK CONSTRAINT [FK_Ciudad_Departamento]
GO
ALTER TABLE [dbo].[Ciudadanos]  WITH CHECK ADD  CONSTRAINT [FK_Ciudadanos_Ciudad] FOREIGN KEY([MunicipioId])
REFERENCES [dbo].[Ciudad] ([CiudadId])
GO
ALTER TABLE [dbo].[Ciudadanos] CHECK CONSTRAINT [FK_Ciudadanos_Ciudad]
GO
ALTER TABLE [dbo].[Ciudadanos]  WITH CHECK ADD  CONSTRAINT [FK_Ciudadanos_Departamento] FOREIGN KEY([DepartamentoId])
REFERENCES [dbo].[Departamento] ([DepartamentoId])
GO
ALTER TABLE [dbo].[Ciudadanos] CHECK CONSTRAINT [FK_Ciudadanos_Departamento]
GO
ALTER TABLE [dbo].[Ciudadanos]  WITH CHECK ADD  CONSTRAINT [FK_Ciudadanos_Parametros] FOREIGN KEY([ParametroIdTipoIdentificacion])
REFERENCES [dbo].[Parametros] ([ParametroId])
GO
ALTER TABLE [dbo].[Ciudadanos] CHECK CONSTRAINT [FK_Ciudadanos_Parametros]
GO
ALTER TABLE [dbo].[Ciudadanos]  WITH CHECK ADD  CONSTRAINT [FK_Ciudadanos_Parametros1] FOREIGN KEY([ParametroIdGrupoEdad])
REFERENCES [dbo].[Parametros] ([ParametroId])
GO
ALTER TABLE [dbo].[Ciudadanos] CHECK CONSTRAINT [FK_Ciudadanos_Parametros1]
GO
ALTER TABLE [dbo].[Ciudadanos]  WITH CHECK ADD  CONSTRAINT [FK_Ciudadanos_Parametros2] FOREIGN KEY([ParametroIdGenero])
REFERENCES [dbo].[Parametros] ([ParametroId])
GO
ALTER TABLE [dbo].[Ciudadanos] CHECK CONSTRAINT [FK_Ciudadanos_Parametros2]
GO
ALTER TABLE [dbo].[Ciudadanos]  WITH CHECK ADD  CONSTRAINT [FK_Ciudadanos_Parametros3] FOREIGN KEY([ParametroIdDondeVive])
REFERENCES [dbo].[Parametros] ([ParametroId])
GO
ALTER TABLE [dbo].[Ciudadanos] CHECK CONSTRAINT [FK_Ciudadanos_Parametros3]
GO
ALTER TABLE [dbo].[Ciudadanos]  WITH CHECK ADD  CONSTRAINT [FK_Ciudadanos_Parametros4] FOREIGN KEY([ParametroIdSoy])
REFERENCES [dbo].[Parametros] ([ParametroId])
GO
ALTER TABLE [dbo].[Ciudadanos] CHECK CONSTRAINT [FK_Ciudadanos_Parametros4]
GO
ALTER TABLE [dbo].[Parametros]  WITH CHECK ADD  CONSTRAINT [FK_Parametros_Clase] FOREIGN KEY([ClaseId])
REFERENCES [dbo].[Clase] ([ClaseId])
GO
ALTER TABLE [dbo].[Parametros] CHECK CONSTRAINT [FK_Parametros_Clase]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Ciudadanos] FOREIGN KEY([CiudadanoId])
REFERENCES [dbo].[Ciudadanos] ([CiudadanoId])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Ciudadanos]
GO
/****** Object:  StoredProcedure [dbo].[spGetCiudadesPorDepartamentoId]    Script Date: 27/06/2026 2:46:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spGetCiudadesPorDepartamentoId]
    @DepartamentoId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        CiudadId,
        DepartamentoId,
        CiudadNombre,
        Descripcion,
        FechaCreacion
    FROM dbo.Ciudad
    WHERE DepartamentoId = @DepartamentoId
    ORDER BY CiudadNombre;
END;
GO
/****** Object:  StoredProcedure [dbo].[spGetDepartamentos]    Script Date: 27/06/2026 2:46:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spGetDepartamentos]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        DepartamentoId,
        DepartamentoNombre,
        Descripcion,
        FechaCreacion
    FROM dbo.Departamento
    ORDER BY DepartamentoNombre;
END;
GO
/****** Object:  StoredProcedure [dbo].[spGetObtenerParametrosClaseDescripcion]    Script Date: 27/06/2026 2:46:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spGetObtenerParametrosClaseDescripcion]
    @DescripcionClase NVARCHAR(150)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        p.ParametroId,
        p.ClaseId,
        p.Descripcion,
        p.Observacion,
        p.Estado,
        p.FechaCreacion
    FROM dbo.Clase c
    INNER JOIN dbo.Parametros p
        ON p.ClaseId = c.ClaseId
    WHERE c.Descripcion = @DescripcionClase
      AND c.Estado = 1
      AND p.Estado = 1
    ORDER BY p.Descripcion;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_Ciudadanos_DesactivarReferido]    Script Date: 27/06/2026 2:46:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_Ciudadanos_DesactivarReferido]
    @CiudadanoAutenticadoId INT,
    @CiudadanoReferidoId INT
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    UPDATE objetivo
    SET Estado = 0
    FROM dbo.Ciudadanos objetivo
    WHERE objetivo.CiudadanoId = @CiudadanoReferidoId
      AND objetivo.Estado = 1
      AND (
            objetivo.CiudadanoReferidorId = @CiudadanoAutenticadoId
            OR objetivo.CiudadanoReferidorId IN (
                SELECT directo.CiudadanoId
                FROM dbo.Ciudadanos directo
                WHERE directo.CiudadanoReferidorId = @CiudadanoAutenticadoId
            )
          );

    SELECT CAST(IIF(@@ROWCOUNT > 0, 1, 0) AS BIT) AS Desactivado;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_Ciudadanos_ExisteCodigoReferido]    Script Date: 27/06/2026 2:46:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_Ciudadanos_ExisteCodigoReferido]
    @CodigoReferido NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT CAST(
        CASE
            WHEN EXISTS (
                SELECT 1
                FROM dbo.Ciudadanos
                WHERE CodigoReferido = @CodigoReferido
            )
            THEN 1
            ELSE 0
        END AS BIT) AS Existe;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_Ciudadanos_ObtenerRedReferidos]    Script Date: 27/06/2026 2:46:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE   PROCEDURE [dbo].[usp_Ciudadanos_ObtenerRedReferidos]
    @CiudadanoId INT
AS
BEGIN
    SET NOCOUNT ON;

    ;WITH RedReferidos AS
    (
        SELECT
            c.CiudadanoId,
            c.NombresCompletos,
            c.FechaNacimiento,
            c.LugarNacimiento,
            c.Email,
            c.Celular,
            c.TieneWhatsapp,
            c.ParametroIdDondeVive,
            c.PuestoVotacion,
            c.ParametroIdTipoIdentificacion,
            c.NumeroIdentificacion,
            c.Direccion,
            c.DepartamentoId,
            c.MunicipioId,
            c.ParametroIdGrupoEdad,
            c.ParametroIdGenero,
            c.ParametroIdSoy,
            c.CodigoReferido,
            c.CiudadanoReferidorId,
            c.TieneAcceso,
            c.ParametroIdVereda,
            c.Estado,
            c.FechaRegistro,
            c.Celular2,
            c.TieneWhatsapp2,
            c.ParametroIdTipoDiscapacidad,
            c.ParametroIdEstadoCivil,
            c.TieneHijos,
            c.Cuantos,
            c.TieneVehiculo,
            c.ParametroIdTipoVehiculo,
            c.ParametroIdReligion,
            c.EsEmpleado,
            r.NombresCompletos AS Referidor,
            1 AS Nivel,
            CAST(N'Directo' AS NVARCHAR(20)) AS TipoReferido,
            CAST('/' + CAST(c.CiudadanoId AS VARCHAR(20)) + '/' AS VARCHAR(MAX)) AS Ruta
        FROM dbo.Ciudadanos c
        INNER JOIN dbo.Ciudadanos r
            ON r.CiudadanoId = c.CiudadanoReferidorId
        WHERE c.CiudadanoReferidorId = @CiudadanoId
          AND c.CiudadanoId <> @CiudadanoId

        UNION ALL

        SELECT
            c.CiudadanoId,
            c.NombresCompletos,
            c.FechaNacimiento,
            c.LugarNacimiento,
            c.Email,
            c.Celular,
            c.TieneWhatsapp,
            c.ParametroIdDondeVive,
            c.PuestoVotacion,
            c.ParametroIdTipoIdentificacion,
            c.NumeroIdentificacion,
            c.Direccion,
            c.DepartamentoId,
            c.MunicipioId,
            c.ParametroIdGrupoEdad,
            c.ParametroIdGenero,
            c.ParametroIdSoy,
            c.CodigoReferido,
            c.CiudadanoReferidorId,
            c.TieneAcceso,
            c.ParametroIdVereda,
            c.Estado,
            c.FechaRegistro,
            c.Celular2,
            c.TieneWhatsapp2,
            c.ParametroIdTipoDiscapacidad,
            c.ParametroIdEstadoCivil,
            c.TieneHijos,
            c.Cuantos,
            c.TieneVehiculo,
            c.ParametroIdTipoVehiculo,
            c.ParametroIdReligion,
            c.EsEmpleado,
            r.NombresCompletos AS Referidor,
            rr.Nivel + 1 AS Nivel,
            CAST(N'Indirecto' AS NVARCHAR(20)) AS TipoReferido,
            CAST(rr.Ruta + CAST(c.CiudadanoId AS VARCHAR(20)) + '/' AS VARCHAR(MAX)) AS Ruta
        FROM dbo.Ciudadanos c
        INNER JOIN dbo.Ciudadanos r
            ON r.CiudadanoId = c.CiudadanoReferidorId
        INNER JOIN RedReferidos rr
            ON rr.CiudadanoId = c.CiudadanoReferidorId
        WHERE c.CiudadanoId <> @CiudadanoId
          AND rr.Ruta NOT LIKE '%/' + CAST(c.CiudadanoId AS VARCHAR(20)) + '/%'
          AND rr.Nivel < 20
    )
    SELECT
        rr.CiudadanoId,
        rr.NombresCompletos,
        rr.FechaNacimiento,
        rr.LugarNacimiento,
        rr.Email,
        rr.Celular,
        rr.TieneWhatsapp,
        rr.ParametroIdDondeVive,
        pDondeVive.Descripcion AS DondeViveDescripcion,
        rr.PuestoVotacion,
        rr.ParametroIdTipoIdentificacion,
        pTipoIdentificacion.Descripcion AS TipoIdentificacionDescripcion,
        rr.NumeroIdentificacion,
        rr.Direccion,
        rr.DepartamentoId,
        rr.MunicipioId,
        rr.ParametroIdGrupoEdad,
        pGrupoEdad.Descripcion AS GrupoEdadDescripcion,
        rr.ParametroIdGenero,
        pGenero.Descripcion AS GeneroDescripcion,
        rr.ParametroIdSoy,
        pSoy.Descripcion AS SoyDescripcion,
        rr.CodigoReferido,
        rr.CiudadanoReferidorId,
        rr.TieneAcceso,
        rr.ParametroIdVereda,
        pVereda.Descripcion AS VeredaDescripcion,
        rr.Estado,
        rr.FechaRegistro,
        rr.Celular2,
        rr.TieneWhatsapp2,
        rr.ParametroIdTipoDiscapacidad,
        pDiscapacidad.Descripcion AS TipoDiscapacidadDescripcion,
        rr.ParametroIdEstadoCivil,
        pEstadoCivil.Descripcion AS EstadoCivilDescripcion,
        rr.TieneHijos,
        rr.Cuantos,
        rr.TieneVehiculo,
        rr.ParametroIdTipoVehiculo,
        pTipoVehiculo.Descripcion AS TipoVehiculoDescripcion,
        rr.ParametroIdReligion,
        pReligion.Descripcion AS ReligionDescripcion,
        rr.EsEmpleado,
        rr.Referidor,
        rr.Nivel,
        rr.TipoReferido
    FROM RedReferidos rr
    LEFT JOIN dbo.Parametros pDondeVive
        ON pDondeVive.ParametroId = rr.ParametroIdDondeVive
    LEFT JOIN dbo.Parametros pTipoIdentificacion
        ON pTipoIdentificacion.ParametroId = rr.ParametroIdTipoIdentificacion
    LEFT JOIN dbo.Parametros pGrupoEdad
        ON pGrupoEdad.ParametroId = rr.ParametroIdGrupoEdad
    LEFT JOIN dbo.Parametros pGenero
        ON pGenero.ParametroId = rr.ParametroIdGenero
    LEFT JOIN dbo.Parametros pSoy
        ON pSoy.ParametroId = rr.ParametroIdSoy
    LEFT JOIN dbo.Parametros pVereda
        ON pVereda.ParametroId = rr.ParametroIdVereda
    LEFT JOIN dbo.Parametros pDiscapacidad
        ON pDiscapacidad.ParametroId = rr.ParametroIdTipoDiscapacidad
    LEFT JOIN dbo.Parametros pEstadoCivil
        ON pEstadoCivil.ParametroId = rr.ParametroIdEstadoCivil
    LEFT JOIN dbo.Parametros pTipoVehiculo
        ON pTipoVehiculo.ParametroId = rr.ParametroIdTipoVehiculo
    LEFT JOIN dbo.Parametros pReligion
        ON pReligion.ParametroId = rr.ParametroIdReligion
    ORDER BY 
        rr.Nivel,
        rr.FechaRegistro DESC,
        rr.NombresCompletos
    OPTION (MAXRECURSION 20);
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_Ciudadanos_ObtenerRedReferidos_23_06_2026]    Script Date: 27/06/2026 2:46:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Ciudadanos_ObtenerRedReferidos_23_06_2026]
    @CiudadanoId INT
AS
BEGIN
    SET NOCOUNT ON;

    ;WITH Directos AS
    (
        SELECT
            c.CiudadanoId,
            c.NombresCompletos,
            c.Email,
            c.Celular,
            c.Celular2,
            c.TieneWhatsapp2,
            c.NumeroIdentificacion,
            c.CodigoReferido,
            c.CiudadanoReferidorId,
            r.NombresCompletos AS Referidor,
            c.FechaRegistro,
            c.Estado,
            1 AS Nivel,
            CAST(N'Directo' AS NVARCHAR(20)) AS TipoReferido
        FROM dbo.Ciudadanos c
        INNER JOIN dbo.Ciudadanos r
            ON r.CiudadanoId = c.CiudadanoReferidorId
        WHERE c.CiudadanoReferidorId = @CiudadanoId
    ),
    Indirectos AS
    (
        SELECT
            c.CiudadanoId,
            c.NombresCompletos,
            c.Email,
            c.Celular,
            c.Celular2,
            c.TieneWhatsapp2,
            c.NumeroIdentificacion,
            c.CodigoReferido,
            c.CiudadanoReferidorId,
            r.NombresCompletos AS Referidor,
            c.FechaRegistro,
            c.Estado,
            2 AS Nivel,
            CAST(N'Indirecto' AS NVARCHAR(20)) AS TipoReferido
        FROM dbo.Ciudadanos c
        INNER JOIN dbo.Ciudadanos r
            ON r.CiudadanoId = c.CiudadanoReferidorId
        INNER JOIN Directos d
            ON d.CiudadanoId = c.CiudadanoReferidorId
        WHERE NOT EXISTS
        (
            SELECT 1
            FROM Directos dx
            WHERE dx.CiudadanoId = c.CiudadanoId
        )
    )
    SELECT *
    FROM Directos

    UNION ALL

    SELECT *
    FROM Indirectos
    ORDER BY Nivel, FechaRegistro DESC, NombresCompletos;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_Ciudadanos_ObtenerRedReferidos_25_06_2026]    Script Date: 27/06/2026 2:46:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Ciudadanos_ObtenerRedReferidos_25_06_2026]
    @CiudadanoId INT
AS
BEGIN
    SET NOCOUNT ON;

    ;WITH RedReferidos AS
    (
        SELECT
            c.CiudadanoId,
            c.NombresCompletos,
            c.Email,
            c.Celular,
            c.Celular2,
            c.TieneWhatsapp2,
            c.NumeroIdentificacion,
            c.FechaNacimiento,
            c.CodigoReferido,
            c.CiudadanoReferidorId,
            r.NombresCompletos AS Referidor,
            c.FechaRegistro,
            c.Estado,
            1 AS Nivel,
            CAST(N'Directo' AS NVARCHAR(20)) AS TipoReferido,
            CAST('/' + CAST(c.CiudadanoId AS VARCHAR(20)) + '/' AS VARCHAR(MAX)) AS Ruta
        FROM dbo.Ciudadanos c
        INNER JOIN dbo.Ciudadanos r
            ON r.CiudadanoId = c.CiudadanoReferidorId
        WHERE c.CiudadanoReferidorId = @CiudadanoId
          AND c.CiudadanoId <> @CiudadanoId

        UNION ALL

        SELECT
            c.CiudadanoId,
            c.NombresCompletos,
            c.Email,
            c.Celular,
            c.Celular2,
            c.TieneWhatsapp2,
            c.NumeroIdentificacion,
            c.FechaNacimiento,
            c.CodigoReferido,
            c.CiudadanoReferidorId,
            r.NombresCompletos AS Referidor,
            c.FechaRegistro,
            c.Estado,
            rr.Nivel + 1 AS Nivel,
            CAST(N'Indirecto' AS NVARCHAR(20)) AS TipoReferido,
            CAST(rr.Ruta + CAST(c.CiudadanoId AS VARCHAR(20)) + '/' AS VARCHAR(MAX)) AS Ruta
        FROM dbo.Ciudadanos c
        INNER JOIN dbo.Ciudadanos r
            ON r.CiudadanoId = c.CiudadanoReferidorId
        INNER JOIN RedReferidos rr
            ON rr.CiudadanoId = c.CiudadanoReferidorId
        WHERE c.CiudadanoId <> @CiudadanoId
          AND rr.Ruta NOT LIKE '%/' + CAST(c.CiudadanoId AS VARCHAR(20)) + '/%'
          AND rr.Nivel < 20
    )
    SELECT
        CiudadanoId,
        NombresCompletos,
        Email,
        Celular,
        Celular2,
        TieneWhatsapp2,
        NumeroIdentificacion,
        FechaNacimiento,
        CodigoReferido,
        CiudadanoReferidorId,
        Referidor,
        FechaRegistro,
        Estado,
        Nivel,
        TipoReferido
    FROM RedReferidos
    ORDER BY 
        Nivel,
        FechaRegistro DESC,
        NombresCompletos
    OPTION (MAXRECURSION 20);
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_Ciudadanos_Registrar]    Script Date: 27/06/2026 2:46:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_Ciudadanos_Registrar]
    @NombresCompletos NVARCHAR(200),
    @Celular NVARCHAR(30) = NULL,
    @Celular2 NVARCHAR(30) = NULL,
    @FechaNacimiento DATETIME = NULL,
    @LugarNacimiento NVARCHAR(150) = NULL,
    @TieneWhatsapp BIT = NULL,
    @TieneWhatsapp2 BIT = NULL,
    @ParametroIdDondeVive INT = NULL,
    @Email NVARCHAR(150) = NULL,
    @ParametroIdTipoIdentificacion INT = NULL,
    @NumeroIdentificacion NVARCHAR(50) = NULL,
    @Direccion NVARCHAR(250) = NULL,
    @DepartamentoId INT = NULL,
    @MunicipioId INT = NULL,
    @ParametroIdGrupoEdad INT = NULL,
    @ParametroIdGenero INT = NULL,
    @ParametroIdSoy INT = NULL,
    @ParametroIdVereda INT = NULL,
    @ParametroIdTipoDiscapacidad INT = NULL,
    @ParametroIdEstadoCivil INT = NULL,
    @TieneHijos BIT = NULL,
    @Cuantos INT = NULL,
    @TieneVehiculo BIT = NULL,
    @ParametroIdTipoVehiculo INT = NULL,
    @ParametroIdReligion INT = NULL,
    @EsEmpleado BIT = NULL,
    @Estado BIT = 1,
    @CodigoReferidoInvitacion NVARCHAR(50) = NULL,
    @PasswordHash NVARCHAR(500) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @CiudadanoReferidorId INT = NULL;
    DECLARE @CiudadanoId INT;
    DECLARE @CodigoReferido NVARCHAR(50);
    DECLARE @TieneAcceso BIT = IIF(@PasswordHash IS NULL, 0, 1);
    DECLARE @FechaRegistro DATETIME = GETUTCDATE();

    BEGIN TRY
        BEGIN TRANSACTION;

        IF @CodigoReferidoInvitacion IS NOT NULL
        BEGIN
            SELECT @CiudadanoReferidorId = CiudadanoId
            FROM dbo.Ciudadanos WITH (UPDLOCK, HOLDLOCK)
            WHERE CodigoReferido = @CodigoReferidoInvitacion;

            IF @CiudadanoReferidorId IS NULL
            BEGIN
                ROLLBACK TRANSACTION;
                SELECT
                    CAST(0 AS BIT) AS IsSuccess,
                    N'El código de referido no es válido.' AS Message,
                    CAST(NULL AS INT) AS CiudadanoId,
                    CAST(NULL AS NVARCHAR(50)) AS CodigoReferido,
                    CAST(0 AS BIT) AS TieneAcceso,
                    CAST(NULL AS INT) AS CiudadanoReferidorId,
                    CAST(NULL AS DATETIME) AS FechaNacimiento,
                    CAST(NULL AS NVARCHAR(150)) AS LugarNacimiento,
                    CAST(NULL AS NVARCHAR(30)) AS Celular,
                    CAST(NULL AS BIT) AS TieneWhatsapp,
                    CAST(NULL AS NVARCHAR(30)) AS Celular2,
                    CAST(NULL AS BIT) AS TieneWhatsapp2,
                    CAST(NULL AS INT) AS ParametroIdDondeVive,
                    CAST(NULL AS INT) AS ParametroIdVereda,
                    CAST(NULL AS INT) AS ParametroIdTipoDiscapacidad,
                    CAST(NULL AS INT) AS ParametroIdEstadoCivil,
                    CAST(NULL AS BIT) AS TieneHijos,
                    CAST(NULL AS INT) AS Cuantos,
                    CAST(NULL AS BIT) AS TieneVehiculo,
                    CAST(NULL AS INT) AS ParametroIdTipoVehiculo,
                    CAST(NULL AS INT) AS ParametroIdReligion,
                    CAST(NULL AS BIT) AS EsEmpleado;
                RETURN;
            END
        END

        IF @PasswordHash IS NOT NULL
           AND EXISTS (
               SELECT 1
               FROM dbo.Usuarios WITH (UPDLOCK, HOLDLOCK)
               WHERE Email = @Email
           )
        BEGIN
            ROLLBACK TRANSACTION;
            SELECT
                CAST(0 AS BIT) AS IsSuccess,
                N'El email ya se encuentra registrado.' AS Message,
                CAST(NULL AS INT) AS CiudadanoId,
                CAST(NULL AS NVARCHAR(50)) AS CodigoReferido,
                CAST(0 AS BIT) AS TieneAcceso,
                CAST(NULL AS INT) AS CiudadanoReferidorId,
                CAST(NULL AS DATETIME) AS FechaNacimiento,
                CAST(NULL AS NVARCHAR(150)) AS LugarNacimiento,
                CAST(NULL AS NVARCHAR(30)) AS Celular,
                CAST(NULL AS BIT) AS TieneWhatsapp,
                CAST(NULL AS NVARCHAR(30)) AS Celular2,
                CAST(NULL AS BIT) AS TieneWhatsapp2,
                CAST(NULL AS INT) AS ParametroIdDondeVive,
                CAST(NULL AS INT) AS ParametroIdVereda,
                CAST(NULL AS INT) AS ParametroIdTipoDiscapacidad,
                CAST(NULL AS INT) AS ParametroIdEstadoCivil,
                CAST(NULL AS BIT) AS TieneHijos,
                CAST(NULL AS INT) AS Cuantos,
                CAST(NULL AS BIT) AS TieneVehiculo,
                CAST(NULL AS INT) AS ParametroIdTipoVehiculo,
                CAST(NULL AS INT) AS ParametroIdReligion,
                CAST(NULL AS BIT) AS EsEmpleado;
            RETURN;
        END

        IF @Email IS NOT NULL
           AND EXISTS (
               SELECT 1
               FROM dbo.Ciudadanos WITH (UPDLOCK, HOLDLOCK)
               WHERE Email = @Email
           )
        BEGIN
            ROLLBACK TRANSACTION;
            SELECT
                CAST(0 AS BIT) AS IsSuccess,
                N'El email ya se encuentra registrado en ciudadanos.' AS Message,
                CAST(NULL AS INT) AS CiudadanoId,
                CAST(NULL AS NVARCHAR(50)) AS CodigoReferido,
                CAST(0 AS BIT) AS TieneAcceso,
                CAST(NULL AS INT) AS CiudadanoReferidorId,
                CAST(NULL AS DATETIME) AS FechaNacimiento,
                CAST(NULL AS NVARCHAR(150)) AS LugarNacimiento,
                CAST(NULL AS NVARCHAR(30)) AS Celular,
                CAST(NULL AS BIT) AS TieneWhatsapp,
                CAST(NULL AS NVARCHAR(30)) AS Celular2,
                CAST(NULL AS BIT) AS TieneWhatsapp2,
                CAST(NULL AS INT) AS ParametroIdDondeVive,
                CAST(NULL AS INT) AS ParametroIdVereda,
                CAST(NULL AS INT) AS ParametroIdTipoDiscapacidad,
                CAST(NULL AS INT) AS ParametroIdEstadoCivil,
                CAST(NULL AS BIT) AS TieneHijos,
                CAST(NULL AS INT) AS Cuantos,
                CAST(NULL AS BIT) AS TieneVehiculo,
                CAST(NULL AS INT) AS ParametroIdTipoVehiculo,
                CAST(NULL AS INT) AS ParametroIdReligion,
                CAST(NULL AS BIT) AS EsEmpleado;
            RETURN;
        END

        IF @Celular IS NOT NULL
           AND EXISTS (
               SELECT 1
               FROM dbo.Ciudadanos WITH (UPDLOCK, HOLDLOCK)
               WHERE Celular = @Celular
           )
        BEGIN
            ROLLBACK TRANSACTION;
            SELECT
                CAST(0 AS BIT) AS IsSuccess,
                N'El celular ya se encuentra registrado en ciudadanos.' AS Message,
                CAST(NULL AS INT) AS CiudadanoId,
                CAST(NULL AS NVARCHAR(50)) AS CodigoReferido,
                CAST(0 AS BIT) AS TieneAcceso,
                CAST(NULL AS INT) AS CiudadanoReferidorId,
                CAST(NULL AS DATETIME) AS FechaNacimiento,
                CAST(NULL AS NVARCHAR(150)) AS LugarNacimiento,
                CAST(NULL AS NVARCHAR(30)) AS Celular,
                CAST(NULL AS BIT) AS TieneWhatsapp,
                CAST(NULL AS NVARCHAR(30)) AS Celular2,
                CAST(NULL AS BIT) AS TieneWhatsapp2,
                CAST(NULL AS INT) AS ParametroIdDondeVive,
                CAST(NULL AS INT) AS ParametroIdVereda,
                CAST(NULL AS INT) AS ParametroIdTipoDiscapacidad,
                CAST(NULL AS INT) AS ParametroIdEstadoCivil,
                CAST(NULL AS BIT) AS TieneHijos,
                CAST(NULL AS INT) AS Cuantos,
                CAST(NULL AS BIT) AS TieneVehiculo,
                CAST(NULL AS INT) AS ParametroIdTipoVehiculo,
                CAST(NULL AS INT) AS ParametroIdReligion,
                CAST(NULL AS BIT) AS EsEmpleado;
            RETURN;
        END

        IF @NumeroIdentificacion IS NOT NULL
           AND EXISTS (
               SELECT 1
               FROM dbo.Ciudadanos WITH (UPDLOCK, HOLDLOCK)
               WHERE NumeroIdentificacion = @NumeroIdentificacion
           )
        BEGIN
            ROLLBACK TRANSACTION;
            SELECT
                CAST(0 AS BIT) AS IsSuccess,
                N'El numero de identificacion ya se encuentra registrado en ciudadanos.' AS Message,
                CAST(NULL AS INT) AS CiudadanoId,
                CAST(NULL AS NVARCHAR(50)) AS CodigoReferido,
                CAST(0 AS BIT) AS TieneAcceso,
                CAST(NULL AS INT) AS CiudadanoReferidorId,
                CAST(NULL AS DATETIME) AS FechaNacimiento,
                CAST(NULL AS NVARCHAR(150)) AS LugarNacimiento,
                CAST(NULL AS NVARCHAR(30)) AS Celular,
                CAST(NULL AS BIT) AS TieneWhatsapp,
                CAST(NULL AS NVARCHAR(30)) AS Celular2,
                CAST(NULL AS BIT) AS TieneWhatsapp2,
                CAST(NULL AS INT) AS ParametroIdDondeVive,
                CAST(NULL AS INT) AS ParametroIdVereda,
                CAST(NULL AS INT) AS ParametroIdTipoDiscapacidad,
                CAST(NULL AS INT) AS ParametroIdEstadoCivil,
                CAST(NULL AS BIT) AS TieneHijos,
                CAST(NULL AS INT) AS Cuantos,
                CAST(NULL AS BIT) AS TieneVehiculo,
                CAST(NULL AS INT) AS ParametroIdTipoVehiculo,
                CAST(NULL AS INT) AS ParametroIdReligion,
                CAST(NULL AS BIT) AS EsEmpleado;
            RETURN;
        END

        WHILE @CodigoReferido IS NULL
        BEGIN
            SET @CodigoReferido = N'RV-' + UPPER(LEFT(REPLACE(CONVERT(NVARCHAR(36), NEWID()), N'-', N''), 12));

            IF EXISTS (
                SELECT 1
                FROM dbo.Ciudadanos WITH (UPDLOCK, HOLDLOCK)
                WHERE CodigoReferido = @CodigoReferido
            )
                SET @CodigoReferido = NULL;
        END

        INSERT INTO dbo.Ciudadanos
        (
            NombresCompletos,
            Celular,
            Celular2,
            FechaNacimiento,
            LugarNacimiento,
            TieneWhatsapp,
            TieneWhatsapp2,
            ParametroIdDondeVive,
            Email,
            ParametroIdTipoIdentificacion,
            NumeroIdentificacion,
            Direccion,
            DepartamentoId,
            MunicipioId,
            ParametroIdGrupoEdad,
            ParametroIdGenero,
            ParametroIdSoy,
            ParametroIdVereda,
            ParametroIdTipoDiscapacidad,
            ParametroIdEstadoCivil,
            TieneHijos,
            Cuantos,
            TieneVehiculo,
            ParametroIdTipoVehiculo,
            ParametroIdReligion,
            EsEmpleado,
            CodigoReferido,
            CiudadanoReferidorId,
            TieneAcceso,
            Estado,
            FechaRegistro
        )
        VALUES
        (
            @NombresCompletos,
            @Celular,
            @Celular2,
            @FechaNacimiento,
            @LugarNacimiento,
            @TieneWhatsapp,
            @TieneWhatsapp2,
            @ParametroIdDondeVive,
            @Email,
            @ParametroIdTipoIdentificacion,
            @NumeroIdentificacion,
            @Direccion,
            @DepartamentoId,
            @MunicipioId,
            @ParametroIdGrupoEdad,
            @ParametroIdGenero,
            @ParametroIdSoy,
            @ParametroIdVereda,
            @ParametroIdTipoDiscapacidad,
            @ParametroIdEstadoCivil,
            @TieneHijos,
            @Cuantos,
            @TieneVehiculo,
            @ParametroIdTipoVehiculo,
            @ParametroIdReligion,
            @EsEmpleado,
            @CodigoReferido,
            @CiudadanoReferidorId,
            @TieneAcceso,
            @Estado,
            @FechaRegistro
        );

        SET @CiudadanoId = CONVERT(INT, SCOPE_IDENTITY());

        IF @PasswordHash IS NOT NULL
        BEGIN
            INSERT INTO dbo.Usuarios
            (
                CiudadanoId,
                Email,
                PasswordHash,
                Estado,
                FechaCreacion
            )
            VALUES
            (
                @CiudadanoId,
                @Email,
                @PasswordHash,
                1,
                SYSUTCDATETIME()
            );
        END

        COMMIT TRANSACTION;

        SELECT
            CAST(1 AS BIT) AS IsSuccess,
            N'Ciudadano registrado correctamente.' AS Message,
            @CiudadanoId AS CiudadanoId,
            @NombresCompletos AS NombresCompletos,
            @FechaNacimiento AS FechaNacimiento,
            @LugarNacimiento AS LugarNacimiento,
            @Email AS Email,
            @Celular AS Celular,
            @TieneWhatsapp AS TieneWhatsapp,
            @Celular2 AS Celular2,
            @TieneWhatsapp2 AS TieneWhatsapp2,
            @ParametroIdDondeVive AS ParametroIdDondeVive,
            @ParametroIdTipoIdentificacion AS ParametroIdTipoIdentificacion,
            @NumeroIdentificacion AS NumeroIdentificacion,
            @Direccion AS Direccion,
            @DepartamentoId AS DepartamentoId,
            @MunicipioId AS MunicipioId,
            @ParametroIdGrupoEdad AS ParametroIdGrupoEdad,
            @ParametroIdGenero AS ParametroIdGenero,
            @ParametroIdSoy AS ParametroIdSoy,
            @ParametroIdVereda AS ParametroIdVereda,
            @ParametroIdTipoDiscapacidad AS ParametroIdTipoDiscapacidad,
            @ParametroIdEstadoCivil AS ParametroIdEstadoCivil,
            @TieneHijos AS TieneHijos,
            @Cuantos AS Cuantos,
            @TieneVehiculo AS TieneVehiculo,
            @ParametroIdTipoVehiculo AS ParametroIdTipoVehiculo,
            @ParametroIdReligion AS ParametroIdReligion,
            @EsEmpleado AS EsEmpleado,
            @CodigoReferido AS CodigoReferido,
            @CiudadanoReferidorId AS CiudadanoReferidorId,
            @TieneAcceso AS TieneAcceso,
            @Estado AS Estado,
            @FechaRegistro AS FechaRegistro;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        THROW;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_Ciudadanos_Registrar_20_06_2026]    Script Date: 27/06/2026 2:46:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Ciudadanos_Registrar_20_06_2026]
    @NombresCompletos NVARCHAR(200),
    @Celular NVARCHAR(30) = NULL,
    @Celular2 NVARCHAR(30) = NULL,
    @FechaNacimiento DATETIME = NULL,
    @LugarNacimiento NVARCHAR(150) = NULL,
    @TieneWhatsapp BIT = NULL,
    @TieneWhatsapp2 BIT = NULL,
    @ParametroIdDondeVive INT = NULL,
    @PuestoVotacion NVARCHAR(150) = NULL,
    @Email NVARCHAR(150) = NULL,
    @ParametroIdTipoIdentificacion INT = NULL,
    @NumeroIdentificacion NVARCHAR(50) = NULL,
    @Direccion NVARCHAR(250) = NULL,
    @DepartamentoId INT = NULL,
    @MunicipioId INT = NULL,
    @ParametroIdGrupoEdad INT = NULL,
    @ParametroIdGenero INT = NULL,
    @ParametroIdSoy INT = NULL,
    @ParametroIdVereda INT = NULL,
    @Estado BIT = 1,
    @CodigoReferidoInvitacion NVARCHAR(50) = NULL,
    @PasswordHash NVARCHAR(500) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @CiudadanoReferidorId INT = NULL;
    DECLARE @CiudadanoId INT;
    DECLARE @CodigoReferido NVARCHAR(50);
    DECLARE @TieneAcceso BIT = IIF(@PasswordHash IS NULL, 0, 1);
    DECLARE @FechaRegistro DATETIME = GETUTCDATE();

    BEGIN TRY
        BEGIN TRANSACTION;

        IF @CodigoReferidoInvitacion IS NOT NULL
        BEGIN
            SELECT @CiudadanoReferidorId = CiudadanoId
            FROM dbo.Ciudadanos WITH (UPDLOCK, HOLDLOCK)
            WHERE CodigoReferido = @CodigoReferidoInvitacion;

            IF @CiudadanoReferidorId IS NULL
            BEGIN
                ROLLBACK TRANSACTION;
                SELECT
                    CAST(0 AS BIT) AS IsSuccess,
                    N'El código de referido no es válido.' AS Message,
                    CAST(NULL AS INT) AS CiudadanoId,
                    CAST(NULL AS NVARCHAR(50)) AS CodigoReferido,
                    CAST(0 AS BIT) AS TieneAcceso,
                    CAST(NULL AS INT) AS CiudadanoReferidorId,
                    CAST(NULL AS DATETIME) AS FechaNacimiento,
                    CAST(NULL AS NVARCHAR(150)) AS LugarNacimiento,
                    CAST(NULL AS NVARCHAR(30)) AS Celular,
                    CAST(NULL AS BIT) AS TieneWhatsapp,
                    CAST(NULL AS NVARCHAR(30)) AS Celular2,
                    CAST(NULL AS BIT) AS TieneWhatsapp2,
                    CAST(NULL AS INT) AS ParametroIdDondeVive,
                    CAST(NULL AS INT) AS ParametroIdVereda,
                    CAST(NULL AS NVARCHAR(150)) AS PuestoVotacion;
                RETURN;
            END
        END

        IF @PasswordHash IS NOT NULL
           AND EXISTS (
               SELECT 1
               FROM dbo.Usuarios WITH (UPDLOCK, HOLDLOCK)
               WHERE Email = @Email
           )
        BEGIN
            ROLLBACK TRANSACTION;
            SELECT
                CAST(0 AS BIT) AS IsSuccess,
                N'El email ya se encuentra registrado.' AS Message,
                CAST(NULL AS INT) AS CiudadanoId,
                CAST(NULL AS NVARCHAR(50)) AS CodigoReferido,
                CAST(0 AS BIT) AS TieneAcceso,
                CAST(NULL AS INT) AS CiudadanoReferidorId,
                CAST(NULL AS DATETIME) AS FechaNacimiento,
                CAST(NULL AS NVARCHAR(150)) AS LugarNacimiento,
                CAST(NULL AS NVARCHAR(30)) AS Celular,
                CAST(NULL AS BIT) AS TieneWhatsapp,
                CAST(NULL AS NVARCHAR(30)) AS Celular2,
                CAST(NULL AS BIT) AS TieneWhatsapp2,
                CAST(NULL AS INT) AS ParametroIdDondeVive,
                CAST(NULL AS INT) AS ParametroIdVereda,
                CAST(NULL AS NVARCHAR(150)) AS PuestoVotacion;
            RETURN;
        END

        IF @Email IS NOT NULL
           AND EXISTS (
               SELECT 1
               FROM dbo.Ciudadanos WITH (UPDLOCK, HOLDLOCK)
               WHERE Email = @Email
           )
        BEGIN
            ROLLBACK TRANSACTION;
            SELECT
                CAST(0 AS BIT) AS IsSuccess,
                N'El email ya se encuentra registrado en ciudadanos.' AS Message,
                CAST(NULL AS INT) AS CiudadanoId,
                CAST(NULL AS NVARCHAR(50)) AS CodigoReferido,
                CAST(0 AS BIT) AS TieneAcceso,
                CAST(NULL AS INT) AS CiudadanoReferidorId,
                CAST(NULL AS DATETIME) AS FechaNacimiento,
                CAST(NULL AS NVARCHAR(150)) AS LugarNacimiento,
                CAST(NULL AS NVARCHAR(30)) AS Celular,
                CAST(NULL AS BIT) AS TieneWhatsapp,
                CAST(NULL AS NVARCHAR(30)) AS Celular2,
                CAST(NULL AS BIT) AS TieneWhatsapp2,
                CAST(NULL AS INT) AS ParametroIdDondeVive,
                CAST(NULL AS INT) AS ParametroIdVereda,
                CAST(NULL AS NVARCHAR(150)) AS PuestoVotacion;
            RETURN;
        END

        IF @Celular IS NOT NULL
           AND EXISTS (
               SELECT 1
               FROM dbo.Ciudadanos WITH (UPDLOCK, HOLDLOCK)
               WHERE Celular = @Celular
           )
        BEGIN
            ROLLBACK TRANSACTION;
            SELECT
                CAST(0 AS BIT) AS IsSuccess,
                N'El celular ya se encuentra registrado en ciudadanos.' AS Message,
                CAST(NULL AS INT) AS CiudadanoId,
                CAST(NULL AS NVARCHAR(50)) AS CodigoReferido,
                CAST(0 AS BIT) AS TieneAcceso,
                CAST(NULL AS INT) AS CiudadanoReferidorId,
                CAST(NULL AS DATETIME) AS FechaNacimiento,
                CAST(NULL AS NVARCHAR(150)) AS LugarNacimiento,
                CAST(NULL AS NVARCHAR(30)) AS Celular,
                CAST(NULL AS BIT) AS TieneWhatsapp,
                CAST(NULL AS NVARCHAR(30)) AS Celular2,
                CAST(NULL AS BIT) AS TieneWhatsapp2,
                CAST(NULL AS INT) AS ParametroIdDondeVive,
                CAST(NULL AS INT) AS ParametroIdVereda,
                CAST(NULL AS NVARCHAR(150)) AS PuestoVotacion;
            RETURN;
        END

        IF @NumeroIdentificacion IS NOT NULL
           AND EXISTS (
               SELECT 1
               FROM dbo.Ciudadanos WITH (UPDLOCK, HOLDLOCK)
               WHERE NumeroIdentificacion = @NumeroIdentificacion
           )
        BEGIN
            ROLLBACK TRANSACTION;
            SELECT
                CAST(0 AS BIT) AS IsSuccess,
                N'El numero de identificacion ya se encuentra registrado en ciudadanos.' AS Message,
                CAST(NULL AS INT) AS CiudadanoId,
                CAST(NULL AS NVARCHAR(50)) AS CodigoReferido,
                CAST(0 AS BIT) AS TieneAcceso,
                CAST(NULL AS INT) AS CiudadanoReferidorId,
                CAST(NULL AS DATETIME) AS FechaNacimiento,
                CAST(NULL AS NVARCHAR(150)) AS LugarNacimiento,
                CAST(NULL AS NVARCHAR(30)) AS Celular,
                CAST(NULL AS BIT) AS TieneWhatsapp,
                CAST(NULL AS NVARCHAR(30)) AS Celular2,
                CAST(NULL AS BIT) AS TieneWhatsapp2,
                CAST(NULL AS INT) AS ParametroIdDondeVive,
                CAST(NULL AS INT) AS ParametroIdVereda,
                CAST(NULL AS NVARCHAR(150)) AS PuestoVotacion;
            RETURN;
        END

        WHILE @CodigoReferido IS NULL
        BEGIN
            SET @CodigoReferido = N'RV-' + UPPER(LEFT(REPLACE(CONVERT(NVARCHAR(36), NEWID()), N'-', N''), 12));

            IF EXISTS (
                SELECT 1
                FROM dbo.Ciudadanos WITH (UPDLOCK, HOLDLOCK)
                WHERE CodigoReferido = @CodigoReferido
            )
                SET @CodigoReferido = NULL;
        END

        INSERT INTO dbo.Ciudadanos
        (
            NombresCompletos,
            Celular,
            Celular2,
            FechaNacimiento,
            LugarNacimiento,
            TieneWhatsapp,
            TieneWhatsapp2,
            ParametroIdDondeVive,
            PuestoVotacion,
            Email,
            ParametroIdTipoIdentificacion,
            NumeroIdentificacion,
            Direccion,
            DepartamentoId,
            MunicipioId,
            ParametroIdGrupoEdad,
            ParametroIdGenero,
            ParametroIdSoy,
            ParametroIdVereda,
            CodigoReferido,
            CiudadanoReferidorId,
            TieneAcceso,
            Estado,
            FechaRegistro
        )
        VALUES
        (
            @NombresCompletos,
            @Celular,
            @Celular2,
            @FechaNacimiento,
            @LugarNacimiento,
            @TieneWhatsapp,
            @TieneWhatsapp2,
            @ParametroIdDondeVive,
            @PuestoVotacion,
            @Email,
            @ParametroIdTipoIdentificacion,
            @NumeroIdentificacion,
            @Direccion,
            @DepartamentoId,
            @MunicipioId,
            @ParametroIdGrupoEdad,
            @ParametroIdGenero,
            @ParametroIdSoy,
            @ParametroIdVereda,
            @CodigoReferido,
            @CiudadanoReferidorId,
            @TieneAcceso,
            @Estado,
            @FechaRegistro
        );

        SET @CiudadanoId = CONVERT(INT, SCOPE_IDENTITY());

        IF @PasswordHash IS NOT NULL
        BEGIN
            INSERT INTO dbo.Usuarios
            (
                CiudadanoId,
                Email,
                PasswordHash,
                Estado,
                FechaCreacion
            )
            VALUES
            (
                @CiudadanoId,
                @Email,
                @PasswordHash,
                1,
                SYSUTCDATETIME()
            );
        END

        COMMIT TRANSACTION;

        SELECT
            CAST(1 AS BIT) AS IsSuccess,
            N'Ciudadano registrado correctamente.' AS Message,
            @CiudadanoId AS CiudadanoId,
            @NombresCompletos AS NombresCompletos,
            @FechaNacimiento AS FechaNacimiento,
            @LugarNacimiento AS LugarNacimiento,
            @Email AS Email,
            @Celular AS Celular,
            @TieneWhatsapp AS TieneWhatsapp,
            @Celular2 AS Celular2,
            @TieneWhatsapp2 AS TieneWhatsapp2,
            @ParametroIdDondeVive AS ParametroIdDondeVive,
            @PuestoVotacion AS PuestoVotacion,
            @ParametroIdTipoIdentificacion AS ParametroIdTipoIdentificacion,
            @NumeroIdentificacion AS NumeroIdentificacion,
            @Direccion AS Direccion,
            @DepartamentoId AS DepartamentoId,
            @MunicipioId AS MunicipioId,
            @ParametroIdGrupoEdad AS ParametroIdGrupoEdad,
            @ParametroIdGenero AS ParametroIdGenero,
            @ParametroIdSoy AS ParametroIdSoy,
            @ParametroIdVereda AS ParametroIdVereda,
            @CodigoReferido AS CodigoReferido,
            @CiudadanoReferidorId AS CiudadanoReferidorId,
            @TieneAcceso AS TieneAcceso,
            @Estado AS Estado,
            @FechaRegistro AS FechaRegistro;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        THROW;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_Ciudadanos_Registrar_24_06_2026]    Script Date: 27/06/2026 2:46:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Ciudadanos_Registrar_24_06_2026]
    @NombresCompletos NVARCHAR(200),
    @Celular NVARCHAR(30) = NULL,
    @Celular2 NVARCHAR(30) = NULL,
    @FechaNacimiento DATETIME = NULL,
    @LugarNacimiento NVARCHAR(150) = NULL,
    @TieneWhatsapp BIT = NULL,
    @TieneWhatsapp2 BIT = NULL,
    @ParametroIdDondeVive INT = NULL,    
    @Email NVARCHAR(150) = NULL,
    @ParametroIdTipoIdentificacion INT = NULL,
    @NumeroIdentificacion NVARCHAR(50) = NULL,
    @Direccion NVARCHAR(250) = NULL,
    @DepartamentoId INT = NULL,
    @MunicipioId INT = NULL,
    @ParametroIdGrupoEdad INT = NULL,
    @ParametroIdGenero INT = NULL,
    @ParametroIdSoy INT = NULL,
    @ParametroIdVereda INT = NULL,
    @Estado BIT = 1,
    @CodigoReferidoInvitacion NVARCHAR(50) = NULL,
    @PasswordHash NVARCHAR(500) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @CiudadanoReferidorId INT = NULL;
    DECLARE @CiudadanoId INT;
    DECLARE @CodigoReferido NVARCHAR(50);
    DECLARE @TieneAcceso BIT = IIF(@PasswordHash IS NULL, 0, 1);
    DECLARE @FechaRegistro DATETIME = GETUTCDATE();

    BEGIN TRY
        BEGIN TRANSACTION;

        IF @CodigoReferidoInvitacion IS NOT NULL
        BEGIN
            SELECT @CiudadanoReferidorId = CiudadanoId
            FROM dbo.Ciudadanos WITH (UPDLOCK, HOLDLOCK)
            WHERE CodigoReferido = @CodigoReferidoInvitacion;

            IF @CiudadanoReferidorId IS NULL
            BEGIN
                ROLLBACK TRANSACTION;
                SELECT
                    CAST(0 AS BIT) AS IsSuccess,
                    N'El código de referido no es válido.' AS Message,
                    CAST(NULL AS INT) AS CiudadanoId,
                    CAST(NULL AS NVARCHAR(50)) AS CodigoReferido,
                    CAST(0 AS BIT) AS TieneAcceso,
                    CAST(NULL AS INT) AS CiudadanoReferidorId,
                    CAST(NULL AS DATETIME) AS FechaNacimiento,
                    CAST(NULL AS NVARCHAR(150)) AS LugarNacimiento,
                    CAST(NULL AS NVARCHAR(30)) AS Celular,
                    CAST(NULL AS BIT) AS TieneWhatsapp,
                    CAST(NULL AS NVARCHAR(30)) AS Celular2,
                    CAST(NULL AS BIT) AS TieneWhatsapp2,
                    CAST(NULL AS INT) AS ParametroIdDondeVive,
                    CAST(NULL AS INT) AS ParametroIdVereda;
                RETURN;
            END
        END

        IF @PasswordHash IS NOT NULL
           AND EXISTS (
               SELECT 1
               FROM dbo.Usuarios WITH (UPDLOCK, HOLDLOCK)
               WHERE Email = @Email
           )
        BEGIN
            ROLLBACK TRANSACTION;
            SELECT
                CAST(0 AS BIT) AS IsSuccess,
                N'El email ya se encuentra registrado.' AS Message,
                CAST(NULL AS INT) AS CiudadanoId,
                CAST(NULL AS NVARCHAR(50)) AS CodigoReferido,
                CAST(0 AS BIT) AS TieneAcceso,
                CAST(NULL AS INT) AS CiudadanoReferidorId,
                CAST(NULL AS DATETIME) AS FechaNacimiento,
                CAST(NULL AS NVARCHAR(150)) AS LugarNacimiento,
                CAST(NULL AS NVARCHAR(30)) AS Celular,
                CAST(NULL AS BIT) AS TieneWhatsapp,
                CAST(NULL AS NVARCHAR(30)) AS Celular2,
                CAST(NULL AS BIT) AS TieneWhatsapp2,
                CAST(NULL AS INT) AS ParametroIdDondeVive,
                CAST(NULL AS INT) AS ParametroIdVereda;
            RETURN;
        END

        IF @Email IS NOT NULL
           AND EXISTS (
               SELECT 1
               FROM dbo.Ciudadanos WITH (UPDLOCK, HOLDLOCK)
               WHERE Email = @Email
           )
        BEGIN
            ROLLBACK TRANSACTION;
            SELECT
                CAST(0 AS BIT) AS IsSuccess,
                N'El email ya se encuentra registrado en ciudadanos.' AS Message,
                CAST(NULL AS INT) AS CiudadanoId,
                CAST(NULL AS NVARCHAR(50)) AS CodigoReferido,
                CAST(0 AS BIT) AS TieneAcceso,
                CAST(NULL AS INT) AS CiudadanoReferidorId,
                CAST(NULL AS DATETIME) AS FechaNacimiento,
                CAST(NULL AS NVARCHAR(150)) AS LugarNacimiento,
                CAST(NULL AS NVARCHAR(30)) AS Celular,
                CAST(NULL AS BIT) AS TieneWhatsapp,
                CAST(NULL AS NVARCHAR(30)) AS Celular2,
                CAST(NULL AS BIT) AS TieneWhatsapp2,
                CAST(NULL AS INT) AS ParametroIdDondeVive,
                CAST(NULL AS INT) AS ParametroIdVereda;
            RETURN;
        END

        IF @Celular IS NOT NULL
           AND EXISTS (
               SELECT 1
               FROM dbo.Ciudadanos WITH (UPDLOCK, HOLDLOCK)
               WHERE Celular = @Celular
           )
        BEGIN
            ROLLBACK TRANSACTION;
            SELECT
                CAST(0 AS BIT) AS IsSuccess,
                N'El celular ya se encuentra registrado en ciudadanos.' AS Message,
                CAST(NULL AS INT) AS CiudadanoId,
                CAST(NULL AS NVARCHAR(50)) AS CodigoReferido,
                CAST(0 AS BIT) AS TieneAcceso,
                CAST(NULL AS INT) AS CiudadanoReferidorId,
                CAST(NULL AS DATETIME) AS FechaNacimiento,
                CAST(NULL AS NVARCHAR(150)) AS LugarNacimiento,
                CAST(NULL AS NVARCHAR(30)) AS Celular,
                CAST(NULL AS BIT) AS TieneWhatsapp,
                CAST(NULL AS NVARCHAR(30)) AS Celular2,
                CAST(NULL AS BIT) AS TieneWhatsapp2,
                CAST(NULL AS INT) AS ParametroIdDondeVive,
                CAST(NULL AS INT) AS ParametroIdVereda;
            RETURN;
        END

        IF @NumeroIdentificacion IS NOT NULL
           AND EXISTS (
               SELECT 1
               FROM dbo.Ciudadanos WITH (UPDLOCK, HOLDLOCK)
               WHERE NumeroIdentificacion = @NumeroIdentificacion
           )
        BEGIN
            ROLLBACK TRANSACTION;
            SELECT
                CAST(0 AS BIT) AS IsSuccess,
                N'El numero de identificacion ya se encuentra registrado en ciudadanos.' AS Message,
                CAST(NULL AS INT) AS CiudadanoId,
                CAST(NULL AS NVARCHAR(50)) AS CodigoReferido,
                CAST(0 AS BIT) AS TieneAcceso,
                CAST(NULL AS INT) AS CiudadanoReferidorId,
                CAST(NULL AS DATETIME) AS FechaNacimiento,
                CAST(NULL AS NVARCHAR(150)) AS LugarNacimiento,
                CAST(NULL AS NVARCHAR(30)) AS Celular,
                CAST(NULL AS BIT) AS TieneWhatsapp,
                CAST(NULL AS NVARCHAR(30)) AS Celular2,
                CAST(NULL AS BIT) AS TieneWhatsapp2,
                CAST(NULL AS INT) AS ParametroIdDondeVive,
                CAST(NULL AS INT) AS ParametroIdVereda;
            RETURN;
        END

        WHILE @CodigoReferido IS NULL
        BEGIN
            SET @CodigoReferido = N'RV-' + UPPER(LEFT(REPLACE(CONVERT(NVARCHAR(36), NEWID()), N'-', N''), 12));

            IF EXISTS (
                SELECT 1
                FROM dbo.Ciudadanos WITH (UPDLOCK, HOLDLOCK)
                WHERE CodigoReferido = @CodigoReferido
            )
                SET @CodigoReferido = NULL;
        END

        INSERT INTO dbo.Ciudadanos
        (
            NombresCompletos,
            Celular,
            Celular2,
            FechaNacimiento,
            LugarNacimiento,
            TieneWhatsapp,
            TieneWhatsapp2,
            ParametroIdDondeVive,            
            Email,
            ParametroIdTipoIdentificacion,
            NumeroIdentificacion,
            Direccion,
            DepartamentoId,
            MunicipioId,
            ParametroIdGrupoEdad,
            ParametroIdGenero,
            ParametroIdSoy,
            ParametroIdVereda,
            CodigoReferido,
            CiudadanoReferidorId,
            TieneAcceso,
            Estado,
            FechaRegistro
        )
        VALUES
        (
            @NombresCompletos,
            @Celular,
            @Celular2,
            @FechaNacimiento,
            @LugarNacimiento,
            @TieneWhatsapp,
            @TieneWhatsapp2,
            @ParametroIdDondeVive,            
            @Email,
            @ParametroIdTipoIdentificacion,
            @NumeroIdentificacion,
            @Direccion,
            @DepartamentoId,
            @MunicipioId,
            @ParametroIdGrupoEdad,
            @ParametroIdGenero,
            @ParametroIdSoy,
            @ParametroIdVereda,
            @CodigoReferido,
            @CiudadanoReferidorId,
            @TieneAcceso,
            @Estado,
            @FechaRegistro
        );

        SET @CiudadanoId = CONVERT(INT, SCOPE_IDENTITY());

        IF @PasswordHash IS NOT NULL
        BEGIN
            INSERT INTO dbo.Usuarios
            (
                CiudadanoId,
                Email,
                PasswordHash,
                Estado,
                FechaCreacion
            )
            VALUES
            (
                @CiudadanoId,
                @Email,
                @PasswordHash,
                1,
                SYSUTCDATETIME()
            );
        END

        COMMIT TRANSACTION;

        SELECT
            CAST(1 AS BIT) AS IsSuccess,
            N'Ciudadano registrado correctamente.' AS Message,
            @CiudadanoId AS CiudadanoId,
            @NombresCompletos AS NombresCompletos,
            @FechaNacimiento AS FechaNacimiento,
            @LugarNacimiento AS LugarNacimiento,
            @Email AS Email,
            @Celular AS Celular,
            @TieneWhatsapp AS TieneWhatsapp,
            @Celular2 AS Celular2,
            @TieneWhatsapp2 AS TieneWhatsapp2,
            @ParametroIdDondeVive AS ParametroIdDondeVive,            
            @ParametroIdTipoIdentificacion AS ParametroIdTipoIdentificacion,
            @NumeroIdentificacion AS NumeroIdentificacion,
            @Direccion AS Direccion,
            @DepartamentoId AS DepartamentoId,
            @MunicipioId AS MunicipioId,
            @ParametroIdGrupoEdad AS ParametroIdGrupoEdad,
            @ParametroIdGenero AS ParametroIdGenero,
            @ParametroIdSoy AS ParametroIdSoy,
            @ParametroIdVereda AS ParametroIdVereda,
            @CodigoReferido AS CodigoReferido,
            @CiudadanoReferidorId AS CiudadanoReferidorId,
            @TieneAcceso AS TieneAcceso,
            @Estado AS Estado,
            @FechaRegistro AS FechaRegistro;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        THROW;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_Usuarios_ObtenerPorEmail]    Script Date: 27/06/2026 2:46:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_Usuarios_ObtenerPorEmail]
    @Email NVARCHAR(150)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP (1)
        u.UsuarioId,
        u.CiudadanoId,
        COALESCE(c.NombresCompletos, N'') AS NombresCompletos,
        COALESCE(c.CodigoReferido, N'') AS CodigoReferido,
        u.Email,
        u.PasswordHash,
        COALESCE(u.Rol, N'Ciudadano') AS Rol,
        u.Estado AS UsuarioEstado,
        CAST(COALESCE(c.Estado, 0) AS BIT) AS CiudadanoEstado,
        CAST(COALESCE(c.TieneAcceso, 0) AS BIT) AS TieneAcceso
    FROM dbo.Usuarios AS u
    LEFT JOIN dbo.Ciudadanos AS c
        ON c.CiudadanoId = u.CiudadanoId
    WHERE u.Email = @Email;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_Usuarios_Registrar]    Script Date: 27/06/2026 2:46:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_Usuarios_Registrar]
    @CiudadanoId INT,
    @Email NVARCHAR(150),
    @PasswordHash NVARCHAR(500),
    @Rol NVARCHAR(50) = N'Ciudadano'
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @UsuarioId INT;
    DECLARE @FechaCreacion DATETIME = GETUTCDATE();
    DECLARE @RolNormalizado NVARCHAR(50) = COALESCE(NULLIF(LTRIM(RTRIM(@Rol)), N''), N'Ciudadano');

    BEGIN TRY
        BEGIN TRANSACTION;

        IF NOT EXISTS (
            SELECT 1
            FROM dbo.Ciudadanos WITH (UPDLOCK, HOLDLOCK)
            WHERE CiudadanoId = @CiudadanoId
        )
        BEGIN
            ROLLBACK TRANSACTION;
            SELECT
                CAST(0 AS BIT) AS IsSuccess,
                N'El ciudadano no existe.' AS Message,
                CAST(NULL AS INT) AS UsuarioId,
                CAST(NULL AS INT) AS CiudadanoId,
                CAST(NULL AS NVARCHAR(150)) AS Email,
                CAST(NULL AS NVARCHAR(50)) AS Rol,
                CAST(0 AS BIT) AS Estado,
                CAST(NULL AS DATETIME) AS FechaCreacion;
            RETURN;
        END

        IF EXISTS (
            SELECT 1
            FROM dbo.Ciudadanos WITH (UPDLOCK, HOLDLOCK)
            WHERE CiudadanoId = @CiudadanoId
              AND Estado = 0
        )
        BEGIN
            ROLLBACK TRANSACTION;
            SELECT
                CAST(0 AS BIT) AS IsSuccess,
                N'El ciudadano se encuentra inactivo.' AS Message,
                CAST(NULL AS INT) AS UsuarioId,
                CAST(NULL AS INT) AS CiudadanoId,
                CAST(NULL AS NVARCHAR(150)) AS Email,
                CAST(NULL AS NVARCHAR(50)) AS Rol,
                CAST(0 AS BIT) AS Estado,
                CAST(NULL AS DATETIME) AS FechaCreacion;
            RETURN;
        END

        IF EXISTS (
            SELECT 1
            FROM dbo.Usuarios WITH (UPDLOCK, HOLDLOCK)
            WHERE CiudadanoId = @CiudadanoId
        )
        BEGIN
            ROLLBACK TRANSACTION;
            SELECT
                CAST(0 AS BIT) AS IsSuccess,
                N'El ciudadano ya tiene un usuario registrado.' AS Message,
                CAST(NULL AS INT) AS UsuarioId,
                CAST(NULL AS INT) AS CiudadanoId,
                CAST(NULL AS NVARCHAR(150)) AS Email,
                CAST(NULL AS NVARCHAR(50)) AS Rol,
                CAST(0 AS BIT) AS Estado,
                CAST(NULL AS DATETIME) AS FechaCreacion;
            RETURN;
        END

        IF EXISTS (
            SELECT 1
            FROM dbo.Usuarios WITH (UPDLOCK, HOLDLOCK)
            WHERE Email = @Email
        )
        BEGIN
            ROLLBACK TRANSACTION;
            SELECT
                CAST(0 AS BIT) AS IsSuccess,
                N'El email ya se encuentra registrado.' AS Message,
                CAST(NULL AS INT) AS UsuarioId,
                CAST(NULL AS INT) AS CiudadanoId,
                CAST(NULL AS NVARCHAR(150)) AS Email,
                CAST(NULL AS NVARCHAR(50)) AS Rol,
                CAST(0 AS BIT) AS Estado,
                CAST(NULL AS DATETIME) AS FechaCreacion;
            RETURN;
        END

        INSERT INTO dbo.Usuarios
        (
            CiudadanoId,
            Email,
            PasswordHash,
            Rol,
            Estado,
            FechaCreacion
        )
        VALUES
        (
            @CiudadanoId,
            @Email,
            @PasswordHash,
            @RolNormalizado,
            1,
            @FechaCreacion
        );

        SET @UsuarioId = CONVERT(INT, SCOPE_IDENTITY());

        UPDATE dbo.Ciudadanos
        SET TieneAcceso = 1
        WHERE CiudadanoId = @CiudadanoId;

        COMMIT TRANSACTION;

        SELECT
            CAST(1 AS BIT) AS IsSuccess,
            N'Usuario registrado correctamente.' AS Message,
            @UsuarioId AS UsuarioId,
            @CiudadanoId AS CiudadanoId,
            @Email AS Email,
            @RolNormalizado AS Rol,
            CAST(1 AS BIT) AS Estado,
            @FechaCreacion AS FechaCreacion;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        THROW;
    END CATCH
END;
GO
