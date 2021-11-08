USE [master]
GO
/****** Object:  Database [Reserva_Turnos_test]    Script Date: 8/11/2021 6:49:22 a. m. ******/
CREATE DATABASE [Reserva_Turnos_test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Reserva_Turnos_test', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Reserva_Turnos_test.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Reserva_Turnos_test_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Reserva_Turnos_test_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Reserva_Turnos_test] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Reserva_Turnos_test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Reserva_Turnos_test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Reserva_Turnos_test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Reserva_Turnos_test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Reserva_Turnos_test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Reserva_Turnos_test] SET ARITHABORT OFF 
GO
ALTER DATABASE [Reserva_Turnos_test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Reserva_Turnos_test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Reserva_Turnos_test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Reserva_Turnos_test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Reserva_Turnos_test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Reserva_Turnos_test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Reserva_Turnos_test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Reserva_Turnos_test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Reserva_Turnos_test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Reserva_Turnos_test] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Reserva_Turnos_test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Reserva_Turnos_test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Reserva_Turnos_test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Reserva_Turnos_test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Reserva_Turnos_test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Reserva_Turnos_test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Reserva_Turnos_test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Reserva_Turnos_test] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Reserva_Turnos_test] SET  MULTI_USER 
GO
ALTER DATABASE [Reserva_Turnos_test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Reserva_Turnos_test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Reserva_Turnos_test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Reserva_Turnos_test] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Reserva_Turnos_test] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Reserva_Turnos_test] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Reserva_Turnos_test] SET QUERY_STORE = OFF
GO
USE [Reserva_Turnos_test]
GO
/****** Object:  Table [dbo].[comercios]    Script Date: 8/11/2021 6:49:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comercios](
	[id_comercio] [int] IDENTITY(1,1) NOT NULL,
	[nom_comercio] [nvarchar](50) NOT NULL,
	[aforo_maximo] [int] NOT NULL,
 CONSTRAINT [PK_comercios] PRIMARY KEY CLUSTERED 
(
	[id_comercio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[servicios]    Script Date: 8/11/2021 6:49:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servicios](
	[id_servicio] [int] IDENTITY(1,1) NOT NULL,
	[id_comercio] [int] NOT NULL,
	[nom_servicio] [nvarchar](50) NOT NULL,
	[hora_apertura] [time](7) NOT NULL,
	[hora_cierre] [time](7) NOT NULL,
	[duracion] [int] NOT NULL,
 CONSTRAINT [PK_servicios] PRIMARY KEY CLUSTERED 
(
	[id_servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[turnos]    Script Date: 8/11/2021 6:49:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[turnos](
	[id_turno] [int] IDENTITY(1,1) NOT NULL,
	[id_servicio] [int] NOT NULL,
	[fecha_turno] [date] NOT NULL,
	[hora_inicio] [datetime] NOT NULL,
	[hora_fin] [datetime] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_turnos] PRIMARY KEY CLUSTERED 
(
	[id_turno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[servicios]  WITH CHECK ADD  CONSTRAINT [FK_servicios_comercios1] FOREIGN KEY([id_comercio])
REFERENCES [dbo].[comercios] ([id_comercio])
GO
ALTER TABLE [dbo].[servicios] CHECK CONSTRAINT [FK_servicios_comercios1]
GO
/****** Object:  StoredProcedure [dbo].[sp_genera_turnos_diarios]    Script Date: 8/11/2021 6:49:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Santiago E Torres Z
-- Create date: 06/11/21
-- Description:	Procedimiento para generación de turnos diarios
-- =============================================
CREATE PROCEDURE [dbo].[sp_genera_turnos_diarios]
	@fecha_inicio datetime,
	@fecha_fin datetime,
	@id_servicio int
AS
BEGIN
	SET NOCOUNT ON
	-- Asignación de formato de las fechas
	SET DATEFORMAT ymd;

	-- Declaración de variables
	DECLARE @numDias int,
			@numTurnosPosibles int,
			@numTurnosTotales int,
			@auxInicio datetime,
			@auxFin datetime,
			@contador int,
			@duracion int,
			@auxDias int

	-- Asignación de la cantidad de días que se enviaron por parametros
	select @numDias = DATEDIFF(DAY,@fecha_inicio, @fecha_fin);
	
	-- Inicializar contador
	select @contador = 0
	
	-- Asiganción de variables con informaicón del Id del servicio enviado
	select	@numTurnosPosibles = DATEDIFF(MINUTE,hora_apertura,hora_cierre) / duracion,
			@duracion = duracion, 
			@auxInicio = hora_apertura, 
			@auxFin = DATEADD(MINUTE,duracion,hora_apertura)
	from servicios
	where id_servicio = @id_servicio
	
	-- Asignación de la cantidad de turnos totales que debe generar el procedimiento
	select @numTurnosTotales = @numTurnosPosibles * @numDias
	
	-- Elimina los turnos del servicio a crear
	delete from turnos where id_servicio = @id_servicio

	-- Ciclo el cual genera, valida e introduce los registros a la tabla de turnos
	while @numTurnosTotales > @contador
	begin
		-- Condicinal para asignación de variables
		if @contador >= 1
		begin
			select @auxInicio = @auxFin

			select @auxFin = DATEADD(MI,@duracion,@auxInicio)		

			if @contador % @numTurnosPosibles = 0
			begin
				select @auxInicio = hora_apertura, 
					   @auxFin = DATEADD(MINUTE,duracion,hora_apertura),
					   @fecha_inicio = DATEADD(Day,1,@fecha_inicio)
				from servicios
				where id_servicio = @id_servicio
			end
		end						

		-- Asigna la cantidad de días para corregir en el formato fecha
		select	@auxDias = DATEDIFF(day,'1900-01-01',@fecha_inicio)

		-- Inserta los nuevos turnos generados
		insert into turnos
		select  @id_servicio, 
				@fecha_inicio, 
				dateadd(day,@auxDias,@auxInicio), 
				dateadd(day,@auxDias,@auxFin), 1
		
		-- Aumento del contador
		select @contador += 1
	end
	
	-- Consulta los turnos generados
	select id_turno, id_servicio, fecha_turno, hora_inicio, hora_fin, estado
	from turnos 
	where id_servicio = @id_servicio

END
GO
USE [master]
GO
ALTER DATABASE [Reserva_Turnos_test] SET  READ_WRITE 
GO
