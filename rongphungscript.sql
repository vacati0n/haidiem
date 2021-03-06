USE [master]
GO
/****** Object:  Database [guline_rongphung]    Script Date: 1/25/2017 9:07:49 PM ******/
CREATE DATABASE [guline_rongphung]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'guline_rongphung', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\guline_rongphung.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'guline_rongphung_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\guline_rongphung_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [guline_rongphung] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [guline_rongphung].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [guline_rongphung] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [guline_rongphung] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [guline_rongphung] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [guline_rongphung] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [guline_rongphung] SET ARITHABORT OFF 
GO
ALTER DATABASE [guline_rongphung] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [guline_rongphung] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [guline_rongphung] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [guline_rongphung] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [guline_rongphung] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [guline_rongphung] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [guline_rongphung] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [guline_rongphung] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [guline_rongphung] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [guline_rongphung] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [guline_rongphung] SET  DISABLE_BROKER 
GO
ALTER DATABASE [guline_rongphung] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [guline_rongphung] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [guline_rongphung] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [guline_rongphung] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [guline_rongphung] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [guline_rongphung] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [guline_rongphung] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [guline_rongphung] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [guline_rongphung] SET  MULTI_USER 
GO
ALTER DATABASE [guline_rongphung] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [guline_rongphung] SET DB_CHAINING OFF 
GO
ALTER DATABASE [guline_rongphung] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [guline_rongphung] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [guline_rongphung]
GO
/****** Object:  Table [dbo].[cmsContent]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContent](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[contentType] [int] NOT NULL,
 CONSTRAINT [PK_cmsContent] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentType]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[alias] [nvarchar](255) NULL,
	[icon] [nvarchar](255) NULL,
	[thumbnail] [nvarchar](255) NOT NULL CONSTRAINT [DF_cmsContentType_thumbnail]  DEFAULT ('folder.png'),
	[description] [nvarchar](1500) NULL,
	[isContainer] [bit] NOT NULL CONSTRAINT [DF_cmsContentType_isContainer]  DEFAULT ('0'),
	[allowAtRoot] [bit] NOT NULL CONSTRAINT [DF_cmsContentType_allowAtRoot]  DEFAULT ('0'),
 CONSTRAINT [PK_cmsContentType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentType2ContentType]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentType2ContentType](
	[parentContentTypeId] [int] NOT NULL,
	[childContentTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentType2ContentType] PRIMARY KEY CLUSTERED 
(
	[parentContentTypeId] ASC,
	[childContentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentTypeAllowedContentType]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentTypeAllowedContentType](
	[Id] [int] NOT NULL,
	[AllowedId] [int] NOT NULL,
	[SortOrder] [int] NOT NULL CONSTRAINT [df_cmsContentTypeAllowedContentType_sortOrder]  DEFAULT ('0'),
 CONSTRAINT [PK_cmsContentTypeAllowedContentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[AllowedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentVersion]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentVersion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ContentId] [int] NOT NULL,
	[VersionId] [uniqueidentifier] NOT NULL,
	[VersionDate] [datetime] NOT NULL CONSTRAINT [DF_cmsContentVersion_VersionDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_cmsContentVersion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsContentXml]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentXml](
	[nodeId] [int] NOT NULL,
	[xml] [ntext] NOT NULL,
 CONSTRAINT [PK_cmsContentXml] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDataType]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDataType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[propertyEditorAlias] [nvarchar](255) NOT NULL,
	[dbType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_cmsDataType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDataTypePreValues]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDataTypePreValues](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[datatypeNodeId] [int] NOT NULL,
	[value] [ntext] NULL,
	[sortorder] [int] NOT NULL,
	[alias] [nvarchar](50) NULL,
 CONSTRAINT [PK_cmsDataTypePreValues] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDictionary]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDictionary](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[parent] [uniqueidentifier] NULL,
	[key] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsDictionary] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDocument]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDocument](
	[nodeId] [int] NOT NULL,
	[published] [bit] NOT NULL,
	[documentUser] [int] NOT NULL,
	[versionId] [uniqueidentifier] NOT NULL,
	[text] [nvarchar](255) NOT NULL,
	[releaseDate] [datetime] NULL,
	[expireDate] [datetime] NULL,
	[updateDate] [datetime] NOT NULL CONSTRAINT [DF_cmsDocument_updateDate]  DEFAULT (getdate()),
	[templateId] [int] NULL,
	[newest] [bit] NOT NULL CONSTRAINT [DF_cmsDocument_newest]  DEFAULT ('0'),
 CONSTRAINT [PK_cmsDocument] PRIMARY KEY CLUSTERED 
(
	[versionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsDocumentType]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDocumentType](
	[contentTypeNodeId] [int] NOT NULL,
	[templateNodeId] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL CONSTRAINT [DF_cmsDocumentType_IsDefault]  DEFAULT ('0'),
 CONSTRAINT [PK_cmsDocumentType] PRIMARY KEY CLUSTERED 
(
	[contentTypeNodeId] ASC,
	[templateNodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsLanguageText]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsLanguageText](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[languageId] [int] NOT NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
	[value] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsLanguageText] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMacro]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[macroUseInEditor] [bit] NOT NULL,
	[macroRefreshRate] [int] NOT NULL,
	[macroAlias] [nvarchar](255) NOT NULL,
	[macroName] [nvarchar](255) NULL,
	[macroScriptType] [nvarchar](255) NULL,
	[macroScriptAssembly] [nvarchar](255) NULL,
	[macroXSLT] [nvarchar](255) NULL,
	[macroCacheByPage] [bit] NOT NULL,
	[macroCachePersonalized] [bit] NOT NULL,
	[macroDontRender] [bit] NOT NULL,
	[macroPython] [nvarchar](255) NULL,
 CONSTRAINT [PK_cmsMacro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMacroProperty]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacroProperty](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[editorAlias] [nvarchar](255) NOT NULL,
	[macro] [int] NOT NULL,
	[macroPropertySortOrder] [int] NOT NULL,
	[macroPropertyAlias] [nvarchar](50) NOT NULL,
	[macroPropertyName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_cmsMacroProperty] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMember]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMember](
	[nodeId] [int] NOT NULL,
	[Email] [nvarchar](1000) NOT NULL,
	[LoginName] [nvarchar](1000) NOT NULL,
	[Password] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsMember] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMember2MemberGroup]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMember2MemberGroup](
	[Member] [int] NOT NULL,
	[MemberGroup] [int] NOT NULL,
 CONSTRAINT [PK_cmsMember2MemberGroup] PRIMARY KEY CLUSTERED 
(
	[Member] ASC,
	[MemberGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsMemberType]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMemberType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[NodeId] [int] NOT NULL,
	[propertytypeId] [int] NOT NULL,
	[memberCanEdit] [bit] NOT NULL,
	[viewOnProfile] [bit] NOT NULL,
 CONSTRAINT [PK_cmsMemberType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsPreviewXml]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPreviewXml](
	[nodeId] [int] NOT NULL,
	[versionId] [uniqueidentifier] NOT NULL,
	[timestamp] [datetime] NOT NULL,
	[xml] [ntext] NOT NULL,
 CONSTRAINT [PK_cmsContentPreviewXml] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[versionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsPropertyData]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyData](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contentNodeId] [int] NOT NULL,
	[versionId] [uniqueidentifier] NULL,
	[propertytypeid] [int] NOT NULL,
	[dataInt] [int] NULL,
	[dataDate] [datetime] NULL,
	[dataNvarchar] [nvarchar](500) NULL,
	[dataNtext] [ntext] NULL,
 CONSTRAINT [PK_cmsPropertyData] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsPropertyType]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dataTypeId] [int] NOT NULL,
	[contentTypeId] [int] NOT NULL,
	[propertyTypeGroupId] [int] NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[sortOrder] [int] NOT NULL CONSTRAINT [DF_cmsPropertyType_sortOrder]  DEFAULT ('0'),
	[mandatory] [bit] NOT NULL CONSTRAINT [DF_cmsPropertyType_mandatory]  DEFAULT ('0'),
	[validationRegExp] [nvarchar](255) NULL,
	[Description] [nvarchar](2000) NULL,
	[UniqueID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_cmsPropertyType_UniqueID]  DEFAULT (newid()),
 CONSTRAINT [PK_cmsPropertyType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsPropertyTypeGroup]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyTypeGroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parentGroupId] [int] NULL,
	[contenttypeNodeId] [int] NOT NULL,
	[text] [nvarchar](255) NOT NULL,
	[sortorder] [int] NOT NULL,
 CONSTRAINT [PK_cmsPropertyTypeGroup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsStylesheet]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsStylesheet](
	[nodeId] [int] NOT NULL,
	[filename] [nvarchar](100) NOT NULL,
	[content] [ntext] NULL,
 CONSTRAINT [PK_cmsStylesheet] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsStylesheetProperty]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsStylesheetProperty](
	[nodeId] [int] NOT NULL,
	[stylesheetPropertyEditor] [bit] NULL,
	[stylesheetPropertyAlias] [nvarchar](50) NULL,
	[stylesheetPropertyValue] [nvarchar](400) NULL,
 CONSTRAINT [PK_cmsStylesheetProperty] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTagRelationship]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTagRelationship](
	[nodeId] [int] NOT NULL,
	[tagId] [int] NOT NULL,
	[propertyTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsTagRelationship] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[propertyTypeId] ASC,
	[tagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTags]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tag] [nvarchar](200) NULL,
	[ParentId] [int] NULL,
	[group] [nvarchar](100) NULL,
 CONSTRAINT [PK_cmsTags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTask]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTask](
	[closed] [bit] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[taskTypeId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[parentUserId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Comment] [nvarchar](500) NULL,
 CONSTRAINT [PK_cmsTask] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTaskType]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTaskType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[alias] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_cmsTaskType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cmsTemplate]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTemplate](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[alias] [nvarchar](100) NULL,
	[design] [ntext] NOT NULL,
 CONSTRAINT [PK_cmsTemplate] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rpContact]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rpContact](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](200) NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[Phone] [nvarchar](200) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_rpContact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoAccess]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAccess](
	[id] [uniqueidentifier] NOT NULL,
	[nodeId] [int] NOT NULL,
	[loginNodeId] [int] NOT NULL,
	[noAccessNodeId] [int] NOT NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoAccess] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoAccessRule]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAccessRule](
	[id] [uniqueidentifier] NOT NULL,
	[accessId] [uniqueidentifier] NOT NULL,
	[ruleValue] [nvarchar](255) NOT NULL,
	[ruleType] [nvarchar](255) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoAccessRule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoCacheInstruction]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoCacheInstruction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[utcStamp] [datetime] NOT NULL,
	[jsonInstruction] [ntext] NOT NULL,
	[originated] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_umbracoCacheInstruction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoDomains]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDomains](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[domainDefaultLanguage] [int] NULL,
	[domainRootStructureID] [int] NULL,
	[domainName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoDomains] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoExternalLogin]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoExternalLogin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[loginProvider] [nvarchar](4000) NOT NULL,
	[providerKey] [nvarchar](4000) NOT NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoExternalLogin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoLanguage]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLanguage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[languageISOCode] [nvarchar](10) NULL,
	[languageCultureName] [nvarchar](100) NULL,
 CONSTRAINT [PK_umbracoLanguage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoLog]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[NodeId] [int] NOT NULL,
	[Datestamp] [datetime] NOT NULL CONSTRAINT [DF_umbracoLog_Datestamp]  DEFAULT (getdate()),
	[logHeader] [nvarchar](50) NOT NULL,
	[logComment] [nvarchar](4000) NULL,
 CONSTRAINT [PK_umbracoLog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoMigration]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoMigration](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[createDate] [datetime] NOT NULL CONSTRAINT [DF_umbracoMigration_createDate]  DEFAULT (getdate()),
	[version] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_umbracoMigration] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoNode]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoNode](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[trashed] [bit] NOT NULL CONSTRAINT [DF_umbracoNode_trashed]  DEFAULT ('0'),
	[parentID] [int] NOT NULL,
	[nodeUser] [int] NULL,
	[level] [int] NOT NULL,
	[path] [nvarchar](150) NOT NULL,
	[sortOrder] [int] NOT NULL,
	[uniqueID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_umbracoNode_uniqueID]  DEFAULT (newid()),
	[text] [nvarchar](255) NULL,
	[nodeObjectType] [uniqueidentifier] NULL,
	[createDate] [datetime] NOT NULL CONSTRAINT [DF_umbracoNode_createDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_structure] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoRelation]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRelation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parentId] [int] NOT NULL,
	[childId] [int] NOT NULL,
	[relType] [int] NOT NULL,
	[datetime] [datetime] NOT NULL CONSTRAINT [DF_umbracoRelation_datetime]  DEFAULT (getdate()),
	[comment] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_umbracoRelation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoRelationType]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRelationType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dual] [bit] NOT NULL,
	[parentObjectType] [uniqueidentifier] NOT NULL,
	[childObjectType] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[alias] [nvarchar](100) NULL,
 CONSTRAINT [PK_umbracoRelationType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoServer]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoServer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](500) NOT NULL,
	[computerName] [nvarchar](255) NOT NULL,
	[registeredDate] [datetime] NOT NULL CONSTRAINT [DF_umbracoServer_registeredDate]  DEFAULT (getdate()),
	[lastNotifiedDate] [datetime] NOT NULL,
	[isActive] [bit] NOT NULL,
	[isMaster] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoServer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUser]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userDisabled] [bit] NOT NULL CONSTRAINT [DF_umbracoUser_userDisabled]  DEFAULT ('0'),
	[userNoConsole] [bit] NOT NULL CONSTRAINT [DF_umbracoUser_userNoConsole]  DEFAULT ('0'),
	[userType] [int] NOT NULL,
	[startStructureID] [int] NOT NULL,
	[startMediaID] [int] NULL,
	[userName] [nvarchar](255) NOT NULL,
	[userLogin] [nvarchar](125) NOT NULL,
	[userPassword] [nvarchar](500) NOT NULL,
	[userEmail] [nvarchar](255) NOT NULL,
	[userLanguage] [nvarchar](10) NULL,
	[securityStampToken] [nvarchar](255) NULL,
	[failedLoginAttempts] [int] NULL,
	[lastLockoutDate] [datetime] NULL,
	[lastPasswordChangeDate] [datetime] NULL,
	[lastLoginDate] [datetime] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUser2app]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2app](
	[user] [int] NOT NULL,
	[app] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_user2app] PRIMARY KEY CLUSTERED 
(
	[user] ASC,
	[app] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUser2NodeNotify]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2NodeNotify](
	[userId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[action] [nchar](1) NOT NULL,
 CONSTRAINT [PK_umbracoUser2NodeNotify] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[nodeId] ASC,
	[action] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUser2NodePermission]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2NodePermission](
	[userId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[permission] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoUser2NodePermission] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[nodeId] ASC,
	[permission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[umbracoUserType]    Script Date: 1/25/2017 9:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userTypeAlias] [nvarchar](50) NULL,
	[userTypeName] [nvarchar](255) NOT NULL,
	[userTypeDefaultPermissions] [nvarchar](50) NULL,
 CONSTRAINT [PK_umbracoUserType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[cmsContent] ON 

INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (1, 1051, 1050)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (2, 1054, 1053)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (3, 1060, 1059)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (4, 1061, 1056)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (5, 1064, 1063)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (6, 1067, 1066)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (7, 1068, 1031)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (8, 1069, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (9, 1070, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (10, 1072, 1031)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (11, 1073, 1031)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (12, 1074, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (13, 1075, 1059)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (14, 1076, 1059)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (15, 1077, 1059)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (16, 1078, 1059)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (17, 1079, 1059)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (18, 1080, 1059)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (19, 1081, 1059)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (20, 1082, 1059)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (21, 1083, 1059)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (22, 1084, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (23, 1085, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (24, 1087, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (25, 1088, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (26, 1089, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (27, 1090, 1032)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (28, 1091, 1063)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (29, 1095, 1092)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (30, 1096, 1092)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (31, 1097, 1092)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (32, 1098, 1094)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (33, 1099, 1094)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (34, 1100, 1094)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (35, 1105, 1102)
SET IDENTITY_INSERT [dbo].[cmsContent] OFF
SET IDENTITY_INSERT [dbo].[cmsContentType] ON 

INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (531, 1044, N'Member', N'icon-user', N'icon-user', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (532, 1031, N'Folder', N'icon-folder', N'icon-folder', NULL, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (533, 1032, N'Image', N'icon-picture', N'icon-picture', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (534, 1033, N'File', N'icon-document', N'icon-document', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (536, 1048, N'Masterpage', N'.sprTreeFolder', N'folder.png', N'', 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (537, 1050, N'Homepage', N'icon-home color-green', N'folder.png', N'', 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (538, 1053, N'ProductPage', N'icon-store color-green', N'folder.png', N'', 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (539, 1056, N'About', N'icon-sweatshirt color-green', N'folder.png', N'', 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (541, 1059, N'ProductItem', N'icon-item-arrangement color-green', N'folder.png', N'', 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (542, 1063, N'Fashion', N'icon-adressbook color-green', N'folder.png', N'', 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (543, 1066, N'Contactpage', N'icon-calendar-alt color-green', N'folder.png', N'', 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (544, 1092, N'Servicespage', N'icon-vcard color-green', N'folder.png', N'', 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (545, 1094, N'ServiceDetailPage', N'icon-utilities color-green', N'folder.png', N'', 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (546, 1102, N'News', N'icon-newspaper color-green', N'folder.png', N'', 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (547, 1104, N'NewsDetail', N'icon-newspaper-alt color-green', N'folder.png', N'', 0, 0)
SET IDENTITY_INSERT [dbo].[cmsContentType] OFF
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1048, 1050)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1048, 1053)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1048, 1056)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1048, 1059)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1048, 1063)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1048, 1066)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1048, 1092)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1048, 1094)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1048, 1102)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1048, 1104)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1031, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1032, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1033, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1050, 1053, 10)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1050, 1056, 6)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1050, 1063, 8)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1050, 1066, 7)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1050, 1092, 11)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1050, 1102, 9)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1053, 1059, 1)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1092, 1094, 1)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1102, 1104, 1)
SET IDENTITY_INSERT [dbo].[cmsContentVersion] ON 

INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (1, 1051, N'59fdce3a-a268-41b9-9a7b-fc1c515b6b83', CAST(N'2016-04-05 11:08:50.610' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (2, 1051, N'd236aeeb-ebc4-4d05-9c3b-9a6487cd3c25', CAST(N'2016-04-05 13:22:00.787' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (3, 1051, N'fb6bd512-7204-4a0b-a6bc-4e481b9a16b0', CAST(N'2016-04-05 13:45:03.540' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (4, 1051, N'1122711b-dd7c-407e-8841-3f3d4448e354', CAST(N'2016-04-05 13:45:37.210' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (5, 1051, N'0b3b0c10-04d4-4150-a3f5-7364080a2b97', CAST(N'2016-04-05 13:46:06.447' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (6, 1054, N'82bce98c-1d8a-4ab9-bc09-149be12e0e3b', CAST(N'2016-04-05 15:20:40.827' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (7, 1054, N'f07c9615-89f9-435c-a960-a619a74742a0', CAST(N'2016-04-05 15:23:37.530' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (8, 1060, N'6381e0c1-f449-4f93-836b-64f337104288', CAST(N'2016-04-06 13:59:01.093' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (9, 1061, N'dd67910e-db89-454e-96cb-1baea493b209', CAST(N'2016-04-05 15:46:21.013' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (10, 1061, N'6296266f-59a3-470d-9d3a-07437cde7c8f', CAST(N'2016-04-06 13:59:00.150' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (11, 1054, N'320d2a1b-0749-4e46-8509-a6740b59696f', CAST(N'2016-04-05 15:46:40.877' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (12, 1064, N'9109c2ba-10e0-4b1b-a403-6b819bbac0f6', CAST(N'2016-04-06 13:59:00.630' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (13, 1067, N'acedaf91-94a7-4efd-8d12-e03211fbeaaa', CAST(N'2016-04-06 13:59:00.863' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (14, 1068, N'bc50fb6c-73e4-4567-8213-8d5201bb290a', CAST(N'2016-04-06 13:44:47.493' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (15, 1069, N'2bc79158-ee9b-4ec0-afaa-95c6ca3831f4', CAST(N'2017-01-08 16:30:53.667' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (16, 1070, N'3bef708e-6433-4c59-ad63-07ee4628912d', CAST(N'2017-01-08 16:31:00.633' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (17, 1051, N'0e9828d0-5dfc-42b4-8f28-9e495312b3f0', CAST(N'2016-04-06 13:46:35.243' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (18, 1051, N'cd9f99b3-f51f-4426-ba64-ec743120f067', CAST(N'2016-04-06 13:58:59.770' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (19, 1054, N'f88b72fc-f486-44e4-b9e7-67a9b23bca63', CAST(N'2016-04-06 13:59:00.387' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (20, 1051, N'277ea9b0-a629-4f79-a5b4-667d8f38b160', CAST(N'2016-04-06 13:59:55.583' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (21, 1051, N'0a704ff3-cc23-4db9-85df-8d50fc37efbf', CAST(N'2016-04-06 14:00:45.803' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (22, 1061, N'b6f779b1-9ccb-43d7-aa7e-9763a98e138c', CAST(N'2016-04-06 14:23:55.957' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (23, 1064, N'd2988503-33e8-4bba-b3b4-1da11e56ef8a', CAST(N'2016-04-06 14:24:11.693' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (24, 1067, N'a5daf209-1541-4e64-a8b3-a5d4cc71a30a', CAST(N'2016-04-06 14:24:21.850' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (25, 1061, N'afb4777f-6d13-44d3-86c3-00e15c8d62a3', CAST(N'2016-04-06 14:25:12.757' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (26, 1061, N'a2c9b908-1db6-4d9d-a819-4446ed884f1a', CAST(N'2016-04-06 15:52:26.200' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (27, 1061, N'0393235a-c6cc-487e-a313-9a81c056471d', CAST(N'2016-04-06 15:52:50.907' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (28, 1061, N'5517d347-96ff-4e3f-85d4-2343dfa8f41f', CAST(N'2016-04-06 15:54:03.283' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (29, 1061, N'98b41b26-60ef-4047-bdc1-28e675177697', CAST(N'2016-04-06 16:00:04.133' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (30, 1061, N'f8614c47-59d5-4ded-8f1f-4ad80ac935b8', CAST(N'2016-04-06 16:00:54.150' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (31, 1061, N'5ccae885-baf3-478d-98b2-ce66df496a95', CAST(N'2016-04-06 16:01:30.107' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (32, 1061, N'c8e15daf-b350-4421-91d8-8733accf459e', CAST(N'2016-04-06 16:02:16.983' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (33, 1061, N'1578e266-12c6-410e-9a37-705153622ce0', CAST(N'2016-04-06 16:06:17.043' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (34, 1072, N'98dc6466-7a51-490f-95f1-ab247f7d6326', CAST(N'2016-04-06 16:52:02.657' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (35, 1073, N'428c9024-4448-493b-8d1f-38cdb7eed330', CAST(N'2016-04-06 16:52:17.377' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (36, 1074, N'ac0a75a2-d2b4-4a38-b9b6-b3f39a4f018f', CAST(N'2016-04-06 16:52:21.607' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (37, 1060, N'7e06ac74-54b3-47f5-ad3a-46fa745d08f9', CAST(N'2016-04-06 16:52:26.803' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (38, 1075, N'bc50949e-2d1e-44e6-a141-e7184707ced2', CAST(N'2016-04-06 16:54:17.677' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (39, 1075, N'ddd7dc6f-3740-4bbe-b62a-9b151727b442', CAST(N'2016-04-06 16:54:26.620' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (40, 1076, N'3908088c-6865-45d9-a9bc-7ac46b4c03a7', CAST(N'2016-04-06 16:54:38.843' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (41, 1077, N'8add66e7-8b4b-474c-9841-4ec38dc86b2d', CAST(N'2016-04-06 16:54:50.563' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (42, 1078, N'0b7df8d4-043b-49ca-90f4-3d6841d6d6a9', CAST(N'2016-04-06 16:54:57.273' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (43, 1079, N'173e0cc7-269c-4d3f-92c1-d2493fa77067', CAST(N'2016-04-06 16:55:03.553' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (44, 1080, N'72bc2f55-bff3-478f-b893-40f33df84717', CAST(N'2016-04-06 16:55:10.547' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (45, 1081, N'1db2a172-fe8d-4538-bd05-b605b647aad1', CAST(N'2016-04-06 16:55:19.273' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (46, 1082, N'b4edf91b-83cb-4ec4-88db-abf87c8ced06', CAST(N'2016-04-06 16:55:29.083' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (47, 1083, N'b00da800-28a1-4700-a700-87f682d7e6e9', CAST(N'2016-04-06 16:55:35.020' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (48, 1076, N'46d386db-1713-4cdc-9d7a-f75ae79daf02', CAST(N'2016-04-06 16:55:46.270' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (49, 1077, N'a5dafcb1-40a8-4e45-983b-bd4990a09a8d', CAST(N'2016-04-06 16:55:55.617' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (50, 1078, N'2a376053-1beb-43b8-b2df-d601f35ce4d4', CAST(N'2016-04-06 16:56:03.513' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (51, 1079, N'46fb7960-012a-4195-8095-c54a538af568', CAST(N'2016-04-06 16:56:11.350' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (52, 1080, N'8ce919f2-ba13-43e7-9ac1-53c0d74a42ba', CAST(N'2016-04-06 16:56:21.243' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (53, 1081, N'c199d8fd-9ac2-4e4c-9e44-ee991a18b0bd', CAST(N'2016-04-06 16:56:30.210' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (54, 1082, N'8f70a7ce-4378-412c-b7ea-b9d812c98f6b', CAST(N'2016-04-06 16:56:38.443' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (55, 1083, N'19225619-e1fe-4985-b5f1-cef60a265740', CAST(N'2016-04-06 16:56:45.920' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (56, 1054, N'26bc6b27-9bca-45a1-a5a9-286acec584d4', CAST(N'2016-04-07 10:51:10.280' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (57, 1084, N'b7e9212b-e4e4-42e3-82f2-b5809bf2a366', CAST(N'2017-01-08 16:31:03.947' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (58, 1085, N'bcf2d806-025a-4a68-b5f0-9f0cd4a690df', CAST(N'2017-01-08 16:31:07.777' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (59, 1051, N'1bb6b08c-b8b9-4f85-a64f-9fb69abfd6b2', CAST(N'2016-04-12 13:20:09.833' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (60, 1054, N'96cb3f33-5906-4212-94e4-55faf83e9989', CAST(N'2016-04-12 13:23:33.203' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (61, 1060, N'21eb0807-b5ec-4c86-83c2-05e74085ca68', CAST(N'2016-04-12 13:45:12.677' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (62, 1061, N'56619615-24f6-4f6b-921b-62bc8c5151ae', CAST(N'2016-04-12 14:17:15.617' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (63, 1060, N'23447f32-0980-4023-84b5-221a33c50188', CAST(N'2016-04-12 16:10:23.700' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (64, 1051, N'8e3f5936-254c-4afd-8645-54c9f1e69a53', CAST(N'2016-04-29 10:45:23.637' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (65, 1060, N'd0cfce3d-73b7-4b70-a706-97dadad32652', CAST(N'2016-04-13 13:57:35.317' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (66, 1075, N'073301b3-c255-4ee9-a4d7-31e2dad09462', CAST(N'2016-04-13 13:57:51.423' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (67, 1060, N'8112a8b0-7c8c-4beb-b46c-1090cd411e33', CAST(N'2016-04-13 14:02:25.317' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (68, 1060, N'451c8e02-903f-4a40-8793-123e2217059c', CAST(N'2016-04-13 14:09:09.133' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (69, 1060, N'234ee45c-16b0-4249-bca5-f3db02bfc504', CAST(N'2016-04-13 14:19:06.417' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (70, 1060, N'80b6e65c-d346-484b-b7b9-a10ce547372f', CAST(N'2016-04-13 14:20:04.693' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (71, 1060, N'fceb75cc-76d0-431c-bafa-5243b30e1f6e', CAST(N'2016-04-13 14:20:26.640' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (72, 1060, N'641deaa3-5cac-4217-a44a-af90be9d18fb', CAST(N'2016-04-13 14:21:13.203' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (73, 1060, N'7f404a2e-91e3-42f6-a1e5-9dfd3b263f7e', CAST(N'2016-04-13 14:21:26.313' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (74, 1051, N'513f7a26-d9ad-449e-a18c-c2c494483c37', CAST(N'2017-01-08 16:12:26.130' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (75, 1051, N'04956f8b-b357-4faa-bfde-d6ccea57d318', CAST(N'2017-01-08 16:15:48.533' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (76, 1051, N'f0bda49c-8fc3-4b69-ada0-8f92c5064f85', CAST(N'2017-01-08 16:16:12.227' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (77, 1051, N'ca355191-3b9b-4a47-998f-af9572dc2f2c', CAST(N'2017-01-08 16:17:31.177' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (78, 1087, N'767511d8-b1ce-4f95-970b-496b023b9ae1', CAST(N'2017-01-08 16:33:57.053' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (79, 1088, N'4b7c8499-f699-44b0-aafe-934fb97e67a9', CAST(N'2017-01-08 16:33:57.207' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (80, 1089, N'99ba302f-a63f-4837-a474-f7a7badcb8a5', CAST(N'2017-01-08 16:33:57.350' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (81, 1051, N'40b31455-abe2-496e-8552-70fb9b5a8b9b', CAST(N'2017-01-08 16:34:29.037' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (82, 1090, N'6222f248-ad2a-40c7-829a-32f5e4c72e1b', CAST(N'2017-01-08 16:36:18.830' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (83, 1051, N'5f8d5863-3134-4944-80eb-dd307184b4af', CAST(N'2017-01-08 16:58:35.863' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (84, 1091, N'7c3727a4-9a60-4323-99a5-cb6a96f5fc0f', CAST(N'2017-01-08 16:41:38.213' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (85, 1091, N'183abdde-38df-401f-8a9a-5b5b92b1c6f5', CAST(N'2017-01-08 16:42:06.650' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (86, 1054, N'a70a6727-ec61-46b0-8add-d519d5665122', CAST(N'2017-01-08 16:42:06.663' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (87, 1064, N'a8cf8090-7e09-4ff4-9618-2b22639c0ef6', CAST(N'2017-01-08 16:42:06.683' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (88, 1067, N'e9bb6e16-8721-4ebb-806c-59d174ba10bc', CAST(N'2017-01-08 16:42:06.690' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (89, 1095, N'5bf2a256-2b5c-4c34-919a-e22019bba8db', CAST(N'2017-01-08 16:56:21.220' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (90, 1095, N'ee8ab800-7d8c-459d-aa6d-4b6ee5745ef3', CAST(N'2017-01-08 16:56:27.470' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (91, 1095, N'aa56a071-75ee-4e02-8692-2fdb6b8387df', CAST(N'2017-01-08 16:56:27.547' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (92, 1096, N'37fcec08-3a90-4aac-aa05-2f2598373048', CAST(N'2017-01-08 16:57:09.377' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (93, 1096, N'54ec8e19-1ddd-42dc-bc73-8dd548635909', CAST(N'2017-01-08 16:57:20.567' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (94, 1096, N'76abe1dd-e84c-4289-b75e-10e06a077b44', CAST(N'2017-01-08 16:57:20.600' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (95, 1097, N'8d6722a8-d3e0-4cd2-aa1a-38a03e31cf5b', CAST(N'2017-01-08 16:57:30.647' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (96, 1097, N'24d1129b-d1a9-499a-a7e9-0439ec85ba78', CAST(N'2017-01-08 16:58:32.993' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (97, 1098, N'c017604c-b864-4b43-9a1c-020f34c95337', CAST(N'2017-01-08 17:00:58.780' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (98, 1099, N'010a175d-4c8f-4b37-a093-38e18c351e78', CAST(N'2017-01-08 17:01:08.580' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (99, 1100, N'9e5427b3-fbf8-44c7-bf68-a03caa807bb2', CAST(N'2017-01-08 17:01:29.787' AS DateTime))
GO
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (100, 1064, N'a6e32bb5-b8d7-4308-a434-1541890c5503', CAST(N'2017-01-08 17:04:41.303' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (101, 1064, N'ee4812fa-927a-4a0e-8bad-742d43c4b313', CAST(N'2017-01-08 17:04:41.350' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (102, 1105, N'bd103ce8-eddd-4e3f-9047-3b4721f9c8af', CAST(N'2017-01-08 17:04:57.970' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (103, 1054, N'a3936bd3-9633-4eb8-bd23-2dc3cebb3336', CAST(N'2017-01-08 17:06:17.490' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (104, 1091, N'cf5a2a93-1698-431c-8632-d328f668e2d8', CAST(N'2017-01-08 17:06:17.510' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (105, 1105, N'382747bc-08c2-4e4a-9c0c-97c7a1265ccf', CAST(N'2017-01-08 17:06:17.520' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (106, 1097, N'b17ed075-fc03-4823-915c-c2f42e6bbbee', CAST(N'2017-01-08 17:06:17.527' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (107, 1067, N'ae6cde7e-dbff-4194-b987-ce007c079900', CAST(N'2017-01-08 17:06:17.537' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (108, 1051, N'f7ebfe78-f3e5-4649-ae4f-552b71efd81e', CAST(N'2017-01-08 17:16:24.700' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (109, 1051, N'13c73743-50ed-482d-8fef-25839c46f9ff', CAST(N'2017-01-08 17:17:15.123' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (110, 1051, N'a8cf7d00-85c0-4025-b273-282210c591c6', CAST(N'2017-01-08 17:19:21.067' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (111, 1051, N'aeee99cc-07a0-4bf8-8c40-c595fc138103', CAST(N'2017-01-08 17:20:37.217' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (112, 1051, N'54aa5a90-c79e-4c01-9891-8da238d90341', CAST(N'2017-01-08 17:53:47.330' AS DateTime))
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate]) VALUES (113, 1051, N'3e017249-2472-43b9-b323-f7cb117ecdb9', CAST(N'2017-01-08 20:16:50.677' AS DateTime))
SET IDENTITY_INSERT [dbo].[cmsContentVersion] OFF
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1051, N'<Homepage id="1051" key="03c97828-eb70-410c-a4a0-39b92ca110b5" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-04-05T11:08:50" updateDate="2017-01-08T20:16:50" nodeName="Trang Chủ" urlName="trang-chủ" path="-1,1051" isDoc="" nodeType="1050" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1049" nodeTypeAlias="Homepage"><hideInNavigation>0</hideInNavigation><pagetitle><![CDATA[Hải Diễm Studio]]></pagetitle><pageName><![CDATA[Hải Diễm Studio]]></pageName><twitterLink><![CDATA[https://twitter.com/]]></twitterLink><facebookLink><![CDATA[https://www.facebook.com/cao.hoangvu]]></facebookLink><instagramLink><![CDATA[https://www.instagram.com/]]></instagramLink><googleplusLink><![CDATA[http://feedburner.google.com/fb/a/mailverify?uri=tympanus&loc=en_US]]></googleplusLink><bannerImage><![CDATA[[
  {
    "image": "1088",
    "link": "1054"
  },
  {
    "image": "1090",
    "link": "1051"
  },
  {
    "image": "1089",
    "link": "1064"
  }
]]]></bannerImage><copyright><![CDATA[Hải Diễm Studio]]></copyright><siteName><![CDATA[Trang chủ]]></siteName><productHightlight><![CDATA[1060,1079,1083]]></productHightlight></Homepage>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1054, N'<ProductPage id="1054" key="38fa5bd4-6653-4309-93fe-8763bf2bda58" parentID="1051" level="2" creatorID="0" sortOrder="1" createDate="2016-04-05T15:20:40" updateDate="2017-01-08T17:06:17" nodeName="Rồng phụng trái cây" urlName="rong-phung-trai-cay" path="-1,1051,1054" isDoc="" nodeType="1053" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1052" nodeTypeAlias="ProductPage"><umbracoUrlName><![CDATA[rong-phung-trai-cay]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng trái cây]]></pageName><shownumberofproduct><![CDATA[8]]></shownumberofproduct></ProductPage>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1060, N'<ProductItem id="1060" key="2013ba88-b3f3-42b6-905a-a8a0e70712af" parentID="1054" level="3" creatorID="0" sortOrder="0" createDate="2016-04-05T15:42:51" updateDate="2016-04-13T14:21:26" nodeName="Rồng phụng thâm quyến" urlName="rong-phung-tham-quyen" path="-1,1051,1054,1060" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><umbracoUrlName><![CDATA[rong-phung-tham-quyen]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng thâm quyến]]></pageName><hinhAnh>1074</hinhAnh><price><![CDATA[500,000 ]]></price><phuongThucThanhToan><![CDATA[<p><strong>1.Thanh toán trực tiêp </strong></p>
<p>Quý khách vui lòng liên hệ số điện thoại 0982357990 để đặt hàng và thanh toán ngay sau khi nhận hàng<br /><br /><strong>2.Chuyển khoản ngân hàng</strong></p>
<p>Để thuận tiện cho quý khách chúng tôi cung cấp phương thức chuyển khoản ngân hàng . Quý khách chỉ cần chuyển khoản số tiền và quý khách đã đặt mua sản phẩm đên tài khoản của chúng tôi.Ngay sau khi nhận được tiền chúng tôi sẽ tiến hành giao hàng cho quý khách<br /><strong><em>Thông tin ngân hàng</em></strong><br /><em>VietComBank chi nhánh Tp Hồ chí minh . </em><br /><em>Số tài khoản :12345678</em>9</p>]]></phuongThucThanhToan><moTa><![CDATA[<p>Rồng phụng trái cây được kết rất cầu kỳ, khéo léo từ các loại trái cây tươi ngon, bắt mắt thì những con rồng long phụng rất tinh xảo sóng động như thật, nhất là loại rồng phụng cao cấp chuyển động.</p>
<p>Ngoài ra, Rồng phượng là biểu tượng âm dương rất mạnh trong thần thoại.</p>
<p>Rồng tượng trưng cho sức mạnh của nam.</p>
<p>Phượng tượng trưng cho sự kiều diễm và vẻ đẹp nữ tính khi đặt bên cạnh rồng. Cho nên trên bàn thờ lễ gia tiên đặt một đôi rồng phụng vừa tạo cảnh đẹp mắt. long trọng của buổi lễ vừa tạo nên phong thủy tích cực, tốt đẹp cho cuộc sống hôn nhân của đôi lứa sau này</p>]]></moTa></ProductItem>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1061, N'<About id="1061" key="5154808d-5144-4df6-88c9-9f25184c52e0" parentID="1051" level="2" creatorID="0" sortOrder="0" createDate="2016-04-05T15:46:21" updateDate="2016-04-12T14:17:15" nodeName="Giới thiệu" urlName="gioi-thieu" path="-1,1051,1061" isDoc="" nodeType="1056" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1055" nodeTypeAlias="About"><umbracoUrlName><![CDATA[gioi-thieu]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageKeywords><![CDATA[gioi thieu, rongphunghaidiem, rongphung, rong, phung]]></pageKeywords><pagetitle><![CDATA[Giới thiệu]]></pagetitle><pageName><![CDATA[Giới thiệu]]></pageName><content><![CDATA[<p>RỒNG PHỤNG HẢI DIỄM</p>
<p>Chuyên cung cấp dịch vụ rồng phụng trái cây ngày cưới cho các cặp đôi hoàn hảo</p>
<div>
<div><em>Mỗi mẫu trang trí nhà cưới hỏi của RỒNG PHỤNG HẢI DIỄM thường gồm có:</em></div>
<div><em>* <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/679/ban-tho-gia-tien-ngay-cuoi">Trang trí bàn thờ gia tiên</a> hay còn gọi là bàn thờ tổ tiên của RỒNG PHỤNG HẢI DIỄM với </em></div>
<div><em>+ Các kiểu trang trí bàn thờ gồm có: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/924/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">mẫu truyền thống nhung đỏ</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/928/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">mẫu tự nhiên</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/978/ban-tho-to-tien-ngay-cuoi-tong-hong-canh-sen-mau-tu-nhien-duoc-t">mẫu hiện đại</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/944/ban-tho-to-tien-ngay-cuoi-mau-thien-chua-tong-xanh-la-cho-trang-">mẫu thiên chúa tin lành</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/946/ban-tho-to-tien-ngay-cuoi-mau-dep-voi-manh-tre-mau-do-chuc-phuc-">mẫu mành tre</a> với dây voan, hoa vải hoa tươi trang trí, chữ song hỷ, câu đối trang trí; </em></div>
<div><em>+ Chữ dán trên phong nền có thể là: <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-dich-vu-cuoi-hoi-ban-tho-to-tien-ngay-cuoi-tong-cam-mau-tu-nhien-duoc-trang-tri-bang-vai-voan-cao-cap-cho-le-an-hoi-gia-tien-dam-cuoi-day-du-nghi-le-4.jpg">Song hỷ</a> ; <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/946/ban-tho-to-tien-ngay-cuoi-mau-dep-voi-manh-tre-mau-do-chuc-phuc-">Phúc</a>; <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/936/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">Trăm năm hạnh phúc</a>;  Kính nhớ tổ tiên ;  Long phụng hòa minh - Sắc cầm hỏa hợp; Trăm năm tình viên mãn bạc đầu nghĩa phu thê</em></div>
<div><em>+ Trên bàn thờ có đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/955/ban-tho-to-tien-ngay-cuoi-mau-an-tuong-tong-hong-cho-trang-tri-l">1 bộ lư</a> để bình thường hoặc trang trí thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/993/ban-tho-to-tien-ngay-cuoi-tong-trang-do-mau-tu-nhien-duoc-trang-">hoa tươi</a></em></div>
<div><em>+ Đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/984/ban-tho-to-tien-ngay-cuoi-tong-hong-mau-tu-nhien-duoc-trang-tri-">hai bình hoa tươi</a> song hỷ hoặc một bình hoa tươi một mâm trái cây ngũ quả hoặc là đặc biệt hơn là mẫu trang trí hoa <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/986/ban-tho-to-tien-ngay-cuoi-tong-hong-mau-tu-nhien-duoc-trang-tri-">cắm đỗ bàn thờ</a></em></div>
<div><em>+ Đặt một đôi <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/648/rong-phung-trai-cay-ngay-cuoi">rồng phụng trái cây</a> sẽ mang lại không khí ấm áp, sung túc cho ngày lễ ăn hỏi, lễ cưới của bạn</em></div>
<div><em>+ Cạnh bàn thờ thì ở nhà gái còn đặt thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1031/hoa-giay-lua-tong-trang-do-long-lay-trang-tri-ban-tho-to-tien-n">một cái bàn nhỏ</a> được phủ mặt bàn được may bắt mắt để đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/859/mam-qua-tong-hop-qua-trai-cay-trau-cau-rong-phung-trai-cay-dac-s">mâm quả lễ vật</a> của nhà trai</em></div>
</div>]]></content></About>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1067, N'<Contactpage id="1067" key="cde7de7e-66d3-4acb-bbfe-fe0832d6aad0" parentID="1051" level="2" creatorID="0" sortOrder="5" createDate="2016-04-05T15:58:14" updateDate="2017-01-08T17:06:17" nodeName="Liên hệ" urlName="lien-he" path="-1,1051,1067" isDoc="" nodeType="1066" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1065" nodeTypeAlias="Contactpage"><umbracoUrlName><![CDATA[lien-he]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Liên hệ]]></pageName></Contactpage>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1068, N'<Folder id="1068" key="848e301b-db30-45ce-b1e3-9039cf2463e4" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-04-06T13:44:47" updateDate="2016-04-06T13:44:47" nodeName="Banner" urlName="banner" path="-1,1068" isDoc="" nodeType="1031" writerName="Hoang Vu" writerID="0" version="bc50fb6c-73e4-4567-8213-8d5201bb290a" template="0" nodeTypeAlias="Folder" />')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1072, N'<Folder id="1072" key="ed18a64e-08a4-47e1-a2a2-7990909f2fca" parentID="-1" level="1" creatorID="0" sortOrder="1" createDate="2016-04-06T16:52:02" updateDate="2016-04-06T16:52:02" nodeName="Product" urlName="product" path="-1,1072" isDoc="" nodeType="1031" writerName="Hoang Vu" writerID="0" version="98dc6466-7a51-490f-95f1-ab247f7d6326" template="0" nodeTypeAlias="Folder" />')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1073, N'<Folder id="1073" key="6bdd26f2-d572-4d97-945f-fd7742f232f5" parentID="1072" level="2" creatorID="0" sortOrder="0" createDate="2016-04-06T16:52:17" updateDate="2016-04-06T16:52:17" nodeName="RP01" urlName="rp01" path="-1,1072,1073" isDoc="" nodeType="1031" writerName="Hoang Vu" writerID="0" version="428c9024-4448-493b-8d1f-38cdb7eed330" template="0" nodeTypeAlias="Folder" />')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1074, N'<Image id="1074" key="dc2d051c-412e-4a59-9e38-668cee0783c9" parentID="1073" level="3" creatorID="0" sortOrder="0" createDate="2016-04-06T16:52:21" updateDate="2016-04-06T16:52:21" nodeName="about-rp.jpg" urlName="about-rpjpg" path="-1,1072,1073,1074" isDoc="" nodeType="1032" writerName="Hoang Vu" writerID="0" version="ac0a75a2-d2b4-4a38-b9b6-b3f39a4f018f" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[/media/1003/about-rp.jpg]]></umbracoFile><umbracoWidth><![CDATA[2520]]></umbracoWidth><umbracoHeight><![CDATA[1890]]></umbracoHeight><umbracoBytes><![CDATA[311219]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1075, N'<ProductItem id="1075" key="c705a36f-e322-4713-9235-6f4d254dedbd" parentID="1054" level="3" creatorID="0" sortOrder="1" createDate="2016-04-06T16:54:17" updateDate="2016-04-13T13:57:51" nodeName="Rồng phụng 2" urlName="rong-phung-2" path="-1,1051,1054,1075" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><umbracoUrlName><![CDATA[rong-phung-2]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng 2]]></pageName><hinhAnh>1074</hinhAnh></ProductItem>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1076, N'<ProductItem id="1076" key="52440f67-43b2-4f69-ad14-7e579baf7dee" parentID="1054" level="3" creatorID="0" sortOrder="2" createDate="2016-04-06T16:54:38" updateDate="2016-04-06T16:55:46" nodeName="Rồng phụng 3" urlName="rồng-phụng-3" path="-1,1051,1054,1076" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng 3]]></pageName><hinhAnh>1074</hinhAnh></ProductItem>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1077, N'<ProductItem id="1077" key="18b48326-0e4f-4812-9964-d8d12b7468cc" parentID="1054" level="3" creatorID="0" sortOrder="3" createDate="2016-04-06T16:54:50" updateDate="2016-04-06T16:55:55" nodeName="Rồng phụng 4" urlName="rồng-phụng-4" path="-1,1051,1054,1077" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng 4]]></pageName><hinhAnh>1074</hinhAnh></ProductItem>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1078, N'<ProductItem id="1078" key="f381174a-a127-4b79-8ca7-d8c8052a303f" parentID="1054" level="3" creatorID="0" sortOrder="4" createDate="2016-04-06T16:54:57" updateDate="2016-04-06T16:56:03" nodeName="Rồng phụng 5" urlName="rồng-phụng-5" path="-1,1051,1054,1078" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng 5]]></pageName><hinhAnh>1074</hinhAnh></ProductItem>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1079, N'<ProductItem id="1079" key="8bba6abb-96a1-41ae-90a7-f7d581f77c3c" parentID="1054" level="3" creatorID="0" sortOrder="5" createDate="2016-04-06T16:55:03" updateDate="2016-04-06T16:56:11" nodeName="Rồng phụng 6" urlName="rồng-phụng-6" path="-1,1051,1054,1079" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng 6]]></pageName><hinhAnh>1074</hinhAnh></ProductItem>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1080, N'<ProductItem id="1080" key="0ba31968-0791-443f-9e41-7095b732738f" parentID="1054" level="3" creatorID="0" sortOrder="6" createDate="2016-04-06T16:55:10" updateDate="2016-04-06T16:56:21" nodeName="Rồng phụng 7" urlName="rồng-phụng-7" path="-1,1051,1054,1080" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng 7]]></pageName><hinhAnh>1074</hinhAnh></ProductItem>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1081, N'<ProductItem id="1081" key="4a2c3e26-08d6-4d58-b79a-e2648b4f623e" parentID="1054" level="3" creatorID="0" sortOrder="7" createDate="2016-04-06T16:55:19" updateDate="2016-04-06T16:56:30" nodeName="Rồng phụng 8" urlName="rồng-phụng-8" path="-1,1051,1054,1081" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng 8]]></pageName><hinhAnh>1074</hinhAnh></ProductItem>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1082, N'<ProductItem id="1082" key="db905eac-ba15-4931-9318-e504e36938e7" parentID="1054" level="3" creatorID="0" sortOrder="8" createDate="2016-04-06T16:55:29" updateDate="2016-04-06T16:56:38" nodeName="Rồng phụng 9" urlName="rồng-phụng-9" path="-1,1051,1054,1082" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng 9]]></pageName><hinhAnh>1074</hinhAnh></ProductItem>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1083, N'<ProductItem id="1083" key="6d077c0a-690f-4ba5-8a8a-adf9883c849c" parentID="1054" level="3" creatorID="0" sortOrder="9" createDate="2016-04-06T16:55:35" updateDate="2016-04-06T16:56:45" nodeName="Rồng phụng 10" urlName="rồng-phụng-10" path="-1,1051,1054,1083" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng 10]]></pageName><hinhAnh>1074</hinhAnh></ProductItem>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1087, N'<Image id="1087" key="78baaaac-1a26-4ad6-a5b1-07e6530685ec" parentID="1068" level="2" creatorID="0" sortOrder="0" createDate="2017-01-08T16:33:57" updateDate="2017-01-08T16:33:57" nodeName="Bo1.3.jpg" urlName="bo13jpg" path="-1,1068,1087" isDoc="" nodeType="1032" writerName="Hoang Vu" writerID="0" version="767511d8-b1ce-4f95-970b-496b023b9ae1" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[/media/1006/bo13.jpg]]></umbracoFile><umbracoWidth><![CDATA[1500]]></umbracoWidth><umbracoHeight><![CDATA[600]]></umbracoHeight><umbracoBytes><![CDATA[281041]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1088, N'<Image id="1088" key="0826ab98-3181-451c-8c8f-d3b6b81eb2f1" parentID="1068" level="2" creatorID="0" sortOrder="1" createDate="2017-01-08T16:33:57" updateDate="2017-01-08T16:33:57" nodeName="KEN_9149.jpg" urlName="ken_9149jpg" path="-1,1068,1088" isDoc="" nodeType="1032" writerName="Hoang Vu" writerID="0" version="4b7c8499-f699-44b0-aafe-934fb97e67a9" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[/media/1007/ken_9149.jpg]]></umbracoFile><umbracoWidth><![CDATA[2000]]></umbracoWidth><umbracoHeight><![CDATA[800]]></umbracoHeight><umbracoBytes><![CDATA[459311]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1089, N'<Image id="1089" key="d48691a6-391b-414c-8c9d-7eb326367268" parentID="1068" level="2" creatorID="0" sortOrder="2" createDate="2017-01-08T16:33:57" updateDate="2017-01-08T16:33:57" nodeName="NUPA5843x-copy.jpg" urlName="nupa5843x-copyjpg" path="-1,1068,1089" isDoc="" nodeType="1032" writerName="Hoang Vu" writerID="0" version="99ba302f-a63f-4837-a474-f7a7badcb8a5" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[/media/1008/nupa5843x-copy.jpg]]></umbracoFile><umbracoWidth><![CDATA[2000]]></umbracoWidth><umbracoHeight><![CDATA[800]]></umbracoHeight><umbracoBytes><![CDATA[581514]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1090, N'<Image id="1090" key="843830a7-8352-4aad-aa56-e30697df7401" parentID="1068" level="2" creatorID="0" sortOrder="3" createDate="2017-01-08T16:36:18" updateDate="2017-01-08T16:36:18" nodeName="KEN_3524.jpg" urlName="ken_3524jpg" path="-1,1068,1090" isDoc="" nodeType="1032" writerName="Hoang Vu" writerID="0" version="6222f248-ad2a-40c7-829a-32f5e4c72e1b" template="0" nodeTypeAlias="Image"><umbracoFile><![CDATA[/media/1009/ken_3524.jpg]]></umbracoFile><umbracoWidth><![CDATA[2000]]></umbracoWidth><umbracoHeight><![CDATA[800]]></umbracoHeight><umbracoBytes><![CDATA[1009446]]></umbracoBytes><umbracoExtension><![CDATA[jpg]]></umbracoExtension></Image>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1091, N'<Fashion id="1091" key="a452b061-d348-4550-99ec-160b8e7ed6da" parentID="1051" level="2" creatorID="0" sortOrder="2" createDate="2017-01-08T16:41:38" updateDate="2017-01-08T17:06:17" nodeName="Album Ảnh" urlName="album-ảnh" path="-1,1051,1091" isDoc="" nodeType="1063" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1062" nodeTypeAlias="Fashion"><hideInNavigation>0</hideInNavigation></Fashion>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1097, N'<Servicespage id="1097" key="4cf1918d-7ec5-475f-87bf-f4d79196a4be" parentID="1051" level="2" creatorID="0" sortOrder="4" createDate="2017-01-08T16:57:30" updateDate="2017-01-08T17:06:17" nodeName="Dịch vụ" urlName="dịch-vụ" path="-1,1051,1097" isDoc="" nodeType="1092" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="0" nodeTypeAlias="Servicespage"><hideInNavigation>1</hideInNavigation></Servicespage>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1098, N'<ServiceDetailPage id="1098" key="b5ecd9af-5bf0-442a-9757-0f3e549eb168" parentID="1097" level="3" creatorID="0" sortOrder="0" createDate="2017-01-08T17:00:58" updateDate="2017-01-08T17:00:58" nodeName="Trang Điểm Cô Dâu" urlName="trang-điểm-cô-dâu" path="-1,1051,1097,1098" isDoc="" nodeType="1094" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1093" nodeTypeAlias="ServiceDetailPage"><hideInNavigation>0</hideInNavigation></ServiceDetailPage>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1099, N'<ServiceDetailPage id="1099" key="369064bc-d371-44b9-bffd-78c426aa0403" parentID="1097" level="3" creatorID="0" sortOrder="1" createDate="2017-01-08T17:01:08" updateDate="2017-01-08T17:01:08" nodeName="Cho Thuê Xe Cưới" urlName="cho-thuê-xe-cưới" path="-1,1051,1097,1099" isDoc="" nodeType="1094" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1093" nodeTypeAlias="ServiceDetailPage"><hideInNavigation>0</hideInNavigation></ServiceDetailPage>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1100, N'<ServiceDetailPage id="1100" key="631782bb-a103-457f-b3ed-6a9ec62448dc" parentID="1097" level="3" creatorID="0" sortOrder="2" createDate="2017-01-08T17:01:29" updateDate="2017-01-08T17:01:29" nodeName="Chụp Hình Cưới" urlName="chụp-hình-cưới" path="-1,1051,1097,1100" isDoc="" nodeType="1094" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1093" nodeTypeAlias="ServiceDetailPage"><hideInNavigation>0</hideInNavigation></ServiceDetailPage>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1105, N'<News id="1105" key="c352b05e-da4a-4f4f-8f46-0a2a30dcee85" parentID="1051" level="2" creatorID="0" sortOrder="3" createDate="2017-01-08T17:04:57" updateDate="2017-01-08T17:06:17" nodeName="Thời Trang" urlName="thời-trang" path="-1,1051,1105" isDoc="" nodeType="1102" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1101" nodeTypeAlias="News"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Thời Trang]]></pageName></News>')
SET IDENTITY_INSERT [dbo].[cmsDataType] ON 

INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (-28, -97, N'Umbraco.ListView', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (-27, -96, N'Umbraco.ListView', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (-26, -95, N'Umbraco.ListView', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (1, -49, N'Umbraco.TrueFalse', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (2, -51, N'Umbraco.Integer', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (3, -87, N'Umbraco.TinyMCEv3', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (4, -88, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (5, -89, N'Umbraco.TextboxMultiple', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (6, -90, N'Umbraco.UploadField', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (7, -92, N'Umbraco.NoEdit', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (8, -36, N'Umbraco.DateTime', N'Date')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (9, -37, N'Umbraco.ColorPickerAlias', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (10, -38, N'Umbraco.FolderBrowser', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (11, -39, N'Umbraco.DropDownMultiple', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (12, -40, N'Umbraco.RadioButtonList', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (13, -41, N'Umbraco.Date', N'Date')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (14, -42, N'Umbraco.DropDown', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (15, -43, N'Umbraco.CheckBoxList', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (16, 1034, N'Umbraco.ContentPickerAlias', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (17, 1035, N'Umbraco.MediaPicker', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (18, 1036, N'Umbraco.MemberPicker', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (21, 1040, N'Umbraco.RelatedLinks', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (22, 1041, N'Umbraco.Tags', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (24, 1043, N'Umbraco.ImageCropper', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (25, 1045, N'Umbraco.MultipleMediaPicker', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (26, 1071, N'u7dtg', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (27, 1086, N'Umbraco.MultiNodeTreePicker', N'Nvarchar')
SET IDENTITY_INSERT [dbo].[cmsDataType] OFF
SET IDENTITY_INSERT [dbo].[cmsDataTypePreValues] ON 

INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-4, -97, N'[{"alias":"email","isSystem":1},{"alias":"username","isSystem":1},{"alias":"updateDate","header":"Last edited","isSystem":1}]', 4, N'includeProperties')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-3, -97, N'asc', 3, N'orderDirection')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-2, -97, N'Name', 2, N'orderBy')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (-1, -97, N'10', 1, N'pageSize')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (3, -87, N',code,undo,redo,cut,copy,mcepasteword,stylepicker,bold,italic,bullist,numlist,outdent,indent,mcelink,unlink,mceinsertanchor,mceimage,umbracomacro,mceinserttable,umbracoembed,mcecharmap,|1|1,2,3,|0|500,400|1049,|true|', 0, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (4, 1041, N'default', 0, N'group')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (5, 1045, N'1', 0, N'multiPicker')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (12, 1071, N'{
  "columns": [],
  "rows": ""
}', 1, N'rows')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (13, 1071, N'{
  "columns": [
    {
      "title": "Image",
      "alias": "image",
      "type": "mediapicker",
      "props": {}
    },
    {
      "title": "Link",
      "alias": "link",
      "type": "contentpicker",
      "props": {}
    }
  ]
}', 2, N'columns')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (14, 1086, N'{
  "type": "content",
  "id": 1054
}', 1, N'startNode')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (15, 1086, NULL, 2, N'filter')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (16, 1086, NULL, 3, N'minNumber')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (17, 1086, NULL, 4, N'maxNumber')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (18, 1086, N'0', 5, N'showEditButton')
SET IDENTITY_INSERT [dbo].[cmsDataTypePreValues] OFF
SET IDENTITY_INSERT [dbo].[cmsDictionary] ON 

INSERT [dbo].[cmsDictionary] ([pk], [id], [parent], [key]) VALUES (1, N'74da9dfa-964c-4e98-a5f5-74f6640f1663', NULL, N'title')
SET IDENTITY_INSERT [dbo].[cmsDictionary] OFF
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1061, 0, 0, N'afb4777f-6d13-44d3-86c3-00e15c8d62a3', N'Giới thiệu', NULL, NULL, CAST(N'2016-04-06 14:25:12.757' AS DateTime), 1055, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1098, 1, 0, N'c017604c-b864-4b43-9a1c-020f34c95337', N'Trang Điểm Cô Dâu', NULL, NULL, CAST(N'2017-01-08 17:00:58.780' AS DateTime), 1093, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1097, 0, 0, N'24d1129b-d1a9-499a-a7e9-0439ec85ba78', N'Dịch vụ', NULL, NULL, CAST(N'2017-01-08 16:58:32.993' AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1060, 0, 0, N'21eb0807-b5ec-4c86-83c2-05e74085ca68', N'Rồng phụng 1', NULL, NULL, CAST(N'2016-04-12 13:45:12.677' AS DateTime), 1057, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1061, 0, 0, N'6296266f-59a3-470d-9d3a-07437cde7c8f', N'Giới thiệu', NULL, NULL, CAST(N'2016-04-06 13:59:00.150' AS DateTime), 1055, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1060, 0, 0, N'8112a8b0-7c8c-4beb-b46c-1090cd411e33', N'Rồng phụng thâm quyến', NULL, NULL, CAST(N'2016-04-13 14:02:25.317' AS DateTime), 1057, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1096, 0, 0, N'76abe1dd-e84c-4289-b75e-10e06a077b44', N'Dịch vụ (1)', NULL, NULL, CAST(N'2017-01-08 16:57:20.600' AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1060, 0, 0, N'451c8e02-903f-4a40-8793-123e2217059c', N'Rồng phụng thâm quyến', NULL, NULL, CAST(N'2016-04-13 14:09:09.133' AS DateTime), 1057, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1054, 0, 0, N'82bce98c-1d8a-4ab9-bc09-149be12e0e3b', N'Rồng phụng trái cây', NULL, NULL, CAST(N'2016-04-05 15:20:40.827' AS DateTime), 1052, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1064, 0, 0, N'a6e32bb5-b8d7-4308-a434-1541890c5503', N'Thời trang', NULL, NULL, CAST(N'2017-01-08 17:04:41.303' AS DateTime), 1062, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1061, 0, 0, N'dd67910e-db89-454e-96cb-1baea493b209', N'Giới thiệu', NULL, NULL, CAST(N'2016-04-05 15:46:21.013' AS DateTime), 1055, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1064, 0, 0, N'd2988503-33e8-4bba-b3b4-1da11e56ef8a', N'Thời trang', NULL, NULL, CAST(N'2016-04-06 14:24:11.693' AS DateTime), 1062, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1060, 0, 0, N'23447f32-0980-4023-84b5-221a33c50188', N'Rồng phụng thâm quyến', NULL, NULL, CAST(N'2016-04-12 16:10:23.700' AS DateTime), 1057, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1061, 0, 0, N'5517d347-96ff-4e3f-85d4-2343dfa8f41f', N'Giới thiệu', NULL, NULL, CAST(N'2016-04-06 15:54:03.283' AS DateTime), 1055, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1051, 0, 0, N'13c73743-50ed-482d-8fef-25839c46f9ff', N'Trang Chủ', NULL, NULL, CAST(N'2017-01-08 17:17:15.123' AS DateTime), 1049, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1051, 0, 0, N'a8cf7d00-85c0-4025-b273-282210c591c6', N'Trang Chủ', NULL, NULL, CAST(N'2017-01-08 17:19:21.067' AS DateTime), 1049, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1054, 0, 0, N'26bc6b27-9bca-45a1-a5a9-286acec584d4', N'Rồng phụng trái cây', NULL, NULL, CAST(N'2016-04-07 10:51:10.280' AS DateTime), 1052, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1061, 0, 0, N'98b41b26-60ef-4047-bdc1-28e675177697', N'Giới thiệu', NULL, NULL, CAST(N'2016-04-06 16:00:04.133' AS DateTime), 1055, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1064, 0, 0, N'a8cf8090-7e09-4ff4-9618-2b22639c0ef6', N'Thời trang', NULL, NULL, CAST(N'2017-01-08 16:42:06.683' AS DateTime), 1062, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1054, 1, 0, N'a3936bd3-9633-4eb8-bd23-2dc3cebb3336', N'Rồng phụng trái cây', NULL, NULL, CAST(N'2017-01-08 17:06:17.490' AS DateTime), 1052, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1096, 0, 0, N'37fcec08-3a90-4aac-aa05-2f2598373048', N'Dịch vụ', NULL, NULL, CAST(N'2017-01-08 16:57:09.377' AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1095, 0, 0, N'aa56a071-75ee-4e02-8692-2fdb6b8387df', N'Dịch vụ', NULL, NULL, CAST(N'2017-01-08 16:56:27.547' AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1075, 1, 0, N'073301b3-c255-4ee9-a4d7-31e2dad09462', N'Rồng phụng 2', NULL, NULL, CAST(N'2016-04-13 13:57:51.423' AS DateTime), 1057, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1097, 0, 0, N'8d6722a8-d3e0-4cd2-aa1a-38a03e31cf5b', N'Dịch vụ', NULL, NULL, CAST(N'2017-01-08 16:57:30.647' AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1099, 1, 0, N'010a175d-4c8f-4b37-a093-38e18c351e78', N'Cho Thuê Xe Cưới', NULL, NULL, CAST(N'2017-01-08 17:01:08.580' AS DateTime), 1093, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1105, 0, 0, N'bd103ce8-eddd-4e3f-9047-3b4721f9c8af', N'Thời Trang', NULL, NULL, CAST(N'2017-01-08 17:04:57.970' AS DateTime), 1101, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1078, 0, 0, N'0b7df8d4-043b-49ca-90f4-3d6841d6d6a9', N'Rồng phụng 1 (3)', NULL, NULL, CAST(N'2016-04-06 16:54:57.273' AS DateTime), 1057, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1051, 0, 0, N'1122711b-dd7c-407e-8841-3f3d4448e354', N'Trang Chủ', NULL, NULL, CAST(N'2016-04-05 13:45:37.210' AS DateTime), 1049, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1080, 0, 0, N'72bc2f55-bff3-478f-b893-40f33df84717', N'Rồng phụng 1 (5)', NULL, NULL, CAST(N'2016-04-06 16:55:10.547' AS DateTime), 1057, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1061, 0, 0, N'a2c9b908-1db6-4d9d-a819-4446ed884f1a', N'Giới thiệu', NULL, NULL, CAST(N'2016-04-06 15:52:26.200' AS DateTime), 1055, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1060, 0, 0, N'7e06ac74-54b3-47f5-ad3a-46fa745d08f9', N'Rồng phụng 1', NULL, NULL, CAST(N'2016-04-06 16:52:26.803' AS DateTime), 1057, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1061, 0, 0, N'f8614c47-59d5-4ded-8f1f-4ad80ac935b8', N'Giới thiệu', NULL, NULL, CAST(N'2016-04-06 16:00:54.150' AS DateTime), 1055, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1095, 0, 0, N'ee8ab800-7d8c-459d-aa6d-4b6ee5745ef3', N'Dịch vụ', NULL, NULL, CAST(N'2017-01-08 16:56:27.470' AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1051, 0, 0, N'fb6bd512-7204-4a0b-a6bc-4e481b9a16b0', N'Trang Chủ', NULL, NULL, CAST(N'2016-04-05 13:45:03.540' AS DateTime), 1049, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1077, 0, 0, N'8add66e7-8b4b-474c-9841-4ec38dc86b2d', N'Rồng phụng 1 (2)', NULL, NULL, CAST(N'2016-04-06 16:54:50.563' AS DateTime), 1057, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1060, 0, 0, N'fceb75cc-76d0-431c-bafa-5243b30e1f6e', N'Rồng phụng thâm quyến', NULL, NULL, CAST(N'2016-04-13 14:20:26.640' AS DateTime), 1057, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1080, 1, 0, N'8ce919f2-ba13-43e7-9ac1-53c0d74a42ba', N'Rồng phụng 7', NULL, NULL, CAST(N'2016-04-06 16:56:21.243' AS DateTime), 1057, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1051, 0, 0, N'8e3f5936-254c-4afd-8645-54c9f1e69a53', N'Trang Chủ', NULL, NULL, CAST(N'2016-04-29 10:45:23.637' AS DateTime), 1049, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1051, 0, 0, N'f7ebfe78-f3e5-4649-ae4f-552b71efd81e', N'Trang Chủ', NULL, NULL, CAST(N'2017-01-08 17:16:24.700' AS DateTime), 1049, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1054, 0, 0, N'96cb3f33-5906-4212-94e4-55faf83e9989', N'Rồng phụng trái cây', NULL, NULL, CAST(N'2016-04-12 13:23:33.203' AS DateTime), 1052, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1067, 0, 0, N'e9bb6e16-8721-4ebb-806c-59d174ba10bc', N'Liên hệ', NULL, NULL, CAST(N'2017-01-08 16:42:06.690' AS DateTime), 1065, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1091, 0, 0, N'183abdde-38df-401f-8a9a-5b5b92b1c6f5', N'Album Ảnh', NULL, NULL, CAST(N'2017-01-08 16:42:06.650' AS DateTime), 1062, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1061, 1, 0, N'56619615-24f6-4f6b-921b-62bc8c5151ae', N'Giới thiệu', NULL, NULL, CAST(N'2016-04-12 14:17:15.617' AS DateTime), 1055, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1060, 0, 0, N'6381e0c1-f449-4f93-836b-64f337104288', N'Rồng phụng 1', NULL, NULL, CAST(N'2016-04-06 13:59:01.093' AS DateTime), 1057, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1051, 0, 0, N'277ea9b0-a629-4f79-a5b4-667d8f38b160', N'Trang Chủ', NULL, NULL, CAST(N'2016-04-06 13:59:55.583' AS DateTime), 1049, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1054, 0, 0, N'f88b72fc-f486-44e4-b9e7-67a9b23bca63', N'Rồng phụng trái cây', NULL, NULL, CAST(N'2016-04-06 13:59:00.387' AS DateTime), 1052, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1064, 0, 0, N'9109c2ba-10e0-4b1b-a403-6b819bbac0f6', N'Thời trang', NULL, NULL, CAST(N'2016-04-06 13:59:00.630' AS DateTime), 1062, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1061, 0, 0, N'1578e266-12c6-410e-9a37-705153622ce0', N'Giới thiệu', NULL, NULL, CAST(N'2016-04-06 16:06:17.043' AS DateTime), 1055, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1051, 0, 0, N'40b31455-abe2-496e-8552-70fb9b5a8b9b', N'Trang Chủ', NULL, NULL, CAST(N'2017-01-08 16:34:29.037' AS DateTime), 1049, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1051, 0, 0, N'0b3b0c10-04d4-4150-a3f5-7364080a2b97', N'Trang Chủ', NULL, NULL, CAST(N'2016-04-05 13:46:06.447' AS DateTime), 1049, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1064, 0, 0, N'ee4812fa-927a-4a0e-8bad-742d43c4b313', N'Thời trang', NULL, NULL, CAST(N'2017-01-08 17:04:41.350' AS DateTime), 1062, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1076, 0, 0, N'3908088c-6865-45d9-a9bc-7ac46b4c03a7', N'Rồng phụng 1 (1)', NULL, NULL, CAST(N'2016-04-06 16:54:38.843' AS DateTime), 1057, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1061, 0, 0, N'c8e15daf-b350-4421-91d8-8733accf459e', N'Giới thiệu', NULL, NULL, CAST(N'2016-04-06 16:02:16.983' AS DateTime), 1055, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1083, 0, 0, N'b00da800-28a1-4700-a700-87f682d7e6e9', N'Rồng phụng 1 (8)', NULL, NULL, CAST(N'2016-04-06 16:55:35.020' AS DateTime), 1057, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1051, 0, 0, N'0a704ff3-cc23-4db9-85df-8d50fc37efbf', N'Trang Chủ', NULL, NULL, CAST(N'2016-04-06 14:00:45.803' AS DateTime), 1049, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1051, 0, 0, N'54aa5a90-c79e-4c01-9891-8da238d90341', N'Trang Chủ', NULL, NULL, CAST(N'2017-01-08 17:53:47.330' AS DateTime), 1049, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1096, 0, 0, N'54ec8e19-1ddd-42dc-bc73-8dd548635909', N'Dịch vụ', NULL, NULL, CAST(N'2017-01-08 16:57:20.567' AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1051, 0, 0, N'f0bda49c-8fc3-4b69-ada0-8f92c5064f85', N'Trang Chủ', NULL, NULL, CAST(N'2017-01-08 16:16:12.227' AS DateTime), 1049, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1061, 0, 0, N'b6f779b1-9ccb-43d7-aa7e-9763a98e138c', N'Giới thiệu', NULL, NULL, CAST(N'2016-04-06 14:23:55.957' AS DateTime), 1055, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1105, 1, 0, N'382747bc-08c2-4e4a-9c0c-97c7a1265ccf', N'Thời Trang', NULL, NULL, CAST(N'2017-01-08 17:06:17.520' AS DateTime), 1101, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1060, 0, 0, N'd0cfce3d-73b7-4b70-a706-97dadad32652', N'Rồng phụng thâm quyến', NULL, NULL, CAST(N'2016-04-13 13:57:35.317' AS DateTime), 1057, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1051, 0, 0, N'd236aeeb-ebc4-4d05-9c3b-9a6487cd3c25', N'Trang Chủ', NULL, NULL, CAST(N'2016-04-05 13:22:00.787' AS DateTime), 1049, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1061, 0, 0, N'0393235a-c6cc-487e-a313-9a81c056471d', N'Giới thiệu', NULL, NULL, CAST(N'2016-04-06 15:52:50.907' AS DateTime), 1055, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1075, 0, 0, N'ddd7dc6f-3740-4bbe-b62a-9b151727b442', N'Rồng phụng 2', NULL, NULL, CAST(N'2016-04-06 16:54:26.620' AS DateTime), 1057, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1060, 1, 0, N'7f404a2e-91e3-42f6-a1e5-9dfd3b263f7e', N'Rồng phụng thâm quyến', NULL, NULL, CAST(N'2016-04-13 14:21:26.313' AS DateTime), 1057, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1051, 0, 0, N'0e9828d0-5dfc-42b4-8f28-9e495312b3f0', N'Trang Chủ', NULL, NULL, CAST(N'2016-04-06 13:46:35.243' AS DateTime), 1049, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1051, 0, 0, N'1bb6b08c-b8b9-4f85-a64f-9fb69abfd6b2', N'Trang Chủ', NULL, NULL, CAST(N'2016-04-12 13:20:09.833' AS DateTime), 1049, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1100, 1, 0, N'9e5427b3-fbf8-44c7-bf68-a03caa807bb2', N'Chụp Hình Cưới', NULL, NULL, CAST(N'2017-01-08 17:01:29.787' AS DateTime), 1093, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1060, 0, 0, N'80b6e65c-d346-484b-b7b9-a10ce547372f', N'Rồng phụng thâm quyến', NULL, NULL, CAST(N'2016-04-13 14:20:04.693' AS DateTime), 1057, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1067, 0, 0, N'a5daf209-1541-4e64-a8b3-a5d4cc71a30a', N'Liên hệ', NULL, NULL, CAST(N'2016-04-06 14:24:21.850' AS DateTime), 1065, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1054, 0, 0, N'f07c9615-89f9-435c-a960-a619a74742a0', N'Rồng phụng trái cây', NULL, NULL, CAST(N'2016-04-05 15:23:37.530' AS DateTime), 1052, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1054, 0, 0, N'320d2a1b-0749-4e46-8509-a6740b59696f', N'Rồng phụng trái cây', NULL, NULL, CAST(N'2016-04-05 15:46:40.877' AS DateTime), 1052, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1082, 0, 0, N'b4edf91b-83cb-4ec4-88db-abf87c8ced06', N'Rồng phụng 1 (7)', NULL, NULL, CAST(N'2016-04-06 16:55:29.083' AS DateTime), 1057, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1060, 0, 0, N'641deaa3-5cac-4217-a44a-af90be9d18fb', N'Rồng phụng thâm quyến', NULL, NULL, CAST(N'2016-04-13 14:21:13.203' AS DateTime), 1057, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1051, 0, 0, N'ca355191-3b9b-4a47-998f-af9572dc2f2c', N'Trang Chủ', NULL, NULL, CAST(N'2017-01-08 16:17:31.177' AS DateTime), 1049, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1081, 0, 0, N'1db2a172-fe8d-4538-bd05-b605b647aad1', N'Rồng phụng 1 (6)', NULL, NULL, CAST(N'2016-04-06 16:55:19.273' AS DateTime), 1057, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1082, 1, 0, N'8f70a7ce-4378-412c-b7ea-b9d812c98f6b', N'Rồng phụng 9', NULL, NULL, CAST(N'2016-04-06 16:56:38.443' AS DateTime), 1057, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1077, 1, 0, N'a5dafcb1-40a8-4e45-983b-bd4990a09a8d', N'Rồng phụng 4', NULL, NULL, CAST(N'2016-04-06 16:55:55.617' AS DateTime), 1057, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1051, 0, 0, N'513f7a26-d9ad-449e-a18c-c2c494483c37', N'Trang Chủ', NULL, NULL, CAST(N'2017-01-08 16:12:26.130' AS DateTime), 1049, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1097, 1, 0, N'b17ed075-fc03-4823-915c-c2f42e6bbbee', N'Dịch vụ', NULL, NULL, CAST(N'2017-01-08 17:06:17.527' AS DateTime), NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1079, 1, 0, N'46fb7960-012a-4195-8095-c54a538af568', N'Rồng phụng 6', NULL, NULL, CAST(N'2016-04-06 16:56:11.350' AS DateTime), 1057, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1051, 0, 0, N'aeee99cc-07a0-4bf8-8c40-c595fc138103', N'Trang Chủ', NULL, NULL, CAST(N'2017-01-08 17:20:37.217' AS DateTime), 1049, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1091, 0, 0, N'7c3727a4-9a60-4323-99a5-cb6a96f5fc0f', N'Album Ảnh', NULL, NULL, CAST(N'2017-01-08 16:41:38.213' AS DateTime), 1062, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1067, 1, 0, N'ae6cde7e-dbff-4194-b987-ce007c079900', N'Liên hệ', NULL, NULL, CAST(N'2017-01-08 17:06:17.537' AS DateTime), 1065, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1061, 0, 0, N'5ccae885-baf3-478d-98b2-ce66df496a95', N'Giới thiệu', NULL, NULL, CAST(N'2016-04-06 16:01:30.107' AS DateTime), 1055, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1083, 1, 0, N'19225619-e1fe-4985-b5f1-cef60a265740', N'Rồng phụng 10', NULL, NULL, CAST(N'2016-04-06 16:56:45.920' AS DateTime), 1057, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1079, 0, 0, N'173e0cc7-269c-4d3f-92c1-d2493fa77067', N'Rồng phụng 1 (4)', NULL, NULL, CAST(N'2016-04-06 16:55:03.553' AS DateTime), 1057, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1091, 1, 0, N'cf5a2a93-1698-431c-8632-d328f668e2d8', N'Album Ảnh', NULL, NULL, CAST(N'2017-01-08 17:06:17.510' AS DateTime), 1062, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1054, 0, 0, N'a70a6727-ec61-46b0-8add-d519d5665122', N'Rồng phụng trái cây', NULL, NULL, CAST(N'2017-01-08 16:42:06.663' AS DateTime), 1052, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1078, 1, 0, N'2a376053-1beb-43b8-b2df-d601f35ce4d4', N'Rồng phụng 5', NULL, NULL, CAST(N'2016-04-06 16:56:03.513' AS DateTime), 1057, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1051, 0, 0, N'04956f8b-b357-4faa-bfde-d6ccea57d318', N'Trang Chủ', NULL, NULL, CAST(N'2017-01-08 16:15:48.533' AS DateTime), 1049, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1051, 0, 0, N'5f8d5863-3134-4944-80eb-dd307184b4af', N'Trang Chủ', NULL, NULL, CAST(N'2017-01-08 16:58:35.863' AS DateTime), 1049, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1067, 0, 0, N'acedaf91-94a7-4efd-8d12-e03211fbeaaa', N'Liên hệ', NULL, NULL, CAST(N'2016-04-06 13:59:00.863' AS DateTime), 1065, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1095, 0, 0, N'5bf2a256-2b5c-4c34-919a-e22019bba8db', N'Dịch vụ', NULL, NULL, CAST(N'2017-01-08 16:56:21.220' AS DateTime), NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1075, 0, 0, N'bc50949e-2d1e-44e6-a141-e7184707ced2', N'Rồng phụng 1 (1)', NULL, NULL, CAST(N'2016-04-06 16:54:17.677' AS DateTime), 1057, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1051, 0, 0, N'cd9f99b3-f51f-4426-ba64-ec743120f067', N'Trang Chủ', NULL, NULL, CAST(N'2016-04-06 13:58:59.770' AS DateTime), 1049, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1081, 1, 0, N'c199d8fd-9ac2-4e4c-9e44-ee991a18b0bd', N'Rồng phụng 8', NULL, NULL, CAST(N'2016-04-06 16:56:30.210' AS DateTime), 1057, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1060, 0, 0, N'234ee45c-16b0-4249-bca5-f3db02bfc504', N'Rồng phụng thâm quyến', NULL, NULL, CAST(N'2016-04-13 14:19:06.417' AS DateTime), 1057, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1076, 1, 0, N'46d386db-1713-4cdc-9d7a-f75ae79daf02', N'Rồng phụng 3', NULL, NULL, CAST(N'2016-04-06 16:55:46.270' AS DateTime), 1057, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1051, 1, 0, N'3e017249-2472-43b9-b323-f7cb117ecdb9', N'Trang Chủ', NULL, NULL, CAST(N'2017-01-08 20:16:50.677' AS DateTime), 1049, 1)
GO
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [newest]) VALUES (1051, 0, 0, N'59fdce3a-a268-41b9-9a7b-fc1c515b6b83', N'Trang Chủ', NULL, NULL, CAST(N'2016-04-05 11:08:50.610' AS DateTime), 1049, 0)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1048, 1047, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1050, 1049, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1053, 1052, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1056, 1055, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1059, 1057, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1063, 1062, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1066, 1065, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1094, 1093, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1102, 1101, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1104, 1103, 1)
SET IDENTITY_INSERT [dbo].[cmsLanguageText] ON 

INSERT [dbo].[cmsLanguageText] ([pk], [languageId], [UniqueId], [value]) VALUES (1, 2, N'74da9dfa-964c-4e98-a5f5-74f6640f1663', N'Trang Tinh toan')
INSERT [dbo].[cmsLanguageText] ([pk], [languageId], [UniqueId], [value]) VALUES (2, 1, N'74da9dfa-964c-4e98-a5f5-74f6640f1663', N'Calucaltor paga')
SET IDENTITY_INSERT [dbo].[cmsLanguageText] OFF
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1051, N'13c73743-50ed-482d-8fef-25839c46f9ff', CAST(N'2017-01-08 17:17:15.137' AS DateTime), N'<Homepage id="1051" key="03c97828-eb70-410c-a4a0-39b92ca110b5" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-04-05T11:08:50" updateDate="2017-01-08T17:17:15" nodeName="Trang Chủ" urlName="trang-chủ" path="-1,1051" isDoc="" nodeType="1050" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1049" nodeTypeAlias="Homepage"><hideInNavigation>0</hideInNavigation><pagetitle><![CDATA[Hải Diễm Studio]]></pagetitle><pageName><![CDATA[Hải Diễm Studio]]></pageName><facebookLink><![CDATA[https://www.facebook.com/cao.hoangvu]]></facebookLink><bannerImage><![CDATA[[
  {
    "image": "1090",
    "link": "1051"
  },
  {
    "image": "1088",
    "link": "1054"
  },
  {
    "image": "1089",
    "link": "1064"
  }
]]]></bannerImage><copyright><![CDATA[Hải Diễm Studio]]></copyright><siteName><![CDATA[Trang chủ]]></siteName><productHightlight><![CDATA[1060,1079,1083]]></productHightlight></Homepage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1051, N'a8cf7d00-85c0-4025-b273-282210c591c6', CAST(N'2017-01-08 17:19:21.083' AS DateTime), N'<Homepage id="1051" key="03c97828-eb70-410c-a4a0-39b92ca110b5" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-04-05T11:08:50" updateDate="2017-01-08T17:19:21" nodeName="Trang Chủ" urlName="trang-chủ" path="-1,1051" isDoc="" nodeType="1050" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1049" nodeTypeAlias="Homepage"><hideInNavigation>0</hideInNavigation><pagetitle><![CDATA[Hải Diễm Studio]]></pagetitle><pageName><![CDATA[Hải Diễm Studio]]></pageName><twitterLink><![CDATA[https://twitter.com/]]></twitterLink><facebookLink><![CDATA[https://www.facebook.com/cao.hoangvu]]></facebookLink><bannerImage><![CDATA[[
  {
    "image": "1090",
    "link": "1051"
  },
  {
    "image": "1088",
    "link": "1054"
  },
  {
    "image": "1089",
    "link": "1064"
  }
]]]></bannerImage><copyright><![CDATA[Hải Diễm Studio]]></copyright><siteName><![CDATA[Trang chủ]]></siteName><productHightlight><![CDATA[1060,1079,1083]]></productHightlight></Homepage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1051, N'1122711b-dd7c-407e-8841-3f3d4448e354', CAST(N'2016-04-05 13:45:37.230' AS DateTime), N'<Homepage id="1051" key="03c97828-eb70-410c-a4a0-39b92ca110b5" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-04-05T11:08:50" updateDate="2016-04-05T13:45:37" nodeName="Trang Chủ" urlName="trang-chủ" path="-1,1051" isDoc="" nodeType="1050" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1049" nodeTypeAlias="Homepage"><hideInNavigation>0</hideInNavigation><pagetitle><![CDATA[Rongphunghaidiem | Trang chủ]]></pagetitle><pageName><![CDATA[Trang Chủ]]></pageName><copyright><![CDATA[RongPhungHaiDiem]]></copyright><siteName><![CDATA[Rồng Phụng Hải Diễm]]></siteName></Homepage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1051, N'fb6bd512-7204-4a0b-a6bc-4e481b9a16b0', CAST(N'2016-04-05 13:45:03.573' AS DateTime), N'<Homepage id="1051" key="03c97828-eb70-410c-a4a0-39b92ca110b5" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-04-05T11:08:50" updateDate="2016-04-05T13:45:03" nodeName="Trang Chủ" urlName="trang-chủ" path="-1,1051" isDoc="" nodeType="1050" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1049" nodeTypeAlias="Homepage"><hideInNavigation>0</hideInNavigation><pagetitle><![CDATA[Rongphunghaidiem | Trang chủ]]></pagetitle><pageName><![CDATA[Trang Chủ]]></pageName><copyright><![CDATA[RongPhungHaiDiem]]></copyright><siteName><![CDATA[RongPhungHaiDiem]]></siteName></Homepage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1051, N'8e3f5936-254c-4afd-8645-54c9f1e69a53', CAST(N'2016-04-29 10:45:23.760' AS DateTime), N'<Homepage id="1051" key="03c97828-eb70-410c-a4a0-39b92ca110b5" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-04-05T11:08:50" updateDate="2016-04-29T10:45:23" nodeName="Trang Chủ" urlName="trang-chủ" path="-1,1051" isDoc="" nodeType="1050" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1049" nodeTypeAlias="Homepage"><hideInNavigation>0</hideInNavigation><pagetitle><![CDATA[Trang chủ]]></pagetitle><pageName><![CDATA[Trang Chủ]]></pageName><bannerImage><![CDATA[[
  {
    "image": "1084",
    "link": "1051"
  },
  {
    "image": "1085",
    "link": "1054"
  }
]]]></bannerImage><copyright><![CDATA[RongPhungHaiDiem]]></copyright><siteName><![CDATA[Rồng Phụng Hải Diễm]]></siteName><productHightlight><![CDATA[1060,1079,1083]]></productHightlight></Homepage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1051, N'f7ebfe78-f3e5-4649-ae4f-552b71efd81e', CAST(N'2017-01-08 17:16:24.717' AS DateTime), N'<Homepage id="1051" key="03c97828-eb70-410c-a4a0-39b92ca110b5" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-04-05T11:08:50" updateDate="2017-01-08T17:16:24" nodeName="Trang Chủ" urlName="trang-chủ" path="-1,1051" isDoc="" nodeType="1050" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1049" nodeTypeAlias="Homepage"><hideInNavigation>0</hideInNavigation><pagetitle><![CDATA[Hải Diễm Studio]]></pagetitle><pageName><![CDATA[Hải Diễm Studio]]></pageName><facebookLink><![CDATA[facebook.com/hai.diem.7]]></facebookLink><bannerImage><![CDATA[[
  {
    "image": "1090",
    "link": "1051"
  },
  {
    "image": "1088",
    "link": "1054"
  },
  {
    "image": "1089",
    "link": "1064"
  }
]]]></bannerImage><copyright><![CDATA[Hải Diễm Studio]]></copyright><siteName><![CDATA[Trang chủ]]></siteName><productHightlight><![CDATA[1060,1079,1083]]></productHightlight></Homepage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1051, N'277ea9b0-a629-4f79-a5b4-667d8f38b160', CAST(N'2016-04-06 13:59:56.007' AS DateTime), N'<Homepage id="1051" key="03c97828-eb70-410c-a4a0-39b92ca110b5" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-04-05T11:08:50" updateDate="2016-04-06T13:59:55" nodeName="Trang Chủ" urlName="trang-chủ" path="-1,1051" isDoc="" nodeType="1050" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1049" nodeTypeAlias="Homepage"><hideInNavigation>0</hideInNavigation><pagetitle><![CDATA[Trang chủ]]></pagetitle><pageName><![CDATA[Trang Chủ]]></pageName><copyright><![CDATA[RongPhungHaiDiem]]></copyright><siteName><![CDATA[Rồng Phụng Hải Diễm]]></siteName></Homepage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1051, N'40b31455-abe2-496e-8552-70fb9b5a8b9b', CAST(N'2017-01-08 16:34:29.070' AS DateTime), N'<Homepage id="1051" key="03c97828-eb70-410c-a4a0-39b92ca110b5" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-04-05T11:08:50" updateDate="2017-01-08T16:34:29" nodeName="Trang Chủ" urlName="trang-chủ" path="-1,1051" isDoc="" nodeType="1050" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1049" nodeTypeAlias="Homepage"><hideInNavigation>0</hideInNavigation><pagetitle><![CDATA[Hải Diễm Studio]]></pagetitle><pageName><![CDATA[Hải Diễm Studio]]></pageName><bannerImage><![CDATA[[
  {
    "image": "1087",
    "link": "1051"
  },
  {
    "image": "1088",
    "link": "1054"
  },
  {
    "image": "1089",
    "link": "1064"
  }
]]]></bannerImage><copyright><![CDATA[Hải Diễm Studio]]></copyright><siteName><![CDATA[Trang chủ]]></siteName><productHightlight><![CDATA[1060,1079,1083]]></productHightlight></Homepage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1051, N'0b3b0c10-04d4-4150-a3f5-7364080a2b97', CAST(N'2016-04-05 13:46:06.470' AS DateTime), N'<Homepage id="1051" key="03c97828-eb70-410c-a4a0-39b92ca110b5" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-04-05T11:08:50" updateDate="2016-04-05T13:46:06" nodeName="Trang Chủ" urlName="trang-chủ" path="-1,1051" isDoc="" nodeType="1050" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1049" nodeTypeAlias="Homepage"><hideInNavigation>0</hideInNavigation><pagetitle><![CDATA[Trang chủ]]></pagetitle><pageName><![CDATA[Trang Chủ]]></pageName><copyright><![CDATA[RongPhungHaiDiem]]></copyright><siteName><![CDATA[Rồng Phụng Hải Diễm]]></siteName></Homepage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1051, N'0a704ff3-cc23-4db9-85df-8d50fc37efbf', CAST(N'2016-04-06 14:00:46.210' AS DateTime), N'<Homepage id="1051" key="03c97828-eb70-410c-a4a0-39b92ca110b5" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-04-05T11:08:50" updateDate="2016-04-06T14:00:45" nodeName="Trang Chủ" urlName="trang-chủ" path="-1,1051" isDoc="" nodeType="1050" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1049" nodeTypeAlias="Homepage"><hideInNavigation>0</hideInNavigation><pagetitle><![CDATA[Trang chủ]]></pagetitle><pageName><![CDATA[Trang Chủ]]></pageName><bannerImage><![CDATA[[
  {
    "image": "1069",
    "link": "1051"
  },
  {
    "image": "1070",
    "link": "1060"
  }
]]]></bannerImage><copyright><![CDATA[RongPhungHaiDiem]]></copyright><siteName><![CDATA[Rồng Phụng Hải Diễm]]></siteName></Homepage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1051, N'54aa5a90-c79e-4c01-9891-8da238d90341', CAST(N'2017-01-08 17:53:47.363' AS DateTime), N'<Homepage id="1051" key="03c97828-eb70-410c-a4a0-39b92ca110b5" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-04-05T11:08:50" updateDate="2017-01-08T17:53:47" nodeName="Trang Chủ" urlName="trang-chủ" path="-1,1051" isDoc="" nodeType="1050" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1049" nodeTypeAlias="Homepage"><hideInNavigation>0</hideInNavigation><pagetitle><![CDATA[Hải Diễm Studio]]></pagetitle><pageName><![CDATA[Hải Diễm Studio]]></pageName><twitterLink><![CDATA[https://twitter.com/]]></twitterLink><facebookLink><![CDATA[https://www.facebook.com/cao.hoangvu]]></facebookLink><instagramLink><![CDATA[https://www.instagram.com/]]></instagramLink><googleplusLink><![CDATA[http://feedburner.google.com/fb/a/mailverify?uri=tympanus&loc=en_US]]></googleplusLink><bannerImage><![CDATA[[
  {
    "image": "1090",
    "link": "1051"
  },
  {
    "image": "1088",
    "link": "1054"
  },
  {
    "image": "1089",
    "link": "1064"
  }
]]]></bannerImage><copyright><![CDATA[Hải Diễm Studio]]></copyright><siteName><![CDATA[Trang chủ]]></siteName><productHightlight><![CDATA[1060,1079,1083]]></productHightlight></Homepage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1051, N'f0bda49c-8fc3-4b69-ada0-8f92c5064f85', CAST(N'2017-01-08 16:16:12.233' AS DateTime), N'<Homepage id="1051" key="03c97828-eb70-410c-a4a0-39b92ca110b5" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-04-05T11:08:50" updateDate="2017-01-08T16:16:12" nodeName="Trang Chủ" urlName="trang-chủ" path="-1,1051" isDoc="" nodeType="1050" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1049" nodeTypeAlias="Homepage"><hideInNavigation>0</hideInNavigation><pagetitle><![CDATA[Hải Diễm Studio]]></pagetitle><pageName><![CDATA[Hải Diễm Studio]]></pageName><bannerImage><![CDATA[[
  {
    "image": "1084",
    "link": "1051"
  },
  {
    "image": "1085",
    "link": "1054"
  }
]]]></bannerImage><copyright><![CDATA[RongPhungHaiDiem]]></copyright><siteName><![CDATA[Trang Chủ]]></siteName><productHightlight><![CDATA[1060,1079,1083]]></productHightlight></Homepage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1051, N'd236aeeb-ebc4-4d05-9c3b-9a6487cd3c25', CAST(N'2016-04-05 13:22:00.827' AS DateTime), N'<Homepage id="1051" key="03c97828-eb70-410c-a4a0-39b92ca110b5" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-04-05T11:08:50" updateDate="2016-04-05T13:22:00" nodeName="Trang Chủ" urlName="trang-chủ" path="-1,1051" isDoc="" nodeType="1050" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1049" nodeTypeAlias="Homepage"><hideInNavigation>0</hideInNavigation><pagetitle><![CDATA[Rongphunghaidiem | Trang chủ]]></pagetitle><pageName><![CDATA[Trang Chủ]]></pageName><copyright><![CDATA[RongPhungHaiDiem]]></copyright></Homepage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1051, N'0e9828d0-5dfc-42b4-8f28-9e495312b3f0', CAST(N'2016-04-06 13:46:35.273' AS DateTime), N'<Homepage id="1051" key="03c97828-eb70-410c-a4a0-39b92ca110b5" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-04-05T11:08:50" updateDate="2016-04-06T13:46:35" nodeName="Trang Chủ" urlName="trang-chủ" path="-1,1051" isDoc="" nodeType="1050" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1049" nodeTypeAlias="Homepage"><hideInNavigation>0</hideInNavigation><pagetitle><![CDATA[Trang chủ]]></pagetitle><pageName><![CDATA[Trang Chủ]]></pageName><bannerImage>1069</bannerImage><copyright><![CDATA[RongPhungHaiDiem]]></copyright><siteName><![CDATA[Rồng Phụng Hải Diễm]]></siteName></Homepage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1051, N'1bb6b08c-b8b9-4f85-a64f-9fb69abfd6b2', CAST(N'2016-04-12 13:20:09.910' AS DateTime), N'<Homepage id="1051" key="03c97828-eb70-410c-a4a0-39b92ca110b5" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-04-05T11:08:50" updateDate="2016-04-12T13:20:09" nodeName="Trang Chủ" urlName="trang-chủ" path="-1,1051" isDoc="" nodeType="1050" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1049" nodeTypeAlias="Homepage"><hideInNavigation>0</hideInNavigation><pagetitle><![CDATA[Trang chủ]]></pagetitle><pageName><![CDATA[Trang Chủ]]></pageName><bannerImage><![CDATA[[
  {
    "image": "1084",
    "link": "1051"
  },
  {
    "image": "1085",
    "link": "1054"
  }
]]]></bannerImage><copyright><![CDATA[RongPhungHaiDiem]]></copyright><siteName><![CDATA[Rồng Phụng Hải Diễm]]></siteName></Homepage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1051, N'ca355191-3b9b-4a47-998f-af9572dc2f2c', CAST(N'2017-01-08 16:17:31.203' AS DateTime), N'<Homepage id="1051" key="03c97828-eb70-410c-a4a0-39b92ca110b5" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-04-05T11:08:50" updateDate="2017-01-08T16:17:31" nodeName="Trang Chủ" urlName="trang-chủ" path="-1,1051" isDoc="" nodeType="1050" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1049" nodeTypeAlias="Homepage"><hideInNavigation>0</hideInNavigation><pagetitle><![CDATA[Hải Diễm Studio]]></pagetitle><pageName><![CDATA[Hải Diễm Studio]]></pageName><bannerImage><![CDATA[[
  {
    "image": "1084",
    "link": "1051"
  },
  {
    "image": "1085",
    "link": "1054"
  }
]]]></bannerImage><copyright><![CDATA[Hải Diễm Studio]]></copyright><siteName><![CDATA[Trang chủ]]></siteName><productHightlight><![CDATA[1060,1079,1083]]></productHightlight></Homepage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1051, N'513f7a26-d9ad-449e-a18c-c2c494483c37', CAST(N'2017-01-08 16:12:26.527' AS DateTime), N'<Homepage id="1051" key="03c97828-eb70-410c-a4a0-39b92ca110b5" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-04-05T11:08:50" updateDate="2017-01-08T16:12:26" nodeName="Trang Chủ" urlName="trang-chủ" path="-1,1051" isDoc="" nodeType="1050" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1049" nodeTypeAlias="Homepage"><hideInNavigation>0</hideInNavigation><pagetitle><![CDATA[Trang chủ]]></pagetitle><pageName><![CDATA[Trang Chủ]]></pageName><bannerImage><![CDATA[[
  {
    "image": "1084",
    "link": "1051"
  },
  {
    "image": "1085",
    "link": "1054"
  }
]]]></bannerImage><copyright><![CDATA[RongPhungHaiDiem]]></copyright><siteName><![CDATA[Hải Diễm Studio]]></siteName><productHightlight><![CDATA[1060,1079,1083]]></productHightlight></Homepage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1051, N'aeee99cc-07a0-4bf8-8c40-c595fc138103', CAST(N'2017-01-08 17:20:37.243' AS DateTime), N'<Homepage id="1051" key="03c97828-eb70-410c-a4a0-39b92ca110b5" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-04-05T11:08:50" updateDate="2017-01-08T17:20:37" nodeName="Trang Chủ" urlName="trang-chủ" path="-1,1051" isDoc="" nodeType="1050" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1049" nodeTypeAlias="Homepage"><hideInNavigation>0</hideInNavigation><pagetitle><![CDATA[Hải Diễm Studio]]></pagetitle><pageName><![CDATA[Hải Diễm Studio]]></pageName><twitterLink><![CDATA[https://twitter.com/]]></twitterLink><facebookLink><![CDATA[https://www.facebook.com/cao.hoangvu]]></facebookLink><instagramLink><![CDATA[https://www.instagram.com/]]></instagramLink><googleplusLink><![CDATA[https://plus.google.com/]]></googleplusLink><bannerImage><![CDATA[[
  {
    "image": "1090",
    "link": "1051"
  },
  {
    "image": "1088",
    "link": "1054"
  },
  {
    "image": "1089",
    "link": "1064"
  }
]]]></bannerImage><copyright><![CDATA[Hải Diễm Studio]]></copyright><siteName><![CDATA[Trang chủ]]></siteName><productHightlight><![CDATA[1060,1079,1083]]></productHightlight></Homepage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1051, N'04956f8b-b357-4faa-bfde-d6ccea57d318', CAST(N'2017-01-08 16:15:48.597' AS DateTime), N'<Homepage id="1051" key="03c97828-eb70-410c-a4a0-39b92ca110b5" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-04-05T11:08:50" updateDate="2017-01-08T16:15:48" nodeName="Trang Chủ" urlName="trang-chủ" path="-1,1051" isDoc="" nodeType="1050" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1049" nodeTypeAlias="Homepage"><hideInNavigation>0</hideInNavigation><pagetitle><![CDATA[Trang chủ]]></pagetitle><pageName><![CDATA[Hải Diễm Studio]]></pageName><bannerImage><![CDATA[[
  {
    "image": "1084",
    "link": "1051"
  },
  {
    "image": "1085",
    "link": "1054"
  }
]]]></bannerImage><copyright><![CDATA[RongPhungHaiDiem]]></copyright><siteName><![CDATA[Trang Chủ]]></siteName><productHightlight><![CDATA[1060,1079,1083]]></productHightlight></Homepage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1051, N'5f8d5863-3134-4944-80eb-dd307184b4af', CAST(N'2017-01-08 16:58:35.877' AS DateTime), N'<Homepage id="1051" key="03c97828-eb70-410c-a4a0-39b92ca110b5" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-04-05T11:08:50" updateDate="2017-01-08T16:58:35" nodeName="Trang Chủ" urlName="trang-chủ" path="-1,1051" isDoc="" nodeType="1050" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1049" nodeTypeAlias="Homepage"><hideInNavigation>0</hideInNavigation><pagetitle><![CDATA[Hải Diễm Studio]]></pagetitle><pageName><![CDATA[Hải Diễm Studio]]></pageName><bannerImage><![CDATA[[
  {
    "image": "1090",
    "link": "1051"
  },
  {
    "image": "1088",
    "link": "1054"
  },
  {
    "image": "1089",
    "link": "1064"
  }
]]]></bannerImage><copyright><![CDATA[Hải Diễm Studio]]></copyright><siteName><![CDATA[Trang chủ]]></siteName><productHightlight><![CDATA[1060,1079,1083]]></productHightlight></Homepage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1051, N'cd9f99b3-f51f-4426-ba64-ec743120f067', CAST(N'2016-04-06 13:59:00.110' AS DateTime), N'<Homepage id="1051" key="03c97828-eb70-410c-a4a0-39b92ca110b5" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-04-05T11:08:50" updateDate="2016-04-06T13:58:59" nodeName="Trang Chủ" urlName="trang-chủ" path="-1,1051" isDoc="" nodeType="1050" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1049" nodeTypeAlias="Homepage"><hideInNavigation>0</hideInNavigation><pagetitle><![CDATA[Trang chủ]]></pagetitle><pageName><![CDATA[Trang Chủ]]></pageName><bannerImage><![CDATA[1069,1070]]></bannerImage><copyright><![CDATA[RongPhungHaiDiem]]></copyright><siteName><![CDATA[Rồng Phụng Hải Diễm]]></siteName></Homepage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1051, N'3e017249-2472-43b9-b323-f7cb117ecdb9', CAST(N'2017-01-08 20:16:50.717' AS DateTime), N'<Homepage id="1051" key="03c97828-eb70-410c-a4a0-39b92ca110b5" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-04-05T11:08:50" updateDate="2017-01-08T20:16:50" nodeName="Trang Chủ" urlName="trang-chủ" path="-1,1051" isDoc="" nodeType="1050" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1049" nodeTypeAlias="Homepage"><hideInNavigation>0</hideInNavigation><pagetitle><![CDATA[Hải Diễm Studio]]></pagetitle><pageName><![CDATA[Hải Diễm Studio]]></pageName><twitterLink><![CDATA[https://twitter.com/]]></twitterLink><facebookLink><![CDATA[https://www.facebook.com/cao.hoangvu]]></facebookLink><instagramLink><![CDATA[https://www.instagram.com/]]></instagramLink><googleplusLink><![CDATA[http://feedburner.google.com/fb/a/mailverify?uri=tympanus&loc=en_US]]></googleplusLink><bannerImage><![CDATA[[
  {
    "image": "1088",
    "link": "1054"
  },
  {
    "image": "1090",
    "link": "1051"
  },
  {
    "image": "1089",
    "link": "1064"
  }
]]]></bannerImage><copyright><![CDATA[Hải Diễm Studio]]></copyright><siteName><![CDATA[Trang chủ]]></siteName><productHightlight><![CDATA[1060,1079,1083]]></productHightlight></Homepage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1051, N'59fdce3a-a268-41b9-9a7b-fc1c515b6b83', CAST(N'2016-04-05 11:08:50.643' AS DateTime), N'<Homepage id="1051" key="03c97828-eb70-410c-a4a0-39b92ca110b5" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-04-05T11:08:50" updateDate="2016-04-05T11:08:50" nodeName="Trang Chủ" urlName="trang-chủ" path="-1,1051" isDoc="" nodeType="1050" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1049" nodeTypeAlias="Homepage"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Trang Chủ]]></pageName><copyright><![CDATA[RongPhungHaiDiem]]></copyright></Homepage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1054, N'82bce98c-1d8a-4ab9-bc09-149be12e0e3b', CAST(N'2016-04-05 15:20:40.850' AS DateTime), N'<RongPhungTraiCay id="1054" key="38fa5bd4-6653-4309-93fe-8763bf2bda58" parentID="1051" level="2" creatorID="0" sortOrder="0" createDate="2016-04-05T15:20:40" updateDate="2016-04-05T15:20:40" nodeName="Rồng phụng trái cây" urlName="rồng-phụng-trái-cây" path="-1,1051,1054" isDoc="" nodeType="1053" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1052" nodeTypeAlias="RongPhungTraiCay"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng trái cây]]></pageName></RongPhungTraiCay>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1054, N'26bc6b27-9bca-45a1-a5a9-286acec584d4', CAST(N'2016-04-07 10:51:10.317' AS DateTime), N'<ProductPage id="1054" key="38fa5bd4-6653-4309-93fe-8763bf2bda58" parentID="1051" level="2" creatorID="0" sortOrder="1" createDate="2016-04-05T15:20:40" updateDate="2016-04-07T10:51:10" nodeName="Rồng phụng trái cây" urlName="rong-phung-trai-cay" path="-1,1051,1054" isDoc="" nodeType="1053" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1052" nodeTypeAlias="ProductPage"><umbracoUrlName><![CDATA[rong-phung-trai-cay]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng trái cây]]></pageName><shownumberofproduct><![CDATA[4]]></shownumberofproduct></ProductPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1054, N'a3936bd3-9633-4eb8-bd23-2dc3cebb3336', CAST(N'2017-01-08 17:06:17.507' AS DateTime), N'<ProductPage id="1054" key="38fa5bd4-6653-4309-93fe-8763bf2bda58" parentID="1051" level="2" creatorID="0" sortOrder="1" createDate="2016-04-05T15:20:40" updateDate="2017-01-08T17:06:17" nodeName="Rồng phụng trái cây" urlName="rong-phung-trai-cay" path="-1,1051,1054" isDoc="" nodeType="1053" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1052" nodeTypeAlias="ProductPage"><umbracoUrlName><![CDATA[rong-phung-trai-cay]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng trái cây]]></pageName><shownumberofproduct><![CDATA[8]]></shownumberofproduct></ProductPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1054, N'96cb3f33-5906-4212-94e4-55faf83e9989', CAST(N'2016-04-12 13:23:33.250' AS DateTime), N'<ProductPage id="1054" key="38fa5bd4-6653-4309-93fe-8763bf2bda58" parentID="1051" level="2" creatorID="0" sortOrder="1" createDate="2016-04-05T15:20:40" updateDate="2016-04-12T13:23:33" nodeName="Rồng phụng trái cây" urlName="rong-phung-trai-cay" path="-1,1051,1054" isDoc="" nodeType="1053" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1052" nodeTypeAlias="ProductPage"><umbracoUrlName><![CDATA[rong-phung-trai-cay]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng trái cây]]></pageName><shownumberofproduct><![CDATA[8]]></shownumberofproduct></ProductPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1054, N'f88b72fc-f486-44e4-b9e7-67a9b23bca63', CAST(N'2016-04-06 13:59:00.603' AS DateTime), N'<ProductPage id="1054" key="38fa5bd4-6653-4309-93fe-8763bf2bda58" parentID="1051" level="2" creatorID="0" sortOrder="1" createDate="2016-04-05T15:20:40" updateDate="2016-04-06T13:59:00" nodeName="Rồng phụng trái cây" urlName="rong-phung-trai-cay" path="-1,1051,1054" isDoc="" nodeType="1053" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1052" nodeTypeAlias="ProductPage"><umbracoUrlName><![CDATA[rong-phung-trai-cay]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng trái cây]]></pageName><shownumberofproduct><![CDATA[8]]></shownumberofproduct></ProductPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1054, N'f07c9615-89f9-435c-a960-a619a74742a0', CAST(N'2016-04-05 15:23:37.553' AS DateTime), N'<RongPhungTraiCay id="1054" key="38fa5bd4-6653-4309-93fe-8763bf2bda58" parentID="1051" level="2" creatorID="0" sortOrder="0" createDate="2016-04-05T15:20:40" updateDate="2016-04-05T15:23:37" nodeName="Rồng phụng trái cây" urlName="rong-phung-trai-cay" path="-1,1051,1054" isDoc="" nodeType="1053" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1052" nodeTypeAlias="RongPhungTraiCay"><umbracoUrlName><![CDATA[rong-phung-trai-cay]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng trái cây]]></pageName></RongPhungTraiCay>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1054, N'320d2a1b-0749-4e46-8509-a6740b59696f', CAST(N'2016-04-05 15:46:40.887' AS DateTime), N'<ProductPage id="1054" key="38fa5bd4-6653-4309-93fe-8763bf2bda58" parentID="1051" level="2" creatorID="0" sortOrder="1" createDate="2016-04-05T15:20:40" updateDate="2016-04-05T15:46:40" nodeName="Rồng phụng trái cây" urlName="rong-phung-trai-cay" path="-1,1051,1054" isDoc="" nodeType="1053" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1052" nodeTypeAlias="ProductPage"><umbracoUrlName><![CDATA[rong-phung-trai-cay]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng trái cây]]></pageName></ProductPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1054, N'a70a6727-ec61-46b0-8add-d519d5665122', CAST(N'2017-01-08 16:42:06.673' AS DateTime), N'<ProductPage id="1054" key="38fa5bd4-6653-4309-93fe-8763bf2bda58" parentID="1051" level="2" creatorID="0" sortOrder="2" createDate="2016-04-05T15:20:40" updateDate="2017-01-08T16:42:06" nodeName="Rồng phụng trái cây" urlName="rong-phung-trai-cay" path="-1,1051,1054" isDoc="" nodeType="1053" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1052" nodeTypeAlias="ProductPage"><umbracoUrlName><![CDATA[rong-phung-trai-cay]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng trái cây]]></pageName><shownumberofproduct><![CDATA[8]]></shownumberofproduct></ProductPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1060, N'21eb0807-b5ec-4c86-83c2-05e74085ca68', CAST(N'2016-04-12 13:45:12.880' AS DateTime), N'<ProductItem id="1060" key="2013ba88-b3f3-42b6-905a-a8a0e70712af" parentID="1054" level="3" creatorID="0" sortOrder="0" createDate="2016-04-05T15:42:51" updateDate="2016-04-12T13:45:12" nodeName="Rồng phụng 1" urlName="rồng-phụng-1" path="-1,1051,1054,1060" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng thâm quyến]]></pageName><hinhAnh>1074</hinhAnh><price><![CDATA[500,000 ]]></price></ProductItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1060, N'8112a8b0-7c8c-4beb-b46c-1090cd411e33', CAST(N'2016-04-13 14:02:25.360' AS DateTime), N'<ProductItem id="1060" key="2013ba88-b3f3-42b6-905a-a8a0e70712af" parentID="1054" level="3" creatorID="0" sortOrder="0" createDate="2016-04-05T15:42:51" updateDate="2016-04-13T14:02:25" nodeName="Rồng phụng thâm quyến" urlName="rong-phung-tham-quyen" path="-1,1051,1054,1060" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><umbracoUrlName><![CDATA[rong-phung-tham-quyen]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng thâm quyến]]></pageName><hinhAnh>1074</hinhAnh><price><![CDATA[500,000 ]]></price><moTa><![CDATA[<p>Rồng phụng trái cây được kết rất cầu kỳ, khéo léo từ các loại trái cây tươi ngon, bắt mắt thì những con rồng long phụng rất tinh xảo sóng động như thật, nhất là loại rồng phụng cao cấp chuyển động. Ngoài ra, Rồng phượng là biểu tượng âm dương rất mạnh trong thần thoại. Rồng tượng trưng cho sức mạnh của nam. Phượng tượng trưng cho sự kiều diễm và vẻ đẹp nữ tính khi đặt bên cạnh rồng. Cho nên trên bàn thờ lễ gia tiên đặt một đôi rồng phụng vừa tạo cảnh đẹp mắt. long trọng của buổi lễ vừa tạo nên phong thủy tích cực, tốt đẹp cho cuộc sống hôn nhân của đôi lứa sau này</p>]]></moTa></ProductItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1060, N'451c8e02-903f-4a40-8793-123e2217059c', CAST(N'2016-04-13 14:09:09.197' AS DateTime), N'<ProductItem id="1060" key="2013ba88-b3f3-42b6-905a-a8a0e70712af" parentID="1054" level="3" creatorID="0" sortOrder="0" createDate="2016-04-05T15:42:51" updateDate="2016-04-13T14:09:09" nodeName="Rồng phụng thâm quyến" urlName="rong-phung-tham-quyen" path="-1,1051,1054,1060" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><umbracoUrlName><![CDATA[rong-phung-tham-quyen]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng thâm quyến]]></pageName><hinhAnh>1074</hinhAnh><price><![CDATA[500,000 ]]></price><moTa><![CDATA[<p>Rồng phụng trái cây được kết rất cầu kỳ, khéo léo từ các loại trái cây tươi ngon, bắt mắt thì những con rồng long phụng rất tinh xảo sóng động như thật, nhất là loại rồng phụng cao cấp chuyển động.</p>
<p>Ngoài ra, Rồng phượng là biểu tượng âm dương rất mạnh trong thần thoại.</p>
<p>Rồng tượng trưng cho sức mạnh của nam.</p>
<p>Phượng tượng trưng cho sự kiều diễm và vẻ đẹp nữ tính khi đặt bên cạnh rồng. Cho nên trên bàn thờ lễ gia tiên đặt một đôi rồng phụng vừa tạo cảnh đẹp mắt. long trọng của buổi lễ vừa tạo nên phong thủy tích cực, tốt đẹp cho cuộc sống hôn nhân của đôi lứa sau này</p>]]></moTa></ProductItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1060, N'23447f32-0980-4023-84b5-221a33c50188', CAST(N'2016-04-12 16:10:23.753' AS DateTime), N'<ProductItem id="1060" key="2013ba88-b3f3-42b6-905a-a8a0e70712af" parentID="1054" level="3" creatorID="0" sortOrder="0" createDate="2016-04-05T15:42:51" updateDate="2016-04-12T16:10:23" nodeName="Rồng phụng thâm quyến" urlName="rồng-phụng-thâm-quyến" path="-1,1051,1054,1060" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng thâm quyến]]></pageName><hinhAnh>1074</hinhAnh><price><![CDATA[500,000 ]]></price></ProductItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1060, N'7e06ac74-54b3-47f5-ad3a-46fa745d08f9', CAST(N'2016-04-06 16:52:26.830' AS DateTime), N'<ProductItem id="1060" key="2013ba88-b3f3-42b6-905a-a8a0e70712af" parentID="1054" level="3" creatorID="0" sortOrder="0" createDate="2016-04-05T15:42:51" updateDate="2016-04-06T16:52:26" nodeName="Rồng phụng 1" urlName="rồng-phụng-1" path="-1,1051,1054,1060" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng 1]]></pageName><hinhAnh>1074</hinhAnh></ProductItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1060, N'fceb75cc-76d0-431c-bafa-5243b30e1f6e', CAST(N'2016-04-13 14:20:26.710' AS DateTime), N'<ProductItem id="1060" key="2013ba88-b3f3-42b6-905a-a8a0e70712af" parentID="1054" level="3" creatorID="0" sortOrder="0" createDate="2016-04-05T15:42:51" updateDate="2016-04-13T14:20:26" nodeName="Rồng phụng thâm quyến" urlName="rong-phung-tham-quyen" path="-1,1051,1054,1060" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><umbracoUrlName><![CDATA[rong-phung-tham-quyen]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng thâm quyến]]></pageName><hinhAnh>1074</hinhAnh><price><![CDATA[500,000 ]]></price><phuongThucThanhToan><![CDATA[<p><strong>1.Thanh toán trực tiêp </strong></p>
<p>Quý khách vui lòng liên hệ số điện thoại 0982357990 để đặt hàng và thanh toán ngay sau khi nhận hàng<br /><br /><strong>2.Chuyển khoản ngân hàng</strong></p>
<p>Để thuận tiện cho quý khách chúng tôi cung cấp phương thức chuyển khoản ngân hàng . Quý khách chỉ cần chuyển khoản số tiền và quý khách đã đặt mua sản phẩm đên tài khoản của chúng tôi.Ngay sau khi nhận được tiền chúng tôi sẽ tiến hành giao hàng cho quý khách<br /> Thông tin ngân hàng<br />VietComBank chi nhánh Tp Hồ chí minh . <br />Số tài khoản :123456789</p>]]></phuongThucThanhToan><moTa><![CDATA[<p>Rồng phụng trái cây được kết rất cầu kỳ, khéo léo từ các loại trái cây tươi ngon, bắt mắt thì những con rồng long phụng rất tinh xảo sóng động như thật, nhất là loại rồng phụng cao cấp chuyển động.</p>
<p>Ngoài ra, Rồng phượng là biểu tượng âm dương rất mạnh trong thần thoại.</p>
<p>Rồng tượng trưng cho sức mạnh của nam.</p>
<p>Phượng tượng trưng cho sự kiều diễm và vẻ đẹp nữ tính khi đặt bên cạnh rồng. Cho nên trên bàn thờ lễ gia tiên đặt một đôi rồng phụng vừa tạo cảnh đẹp mắt. long trọng của buổi lễ vừa tạo nên phong thủy tích cực, tốt đẹp cho cuộc sống hôn nhân của đôi lứa sau này</p>]]></moTa></ProductItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1060, N'6381e0c1-f449-4f93-836b-64f337104288', CAST(N'2016-04-06 13:59:01.310' AS DateTime), N'<ProductItem id="1060" key="2013ba88-b3f3-42b6-905a-a8a0e70712af" parentID="1054" level="3" creatorID="0" sortOrder="0" createDate="2016-04-05T15:42:51" updateDate="2016-04-06T13:59:01" nodeName="Rồng phụng 1" urlName="rồng-phụng-1" path="-1,1051,1054,1060" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng 1]]></pageName></ProductItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1060, N'd0cfce3d-73b7-4b70-a706-97dadad32652', CAST(N'2016-04-13 13:57:35.377' AS DateTime), N'<ProductItem id="1060" key="2013ba88-b3f3-42b6-905a-a8a0e70712af" parentID="1054" level="3" creatorID="0" sortOrder="0" createDate="2016-04-05T15:42:51" updateDate="2016-04-13T13:57:35" nodeName="Rồng phụng thâm quyến" urlName="rong-phung-tham-quyen" path="-1,1051,1054,1060" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><umbracoUrlName><![CDATA[rong-phung-tham-quyen]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng thâm quyến]]></pageName><hinhAnh>1074</hinhAnh><price><![CDATA[500,000 ]]></price></ProductItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1060, N'7f404a2e-91e3-42f6-a1e5-9dfd3b263f7e', CAST(N'2016-04-13 14:21:26.360' AS DateTime), N'<ProductItem id="1060" key="2013ba88-b3f3-42b6-905a-a8a0e70712af" parentID="1054" level="3" creatorID="0" sortOrder="0" createDate="2016-04-05T15:42:51" updateDate="2016-04-13T14:21:26" nodeName="Rồng phụng thâm quyến" urlName="rong-phung-tham-quyen" path="-1,1051,1054,1060" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><umbracoUrlName><![CDATA[rong-phung-tham-quyen]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng thâm quyến]]></pageName><hinhAnh>1074</hinhAnh><price><![CDATA[500,000 ]]></price><phuongThucThanhToan><![CDATA[<p><strong>1.Thanh toán trực tiêp </strong></p>
<p>Quý khách vui lòng liên hệ số điện thoại 0982357990 để đặt hàng và thanh toán ngay sau khi nhận hàng<br /><br /><strong>2.Chuyển khoản ngân hàng</strong></p>
<p>Để thuận tiện cho quý khách chúng tôi cung cấp phương thức chuyển khoản ngân hàng . Quý khách chỉ cần chuyển khoản số tiền và quý khách đã đặt mua sản phẩm đên tài khoản của chúng tôi.Ngay sau khi nhận được tiền chúng tôi sẽ tiến hành giao hàng cho quý khách<br /><strong><em>Thông tin ngân hàng</em></strong><br /><em>VietComBank chi nhánh Tp Hồ chí minh . </em><br /><em>Số tài khoản :12345678</em>9</p>]]></phuongThucThanhToan><moTa><![CDATA[<p>Rồng phụng trái cây được kết rất cầu kỳ, khéo léo từ các loại trái cây tươi ngon, bắt mắt thì những con rồng long phụng rất tinh xảo sóng động như thật, nhất là loại rồng phụng cao cấp chuyển động.</p>
<p>Ngoài ra, Rồng phượng là biểu tượng âm dương rất mạnh trong thần thoại.</p>
<p>Rồng tượng trưng cho sức mạnh của nam.</p>
<p>Phượng tượng trưng cho sự kiều diễm và vẻ đẹp nữ tính khi đặt bên cạnh rồng. Cho nên trên bàn thờ lễ gia tiên đặt một đôi rồng phụng vừa tạo cảnh đẹp mắt. long trọng của buổi lễ vừa tạo nên phong thủy tích cực, tốt đẹp cho cuộc sống hôn nhân của đôi lứa sau này</p>]]></moTa></ProductItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1060, N'80b6e65c-d346-484b-b7b9-a10ce547372f', CAST(N'2016-04-13 14:20:04.743' AS DateTime), N'<ProductItem id="1060" key="2013ba88-b3f3-42b6-905a-a8a0e70712af" parentID="1054" level="3" creatorID="0" sortOrder="0" createDate="2016-04-05T15:42:51" updateDate="2016-04-13T14:20:04" nodeName="Rồng phụng thâm quyến" urlName="rong-phung-tham-quyen" path="-1,1051,1054,1060" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><umbracoUrlName><![CDATA[rong-phung-tham-quyen]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng thâm quyến]]></pageName><hinhAnh>1074</hinhAnh><price><![CDATA[500,000 ]]></price><phuongThucThanhToan><![CDATA[<p>1.Thanh toán trực tiêp </p>
<p>Quý khách vui lòng liên hệ số điện thoại 0982357990 để đặt hàng và thanh toán ngay sau khi nhận hàng<br /><br />2.Chuyển khoản ngân hàng<br /><br />Để thuận tiện cho quý khách chúng tôi cung cấp phương thức chuyển khoản ngân hàng . Quý khách chỉ cần chuyển khoản số tiền và quý khách đã đặt mua sản phẩm đên tài khoản của chúng tôi.Ngay sau khi nhận được tiền chúng tôi sẽ tiến hành giao hàng cho quý khách<br /> Thông tin ngân hàng<br />VietComBank chi nhánh Tp Hồ chí minh . <br />Số tài khoản :123456789</p>]]></phuongThucThanhToan><moTa><![CDATA[<p>Rồng phụng trái cây được kết rất cầu kỳ, khéo léo từ các loại trái cây tươi ngon, bắt mắt thì những con rồng long phụng rất tinh xảo sóng động như thật, nhất là loại rồng phụng cao cấp chuyển động.</p>
<p>Ngoài ra, Rồng phượng là biểu tượng âm dương rất mạnh trong thần thoại.</p>
<p>Rồng tượng trưng cho sức mạnh của nam.</p>
<p>Phượng tượng trưng cho sự kiều diễm và vẻ đẹp nữ tính khi đặt bên cạnh rồng. Cho nên trên bàn thờ lễ gia tiên đặt một đôi rồng phụng vừa tạo cảnh đẹp mắt. long trọng của buổi lễ vừa tạo nên phong thủy tích cực, tốt đẹp cho cuộc sống hôn nhân của đôi lứa sau này</p>]]></moTa></ProductItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1060, N'641deaa3-5cac-4217-a44a-af90be9d18fb', CAST(N'2016-04-13 14:21:13.250' AS DateTime), N'<ProductItem id="1060" key="2013ba88-b3f3-42b6-905a-a8a0e70712af" parentID="1054" level="3" creatorID="0" sortOrder="0" createDate="2016-04-05T15:42:51" updateDate="2016-04-13T14:21:13" nodeName="Rồng phụng thâm quyến" urlName="rong-phung-tham-quyen" path="-1,1051,1054,1060" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><umbracoUrlName><![CDATA[rong-phung-tham-quyen]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng thâm quyến]]></pageName><hinhAnh>1074</hinhAnh><price><![CDATA[500,000 ]]></price><phuongThucThanhToan><![CDATA[<p><strong>1.Thanh toán trực tiêp </strong></p>
<p>Quý khách vui lòng liên hệ số điện thoại 0982357990 để đặt hàng và thanh toán ngay sau khi nhận hàng<br /><br /><strong>2.Chuyển khoản ngân hàng</strong></p>
<p>Để thuận tiện cho quý khách chúng tôi cung cấp phương thức chuyển khoản ngân hàng . Quý khách chỉ cần chuyển khoản số tiền và quý khách đã đặt mua sản phẩm đên tài khoản của chúng tôi.Ngay sau khi nhận được tiền chúng tôi sẽ tiến hành giao hàng cho quý khách<br /><em>Thông tin ngân hàng</em><br />VietComBank chi nhánh Tp Hồ chí minh . <br />Số tài khoản :123456789</p>]]></phuongThucThanhToan><moTa><![CDATA[<p>Rồng phụng trái cây được kết rất cầu kỳ, khéo léo từ các loại trái cây tươi ngon, bắt mắt thì những con rồng long phụng rất tinh xảo sóng động như thật, nhất là loại rồng phụng cao cấp chuyển động.</p>
<p>Ngoài ra, Rồng phượng là biểu tượng âm dương rất mạnh trong thần thoại.</p>
<p>Rồng tượng trưng cho sức mạnh của nam.</p>
<p>Phượng tượng trưng cho sự kiều diễm và vẻ đẹp nữ tính khi đặt bên cạnh rồng. Cho nên trên bàn thờ lễ gia tiên đặt một đôi rồng phụng vừa tạo cảnh đẹp mắt. long trọng của buổi lễ vừa tạo nên phong thủy tích cực, tốt đẹp cho cuộc sống hôn nhân của đôi lứa sau này</p>]]></moTa></ProductItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1060, N'234ee45c-16b0-4249-bca5-f3db02bfc504', CAST(N'2016-04-13 14:19:06.597' AS DateTime), N'<ProductItem id="1060" key="2013ba88-b3f3-42b6-905a-a8a0e70712af" parentID="1054" level="3" creatorID="0" sortOrder="0" createDate="2016-04-05T15:42:51" updateDate="2016-04-13T14:19:06" nodeName="Rồng phụng thâm quyến" urlName="rong-phung-tham-quyen" path="-1,1051,1054,1060" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><umbracoUrlName><![CDATA[rong-phung-tham-quyen]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng thâm quyến]]></pageName><hinhAnh>1074</hinhAnh><price><![CDATA[500,000 ]]></price><phuongThucThanhToan><![CDATA[<p>1.Thanh toán trực tiêp </p>
<p>Quý khách vui lòng liên hệ số điện thoại 0982357990 để đặt hàng và thanh toán ngay sau khi nhận hàng<br /><br /><br />2.Chuyển khoản ngân hàng<br /><br />Để thuận tiện cho quý khách chúng tôi cung cấp phương thức chuyển khoản ngân hàng . Quý khách chỉ cần chuyển khoản số tiền và quý khách đã đặt mua sản phẩm đên tài khoản của chúng tôi.Ngay sau khi nhận được tiền chúng tôi sẽ tiến hành giao hàng cho quý khách<br /> Thông tin ngân hàng<br />VietComBank chi nhánh Tp Hồ chí minh . <br />Số tài khoản :123456789</p>]]></phuongThucThanhToan><moTa><![CDATA[<p>Rồng phụng trái cây được kết rất cầu kỳ, khéo léo từ các loại trái cây tươi ngon, bắt mắt thì những con rồng long phụng rất tinh xảo sóng động như thật, nhất là loại rồng phụng cao cấp chuyển động.</p>
<p>Ngoài ra, Rồng phượng là biểu tượng âm dương rất mạnh trong thần thoại.</p>
<p>Rồng tượng trưng cho sức mạnh của nam.</p>
<p>Phượng tượng trưng cho sự kiều diễm và vẻ đẹp nữ tính khi đặt bên cạnh rồng. Cho nên trên bàn thờ lễ gia tiên đặt một đôi rồng phụng vừa tạo cảnh đẹp mắt. long trọng của buổi lễ vừa tạo nên phong thủy tích cực, tốt đẹp cho cuộc sống hôn nhân của đôi lứa sau này</p>]]></moTa></ProductItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1061, N'afb4777f-6d13-44d3-86c3-00e15c8d62a3', CAST(N'2016-04-06 14:25:12.780' AS DateTime), N'<About id="1061" key="5154808d-5144-4df6-88c9-9f25184c52e0" parentID="1051" level="2" creatorID="0" sortOrder="0" createDate="2016-04-05T15:46:21" updateDate="2016-04-06T14:25:12" nodeName="Giới thiệu" urlName="gioi-thieu" path="-1,1051,1061" isDoc="" nodeType="1056" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1055" nodeTypeAlias="About"><umbracoUrlName><![CDATA[gioi-thieu]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Giới thiệu]]></pageName><content><![CDATA[<table border="0">
<tbody>
<tr>
<td colspan="3"><img src="http://shopcuoihoitamnhu.com/Image/Layout/icon_bl11.png" alt="" width="14px" /> <span class="texthot5">Shop dịch vụ cưới hỏi Tâm Như</span></td>
</tr>
<tr>
<td colspan="3">
<div>
<div><a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a> chuyên cung cấp các dịch vụ <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/688/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-trang">trang trí nhà cưới hỏi</a> trọn gói</div>
<div>* <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/690/trang-tri-nha-cuoi-hoi-an-tuong">Trang trí nhà cưới hỏi</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/679/ban-tho-gia-tien-ngay-cuoi">trang trí bàn thờ gia tiên</a>; </div>
<div>* Cung cấp <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/597/cong-cuoi-hoa-tuoi">cổng cưới hoa tươi</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/609/hoa-de-ban-trang-tri-dam-cuoi">hoa để bàn</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/596/hoa-cam-tay-co-dau---cai-ao">hoa cô dâu</a> trong ngày đám cưới hoặc đám hỏi, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/608/cat-dan-chu-xop---hoa-giay">cắt dán chữ xốp</a>; </div>
<div>* Cung cấp <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/593/mam-qua-le-vat-cuoi-hoi">mâm quả ngày cưới</a> (trầu cau, xôi gà, bánh cốm, bánh phu thê, trái cây tươi ngon, bánh bía,...), <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/648/rong-phung-trai-cay-ngay-cuoi">rồng phụng trái cây</a>ngày cưới; </div>
<div>* <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/621/cho-thue-xe-cuoi-4-cho-7-cho">Cho thuê xe hoa</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/643/cong-cuoi-hoa-vai">cổng cưới hoa vải</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/908/cong-cuoi-bong-bong">cổng cưới bong bóng</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/656/nha-bat-rap-cuoi-hien-dai-mau-dep">nhà bạt khung rạp</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/888/ban-tho-hoa-giay-ngay-cuoi">bàn thờ gia tiên hoa giấy</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1295/trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-no-hoa-hong-ng">bàn ghế hai họ</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/682/ban-ghe-cao-cap-theo-tong-nen-mautrang-hong-kem-vang">bàn ghế dựa đãi tiệc</a>, bàn ghế mũ inox, chén dĩa cưới hỏi </div>
<div>* Cho thuê <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/626/doi-ngu-nhan-vien-bung-mam-qua">nhân sự bưng quả</a>, nhân sự <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/680/to-chuc-su-kien-cuoi-hoi">tổ chức sự kiện,</a> <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/627/cho-thue-ban-nhac-mc-nhom-mua-le-tan-pg-pb">nhóm múa, lễ tân</a> </div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/QuangCao/dich-vu-cuoi-hoi-dich-vu-cuoi-hoi-vai-con-cong.jpg"><img src="http://shopcuoihoitamnhu.com/Image/QuangCao/dich-vu-cuoi-hoi-dich-vu-cuoi-hoi-vai-con-cong.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" width="700px" /></a></div>
<div>Dịch vụ cưới hỏi <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/974/trang-tri-nha-cuoi-hoi-voi-vai-con-cong">Trang trí nhà cưới hỏi với vải con cong</a> - <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a></div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a>  là nhà cung cấp <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-tam-nhu-cong-ty-trang-tri-dam-cuoi">dịch vụ cưới hỏi</a> mà các đôi lứa không nên bỏ qua khi chuẩn bị cho ngày hạnh phúc nhất của mình. Bởi vì chúng tôi đã có kinh nghiệm trên 8 năm cung cấp <a href="http://shopcuoihoitamnhu.com/">dịch vụ cưới hỏi</a>. Chúng tôi hiện đang có 2 cửa hàng tại mặt tiền đường Quang Trung và hệ thống 2 kho lưu trữ các đầy đủ trọn gói các sản phẩm <a href="http://shopcuoihoitamnhu.com/">dịch vụ cưới hỏi</a>. Vì thế, cửa hàng của chúng tôi luôn có đầy đủ tất cả các sản phẩm liên quan và có đầy đủ, phong phú các kiểu mẫu để quý khách chọn lựa với giá cả hợp lý và đảm bảo cung cấp dịch vụ đúng giờ, đúng cam kết.</div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/678/cho-thue-ban-ghe---chen-dia---vat-dung-dam-cuoi"><img src="http://shopcuoihoitamnhu.com/Image/QuangCao/dich-vu-cuoi-hoi-dich-vu-cuoi-hoi-cong-hoa.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" width="700px" /></a></div>
<div>Dịch vụ <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/643/cong-cuoi-hoa-vai">cho thuê cổng hoa cưới</a> cho ngày đám cưới hỏi trọn gói - <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a>  </div>
<div></div>
<div>Nếu bạn muốn chọn một nhà cung cấp <a href="http://shopcuoihoitamnhu.com/">dịch vụ cưới hỏi </a>với đúng sản phẩm bạn muốn và giá cả cạnh tranh thị trường thì hãy đến tham quan cửa tiệm chính của <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a>  tại số 737, Quang Trung, phường 12, quận Gò Vấp hoặc gọi 0913.623472 - 0974.241824 để trực tiếp xem thế giới sản phẩm cưới hỏi và để chúng tôi có cơ hội tư vấn chi tiết hơn cho nhu cầu của bạn.</div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/layout/full_dichvu_TN.jpg"><img src="http://shopcuoihoitamnhu.com/Image/layout/full_dichvu_TN.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" width="700px" /></a></div>
<div></div>
<div>
<div><a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a> chuyên <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/688/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-trang">trang trí nhà cưới hỏi</a> trọn gói, chuyên nghiệp với đa dạng mẫu mã cho quý khách lựa chọn gồm các gói:</div>
<div>- Trang trí nhà cưới hỏi theo tông nền màu <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/688/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-trang">trắng</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/686/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-trang-kem">trắng kem</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/689/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-vang-dong">vàng đồng</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/687/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-hong">hồng</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/764/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-do">đỏ </a>cho ngày lễ ăn hỏi gia tiên, đính hôn, đám hỏi, đám cưới</div>
<div>
<div>- Trang trí nhà cưới hỏi cao cấp <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/690/trang-tri-nha-cuoi-hoi-an-tuong">mẫu ấn tượng</a> theo tông nền màu trắng, trắng kem, hồng, vàng đồng, đỏ cho ngày lễ ăn hỏi gia tiên, đính hôn, đám hỏi, đám cưới của bạn thêm phần rực rỡ, nổi bật</div>
<div>- Trang trí nhà cưới hỏi cao cấp <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/889/trang-tri-nha-cuoi-hoi-voi-hoa-giay-lua">mẫu hoa giấy</a> theo tông nền màu <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/688/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-trang">trắng</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/686/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-trang-kem">trắng kem</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/687/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-hong">hồng</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/689/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-vang-dong">vàng đồng</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/764/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-do">đỏ</a> cho ngày lễ ăn hỏi gia tiên, đính hôn, đám hỏi, đám cưới của bạn thêm phần trẻ trung, rực rỡ và nổi bật với các tông hoa giấy <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1154/trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-no-da">trắng đỏ</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1149/trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-no-da">trắng hồng nhạt</a>,<a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1169/trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-no-ng">trắng hồng dâu</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1142/trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-no-da">trắng cam</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1175/trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-no-ng">trắng tím</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1178/trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-no-ng">trắng vàng</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1194/trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-no-ng">trắng xanh dương</a>, trắng xanh ngọc, trắng xanh biển, trắng xanh lá, trắng xanh chuối.</div>
</div>
<div>- Trang trí nhà cưới hỏi cao cấp đặc biệt với mẫu giải hình con cong</div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-no-dai-mau-do-mat-ban-do-tran-nha-voan-trang-do-ban-tho-hien-dai-mam-qua-4.jpg"><img src="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-no-dai-mau-do-mat-ban-do-tran-nha-voan-trang-do-ban-tho-hien-dai-mam-qua-4.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" /></a></div>
<div><a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/690/trang-tri-nha-cuoi-hoi-an-tuong">Trang trí nhà cưới hỏi ấn tượng</a> - mẫu màu hồng phấn <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a></div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/Product/dich-vu-cuoi-hoi-cong-ty-trang-tri-nha-trang-tri-nha-cuoi-hoi-tong-xanh-duong-voi-hoa-giay-dep-3.jpg"><img src="http://shopcuoihoitamnhu.com/Image/Product/dich-vu-cuoi-hoi-cong-ty-trang-tri-nha-trang-tri-nha-cuoi-hoi-tong-xanh-duong-voi-hoa-giay-dep-3.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" /></a></div>
<div>Dịch vụ cưới hỏi <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/889/trang-tri-nha-cuoi-hoi-voi-hoa-giay-lua">Trang trí nhà cưới hỏi với hoa giấy</a> tông trắng đỏ  - <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a></div>
<div></div>
<div>
<div><a href="http://shopcuoihoitamnhu.com/Image/Product/dich-vu-cuoi-hoi-cong-ty-trang-tri-nha-trang-tri-nha-cao-cap-voi-vai-con-cong-17.jpg"><img src="http://shopcuoihoitamnhu.com/Image/Product/dich-vu-cuoi-hoi-cong-ty-trang-tri-nha-trang-tri-nha-cao-cap-voi-vai-con-cong-17.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" /></a></div>
<div>Dịch vụ cưới hỏi <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/974/trang-tri-nha-cuoi-hoi-voi-vai-con-cong">Trang trí nhà cưới hỏi với vải con cong</a> tông hồng dâu  - <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a></div>
</div>
<div></div>
<div>
<div>Mỗi mẫu trang trí nhà cưới hỏi của TamNhu thường gồm có:</div>
<div>* <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/679/ban-tho-gia-tien-ngay-cuoi">Trang trí bàn thờ gia tiên</a> hay còn gọi là bàn thờ tổ tiên của TamNhu với </div>
<div>+ Các kiểu trang trí bàn thờ gồm có: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/924/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">mẫu truyền thống nhung đỏ</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/928/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">mẫu tự nhiên</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/978/ban-tho-to-tien-ngay-cuoi-tong-hong-canh-sen-mau-tu-nhien-duoc-t">mẫu hiện đại</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/944/ban-tho-to-tien-ngay-cuoi-mau-thien-chua-tong-xanh-la-cho-trang-">mẫu thiên chúa tin lành</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/946/ban-tho-to-tien-ngay-cuoi-mau-dep-voi-manh-tre-mau-do-chuc-phuc-">mẫu mành tre</a> với dây voan, hoa vải hoa tươi trang trí, chữ song hỷ, câu đối trang trí; </div>
<div>+ Chữ dán trên phong nền có thể là: <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-dich-vu-cuoi-hoi-ban-tho-to-tien-ngay-cuoi-tong-cam-mau-tu-nhien-duoc-trang-tri-bang-vai-voan-cao-cap-cho-le-an-hoi-gia-tien-dam-cuoi-day-du-nghi-le-4.jpg">Song hỷ</a> ; <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/946/ban-tho-to-tien-ngay-cuoi-mau-dep-voi-manh-tre-mau-do-chuc-phuc-">Phúc</a>; <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/936/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">Trăm năm hạnh phúc</a>;  Kính nhớ tổ tiên ;  Long phụng hòa minh - Sắc cầm hỏa hợp; Trăm năm tình viên mãn bạc đầu nghĩa phu thê</div>
<div>+ Trên bàn thờ có đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/955/ban-tho-to-tien-ngay-cuoi-mau-an-tuong-tong-hong-cho-trang-tri-l">1 bộ lư</a> để bình thường hoặc trang trí thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/993/ban-tho-to-tien-ngay-cuoi-tong-trang-do-mau-tu-nhien-duoc-trang-">hoa tươi</a></div>
<div>+ Đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/984/ban-tho-to-tien-ngay-cuoi-tong-hong-mau-tu-nhien-duoc-trang-tri-">hai bình hoa tươi</a> song hỷ hoặc một bình hoa tươi một mâm trái cây ngũ quả hoặc là đặc biệt hơn là mẫu trang trí hoa <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/986/ban-tho-to-tien-ngay-cuoi-tong-hong-mau-tu-nhien-duoc-trang-tri-">cắm đỗ bàn thờ</a></div>
<div>+ Đặt một đôi <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/648/rong-phung-trai-cay-ngay-cuoi">rồng phụng trái cây</a> sẽ mang lại không khí ấm áp, sung túc cho ngày lễ ăn hỏi, lễ cưới của bạn</div>
<div>+ Cạnh bàn thờ thì ở nhà gái còn đặt thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1031/hoa-giay-lua-tong-trang-do-long-lay-trang-tri-ban-tho-to-tien-n">một cái bàn nhỏ</a> được phủ mặt bàn được may bắt mắt để đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/859/mam-qua-tong-hop-qua-trai-cay-trau-cau-rong-phung-trai-cay-dac-s">mâm quả lễ vật</a> của nhà trai</div>
</div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/Product/dich-vu-cuoi-hoi-cong-ty-trang-tri-nha-dich-vu-cuoi-hoi-rong-phung-trai-cay-dep-1.jpg"><img src="http://shopcuoihoitamnhu.com/Image/Product/dich-vu-cuoi-hoi-cong-ty-trang-tri-nha-dich-vu-cuoi-hoi-rong-phung-trai-cay-dep-1.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" /></a></div>
<div><a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/648/rong-phung-trai-cay-ngay-cuoi">Rồng long phụng</a> được kết từ trái cây tươi ngon như thật  - <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a></div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/Product/dich-vu-cuoi-hoi-cong-ty-trang-tri-nha-doi-chim-cong-hoa-lan-dep-sac-sao-chung-ban-tho-ngay-cuoi-3.jpg"><img src="http://shopcuoihoitamnhu.com/Image/Product/dich-vu-cuoi-hoi-cong-ty-trang-tri-nha-doi-chim-cong-hoa-lan-dep-sac-sao-chung-ban-tho-ngay-cuoi-3.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" /></a></div>
<div><a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/2103/doi-chim-cong-hoa-lan-dep-sac-sao-chung-ban-tho-ngay-cuoi-3">Đôi chim cong hoa lan đẹp sắc sảo chưng bàn thờ ngày cưới</a></div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-trang-tri-ban-tho-gia-tien-to-tien-hoa-giay-tong-mau-trang-do-voi-rong-phung-va-hoa-tuoi--2.jpg"><img src="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-trang-tri-ban-tho-gia-tien-to-tien-hoa-giay-tong-mau-trang-do-voi-rong-phung-va-hoa-tuoi--2.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" /></a></div>
<div><a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/888/ban-tho-hoa-giay-ngay-cuoi">Trang trí bàn thờ hoa giấy</a> sang trọng, lỗng lẫy  - <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a></div>
<div></div>
<div><span>* Một bộ </span><a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/608/cat-dan-chu-xop---hoa-giay">chữ dán tường </a><span>của <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a> </span><span>thường theo kiểu </span><a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/196/chu-mop-xop-cat-dan-chu-xop-le-tan-hon-font-dep">thông dụng phổ biến</a><span>, hay </span><a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/216/chu-mop-xop-cat-dan-chu-xop-le-vu-quy-font-dep">chữ xốp đám cưới</a><span> theo font chữ và màu sắc tự chọn, </span><a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/256/chu-mop-xop-cat-dan-chu-xop-dac-biet-tong-tim-tren-khung-hoa-van">họa tiết </a><span>tự chọn dán đều, đẹp cân đối trên tường bên trái, bên phải theo kiểu đi vô hay đi ra tùy là lễ vu quy hay là lễ tân hôn.</span></div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-cat-dan-chu-mop-xop-tong-tim-lang-man-cho-le-vu-quy.jpg"><img src="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-cat-dan-chu-mop-xop-tong-tim-lang-man-cho-le-vu-quy.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" /></a></div>
<div><a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/608/cat-dan-chu-xop---hoa-giay">Cắt dán chữ mốp xốp </a>ngày cưới - <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a></div>
<div></div>
<div>
<div>* Một một ghế dựa được trang trí ngay ngắn, đẹp mắt để chủ hôn và hai họ trai gái ngồi làm lễ</div>
<div>+ Màu áo ghế: <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/688/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-trang">Trắng</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/686/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-trang-kem">kem</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/687/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-hong">hồng</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/689/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-vang-dong">vàng đồng</a></div>
<div>+ Nơ truyền thống: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1345/trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-voan-ngan-mau-">trắng</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1344/trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-voan-ngan-mau-">hồng</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1336/trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-voan-ngan-mau-">hồng dâu</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1329/trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-voan-ngan-mau-">cam</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1364/trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-voan-ngan-mau-">đỏ</a>, vàng,<a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1347/trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-voan-ngan-mau-">vàng đồng</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1360/trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-voan-ngan-mau-">xanh dương</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1350/trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-voan-ngan-mau-">xanh ngọc</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1359/trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-voan-ngan-mau-">xanh lá</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1357/trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-voan-ngan-mau-">xanh chuối</a>, tím sen, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1346/trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-voan-ngan-mau-">tím cà</a>.</div>
<div>+ Nơ vải hoa hồng sang trọng, lộng lẫy: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1224/trang-tri-nha-cuoi-hoi-tong-nen-mau-hong-ao-ghe-no-ngan-mau-tra">trắng</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1219/trang-tri-nha-cuoi-hoi-tong-nen-mau-hong-ao-ghe-no-ngan-mau-hon">hồng</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1222/trang-tri-nha-cuoi-hoi-tong-nen-mau-hong-ao-ghe-no-ngan-mau-hon">hồng dâu</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1218/trang-tri-nha-cuoi-hoi-tong-nen-mau-hong-ao-ghe-no-ngan-mau-cam">cam</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1217/trang-tri-nha-cuoi-hoi-tong-nen-mau-hong-ao-ghe-no-dai-mau-do-t">đỏ</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1225/trang-tri-nha-cuoi-hoi-tong-nen-mau-hong-ao-ghe-no-ngan-mau-van">vàng</a>,vàng đồng, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1228/trang-tri-nha-cuoi-hoi-tong-nen-mau-hong-ao-ghe-no-ngan-mau-xan">xanh dương</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1227/trang-tri-nha-cuoi-hoi-tong-nen-mau-hong-ao-ghe-no-ngan-mau-xan">xanh ngọc</a>, xanh lá, xanh chuối, tím sen, tím cà.</div>
<div>+ Nơ vài hoa hồng dài đặc biệt sang trọng, ấn tượng: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1119/trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-no-dai-mau-tra">trắng</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1112/trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-no-dai-mau-hon">hồng</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1127/trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-no-dai-mau-xan">xanh ngọc</a></div>
<div>
<div>+ Mặt bàn với nhiều mẫu mã bắt mắt, duyên dáng với vải truyền thống hay vải ren hiện đại</div>
<div>+ <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/609/hoa-de-ban-trang-tri-dam-cuoi">Hoa để bàn</a> một lẵng để chính giữa bàn hoặc 2 lẵng để cân đối đều 2 đầu. Đặc biệt, Dịch vụ cưới hỏi Tuấn Ngọc chuyên kết hoa tươi với rất nhiều mẫu mã đẹp, ấn tượng, sáng tạo mà giá cả rất phải chăng. Quý khách có thể dùng một loại hoa như: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/706/mau-trang-tri-dam-cuoi-voi-hoa-de-ban-hai-ho-le-tiec-mau-tu-cau-">hoa hồng đỏ</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/668/hoa-co-dau-cam-tay-tong-mau-trang-vang-duoc-ket-tu-hoa-hong-lan-">hoa hồng vàng</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/666/hoa-co-dau-cam-tay-tong-mau-trang-tim-pastel-duoc-ket-tu-hoa-hon">hoa hồng trắng</a>, hoa ly, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/730/mau-trang-tri-dam-cuoi-voi-hoa-de-ban-hai-ho-le-tiec-mau-oval-to">hoa lan tím</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/658/hoa-co-dau-cam-tay-tong-mau-trang-hong-pastel-duoc-ket-tu-hoa-ho">lan trắng</a>, lan đỏ, lan hồ điệp, lan ngọc điểm, lan vũ nữ, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/653/hoa-co-dau-cam-tay-tong-mau-hong-duoc-ket-tu-hoa-sen-thuan-khiet">hoa sen</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/686/hoa-co-dau-cam-tay-tong-mau-tim-pastel-duoc-ket-tu-hoa-hong-cam-">hoa cát tường</a>, hoa cúc vàng, hoa cút tím, hoa cúc trắng, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/686/hoa-co-dau-cam-tay-tong-mau-tim-pastel-duoc-ket-tu-hoa-hong-cam-">hoa đồng tiền</a>, ... hoặc kết hợp nhiều loại hoa thật ý nghĩa, tươi tắn, sặc sỡ cho ngày hạnh phúc lứa đôi.</div>
</div>
</div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/Product/dich-vu-cuoi-hoi-cong-ty-trang-tri-nha-cho-thue-ban-ghe-hai-ho-cao-cap-voi-vai-con-cong-14.jpg"><img src="http://shopcuoihoitamnhu.com/Image/Product/dich-vu-cuoi-hoi-cong-ty-trang-tri-nha-cho-thue-ban-ghe-hai-ho-cao-cap-voi-vai-con-cong-14.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" /></a></div>
<div><a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/688/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-trang">Cho thuê bàn ghế hai họ </a>- <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a></div>
<div></div>
<div><span>* </span><a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/605/trang-tri-chi-tiet-nha-cua-cau-thang-tran-nha-loi-di-bang-ten">Trần nhà </a><span>trong gói  trang trí </span><span>nhà cưới hỏi của </span><a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a><span> cũng được trang trí với đa dạng mẫu mã như: Dây bảy màu truyền thống, dây voan hiện đại với tất cả 12 màu (</span><a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1079/trang-tri-day-voan-tran-nha-tong-do-cho-ngay-trong-ngay-le-an-h">trắng</a><span>, </span><a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1063/trang-tri-cua-nha-tong-hong-voi-day-voan-hong-trai-chau-do-tron">hồng</a><span>, hồng dâu, cam, </span><a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1079/trang-tri-day-voan-tran-nha-tong-do-cho-ngay-trong-ngay-le-an-h">đỏ</a><span>, vàng,vàng đồng, xanh dương, </span><a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1058/trang-tri-cau-thang-tong-xanh-ngoc-voi-day-voan-trai-chaucho-ng">xanh ngọc</a><span>, xanh lá, xanh chuối, tím sen, tím cà.), </span><a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1064/trang-tri-cua-nha-tong-hong-voi-day-voan-trai-chau-do-trong-nga">tú cầu</a><span>, </span><a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1078/trang-tri-day-voan-tran-nha-tong-do-cho-ngay-trong-ngay-le-an-h">trái châu</a><span> với tất cả 6 màu, mỗi bộ 50 trái cầu</span></div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-trang-tri-chi-tiet-nha-cuoi-tran-nha-trang-hong-ket-tu-day-voan-va-trai-chau-trang-trong-2.jpg"><img src="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-trang-tri-chi-tiet-nha-cuoi-tran-nha-trang-hong-ket-tu-day-voan-va-trai-chau-trang-trong-2.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" /></a></div>
<div><a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1287/trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-no-hoa-hong-da">Trang trí trần nhà  bằng dây voan</a> trong ngày cưới - <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a></div>
<div></div>
<div>* Ngoài ra, trong ngày lễ ăn hỏi gia tiên, lễ đính hôn, đám cưới, đám hỏi người tổ chức lễ cưới còn chú trọng thuê <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a> thêm việc trang trí lối vào, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/605/trang-tri-chi-tiet-nha-cua-cau-thang-tran-nha-loi-di-bang-ten">trang trí của nhà</a>, cửa sổ, cầu thang, trần nhà nói chung là toàn bộ các chi tiết trong nhà để tạo một không gian lễ đồng bộ, ấn tượng theo tông tạo nên hiệu ứng ấm ấp, khó quên trong ngày lễ và hình ảnh tích cực đó sẽ theo cuộc sống hôn nhân của cô dâu, chú rể mãi về sau này giúp cho việc hôn nhân và làm ăn của đôi tân hôn ngày càng khấm khá, sung túc</div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-trang-tri-cua-nha-tong-trang-do-voi-day-voan-trai-chau-trong-ngay-le-an-hoi-gia-tien-dam-cuoi-cuoi-phong-cach-sang-trong-doc-dao.jpg"><img src="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-trang-tri-cua-nha-tong-trang-do-voi-day-voan-trai-chau-trong-ngay-le-an-hoi-gia-tien-dam-cuoi-cuoi-phong-cach-sang-trong-doc-dao.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" /></a></div>
<div>Trang trí trần nhà với <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1066/trang-tri-cua-nha-tong-trang-do-voi-day-voan-trai-chau-trong-ng">trái châu, tú cầu</a> - <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a></div>
<div></div>
<div><span><a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a> là một trong số rất ít công ty dịch vụ cưới hỏi đi đầu và chuyên cung cấp dịch vụ trang trí nhà cưới hỏi bằng hoa giấy lụa trọn gói:</span>
<div>- Trang trí nhà cưới hỏi bằng <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/889/trang-tri-nha-cuoi-hoi-voi-hoa-giay-lua">hoa giấy lụa</a> của <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a> với các tông màu sắc: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1140/trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-no-da">cam</a>, <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-no-dai-mau-hong-mat-ban-ren-hong-tran-nha-voan-trang-hong-ban-tho-hien-dai-rong-phung-1.jpg">hồng phấn</a>,<a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1169/trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-no-ng">hồng cánh sen</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1162/trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-no-da">đỏ</a>, <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-no-ngan-mau-tim-tran-nha-voan-trang-tim-ban-tho-hien-dai-hoa-giay-tim-rong-phung-trai-cay-1.jpg">tím cà</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1176/trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-no-ng">vàng</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1206/trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-vang-dong-ao-ghe-n">vàng đồng</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1203/trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-ren-n">xanh dương</a>, <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-no-ngan-mau-xanh-la-tran-nha-voan-trang-xanh-la-ban-tho-hien-dai-hoa-giay-xanh-la-rong-phung-trai-cay-1.jpg">xanh lá</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1184/trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-no-ng">xanh chuối</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1188/trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-no-ng">xanh ngọc</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1201/trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-ren-n">xanh biển</a> trong ngày lễ ăn hỏi gia tiên, đính hôn, đám hỏi, đám cưới</div>
<div>- Trang trí chữ xốp dán tường xung với hoa giấy xung quanh trẻ trung, dễ thương của <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a> với các tông màu sắc: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/290/chu-mop-xop-tong-cam-mau-hoa-giay-chu-dep-tu-bo-chu-dan-phong-ch">cam</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/292/chu-mop-xop-tong-hong-mau-hoa-giay-chu-dep-tu-bo-chu-dan-phong-c">hồng phấn</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/291/chu-mop-xop-tong-hong-dau-mau-hoa-giay-chu-dep-tu-bo-chu-dan-pho">hồng cánh sen</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/311/chu-mop-xop-tong-tim-do-mau-le-vu-quy-chu-dep-kem-bo-trang-tri-p">đỏ</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/294/chu-mop-xop-tong-tim-ca-mau-hoa-giay-chu-dep-tu-bo-chu-dan-phong">tím</a>, <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/cat-dan-chu-xop-tong-vang-dong-mau-hoa-giay-chu-dep-tu-bo-chu-dan-phong-chu-dep-de-thuong-va-trang-tri-hoa-giay-xung-quanh-gop-phan-ton-them-ve-dep-lung-linh-ruc-ro-tron-ven-trong-.jpg">vàng đồng</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/316/chu-mop-xop-tong-xanh-duong-mau-hoa-giay-chu-dep-tu-bo-chu-dan-p">xanh dương</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/317/chu-mop-xop-tong-xanh-la-mau-hoa-giay-chu-dep-tu-bo-chu-dan-phon">xanh lá</a>, xanh chuối, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/293/chu-mop-xop-tong-trang-thuan-khiet-mau-hoa-giay-chu-dep-tu-bo-ch">xanh ngọc</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/314/chu-mop-xop-tong-xanh-bien-mau-hoa-giay-chu-dep-tu-bo-chu-dan-ph">xanh biển</a>trong ngày lễ ăn hỏi gia tiên, đính hôn, đám</div>
<div>hỏi, đám cưới</div>
<div>- Trang trí <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/888/ban-tho-hoa-giay-ngay-cuoi">bàn thờ gia tiên</a>, tổ tiên ngày cưới với hoa giấy bắt mắt, ấn tượng của <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a> với các tông màu sắc: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1038/hoa-giay-lua-tong-xanh-duong-tuoi-dep-trang-tri-ban-tho-to-tien">cam</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1027/hoa-giay-lua-tong-hong-trang-nha-trang-tri-ban-tho-to-tien-ngay">hồng phấn</a>, <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-dich-vu-cuoi-hoi-hoa-giay-lua-tong-hong-dau-tuoi-dep-trang-tri-ban-tho-to-tien-ngay-cuoi-tong-cho-le-an-hoi-gia-tien-dam-cuoi-sang-trong-moi-me.jpg">hồng cánh sen</a>,  đỏ, tím cà, tím, vàng, vàng đồng, xanh dương, xanh lá, xanh chuối, xanh ngọc ,<a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1039/hoa-giay-lua-tong-xanh-la-tuoi-dep-trang-tri-ban-tho-to-tien-ng">xanh biển</a> trong ngày lễ ăn hỏi gia tiên, đính hôn, đám hỏi, đám cưới</div>
<div>- <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/762/trang-tri-phong-cuoi-hoi-hoa-giay">Trang trí phông cưới hoa giấy lụa</a> với kỹ thuật tinh xảo nhất là trong việc <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/894/phong-cuoi-hoa-giay-lua-tong-cam-cho-le-vu-quy-tuoi-dep-sang-tro">dán chữ xốp lớn lên tấm phông lụa mỏn</a>g, các mẫu tang trí phông cưới hỏi hoa giấy tạo nên cảm giác nhẹ nhàng nhưng không kề kém phần trang trọng của <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a> với các tông màu sắc: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/893/phong-cuoi-hoa-giay-lua-tong-cam-cho-le-vu-quy-tuoi-dep-sang-tro">cam</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/900/phong-cuoi-hoa-giay-lua-tong-trang-hong-cho-le-vu-quy-voi-voan-h">hồng phấn</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/896/phong-cuoi-hoa-giay-lua-tong-hong-dau-cho-le-vu-quy-voi-voan-hoa">hồng cánh sen</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/902/phong-cuoi-hoa-giay-lua-tong-trang-do-cho-le-vu-quy-voi-voan-hoa">đỏ</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/905/phong-cuoi-hoa-giay-lua-tong-tim-hoa-ca-cho-le-vu-quy-an-tuong-v">tím</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/909/phong-cuoi-hoa-giay-lua-tong-vang-cho-le-vu-quy-dep-mat-an-tuong">vàng</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/915/phong-cuoi-hoa-giay-lua-tong-xanh-duong-cho-le-vu-quy-dep-mat-tr">xanh dương</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/917/phong-cuoi-hoa-giay-lua-tong-xanh-la-cho-le-vu-quy-trang-trong-a">xanh lá</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/913/phong-cuoi-hoa-giay-lua-tong-xanh-chuoi-cho-le-vu-quy-dep-mat-an">xanh chuối</a>, xanh ngọc,<a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-dich-vu-cuoi-hoi-phong-cuoi-hoa-giay-lua-tong-xanh-bien-cho-le-vu-quy-ngot-ngao-tuoi-tre-voi-voan-hoa-vai-chu-song-hy-ghe-dua-ket-no-dep-tu-cau-tran-nha-1.jpg">xanh biển</a></div>
</div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-phong-cuoi-an-hoi-tong-trang-hong-ket-tu-hoa-giay-bong-bong-va-voan-mem-mai.jpg"><img src="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-phong-cuoi-an-hoi-tong-trang-hong-ket-tu-hoa-giay-bong-bong-va-voan-mem-mai.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" /></a></div>
<div><a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/762/trang-tri-phong-cuoi-hoi-hoa-giay">Trang trí phông cưới hoa giấy lụa</a> - <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a></div>
<div></div>
<div>
<div>- <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/763/trang-tri-backdrop-hoa-giay">Trang trí backdrop cưới hỏi</a> bằng hoa giấy lụa cho ngày lễ ăn hỏi gia tiên, đính hôn, đám hỏi, đám cưới với nhiều mẫu đa đạng của <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a> với các tông màu sắc: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/138/tong-cam-mau-bang-ten-dep-voi-tran-trai-chau-tu-cau-do-trang-va-">cam</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/144/tong-trang-hong-mau-bang-ten-dep-voi-tran-nha-trai-chau-tu-cau-t">hồng phấn</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/141/tong-hong-dau-mau-bang-ten-dep-voi-tran-nha-day-voan-hong-trang-">hồng cánh sen</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/156/tong-do-mau-bang-ten-dep-voi-tran-nha-day-voan-trang-do-va-bo-gh">đỏ</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/145/tong-tim-ca-mau-bang-ten-elip-voi-tran-nha-day-voan-do-trang-tim">tím</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/147/tong-vang-mau-bang-ten-dep-voi-tran-nha-trai-chau-tu-cau-trang-v">vàng</a>, vàng đồng,<a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/151/tong-xanh-duong-mau-trai-tim-voi-tran-nha-trai-chau-tu-cau-trang">xanh dương</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/153/tong-xanh-la-mau-bang-ten-dep-voi-trai-chau-tu-cau-trang-xanh-la">xanh lá</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/149/tong-xanh-chuoi-mau-bang-ten-dep-voi-tran-nha-tu-cau-trang-xanh-">xanh chuối</a>, xanh ngọc, xanh biển</div>
<div>- <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/763/trang-tri-backdrop-hoa-giay">Trang trí backdrop hoa giấy</a> cho tiệc cưới ở nhà hàng ở khu vực đón khách, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/909/cho-thue-san-khau-dan-nhac">sân khấu</a>. Đối với dịch vụ trang trí tiệc cưới ở nhà hàng, <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a> còn đi kèm với dịch vụ <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/771/trang-tri-ban-ky-ten-don-khach">trang trí bàn ký tên đón khách</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/643/cong-cuoi-hoa-vai">trang trí cổng cưới đón khách với hoa vải</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/597/cong-cuoi-hoa-tuoi">hoa tươi</a>, hoa giấy, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/908/cong-cuoi-bong-bong">bong bóng</a></div>
<div>- Ngoài ra, <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a> còn dùng hoa giấy lụa để <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/909/cho-thue-san-khau-dan-nhac">trang trí backdrop sân khấu</a> nhạc sống hoặc <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/772/trang-tri-cuoi-hoi-khac">trang trí các chi tiết khác</a> trong nhà cưới hỏi</div>
</div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-cho-thue-san-khau-backdrop-phong-dam-cuoi-dai-tiec-tu-hoa-giay-bong-bong-thap-ly-banh-kem-1.jpg"><img src="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-cho-thue-san-khau-backdrop-phong-dam-cuoi-dai-tiec-tu-hoa-giay-bong-bong-thap-ly-banh-kem-1.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" /></a></div>
<div>Trang trí, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/909/cho-thue-san-khau-dan-nhac">cho thuê sân khấu</a> được trang trí đẹp mắt với <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-dich-vu-cuoi-hoi-cho-thue-san-khau-backdrop-phong-dam-cuoi-dai-tiec-tu-hoa-giay-bong-bong-thap-ly-banh-kem-1.jpg">hoa giấy</a> - <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a></div>
<div></div>
<div><span>Dịch vụ trang trí nhà cưới hỏi cao cấp của </span><a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi cưới hỏi Tâm Như</a><span> dành cho nhóm khách hàng có nguồn thu nhập tốt hoặc muốn có một đám cưới thật </span><a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/776/mau-rap-trang-tri-dam-cuoi-cao-cap-sang-trong-dac-biet-kem-cong-">lung linh</a><span>, hoàn hảo. Với các gói trang trí cao cấp này của </span><a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi cưới hỏi Tâm Như</a><span> chắc chắn sẽ mang đến cho bạn một đám cưới đẹp mắt, tươi tắn, </span><a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/888/ban-tho-hoa-giay-ngay-cuoi">trang trọng</a><span>, </span><a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/690/trang-tri-nha-cuoi-hoi-an-tuong">ấn tượng</a><span> làm đẹp lòng tất cả các khách mời đám cưới và để lại những loạt hình cưới kỷ niệm thật ngọt ngào, khó quên:</span>
<div>- Mâm quả cao cấp với <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/825/mam-qua-ket-cuom-ren-tong-hop-do-hong-vang-cao-cap-sang-trong-lo">mâm quả kết ren</a>, cườm tinh xảo hay cao cấp hơn là loại <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/837/mam-qua-son-mai-tong-hop-cao-cap-sang-trong-long-lau-cho-le-an-h">mâm quả sơn mài</a></div>
<div>- Trang trí chữ xốp dán tường có kèm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/317/chu-mop-xop-tong-xanh-la-mau-hoa-giay-chu-dep-tu-bo-chu-dan-phon">hoa giấy</a> trang trí xung quanh</div>
<div>- Trang trí bàn thờ gia tiên tổ tiên ngày cưới có kèm trang trí <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1027/hoa-giay-lua-tong-hong-trang-nha-trang-tri-ban-tho-to-tien-ngay">hoa giấy</a></div>
<div>-  <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/648/rong-phung-trai-cay-ngay-cuoi">Rồng (long) phụng trái cây</a> ngày cưới bắt mắt, sóng động như thật đặt biệt là mẫu rồng phụng <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/877/rong-long-phung-chuyen-dong-duoc-ket-tu-trai-cay-tuoi-ngon-nhu-t">chuyển động</a></div>
<div>- Trang trí <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/902/phong-cuoi-hoa-giay-lua-tong-trang-do-cho-le-vu-quy-voi-voan-hoa">phông cưới hỏi bằng hoa giấy</a> lụa trong khu vực làm lễ gia tiên</div>
<div>- Trang trí <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-dich-vu-cuoi-hoi-z-backdrop-hoa-giay-lua-mau-hoa-day-tuoi-dep-da-sac-mau-1.jpg">backdrop</a> <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/763/trang-tri-backdrop-hoa-giay">hoa giấy lụa</a> trong khu vực làm lễ đính hôn, ăn hỏi, lễ cưới</div>
<div>- Trang trí <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1084/cho-thue-san-khau-backdrop-phong-dam-cuoi-dai-tiec-tu-hoa-giay-">sân khấu bằng hoa giấy</a>, bong bóng cho tiệc cưới tại nhà hoặc tiệc cưới tại nhà hàng</div>
<div>- Khung rạp cưới mẫu <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/812/tong-do-mau-hien-dai-mau-moi-la-bat-mat-co-kem-cong-hoa-vai-di-t">hiện đại </a>hoặc ấn tượng hơn là <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/773/nha-bat-rap-voan-pha-le-hang-rao-tinh-yeu">rạp cưới voan</a>, pha lê và <a href="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-mau-cao-cap-sang-trong-dac-biet-kem-cong-hoa-vai-tong-xanh-nuoc-bien.jpg">hàng rào tình yêu</a></div>
<div>- <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/597/cong-cuoi-hoa-tuoi">Cổng cưới hoa tươi</a> cắm theo kích thước cổng nhà, ý thích của bạn về tông màu sắc, các loại hoa tươi và kiểu mẫu cổng hoa. Trên cổng hoa tươi đó có thể trang trí thêm <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-dich-vu-cuoi-hoi-hinh-tru-ngang-tong-xanh-ngoc-voi-cam-tu-cau-hoa-hong-va-hoa-ly-ruc-ro-cho-dam-cuoi-sang-trong-long-lay-2.jpg">dây pha lê </a>cho tiệc ấn tượng, lãng mạn hoặc trang trí thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/440/cong-cuoi-hoa-tuoi-hinh-tru-mai-ngang-bong-bong-tong-mau-hong-de">cổng phụ bong bóng </a>bảo đảm khu vực đón khách và tạm biệt khách của bạn trong ngày cưới sẽ không còn có thể <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/460/cong-cuoi-hoa-tuoi-hinh-tru-ngang-tong-xanh-ngoc">đẹp</a> hơn nữa</div>
<div>- Xe hoa đón rước dâu sẽ chọn dòng xe độc, lạ, không đụng hàng và trang trí thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1431/cho-thue-xe-hoa-don-ruoc-dau-mau-trang-4-cho-7-cho-ket-hoa-tuoi">hoa tươi</a> đầy sắc màu và <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-dich-vu-cuoi-hoi-cho-thue-xe-hoa-don-ruoc-dau-4-cho--7-cho-ket-hoa-vai-trai-tim-hoa-tuoi-gau-bong-2.jpg">đôi gấu bông dễ thương</a> sẽ thêm điểm cho nhà trai khi đến nhà gái đồng thời cũng làm đẹp lòng cô dâu</div>
</div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-dich-vu-cuoi-hoi-mam-qua-ket-cuom-ren-tong-hop-do-hong-vang-cao-cap-sang-trong-long-lau-cho-le-an-an-tuong-hoan-hao.jpg"><img src="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-mam-qua-ket-cuom-ren-tong-hop-do-hong-vang-cao-cap-sang-trong-long-lau-cho-le-an-an-tuong-hoan-hao.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" /></a></div>
<div>Mâm quả kết ren bắt mắt, trang trọng - <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a></div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-trang-tri-backdrop-hoa-tong-mau-tim-lang-man-de-thuong.jpg"><img src="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-trang-tri-backdrop-hoa-tong-mau-tim-lang-man-de-thuong.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" /></a></div>
<div><a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/159/z-backdrop-hoa-giay-lua-mau-hoa-day-tuoi-dep-da-sac-mau-1">Backdrop hoa giấy lụa</a> trang trí khu vực đón khách trong tiệc cưới - <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a></div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-mau-cao-cap-sang-trong-dac-biet-kem-cong-hoa-vai-tong-hong-tim-hoa-ca-mau-2.jpg"><img src="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-mau-cao-cap-sang-trong-dac-biet-kem-cong-hoa-vai-tong-hong-tim-hoa-ca-mau-2.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" /></a></div>
<div><a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/773/nha-bat-rap-voan-pha-le-hang-rao-tinh-yeu">Nhà bạt voan, pha lê hàng rào tình yêu</a> - <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a></div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-bo-tong-mau-cam-voi-ban-duoc-trang-trang-tri-day-voan-hong-va-hoa-tuoi-nen-anh-cuoi-gau-bong-kem-2-ghe-vai-ren-hoa-hong-sang-trong.jpg"><img src="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-bo-tong-mau-cam-voi-ban-duoc-trang-trang-tri-day-voan-hong-va-hoa-tuoi-nen-anh-cuoi-gau-bong-kem-2-ghe-vai-ren-hoa-hong-sang-trong.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" /></a></div>
<div><a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/771/trang-tri-ban-ky-ten-don-khach">Trang trí bàn ký tên đón khách</a> - <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a></div>
<div></div>
<div>-----------------------------------------------------------</div>
<div>Mọi chi tiết về việc tư vấn cưới hỏi, đặt dịch vụ quý khách vui lòng liên hệ</div>
<div>
<div>Shop Dịch Vụ Cưới Hỏi Tâm Như</div>
<div>Địa chỉ: 737 - 747 Quang Trung, Phường 12, Quận Gò Vấp, TP.Hồ Chí Minh</div>
<div>Email: shopcuoihoitamnhu@gmail.com </div>
<div>Điện thoại: 08.66 80 72 24 - Hotline: 0913.62 34 72 - 0974.24 18 24</div>
<div>Website: <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-tam-nhu-cong-ty-trang-tri-dam-cuoi">www.ShopCuoiHoiTamNhu.com</a></div>
</div>
</div>
</div>
</td>
</tr>
</tbody>
</table>]]></content></About>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1061, N'6296266f-59a3-470d-9d3a-07437cde7c8f', CAST(N'2016-04-06 13:59:00.360' AS DateTime), N'<About id="1061" key="5154808d-5144-4df6-88c9-9f25184c52e0" parentID="1051" level="2" creatorID="0" sortOrder="0" createDate="2016-04-05T15:46:21" updateDate="2016-04-06T13:59:00" nodeName="Giới thiệu" urlName="giới-thiệu" path="-1,1051,1061" isDoc="" nodeType="1056" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1055" nodeTypeAlias="About"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Giới thiệu]]></pageName></About>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1061, N'dd67910e-db89-454e-96cb-1baea493b209', CAST(N'2016-04-05 15:46:21.037' AS DateTime), N'<About id="1061" key="5154808d-5144-4df6-88c9-9f25184c52e0" parentID="1051" level="2" creatorID="0" sortOrder="1" createDate="2016-04-05T15:46:21" updateDate="2016-04-05T15:46:21" nodeName="Giới thiệu" urlName="giới-thiệu" path="-1,1051,1061" isDoc="" nodeType="1056" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1055" nodeTypeAlias="About"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Giới thiệu]]></pageName></About>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1061, N'5517d347-96ff-4e3f-85d4-2343dfa8f41f', CAST(N'2016-04-06 15:54:03.290' AS DateTime), N'<About id="1061" key="5154808d-5144-4df6-88c9-9f25184c52e0" parentID="1051" level="2" creatorID="0" sortOrder="0" createDate="2016-04-05T15:46:21" updateDate="2016-04-06T15:54:03" nodeName="Giới thiệu" urlName="gioi-thieu" path="-1,1051,1061" isDoc="" nodeType="1056" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1055" nodeTypeAlias="About"><umbracoUrlName><![CDATA[gioi-thieu]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Giới thiệu]]></pageName></About>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1061, N'98b41b26-60ef-4047-bdc1-28e675177697', CAST(N'2016-04-06 16:00:04.153' AS DateTime), N'<About id="1061" key="5154808d-5144-4df6-88c9-9f25184c52e0" parentID="1051" level="2" creatorID="0" sortOrder="0" createDate="2016-04-05T15:46:21" updateDate="2016-04-06T16:00:04" nodeName="Giới thiệu" urlName="gioi-thieu" path="-1,1051,1061" isDoc="" nodeType="1056" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1055" nodeTypeAlias="About"><umbracoUrlName><![CDATA[gioi-thieu]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Giới thiệu]]></pageName><content><![CDATA[<p>RỒNG PHỤNG HẢI DIỄM</p>
<p>Chuyên cung cấp dịch vụ rồng phụng trái cây ngày cưới cho các cặp đôi hoàn hảo</p>
<div>Mỗi mẫu trang trí nhà cưới hỏi của <span>RỒNG PHỤNG HẢI DIỄM </span>thường gồm có:</div>
<div>* <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/679/ban-tho-gia-tien-ngay-cuoi">Trang trí bàn thờ gia tiên</a> hay còn gọi là bàn thờ tổ tiên của <span>RỒNG PHỤNG HẢI DIỄM </span>với </div>
<div>+ Các kiểu trang trí bàn thờ gồm có: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/924/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">mẫu truyền thống nhung đỏ</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/928/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">mẫu tự nhiên</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/978/ban-tho-to-tien-ngay-cuoi-tong-hong-canh-sen-mau-tu-nhien-duoc-t">mẫu hiện đại</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/944/ban-tho-to-tien-ngay-cuoi-mau-thien-chua-tong-xanh-la-cho-trang-">mẫu thiên chúa tin lành</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/946/ban-tho-to-tien-ngay-cuoi-mau-dep-voi-manh-tre-mau-do-chuc-phuc-">mẫu mành tre</a> với dây voan, hoa vải hoa tươi trang trí, chữ song hỷ, câu đối trang trí; </div>
<div>+ Chữ dán trên phong nền có thể là: <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-dich-vu-cuoi-hoi-ban-tho-to-tien-ngay-cuoi-tong-cam-mau-tu-nhien-duoc-trang-tri-bang-vai-voan-cao-cap-cho-le-an-hoi-gia-tien-dam-cuoi-day-du-nghi-le-4.jpg">Song hỷ</a> ; <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/946/ban-tho-to-tien-ngay-cuoi-mau-dep-voi-manh-tre-mau-do-chuc-phuc-">Phúc</a>; <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/936/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">Trăm năm hạnh phúc</a>;  Kính nhớ tổ tiên ;  Long phụng hòa minh - Sắc cầm hỏa hợp; Trăm năm tình viên mãn bạc đầu nghĩa phu thê</div>
<div>+ Trên bàn thờ có đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/955/ban-tho-to-tien-ngay-cuoi-mau-an-tuong-tong-hong-cho-trang-tri-l">1 bộ lư</a> để bình thường hoặc trang trí thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/993/ban-tho-to-tien-ngay-cuoi-tong-trang-do-mau-tu-nhien-duoc-trang-">hoa tươi</a></div>
<div>+ Đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/984/ban-tho-to-tien-ngay-cuoi-tong-hong-mau-tu-nhien-duoc-trang-tri-">hai bình hoa tươi</a> song hỷ hoặc một bình hoa tươi một mâm trái cây ngũ quả hoặc là đặc biệt hơn là mẫu trang trí hoa <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/986/ban-tho-to-tien-ngay-cuoi-tong-hong-mau-tu-nhien-duoc-trang-tri-">cắm đỗ bàn thờ</a></div>
<div>+ Đặt một đôi <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/648/rong-phung-trai-cay-ngay-cuoi">rồng phụng trái cây</a> sẽ mang lại không khí ấm áp, sung túc cho ngày lễ ăn hỏi, lễ cưới của bạn</div>
<div>+ Cạnh bàn thờ thì ở nhà gái còn đặt thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1031/hoa-giay-lua-tong-trang-do-long-lay-trang-tri-ban-tho-to-tien-n">một cái bàn nhỏ</a> được phủ mặt bàn được may bắt mắt để đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/859/mam-qua-tong-hop-qua-trai-cay-trau-cau-rong-phung-trai-cay-dac-s">mâm quả lễ vật</a> của nhà trai</div>]]></content></About>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1061, N'a2c9b908-1db6-4d9d-a819-4446ed884f1a', CAST(N'2016-04-06 15:52:26.227' AS DateTime), N'<About id="1061" key="5154808d-5144-4df6-88c9-9f25184c52e0" parentID="1051" level="2" creatorID="0" sortOrder="0" createDate="2016-04-05T15:46:21" updateDate="2016-04-06T15:52:26" nodeName="Giới thiệu" urlName="gioi-thieu" path="-1,1051,1061" isDoc="" nodeType="1056" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1055" nodeTypeAlias="About"><umbracoUrlName><![CDATA[gioi-thieu]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Giới thiệu]]></pageName></About>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1061, N'f8614c47-59d5-4ded-8f1f-4ad80ac935b8', CAST(N'2016-04-06 16:00:54.157' AS DateTime), N'<About id="1061" key="5154808d-5144-4df6-88c9-9f25184c52e0" parentID="1051" level="2" creatorID="0" sortOrder="0" createDate="2016-04-05T15:46:21" updateDate="2016-04-06T16:00:54" nodeName="Giới thiệu" urlName="gioi-thieu" path="-1,1051,1061" isDoc="" nodeType="1056" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1055" nodeTypeAlias="About"><umbracoUrlName><![CDATA[gioi-thieu]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Giới thiệu]]></pageName><content><![CDATA[<h2 style="color: #fff;">RỒNG PHỤNG HẢI DIỄM</h2>
<p>Chuyên cung cấp dịch vụ rồng phụng trái cây ngày cưới cho các cặp đôi hoàn hảo</p>
<div>Mỗi mẫu trang trí nhà cưới hỏi của <span>RỒNG PHỤNG HẢI DIỄM </span>thường gồm có:</div>
<div>* <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/679/ban-tho-gia-tien-ngay-cuoi">Trang trí bàn thờ gia tiên</a> hay còn gọi là bàn thờ tổ tiên của <span>RỒNG PHỤNG HẢI DIỄM </span>với </div>
<div>+ Các kiểu trang trí bàn thờ gồm có: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/924/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">mẫu truyền thống nhung đỏ</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/928/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">mẫu tự nhiên</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/978/ban-tho-to-tien-ngay-cuoi-tong-hong-canh-sen-mau-tu-nhien-duoc-t">mẫu hiện đại</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/944/ban-tho-to-tien-ngay-cuoi-mau-thien-chua-tong-xanh-la-cho-trang-">mẫu thiên chúa tin lành</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/946/ban-tho-to-tien-ngay-cuoi-mau-dep-voi-manh-tre-mau-do-chuc-phuc-">mẫu mành tre</a> với dây voan, hoa vải hoa tươi trang trí, chữ song hỷ, câu đối trang trí; </div>
<div>+ Chữ dán trên phong nền có thể là: <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-dich-vu-cuoi-hoi-ban-tho-to-tien-ngay-cuoi-tong-cam-mau-tu-nhien-duoc-trang-tri-bang-vai-voan-cao-cap-cho-le-an-hoi-gia-tien-dam-cuoi-day-du-nghi-le-4.jpg">Song hỷ</a> ; <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/946/ban-tho-to-tien-ngay-cuoi-mau-dep-voi-manh-tre-mau-do-chuc-phuc-">Phúc</a>; <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/936/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">Trăm năm hạnh phúc</a>;  Kính nhớ tổ tiên ;  Long phụng hòa minh - Sắc cầm hỏa hợp; Trăm năm tình viên mãn bạc đầu nghĩa phu thê</div>
<div>+ Trên bàn thờ có đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/955/ban-tho-to-tien-ngay-cuoi-mau-an-tuong-tong-hong-cho-trang-tri-l">1 bộ lư</a> để bình thường hoặc trang trí thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/993/ban-tho-to-tien-ngay-cuoi-tong-trang-do-mau-tu-nhien-duoc-trang-">hoa tươi</a></div>
<div>+ Đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/984/ban-tho-to-tien-ngay-cuoi-tong-hong-mau-tu-nhien-duoc-trang-tri-">hai bình hoa tươi</a> song hỷ hoặc một bình hoa tươi một mâm trái cây ngũ quả hoặc là đặc biệt hơn là mẫu trang trí hoa <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/986/ban-tho-to-tien-ngay-cuoi-tong-hong-mau-tu-nhien-duoc-trang-tri-">cắm đỗ bàn thờ</a></div>
<div>+ Đặt một đôi <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/648/rong-phung-trai-cay-ngay-cuoi">rồng phụng trái cây</a> sẽ mang lại không khí ấm áp, sung túc cho ngày lễ ăn hỏi, lễ cưới của bạn</div>
<div>+ Cạnh bàn thờ thì ở nhà gái còn đặt thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1031/hoa-giay-lua-tong-trang-do-long-lay-trang-tri-ban-tho-to-tien-n">một cái bàn nhỏ</a> được phủ mặt bàn được may bắt mắt để đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/859/mam-qua-tong-hop-qua-trai-cay-trau-cau-rong-phung-trai-cay-dac-s">mâm quả lễ vật</a> của nhà trai</div>]]></content></About>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1061, N'56619615-24f6-4f6b-921b-62bc8c5151ae', CAST(N'2016-04-12 14:17:15.683' AS DateTime), N'<About id="1061" key="5154808d-5144-4df6-88c9-9f25184c52e0" parentID="1051" level="2" creatorID="0" sortOrder="0" createDate="2016-04-05T15:46:21" updateDate="2016-04-12T14:17:15" nodeName="Giới thiệu" urlName="gioi-thieu" path="-1,1051,1061" isDoc="" nodeType="1056" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1055" nodeTypeAlias="About"><umbracoUrlName><![CDATA[gioi-thieu]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageKeywords><![CDATA[gioi thieu, rongphunghaidiem, rongphung, rong, phung]]></pageKeywords><pagetitle><![CDATA[Giới thiệu]]></pagetitle><pageName><![CDATA[Giới thiệu]]></pageName><content><![CDATA[<p>RỒNG PHỤNG HẢI DIỄM</p>
<p>Chuyên cung cấp dịch vụ rồng phụng trái cây ngày cưới cho các cặp đôi hoàn hảo</p>
<div>
<div><em>Mỗi mẫu trang trí nhà cưới hỏi của RỒNG PHỤNG HẢI DIỄM thường gồm có:</em></div>
<div><em>* <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/679/ban-tho-gia-tien-ngay-cuoi">Trang trí bàn thờ gia tiên</a> hay còn gọi là bàn thờ tổ tiên của RỒNG PHỤNG HẢI DIỄM với </em></div>
<div><em>+ Các kiểu trang trí bàn thờ gồm có: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/924/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">mẫu truyền thống nhung đỏ</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/928/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">mẫu tự nhiên</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/978/ban-tho-to-tien-ngay-cuoi-tong-hong-canh-sen-mau-tu-nhien-duoc-t">mẫu hiện đại</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/944/ban-tho-to-tien-ngay-cuoi-mau-thien-chua-tong-xanh-la-cho-trang-">mẫu thiên chúa tin lành</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/946/ban-tho-to-tien-ngay-cuoi-mau-dep-voi-manh-tre-mau-do-chuc-phuc-">mẫu mành tre</a> với dây voan, hoa vải hoa tươi trang trí, chữ song hỷ, câu đối trang trí; </em></div>
<div><em>+ Chữ dán trên phong nền có thể là: <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-dich-vu-cuoi-hoi-ban-tho-to-tien-ngay-cuoi-tong-cam-mau-tu-nhien-duoc-trang-tri-bang-vai-voan-cao-cap-cho-le-an-hoi-gia-tien-dam-cuoi-day-du-nghi-le-4.jpg">Song hỷ</a> ; <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/946/ban-tho-to-tien-ngay-cuoi-mau-dep-voi-manh-tre-mau-do-chuc-phuc-">Phúc</a>; <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/936/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">Trăm năm hạnh phúc</a>;  Kính nhớ tổ tiên ;  Long phụng hòa minh - Sắc cầm hỏa hợp; Trăm năm tình viên mãn bạc đầu nghĩa phu thê</em></div>
<div><em>+ Trên bàn thờ có đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/955/ban-tho-to-tien-ngay-cuoi-mau-an-tuong-tong-hong-cho-trang-tri-l">1 bộ lư</a> để bình thường hoặc trang trí thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/993/ban-tho-to-tien-ngay-cuoi-tong-trang-do-mau-tu-nhien-duoc-trang-">hoa tươi</a></em></div>
<div><em>+ Đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/984/ban-tho-to-tien-ngay-cuoi-tong-hong-mau-tu-nhien-duoc-trang-tri-">hai bình hoa tươi</a> song hỷ hoặc một bình hoa tươi một mâm trái cây ngũ quả hoặc là đặc biệt hơn là mẫu trang trí hoa <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/986/ban-tho-to-tien-ngay-cuoi-tong-hong-mau-tu-nhien-duoc-trang-tri-">cắm đỗ bàn thờ</a></em></div>
<div><em>+ Đặt một đôi <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/648/rong-phung-trai-cay-ngay-cuoi">rồng phụng trái cây</a> sẽ mang lại không khí ấm áp, sung túc cho ngày lễ ăn hỏi, lễ cưới của bạn</em></div>
<div><em>+ Cạnh bàn thờ thì ở nhà gái còn đặt thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1031/hoa-giay-lua-tong-trang-do-long-lay-trang-tri-ban-tho-to-tien-n">một cái bàn nhỏ</a> được phủ mặt bàn được may bắt mắt để đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/859/mam-qua-tong-hop-qua-trai-cay-trau-cau-rong-phung-trai-cay-dac-s">mâm quả lễ vật</a> của nhà trai</em></div>
</div>]]></content></About>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1061, N'1578e266-12c6-410e-9a37-705153622ce0', CAST(N'2016-04-06 16:06:17.057' AS DateTime), N'<About id="1061" key="5154808d-5144-4df6-88c9-9f25184c52e0" parentID="1051" level="2" creatorID="0" sortOrder="0" createDate="2016-04-05T15:46:21" updateDate="2016-04-06T16:06:17" nodeName="Giới thiệu" urlName="gioi-thieu" path="-1,1051,1061" isDoc="" nodeType="1056" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1055" nodeTypeAlias="About"><umbracoUrlName><![CDATA[gioi-thieu]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageKeywords><![CDATA[gioi thieu, rongphunghaidiem, rongphung, rong, phung]]></pageKeywords><pagetitle><![CDATA[Giới thiệu]]></pagetitle><pageName><![CDATA[Giới thiệu]]></pageName><content><![CDATA[<p style="color: #fff;">RỒNG PHỤNG HẢI DIỄM</p>
<p style="color: #fff;">Chuyên cung cấp dịch vụ rồng phụng trái cây ngày cưới cho các cặp đôi hoàn hảo</p>
<div style="color: #000;">
<div><em>Mỗi mẫu trang trí nhà cưới hỏi của RỒNG PHỤNG HẢI DIỄM thường gồm có:</em></div>
<div><em>* <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/679/ban-tho-gia-tien-ngay-cuoi">Trang trí bàn thờ gia tiên</a> hay còn gọi là bàn thờ tổ tiên của RỒNG PHỤNG HẢI DIỄM với </em></div>
<div><em>+ Các kiểu trang trí bàn thờ gồm có: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/924/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">mẫu truyền thống nhung đỏ</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/928/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">mẫu tự nhiên</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/978/ban-tho-to-tien-ngay-cuoi-tong-hong-canh-sen-mau-tu-nhien-duoc-t">mẫu hiện đại</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/944/ban-tho-to-tien-ngay-cuoi-mau-thien-chua-tong-xanh-la-cho-trang-">mẫu thiên chúa tin lành</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/946/ban-tho-to-tien-ngay-cuoi-mau-dep-voi-manh-tre-mau-do-chuc-phuc-">mẫu mành tre</a> với dây voan, hoa vải hoa tươi trang trí, chữ song hỷ, câu đối trang trí; </em></div>
<div><em>+ Chữ dán trên phong nền có thể là: <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-dich-vu-cuoi-hoi-ban-tho-to-tien-ngay-cuoi-tong-cam-mau-tu-nhien-duoc-trang-tri-bang-vai-voan-cao-cap-cho-le-an-hoi-gia-tien-dam-cuoi-day-du-nghi-le-4.jpg">Song hỷ</a> ; <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/946/ban-tho-to-tien-ngay-cuoi-mau-dep-voi-manh-tre-mau-do-chuc-phuc-">Phúc</a>; <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/936/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">Trăm năm hạnh phúc</a>;  Kính nhớ tổ tiên ;  Long phụng hòa minh - Sắc cầm hỏa hợp; Trăm năm tình viên mãn bạc đầu nghĩa phu thê</em></div>
<div><em>+ Trên bàn thờ có đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/955/ban-tho-to-tien-ngay-cuoi-mau-an-tuong-tong-hong-cho-trang-tri-l">1 bộ lư</a> để bình thường hoặc trang trí thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/993/ban-tho-to-tien-ngay-cuoi-tong-trang-do-mau-tu-nhien-duoc-trang-">hoa tươi</a></em></div>
<div><em>+ Đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/984/ban-tho-to-tien-ngay-cuoi-tong-hong-mau-tu-nhien-duoc-trang-tri-">hai bình hoa tươi</a> song hỷ hoặc một bình hoa tươi một mâm trái cây ngũ quả hoặc là đặc biệt hơn là mẫu trang trí hoa <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/986/ban-tho-to-tien-ngay-cuoi-tong-hong-mau-tu-nhien-duoc-trang-tri-">cắm đỗ bàn thờ</a></em></div>
<div><em>+ Đặt một đôi <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/648/rong-phung-trai-cay-ngay-cuoi">rồng phụng trái cây</a> sẽ mang lại không khí ấm áp, sung túc cho ngày lễ ăn hỏi, lễ cưới của bạn</em></div>
<div><em>+ Cạnh bàn thờ thì ở nhà gái còn đặt thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1031/hoa-giay-lua-tong-trang-do-long-lay-trang-tri-ban-tho-to-tien-n">một cái bàn nhỏ</a> được phủ mặt bàn được may bắt mắt để đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/859/mam-qua-tong-hop-qua-trai-cay-trau-cau-rong-phung-trai-cay-dac-s">mâm quả lễ vật</a> của nhà trai</em></div>
</div>]]></content></About>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1061, N'c8e15daf-b350-4421-91d8-8733accf459e', CAST(N'2016-04-06 16:02:17.010' AS DateTime), N'<About id="1061" key="5154808d-5144-4df6-88c9-9f25184c52e0" parentID="1051" level="2" creatorID="0" sortOrder="0" createDate="2016-04-05T15:46:21" updateDate="2016-04-06T16:02:16" nodeName="Giới thiệu" urlName="gioi-thieu" path="-1,1051,1061" isDoc="" nodeType="1056" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1055" nodeTypeAlias="About"><umbracoUrlName><![CDATA[gioi-thieu]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Giới thiệu]]></pageName><content><![CDATA[<p style="color: #fff;">RỒNG PHỤNG HẢI DIỄM</p>
<p style="color: #fff;">Chuyên cung cấp dịch vụ rồng phụng trái cây ngày cưới cho các cặp đôi hoàn hảo</p>
<div style="color: #000;">
<div><em>Mỗi mẫu trang trí nhà cưới hỏi của RỒNG PHỤNG HẢI DIỄM thường gồm có:</em></div>
<div><em>* <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/679/ban-tho-gia-tien-ngay-cuoi">Trang trí bàn thờ gia tiên</a> hay còn gọi là bàn thờ tổ tiên của RỒNG PHỤNG HẢI DIỄM với </em></div>
<div><em>+ Các kiểu trang trí bàn thờ gồm có: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/924/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">mẫu truyền thống nhung đỏ</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/928/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">mẫu tự nhiên</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/978/ban-tho-to-tien-ngay-cuoi-tong-hong-canh-sen-mau-tu-nhien-duoc-t">mẫu hiện đại</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/944/ban-tho-to-tien-ngay-cuoi-mau-thien-chua-tong-xanh-la-cho-trang-">mẫu thiên chúa tin lành</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/946/ban-tho-to-tien-ngay-cuoi-mau-dep-voi-manh-tre-mau-do-chuc-phuc-">mẫu mành tre</a> với dây voan, hoa vải hoa tươi trang trí, chữ song hỷ, câu đối trang trí; </em></div>
<div><em>+ Chữ dán trên phong nền có thể là: <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-dich-vu-cuoi-hoi-ban-tho-to-tien-ngay-cuoi-tong-cam-mau-tu-nhien-duoc-trang-tri-bang-vai-voan-cao-cap-cho-le-an-hoi-gia-tien-dam-cuoi-day-du-nghi-le-4.jpg">Song hỷ</a> ; <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/946/ban-tho-to-tien-ngay-cuoi-mau-dep-voi-manh-tre-mau-do-chuc-phuc-">Phúc</a>; <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/936/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">Trăm năm hạnh phúc</a>;  Kính nhớ tổ tiên ;  Long phụng hòa minh - Sắc cầm hỏa hợp; Trăm năm tình viên mãn bạc đầu nghĩa phu thê</em></div>
<div><em>+ Trên bàn thờ có đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/955/ban-tho-to-tien-ngay-cuoi-mau-an-tuong-tong-hong-cho-trang-tri-l">1 bộ lư</a> để bình thường hoặc trang trí thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/993/ban-tho-to-tien-ngay-cuoi-tong-trang-do-mau-tu-nhien-duoc-trang-">hoa tươi</a></em></div>
<div><em>+ Đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/984/ban-tho-to-tien-ngay-cuoi-tong-hong-mau-tu-nhien-duoc-trang-tri-">hai bình hoa tươi</a> song hỷ hoặc một bình hoa tươi một mâm trái cây ngũ quả hoặc là đặc biệt hơn là mẫu trang trí hoa <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/986/ban-tho-to-tien-ngay-cuoi-tong-hong-mau-tu-nhien-duoc-trang-tri-">cắm đỗ bàn thờ</a></em></div>
<div><em>+ Đặt một đôi <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/648/rong-phung-trai-cay-ngay-cuoi">rồng phụng trái cây</a> sẽ mang lại không khí ấm áp, sung túc cho ngày lễ ăn hỏi, lễ cưới của bạn</em></div>
<div><em>+ Cạnh bàn thờ thì ở nhà gái còn đặt thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1031/hoa-giay-lua-tong-trang-do-long-lay-trang-tri-ban-tho-to-tien-n">một cái bàn nhỏ</a> được phủ mặt bàn được may bắt mắt để đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/859/mam-qua-tong-hop-qua-trai-cay-trau-cau-rong-phung-trai-cay-dac-s">mâm quả lễ vật</a> của nhà trai</em></div>
</div>]]></content></About>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1061, N'b6f779b1-9ccb-43d7-aa7e-9763a98e138c', CAST(N'2016-04-06 14:23:55.977' AS DateTime), N'<About id="1061" key="5154808d-5144-4df6-88c9-9f25184c52e0" parentID="1051" level="2" creatorID="0" sortOrder="0" createDate="2016-04-05T15:46:21" updateDate="2016-04-06T14:23:55" nodeName="Giới thiệu" urlName="gioi-thieu" path="-1,1051,1061" isDoc="" nodeType="1056" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1055" nodeTypeAlias="About"><umbracoUrlName><![CDATA[gioi-thieu]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Giới thiệu]]></pageName></About>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1061, N'0393235a-c6cc-487e-a313-9a81c056471d', CAST(N'2016-04-06 15:52:50.913' AS DateTime), N'<About id="1061" key="5154808d-5144-4df6-88c9-9f25184c52e0" parentID="1051" level="2" creatorID="0" sortOrder="0" createDate="2016-04-05T15:46:21" updateDate="2016-04-06T15:52:50" nodeName="Giới thiệu" urlName="gioi-thieu" path="-1,1051,1061" isDoc="" nodeType="1056" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1055" nodeTypeAlias="About"><umbracoUrlName><![CDATA[gioi-thieu]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Giới thiệu]]></pageName><content><![CDATA[<ul id="menu">
<li class="m1"><a href="http://emotionslive.co.uk/index.html" title="Fresh Stuff">Fresh Stuff</a></li>
<li class="m2"><a href="http://emotionslive.co.uk/portfolio.html" title="Portfolio">Portfolio</a></li>
<li class="m3"><a href="http://emotionslive.co.uk/about.html" title="About Me">About Me</a></li>
</ul>
<h1><a href="http://emotionslive.co.uk/index.html" title="EMOTIONS by Mike - freelance portfolio"><img src="http://emotionslive.co.uk/img/logo.gif" alt="EMOTIONS by Mike - freelance portfolio" /></a></h1>
<div id="txt"><img src="http://emotionslive.co.uk/img/h_portfolio.gif" alt="About This Site" />
<p><strong>I''ve been doing</strong> web design for 7 years and the works below represent only <br />a small part of what I have done up to date. If you want to see more designs please visit my new portfolio website at <strong><a href="http://www.creativemints.com/" target="_blank" title="Creative Mints">www.creativemints.com</a></strong></p>
<div id="line"></div>
<dl class="preview">
<dt><img src="http://emotionslive.co.uk/img/p_logo.gif" alt="" /></dt>
<dd><a href="http://emotionslive.co.uk/portfolio.html"><img src="http://emotionslive.co.uk/portfolio/20060609003709.jpg" border="0" alt="" width="94" height="55" /></a></dd>
</dl>
<dl class="preview">
<dt><img src="http://emotionslive.co.uk/img/p_web.gif" alt="" /></dt>
<dd class="p2"><a href="http://emotionslive.co.uk/portfolio.html"><img src="http://emotionslive.co.uk/portfolio/20060609003611.jpg" border="0" alt="" width="94" height="55" /></a></dd>
</dl>
<dl class="preview">
<dt><img src="http://emotionslive.co.uk/img/p_web.gif" alt="" /></dt>
<dd class="p3"><a href="http://emotionslive.co.uk/portfolio.html"><img src="http://emotionslive.co.uk/portfolio/20060609003458.jpg" border="0" alt="" width="94" height="55" /></a></dd>
</dl>
<dl class="preview">
<dt><img src="http://emotionslive.co.uk/img/p_web.gif" alt="" /></dt>
<dd><a href="http://emotionslive.co.uk/portfolio.html"><img src="http://emotionslive.co.uk/portfolio/20060609003116.jpg" border="0" alt="" width="94" height="55" /></a></dd>
</dl>
<dl class="preview">
<dt><img src="http://emotionslive.co.uk/img/p_logo.gif" alt="" /></dt>
<dd class="p2"><a href="http://emotionslive.co.uk/portfolio.html"><img src="http://emotionslive.co.uk/portfolio/20060609002941.jpg" border="0" alt="" width="94" height="55" /></a></dd>
</dl>
<dl class="preview">
<dt><img src="http://emotionslive.co.uk/img/p_web.gif" alt="" /></dt>
<dd class="p3"><a href="http://emotionslive.co.uk/portfolio.html"><img src="http://emotionslive.co.uk/portfolio/20060609002827.jpg" border="0" alt="" width="94" height="55" /></a></dd>
</dl>
<dl class="preview">
<dt><img src="http://emotionslive.co.uk/img/p_web.gif" alt="" /></dt>
<dd><a href="http://emotionslive.co.uk/portfolio.html"><img src="http://emotionslive.co.uk/portfolio/20060609002659.jpg" border="0" alt="" width="94" height="55" /></a></dd>
</dl>
<dl class="preview">
<dt><img src="http://emotionslive.co.uk/img/p_web.gif" alt="" /></dt>
<dd class="p2"><a href="http://emotionslive.co.uk/portfolio.html"><img src="http://emotionslive.co.uk/portfolio/20060609002548.jpg" border="0" alt="" width="94" height="55" /></a></dd>
</dl>
<dl class="preview">
<dt><img src="http://emotionslive.co.uk/img/p_web.gif" alt="" /></dt>
<dd class="p3"><a href="http://emotionslive.co.uk/portfolio.html"><img src="http://emotionslive.co.uk/portfolio/20060609002142.jpg" border="0" alt="" width="94" height="55" /></a></dd>
</dl>
<dl class="preview">
<dt><img src="http://emotionslive.co.uk/img/p_web.gif" alt="" /></dt>
<dd><a href="http://emotionslive.co.uk/portfolio.html"><img src="http://emotionslive.co.uk/portfolio/20051209205943.jpg" border="0" alt="" width="94" height="55" /></a></dd>
</dl>
<dl class="preview">
<dt><img src="http://emotionslive.co.uk/img/p_web.gif" alt="" /></dt>
<dd class="p2"><a href="http://emotionslive.co.uk/portfolio.html"><img src="http://emotionslive.co.uk/portfolio/20051209205810.jpg" border="0" alt="" width="94" height="55" /></a></dd>
</dl>
<dl class="preview">
<dt><img src="http://emotionslive.co.uk/img/p_char.gif" alt="" /></dt>
<dd class="p3"><a href="http://emotionslive.co.uk/portfolio.html"><img src="http://emotionslive.co.uk/portfolio/20051209205627.jpg" border="0" alt="" width="94" height="55" /></a></dd>
</dl>
<div class="clear"></div>
<div id="line3"><a class="left"><img src="http://emotionslive.co.uk/img/arr_l_d.gif" border="0" alt="Previous not aviable" /></a><a href="http://emotionslive.co.uk/portfolio2.html"><img src="http://emotionslive.co.uk/img/arr_r.gif" border="0" alt="Next" /></a></div>
</div>]]></content></About>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1061, N'5ccae885-baf3-478d-98b2-ce66df496a95', CAST(N'2016-04-06 16:01:30.113' AS DateTime), N'<About id="1061" key="5154808d-5144-4df6-88c9-9f25184c52e0" parentID="1051" level="2" creatorID="0" sortOrder="0" createDate="2016-04-05T15:46:21" updateDate="2016-04-06T16:01:30" nodeName="Giới thiệu" urlName="gioi-thieu" path="-1,1051,1061" isDoc="" nodeType="1056" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1055" nodeTypeAlias="About"><umbracoUrlName><![CDATA[gioi-thieu]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Giới thiệu]]></pageName><content><![CDATA[<p style="color: #fff;">RỒNG PHỤNG HẢI DIỄM</p>
<p style="color: #fff;">Chuyên cung cấp dịch vụ rồng phụng trái cây ngày cưới cho các cặp đôi hoàn hảo</p>
<div>Mỗi mẫu trang trí nhà cưới hỏi của <span>RỒNG PHỤNG HẢI DIỄM </span>thường gồm có:</div>
<div>* <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/679/ban-tho-gia-tien-ngay-cuoi">Trang trí bàn thờ gia tiên</a> hay còn gọi là bàn thờ tổ tiên của <span>RỒNG PHỤNG HẢI DIỄM </span>với </div>
<div>+ Các kiểu trang trí bàn thờ gồm có: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/924/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">mẫu truyền thống nhung đỏ</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/928/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">mẫu tự nhiên</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/978/ban-tho-to-tien-ngay-cuoi-tong-hong-canh-sen-mau-tu-nhien-duoc-t">mẫu hiện đại</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/944/ban-tho-to-tien-ngay-cuoi-mau-thien-chua-tong-xanh-la-cho-trang-">mẫu thiên chúa tin lành</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/946/ban-tho-to-tien-ngay-cuoi-mau-dep-voi-manh-tre-mau-do-chuc-phuc-">mẫu mành tre</a> với dây voan, hoa vải hoa tươi trang trí, chữ song hỷ, câu đối trang trí; </div>
<div>+ Chữ dán trên phong nền có thể là: <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-dich-vu-cuoi-hoi-ban-tho-to-tien-ngay-cuoi-tong-cam-mau-tu-nhien-duoc-trang-tri-bang-vai-voan-cao-cap-cho-le-an-hoi-gia-tien-dam-cuoi-day-du-nghi-le-4.jpg">Song hỷ</a> ; <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/946/ban-tho-to-tien-ngay-cuoi-mau-dep-voi-manh-tre-mau-do-chuc-phuc-">Phúc</a>; <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/936/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">Trăm năm hạnh phúc</a>;  Kính nhớ tổ tiên ;  Long phụng hòa minh - Sắc cầm hỏa hợp; Trăm năm tình viên mãn bạc đầu nghĩa phu thê</div>
<div>+ Trên bàn thờ có đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/955/ban-tho-to-tien-ngay-cuoi-mau-an-tuong-tong-hong-cho-trang-tri-l">1 bộ lư</a> để bình thường hoặc trang trí thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/993/ban-tho-to-tien-ngay-cuoi-tong-trang-do-mau-tu-nhien-duoc-trang-">hoa tươi</a></div>
<div>+ Đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/984/ban-tho-to-tien-ngay-cuoi-tong-hong-mau-tu-nhien-duoc-trang-tri-">hai bình hoa tươi</a> song hỷ hoặc một bình hoa tươi một mâm trái cây ngũ quả hoặc là đặc biệt hơn là mẫu trang trí hoa <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/986/ban-tho-to-tien-ngay-cuoi-tong-hong-mau-tu-nhien-duoc-trang-tri-">cắm đỗ bàn thờ</a></div>
<div>+ Đặt một đôi <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/648/rong-phung-trai-cay-ngay-cuoi">rồng phụng trái cây</a> sẽ mang lại không khí ấm áp, sung túc cho ngày lễ ăn hỏi, lễ cưới của bạn</div>
<div>+ Cạnh bàn thờ thì ở nhà gái còn đặt thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1031/hoa-giay-lua-tong-trang-do-long-lay-trang-tri-ban-tho-to-tien-n">một cái bàn nhỏ</a> được phủ mặt bàn được may bắt mắt để đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/859/mam-qua-tong-hop-qua-trai-cay-trau-cau-rong-phung-trai-cay-dac-s">mâm quả lễ vật</a> của nhà trai</div>]]></content></About>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1064, N'd2988503-33e8-4bba-b3b4-1da11e56ef8a', CAST(N'2016-04-06 14:24:11.700' AS DateTime), N'<Fashion id="1064" key="fd7cd0d9-6aa7-43ce-98d1-492fa4ac233f" parentID="1051" level="2" creatorID="0" sortOrder="2" createDate="2016-04-05T15:50:38" updateDate="2016-04-06T14:24:11" nodeName="Thời trang" urlName="thoi-trang" path="-1,1051,1064" isDoc="" nodeType="1063" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1062" nodeTypeAlias="Fashion"><umbracoUrlName><![CDATA[thoi-trang]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Thời trang]]></pageName></Fashion>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1064, N'a8cf8090-7e09-4ff4-9618-2b22639c0ef6', CAST(N'2017-01-08 16:42:06.690' AS DateTime), N'<Fashion id="1064" key="fd7cd0d9-6aa7-43ce-98d1-492fa4ac233f" parentID="1051" level="2" creatorID="0" sortOrder="3" createDate="2016-04-05T15:50:38" updateDate="2017-01-08T16:42:06" nodeName="Thời trang" urlName="thoi-trang" path="-1,1051,1064" isDoc="" nodeType="1063" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1062" nodeTypeAlias="Fashion"><umbracoUrlName><![CDATA[thoi-trang]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Thời trang]]></pageName></Fashion>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1064, N'9109c2ba-10e0-4b1b-a403-6b819bbac0f6', CAST(N'2016-04-06 13:59:00.837' AS DateTime), N'<Fashion id="1064" key="fd7cd0d9-6aa7-43ce-98d1-492fa4ac233f" parentID="1051" level="2" creatorID="0" sortOrder="2" createDate="2016-04-05T15:50:38" updateDate="2016-04-06T13:59:00" nodeName="Thời trang" urlName="thời-trang" path="-1,1051,1064" isDoc="" nodeType="1063" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1062" nodeTypeAlias="Fashion"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Thời trang]]></pageName></Fashion>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1067, N'e9bb6e16-8721-4ebb-806c-59d174ba10bc', CAST(N'2017-01-08 16:42:06.700' AS DateTime), N'<Contactpage id="1067" key="cde7de7e-66d3-4acb-bbfe-fe0832d6aad0" parentID="1051" level="2" creatorID="0" sortOrder="4" createDate="2016-04-05T15:58:14" updateDate="2017-01-08T16:42:06" nodeName="Liên hệ" urlName="lien-he" path="-1,1051,1067" isDoc="" nodeType="1066" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1065" nodeTypeAlias="Contactpage"><umbracoUrlName><![CDATA[lien-he]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Liên hệ]]></pageName></Contactpage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1067, N'a5daf209-1541-4e64-a8b3-a5d4cc71a30a', CAST(N'2016-04-06 14:24:21.857' AS DateTime), N'<Contactpage id="1067" key="cde7de7e-66d3-4acb-bbfe-fe0832d6aad0" parentID="1051" level="2" creatorID="0" sortOrder="3" createDate="2016-04-05T15:58:14" updateDate="2016-04-06T14:24:21" nodeName="Liên hệ" urlName="lien-he" path="-1,1051,1067" isDoc="" nodeType="1066" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1065" nodeTypeAlias="Contactpage"><umbracoUrlName><![CDATA[lien-he]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Liên hệ]]></pageName></Contactpage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1067, N'ae6cde7e-dbff-4194-b987-ce007c079900', CAST(N'2017-01-08 17:06:17.543' AS DateTime), N'<Contactpage id="1067" key="cde7de7e-66d3-4acb-bbfe-fe0832d6aad0" parentID="1051" level="2" creatorID="0" sortOrder="5" createDate="2016-04-05T15:58:14" updateDate="2017-01-08T17:06:17" nodeName="Liên hệ" urlName="lien-he" path="-1,1051,1067" isDoc="" nodeType="1066" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1065" nodeTypeAlias="Contactpage"><umbracoUrlName><![CDATA[lien-he]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Liên hệ]]></pageName></Contactpage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1067, N'acedaf91-94a7-4efd-8d12-e03211fbeaaa', CAST(N'2016-04-06 13:59:01.070' AS DateTime), N'<Contactpage id="1067" key="cde7de7e-66d3-4acb-bbfe-fe0832d6aad0" parentID="1051" level="2" creatorID="0" sortOrder="3" createDate="2016-04-05T15:58:14" updateDate="2016-04-06T13:59:00" nodeName="Liên hệ" urlName="liên-hệ" path="-1,1051,1067" isDoc="" nodeType="1066" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1065" nodeTypeAlias="Contactpage"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Liên hệ]]></pageName></Contactpage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1075, N'073301b3-c255-4ee9-a4d7-31e2dad09462', CAST(N'2016-04-13 13:57:51.467' AS DateTime), N'<ProductItem id="1075" key="c705a36f-e322-4713-9235-6f4d254dedbd" parentID="1054" level="3" creatorID="0" sortOrder="1" createDate="2016-04-06T16:54:17" updateDate="2016-04-13T13:57:51" nodeName="Rồng phụng 2" urlName="rong-phung-2" path="-1,1051,1054,1075" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><umbracoUrlName><![CDATA[rong-phung-2]]></umbracoUrlName><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng 2]]></pageName><hinhAnh>1074</hinhAnh></ProductItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1075, N'ddd7dc6f-3740-4bbe-b62a-9b151727b442', CAST(N'2016-04-06 16:54:26.633' AS DateTime), N'<ProductItem id="1075" key="c705a36f-e322-4713-9235-6f4d254dedbd" parentID="1054" level="3" creatorID="0" sortOrder="1" createDate="2016-04-06T16:54:17" updateDate="2016-04-06T16:54:26" nodeName="Rồng phụng 2" urlName="rồng-phụng-2" path="-1,1051,1054,1075" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng 2]]></pageName><hinhAnh>1074</hinhAnh></ProductItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1075, N'bc50949e-2d1e-44e6-a141-e7184707ced2', CAST(N'2016-04-06 16:54:17.703' AS DateTime), N'<ProductItem id="1075" key="c705a36f-e322-4713-9235-6f4d254dedbd" parentID="1054" level="3" creatorID="0" sortOrder="1" createDate="2016-04-06T16:54:17" updateDate="2016-04-06T16:54:17" nodeName="Rồng phụng 1 (1)" urlName="rồng-phụng-1-1" path="-1,1051,1054,1075" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng 1]]></pageName><hinhAnh>1074</hinhAnh></ProductItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1076, N'3908088c-6865-45d9-a9bc-7ac46b4c03a7', CAST(N'2016-04-06 16:54:38.870' AS DateTime), N'<ProductItem id="1076" key="52440f67-43b2-4f69-ad14-7e579baf7dee" parentID="1054" level="3" creatorID="0" sortOrder="2" createDate="2016-04-06T16:54:38" updateDate="2016-04-06T16:54:38" nodeName="Rồng phụng 1 (1)" urlName="rồng-phụng-1-1" path="-1,1051,1054,1076" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng 1]]></pageName><hinhAnh>1074</hinhAnh></ProductItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1076, N'46d386db-1713-4cdc-9d7a-f75ae79daf02', CAST(N'2016-04-06 16:55:46.290' AS DateTime), N'<ProductItem id="1076" key="52440f67-43b2-4f69-ad14-7e579baf7dee" parentID="1054" level="3" creatorID="0" sortOrder="2" createDate="2016-04-06T16:54:38" updateDate="2016-04-06T16:55:46" nodeName="Rồng phụng 3" urlName="rồng-phụng-3" path="-1,1051,1054,1076" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng 3]]></pageName><hinhAnh>1074</hinhAnh></ProductItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1077, N'8add66e7-8b4b-474c-9841-4ec38dc86b2d', CAST(N'2016-04-06 16:54:50.590' AS DateTime), N'<ProductItem id="1077" key="18b48326-0e4f-4812-9964-d8d12b7468cc" parentID="1054" level="3" creatorID="0" sortOrder="3" createDate="2016-04-06T16:54:50" updateDate="2016-04-06T16:54:50" nodeName="Rồng phụng 1 (2)" urlName="rồng-phụng-1-2" path="-1,1051,1054,1077" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng 1]]></pageName><hinhAnh>1074</hinhAnh></ProductItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1077, N'a5dafcb1-40a8-4e45-983b-bd4990a09a8d', CAST(N'2016-04-06 16:55:55.623' AS DateTime), N'<ProductItem id="1077" key="18b48326-0e4f-4812-9964-d8d12b7468cc" parentID="1054" level="3" creatorID="0" sortOrder="3" createDate="2016-04-06T16:54:50" updateDate="2016-04-06T16:55:55" nodeName="Rồng phụng 4" urlName="rồng-phụng-4" path="-1,1051,1054,1077" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng 4]]></pageName><hinhAnh>1074</hinhAnh></ProductItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1078, N'0b7df8d4-043b-49ca-90f4-3d6841d6d6a9', CAST(N'2016-04-06 16:54:57.283' AS DateTime), N'<ProductItem id="1078" key="f381174a-a127-4b79-8ca7-d8c8052a303f" parentID="1054" level="3" creatorID="0" sortOrder="4" createDate="2016-04-06T16:54:57" updateDate="2016-04-06T16:54:57" nodeName="Rồng phụng 1 (3)" urlName="rồng-phụng-1-3" path="-1,1051,1054,1078" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng 1]]></pageName><hinhAnh>1074</hinhAnh></ProductItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1078, N'2a376053-1beb-43b8-b2df-d601f35ce4d4', CAST(N'2016-04-06 16:56:03.520' AS DateTime), N'<ProductItem id="1078" key="f381174a-a127-4b79-8ca7-d8c8052a303f" parentID="1054" level="3" creatorID="0" sortOrder="4" createDate="2016-04-06T16:54:57" updateDate="2016-04-06T16:56:03" nodeName="Rồng phụng 5" urlName="rồng-phụng-5" path="-1,1051,1054,1078" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng 5]]></pageName><hinhAnh>1074</hinhAnh></ProductItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1079, N'46fb7960-012a-4195-8095-c54a538af568', CAST(N'2016-04-06 16:56:11.357' AS DateTime), N'<ProductItem id="1079" key="8bba6abb-96a1-41ae-90a7-f7d581f77c3c" parentID="1054" level="3" creatorID="0" sortOrder="5" createDate="2016-04-06T16:55:03" updateDate="2016-04-06T16:56:11" nodeName="Rồng phụng 6" urlName="rồng-phụng-6" path="-1,1051,1054,1079" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng 6]]></pageName><hinhAnh>1074</hinhAnh></ProductItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1079, N'173e0cc7-269c-4d3f-92c1-d2493fa77067', CAST(N'2016-04-06 16:55:03.563' AS DateTime), N'<ProductItem id="1079" key="8bba6abb-96a1-41ae-90a7-f7d581f77c3c" parentID="1054" level="3" creatorID="0" sortOrder="5" createDate="2016-04-06T16:55:03" updateDate="2016-04-06T16:55:03" nodeName="Rồng phụng 1 (4)" urlName="rồng-phụng-1-4" path="-1,1051,1054,1079" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng 1]]></pageName><hinhAnh>1074</hinhAnh></ProductItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1080, N'72bc2f55-bff3-478f-b893-40f33df84717', CAST(N'2016-04-06 16:55:10.557' AS DateTime), N'<ProductItem id="1080" key="0ba31968-0791-443f-9e41-7095b732738f" parentID="1054" level="3" creatorID="0" sortOrder="6" createDate="2016-04-06T16:55:10" updateDate="2016-04-06T16:55:10" nodeName="Rồng phụng 1 (5)" urlName="rồng-phụng-1-5" path="-1,1051,1054,1080" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng 1]]></pageName><hinhAnh>1074</hinhAnh></ProductItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1080, N'8ce919f2-ba13-43e7-9ac1-53c0d74a42ba', CAST(N'2016-04-06 16:56:21.250' AS DateTime), N'<ProductItem id="1080" key="0ba31968-0791-443f-9e41-7095b732738f" parentID="1054" level="3" creatorID="0" sortOrder="6" createDate="2016-04-06T16:55:10" updateDate="2016-04-06T16:56:21" nodeName="Rồng phụng 7" urlName="rồng-phụng-7" path="-1,1051,1054,1080" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng 7]]></pageName><hinhAnh>1074</hinhAnh></ProductItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1081, N'1db2a172-fe8d-4538-bd05-b605b647aad1', CAST(N'2016-04-06 16:55:19.283' AS DateTime), N'<ProductItem id="1081" key="4a2c3e26-08d6-4d58-b79a-e2648b4f623e" parentID="1054" level="3" creatorID="0" sortOrder="7" createDate="2016-04-06T16:55:19" updateDate="2016-04-06T16:55:19" nodeName="Rồng phụng 1 (6)" urlName="rồng-phụng-1-6" path="-1,1051,1054,1081" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng 1]]></pageName><hinhAnh>1074</hinhAnh></ProductItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1081, N'c199d8fd-9ac2-4e4c-9e44-ee991a18b0bd', CAST(N'2016-04-06 16:56:30.217' AS DateTime), N'<ProductItem id="1081" key="4a2c3e26-08d6-4d58-b79a-e2648b4f623e" parentID="1054" level="3" creatorID="0" sortOrder="7" createDate="2016-04-06T16:55:19" updateDate="2016-04-06T16:56:30" nodeName="Rồng phụng 8" urlName="rồng-phụng-8" path="-1,1051,1054,1081" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng 8]]></pageName><hinhAnh>1074</hinhAnh></ProductItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1082, N'b4edf91b-83cb-4ec4-88db-abf87c8ced06', CAST(N'2016-04-06 16:55:29.093' AS DateTime), N'<ProductItem id="1082" key="db905eac-ba15-4931-9318-e504e36938e7" parentID="1054" level="3" creatorID="0" sortOrder="8" createDate="2016-04-06T16:55:29" updateDate="2016-04-06T16:55:29" nodeName="Rồng phụng 1 (7)" urlName="rồng-phụng-1-7" path="-1,1051,1054,1082" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng 1]]></pageName><hinhAnh>1074</hinhAnh></ProductItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1082, N'8f70a7ce-4378-412c-b7ea-b9d812c98f6b', CAST(N'2016-04-06 16:56:38.460' AS DateTime), N'<ProductItem id="1082" key="db905eac-ba15-4931-9318-e504e36938e7" parentID="1054" level="3" creatorID="0" sortOrder="8" createDate="2016-04-06T16:55:29" updateDate="2016-04-06T16:56:38" nodeName="Rồng phụng 9" urlName="rồng-phụng-9" path="-1,1051,1054,1082" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng 9]]></pageName><hinhAnh>1074</hinhAnh></ProductItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1083, N'b00da800-28a1-4700-a700-87f682d7e6e9', CAST(N'2016-04-06 16:55:35.027' AS DateTime), N'<ProductItem id="1083" key="6d077c0a-690f-4ba5-8a8a-adf9883c849c" parentID="1054" level="3" creatorID="0" sortOrder="9" createDate="2016-04-06T16:55:35" updateDate="2016-04-06T16:55:35" nodeName="Rồng phụng 1 (8)" urlName="rồng-phụng-1-8" path="-1,1051,1054,1083" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng 1]]></pageName><hinhAnh>1074</hinhAnh></ProductItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1083, N'19225619-e1fe-4985-b5f1-cef60a265740', CAST(N'2016-04-06 16:56:45.927' AS DateTime), N'<ProductItem id="1083" key="6d077c0a-690f-4ba5-8a8a-adf9883c849c" parentID="1054" level="3" creatorID="0" sortOrder="9" createDate="2016-04-06T16:55:35" updateDate="2016-04-06T16:56:45" nodeName="Rồng phụng 10" urlName="rồng-phụng-10" path="-1,1051,1054,1083" isDoc="" nodeType="1059" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1057" nodeTypeAlias="ProductItem"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Rồng phụng 10]]></pageName><hinhAnh>1074</hinhAnh></ProductItem>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1091, N'183abdde-38df-401f-8a9a-5b5b92b1c6f5', CAST(N'2017-01-08 16:42:06.663' AS DateTime), N'<Fashion id="1091" key="a452b061-d348-4550-99ec-160b8e7ed6da" parentID="1051" level="2" creatorID="0" sortOrder="1" createDate="2017-01-08T16:41:38" updateDate="2017-01-08T16:42:06" nodeName="Album Ảnh" urlName="album-ảnh" path="-1,1051,1091" isDoc="" nodeType="1063" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1062" nodeTypeAlias="Fashion"><hideInNavigation>0</hideInNavigation></Fashion>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1091, N'7c3727a4-9a60-4323-99a5-cb6a96f5fc0f', CAST(N'2017-01-08 16:41:38.230' AS DateTime), N'<Fashion id="1091" key="a452b061-d348-4550-99ec-160b8e7ed6da" parentID="1051" level="2" creatorID="0" sortOrder="4" createDate="2017-01-08T16:41:38" updateDate="2017-01-08T16:41:38" nodeName="Album Ảnh" urlName="album-ảnh" path="-1,1051,1091" isDoc="" nodeType="1063" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1062" nodeTypeAlias="Fashion"><hideInNavigation>0</hideInNavigation></Fashion>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1091, N'cf5a2a93-1698-431c-8632-d328f668e2d8', CAST(N'2017-01-08 17:06:17.517' AS DateTime), N'<Fashion id="1091" key="a452b061-d348-4550-99ec-160b8e7ed6da" parentID="1051" level="2" creatorID="0" sortOrder="2" createDate="2017-01-08T16:41:38" updateDate="2017-01-08T17:06:17" nodeName="Album Ảnh" urlName="album-ảnh" path="-1,1051,1091" isDoc="" nodeType="1063" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1062" nodeTypeAlias="Fashion"><hideInNavigation>0</hideInNavigation></Fashion>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1095, N'5bf2a256-2b5c-4c34-919a-e22019bba8db', CAST(N'2017-01-08 16:56:21.250' AS DateTime), N'<Servicespage id="1095" key="2ac255c2-6bbf-4e05-8792-8b24c326e477" parentID="1051" level="2" creatorID="0" sortOrder="5" createDate="2017-01-08T16:56:01" updateDate="2017-01-08T16:56:21" nodeName="Dịch vụ" urlName="dịch-vụ" path="-1,1051,1095" isDoc="" nodeType="1092" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="0" nodeTypeAlias="Servicespage"><hideInNavigation>0</hideInNavigation></Servicespage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1096, N'37fcec08-3a90-4aac-aa05-2f2598373048', CAST(N'2017-01-08 16:57:09.393' AS DateTime), N'<Servicespage id="1096" key="3b1be09c-1016-4e93-8c30-affcc53a656d" parentID="-1" level="1" creatorID="0" sortOrder="1" createDate="2017-01-08T16:57:09" updateDate="2017-01-08T16:57:09" nodeName="Dịch vụ" urlName="dịch-vụ" path="-1,1096" isDoc="" nodeType="1092" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="0" nodeTypeAlias="Servicespage"><hideInNavigation>0</hideInNavigation></Servicespage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1097, N'24d1129b-d1a9-499a-a7e9-0439ec85ba78', CAST(N'2017-01-08 16:58:33.003' AS DateTime), N'<Servicespage id="1097" key="4cf1918d-7ec5-475f-87bf-f4d79196a4be" parentID="1051" level="2" creatorID="0" sortOrder="5" createDate="2017-01-08T16:57:30" updateDate="2017-01-08T16:58:32" nodeName="Dịch vụ" urlName="dịch-vụ" path="-1,1051,1097" isDoc="" nodeType="1092" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="0" nodeTypeAlias="Servicespage"><hideInNavigation>1</hideInNavigation></Servicespage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1097, N'8d6722a8-d3e0-4cd2-aa1a-38a03e31cf5b', CAST(N'2017-01-08 16:57:30.653' AS DateTime), N'<Servicespage id="1097" key="4cf1918d-7ec5-475f-87bf-f4d79196a4be" parentID="1051" level="2" creatorID="0" sortOrder="5" createDate="2017-01-08T16:57:30" updateDate="2017-01-08T16:57:30" nodeName="Dịch vụ" urlName="dịch-vụ" path="-1,1051,1097" isDoc="" nodeType="1092" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="0" nodeTypeAlias="Servicespage"><hideInNavigation>0</hideInNavigation></Servicespage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1097, N'b17ed075-fc03-4823-915c-c2f42e6bbbee', CAST(N'2017-01-08 17:06:17.537' AS DateTime), N'<Servicespage id="1097" key="4cf1918d-7ec5-475f-87bf-f4d79196a4be" parentID="1051" level="2" creatorID="0" sortOrder="4" createDate="2017-01-08T16:57:30" updateDate="2017-01-08T17:06:17" nodeName="Dịch vụ" urlName="dịch-vụ" path="-1,1051,1097" isDoc="" nodeType="1092" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="0" nodeTypeAlias="Servicespage"><hideInNavigation>1</hideInNavigation></Servicespage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1098, N'c017604c-b864-4b43-9a1c-020f34c95337', CAST(N'2017-01-08 17:00:58.810' AS DateTime), N'<ServiceDetailPage id="1098" key="b5ecd9af-5bf0-442a-9757-0f3e549eb168" parentID="1097" level="3" creatorID="0" sortOrder="0" createDate="2017-01-08T17:00:58" updateDate="2017-01-08T17:00:58" nodeName="Trang Điểm Cô Dâu" urlName="trang-điểm-cô-dâu" path="-1,1051,1097,1098" isDoc="" nodeType="1094" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1093" nodeTypeAlias="ServiceDetailPage"><hideInNavigation>0</hideInNavigation></ServiceDetailPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1099, N'010a175d-4c8f-4b37-a093-38e18c351e78', CAST(N'2017-01-08 17:01:08.587' AS DateTime), N'<ServiceDetailPage id="1099" key="369064bc-d371-44b9-bffd-78c426aa0403" parentID="1097" level="3" creatorID="0" sortOrder="1" createDate="2017-01-08T17:01:08" updateDate="2017-01-08T17:01:08" nodeName="Cho Thuê Xe Cưới" urlName="cho-thuê-xe-cưới" path="-1,1051,1097,1099" isDoc="" nodeType="1094" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1093" nodeTypeAlias="ServiceDetailPage"><hideInNavigation>0</hideInNavigation></ServiceDetailPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1100, N'9e5427b3-fbf8-44c7-bf68-a03caa807bb2', CAST(N'2017-01-08 17:01:29.793' AS DateTime), N'<ServiceDetailPage id="1100" key="631782bb-a103-457f-b3ed-6a9ec62448dc" parentID="1097" level="3" creatorID="0" sortOrder="2" createDate="2017-01-08T17:01:29" updateDate="2017-01-08T17:01:29" nodeName="Chụp Hình Cưới" urlName="chụp-hình-cưới" path="-1,1051,1097,1100" isDoc="" nodeType="1094" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1093" nodeTypeAlias="ServiceDetailPage"><hideInNavigation>0</hideInNavigation></ServiceDetailPage>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1105, N'bd103ce8-eddd-4e3f-9047-3b4721f9c8af', CAST(N'2017-01-08 17:04:57.977' AS DateTime), N'<News id="1105" key="c352b05e-da4a-4f4f-8f46-0a2a30dcee85" parentID="1051" level="2" creatorID="0" sortOrder="6" createDate="2017-01-08T17:04:57" updateDate="2017-01-08T17:04:57" nodeName="Thời Trang" urlName="thời-trang" path="-1,1051,1105" isDoc="" nodeType="1102" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1101" nodeTypeAlias="News"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Thời Trang]]></pageName></News>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1105, N'382747bc-08c2-4e4a-9c0c-97c7a1265ccf', CAST(N'2017-01-08 17:06:17.527' AS DateTime), N'<News id="1105" key="c352b05e-da4a-4f4f-8f46-0a2a30dcee85" parentID="1051" level="2" creatorID="0" sortOrder="3" createDate="2017-01-08T17:04:57" updateDate="2017-01-08T17:06:17" nodeName="Thời Trang" urlName="thời-trang" path="-1,1051,1105" isDoc="" nodeType="1102" creatorName="Hoang Vu" writerName="Hoang Vu" writerID="0" template="1101" nodeTypeAlias="News"><hideInNavigation>0</hideInNavigation><pageName><![CDATA[Thời Trang]]></pageName></News>')
SET IDENTITY_INSERT [dbo].[cmsPropertyData] ON 

INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1, 1051, N'59fdce3a-a268-41b9-9a7b-fc1c515b6b83', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (2, 1051, N'59fdce3a-a268-41b9-9a7b-fc1c515b6b83', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (3, 1051, N'59fdce3a-a268-41b9-9a7b-fc1c515b6b83', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (4, 1051, N'59fdce3a-a268-41b9-9a7b-fc1c515b6b83', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (5, 1051, N'59fdce3a-a268-41b9-9a7b-fc1c515b6b83', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (6, 1051, N'59fdce3a-a268-41b9-9a7b-fc1c515b6b83', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (7, 1051, N'59fdce3a-a268-41b9-9a7b-fc1c515b6b83', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (8, 1051, N'59fdce3a-a268-41b9-9a7b-fc1c515b6b83', 46, NULL, NULL, N'Trang Chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (9, 1051, N'59fdce3a-a268-41b9-9a7b-fc1c515b6b83', 43, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (10, 1051, N'59fdce3a-a268-41b9-9a7b-fc1c515b6b83', 42, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (11, 1051, N'59fdce3a-a268-41b9-9a7b-fc1c515b6b83', 45, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (12, 1051, N'59fdce3a-a268-41b9-9a7b-fc1c515b6b83', 44, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (13, 1051, N'59fdce3a-a268-41b9-9a7b-fc1c515b6b83', 47, NULL, NULL, N'RongPhungHaiDiem', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (14, 1051, N'd236aeeb-ebc4-4d05-9c3b-9a6487cd3c25', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (15, 1051, N'd236aeeb-ebc4-4d05-9c3b-9a6487cd3c25', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (16, 1051, N'd236aeeb-ebc4-4d05-9c3b-9a6487cd3c25', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (17, 1051, N'd236aeeb-ebc4-4d05-9c3b-9a6487cd3c25', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (18, 1051, N'd236aeeb-ebc4-4d05-9c3b-9a6487cd3c25', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (19, 1051, N'd236aeeb-ebc4-4d05-9c3b-9a6487cd3c25', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (20, 1051, N'd236aeeb-ebc4-4d05-9c3b-9a6487cd3c25', 35, NULL, NULL, N'Rongphunghaidiem | Trang chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (21, 1051, N'd236aeeb-ebc4-4d05-9c3b-9a6487cd3c25', 46, NULL, NULL, N'Trang Chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (22, 1051, N'd236aeeb-ebc4-4d05-9c3b-9a6487cd3c25', 43, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (23, 1051, N'd236aeeb-ebc4-4d05-9c3b-9a6487cd3c25', 42, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (24, 1051, N'd236aeeb-ebc4-4d05-9c3b-9a6487cd3c25', 45, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (25, 1051, N'd236aeeb-ebc4-4d05-9c3b-9a6487cd3c25', 44, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (26, 1051, N'd236aeeb-ebc4-4d05-9c3b-9a6487cd3c25', 47, NULL, NULL, N'RongPhungHaiDiem', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (27, 1051, N'd236aeeb-ebc4-4d05-9c3b-9a6487cd3c25', 48, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (28, 1051, N'fb6bd512-7204-4a0b-a6bc-4e481b9a16b0', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (29, 1051, N'fb6bd512-7204-4a0b-a6bc-4e481b9a16b0', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (30, 1051, N'fb6bd512-7204-4a0b-a6bc-4e481b9a16b0', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (31, 1051, N'fb6bd512-7204-4a0b-a6bc-4e481b9a16b0', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (32, 1051, N'fb6bd512-7204-4a0b-a6bc-4e481b9a16b0', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (33, 1051, N'fb6bd512-7204-4a0b-a6bc-4e481b9a16b0', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (34, 1051, N'fb6bd512-7204-4a0b-a6bc-4e481b9a16b0', 35, NULL, NULL, N'Rongphunghaidiem | Trang chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (35, 1051, N'fb6bd512-7204-4a0b-a6bc-4e481b9a16b0', 46, NULL, NULL, N'Trang Chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (36, 1051, N'fb6bd512-7204-4a0b-a6bc-4e481b9a16b0', 43, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (37, 1051, N'fb6bd512-7204-4a0b-a6bc-4e481b9a16b0', 42, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (38, 1051, N'fb6bd512-7204-4a0b-a6bc-4e481b9a16b0', 45, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (39, 1051, N'fb6bd512-7204-4a0b-a6bc-4e481b9a16b0', 44, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (40, 1051, N'fb6bd512-7204-4a0b-a6bc-4e481b9a16b0', 47, NULL, NULL, N'RongPhungHaiDiem', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (41, 1051, N'fb6bd512-7204-4a0b-a6bc-4e481b9a16b0', 48, NULL, NULL, N'RongPhungHaiDiem', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (42, 1051, N'1122711b-dd7c-407e-8841-3f3d4448e354', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (43, 1051, N'1122711b-dd7c-407e-8841-3f3d4448e354', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (44, 1051, N'1122711b-dd7c-407e-8841-3f3d4448e354', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (45, 1051, N'1122711b-dd7c-407e-8841-3f3d4448e354', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (46, 1051, N'1122711b-dd7c-407e-8841-3f3d4448e354', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (47, 1051, N'1122711b-dd7c-407e-8841-3f3d4448e354', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (48, 1051, N'1122711b-dd7c-407e-8841-3f3d4448e354', 35, NULL, NULL, N'Rongphunghaidiem | Trang chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (49, 1051, N'1122711b-dd7c-407e-8841-3f3d4448e354', 46, NULL, NULL, N'Trang Chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (50, 1051, N'1122711b-dd7c-407e-8841-3f3d4448e354', 43, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (51, 1051, N'1122711b-dd7c-407e-8841-3f3d4448e354', 42, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (52, 1051, N'1122711b-dd7c-407e-8841-3f3d4448e354', 45, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (53, 1051, N'1122711b-dd7c-407e-8841-3f3d4448e354', 44, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (54, 1051, N'1122711b-dd7c-407e-8841-3f3d4448e354', 47, NULL, NULL, N'RongPhungHaiDiem', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (55, 1051, N'1122711b-dd7c-407e-8841-3f3d4448e354', 48, NULL, NULL, N'Rồng Phụng Hải Diễm', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (56, 1051, N'0b3b0c10-04d4-4150-a3f5-7364080a2b97', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (57, 1051, N'0b3b0c10-04d4-4150-a3f5-7364080a2b97', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (58, 1051, N'0b3b0c10-04d4-4150-a3f5-7364080a2b97', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (59, 1051, N'0b3b0c10-04d4-4150-a3f5-7364080a2b97', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (60, 1051, N'0b3b0c10-04d4-4150-a3f5-7364080a2b97', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (61, 1051, N'0b3b0c10-04d4-4150-a3f5-7364080a2b97', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (62, 1051, N'0b3b0c10-04d4-4150-a3f5-7364080a2b97', 35, NULL, NULL, N'Trang chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (63, 1051, N'0b3b0c10-04d4-4150-a3f5-7364080a2b97', 46, NULL, NULL, N'Trang Chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (64, 1051, N'0b3b0c10-04d4-4150-a3f5-7364080a2b97', 43, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (65, 1051, N'0b3b0c10-04d4-4150-a3f5-7364080a2b97', 42, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (66, 1051, N'0b3b0c10-04d4-4150-a3f5-7364080a2b97', 45, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (67, 1051, N'0b3b0c10-04d4-4150-a3f5-7364080a2b97', 44, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (68, 1051, N'0b3b0c10-04d4-4150-a3f5-7364080a2b97', 47, NULL, NULL, N'RongPhungHaiDiem', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (69, 1051, N'0b3b0c10-04d4-4150-a3f5-7364080a2b97', 48, NULL, NULL, N'Rồng Phụng Hải Diễm', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (70, 1054, N'82bce98c-1d8a-4ab9-bc09-149be12e0e3b', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (71, 1054, N'82bce98c-1d8a-4ab9-bc09-149be12e0e3b', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (72, 1054, N'82bce98c-1d8a-4ab9-bc09-149be12e0e3b', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (73, 1054, N'82bce98c-1d8a-4ab9-bc09-149be12e0e3b', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (74, 1054, N'82bce98c-1d8a-4ab9-bc09-149be12e0e3b', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (75, 1054, N'82bce98c-1d8a-4ab9-bc09-149be12e0e3b', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (76, 1054, N'82bce98c-1d8a-4ab9-bc09-149be12e0e3b', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (77, 1054, N'82bce98c-1d8a-4ab9-bc09-149be12e0e3b', 46, NULL, NULL, N'Rồng phụng trái cây', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (78, 1054, N'f07c9615-89f9-435c-a960-a619a74742a0', 39, NULL, NULL, N'rong-phung-trai-cay', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (79, 1054, N'f07c9615-89f9-435c-a960-a619a74742a0', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (80, 1054, N'f07c9615-89f9-435c-a960-a619a74742a0', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (81, 1054, N'f07c9615-89f9-435c-a960-a619a74742a0', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (82, 1054, N'f07c9615-89f9-435c-a960-a619a74742a0', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (83, 1054, N'f07c9615-89f9-435c-a960-a619a74742a0', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (84, 1054, N'f07c9615-89f9-435c-a960-a619a74742a0', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (85, 1054, N'f07c9615-89f9-435c-a960-a619a74742a0', 46, NULL, NULL, N'Rồng phụng trái cây', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (86, 1054, N'f07c9615-89f9-435c-a960-a619a74742a0', 49, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (87, 1060, N'6381e0c1-f449-4f93-836b-64f337104288', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (88, 1060, N'6381e0c1-f449-4f93-836b-64f337104288', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (89, 1060, N'6381e0c1-f449-4f93-836b-64f337104288', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (90, 1060, N'6381e0c1-f449-4f93-836b-64f337104288', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (91, 1060, N'6381e0c1-f449-4f93-836b-64f337104288', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (92, 1060, N'6381e0c1-f449-4f93-836b-64f337104288', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (93, 1060, N'6381e0c1-f449-4f93-836b-64f337104288', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (94, 1060, N'6381e0c1-f449-4f93-836b-64f337104288', 46, NULL, NULL, N'Rồng phụng 1', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (95, 1060, N'6381e0c1-f449-4f93-836b-64f337104288', 50, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (96, 1061, N'dd67910e-db89-454e-96cb-1baea493b209', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (97, 1061, N'dd67910e-db89-454e-96cb-1baea493b209', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (98, 1061, N'dd67910e-db89-454e-96cb-1baea493b209', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (99, 1061, N'dd67910e-db89-454e-96cb-1baea493b209', 38, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (100, 1061, N'dd67910e-db89-454e-96cb-1baea493b209', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (101, 1061, N'dd67910e-db89-454e-96cb-1baea493b209', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (102, 1061, N'dd67910e-db89-454e-96cb-1baea493b209', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (103, 1061, N'dd67910e-db89-454e-96cb-1baea493b209', 46, NULL, NULL, N'Giới thiệu', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (104, 1061, N'6296266f-59a3-470d-9d3a-07437cde7c8f', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (105, 1061, N'6296266f-59a3-470d-9d3a-07437cde7c8f', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (106, 1061, N'6296266f-59a3-470d-9d3a-07437cde7c8f', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (107, 1061, N'6296266f-59a3-470d-9d3a-07437cde7c8f', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (108, 1061, N'6296266f-59a3-470d-9d3a-07437cde7c8f', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (109, 1061, N'6296266f-59a3-470d-9d3a-07437cde7c8f', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (110, 1061, N'6296266f-59a3-470d-9d3a-07437cde7c8f', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (111, 1061, N'6296266f-59a3-470d-9d3a-07437cde7c8f', 46, NULL, NULL, N'Giới thiệu', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (112, 1054, N'320d2a1b-0749-4e46-8509-a6740b59696f', 39, NULL, NULL, N'rong-phung-trai-cay', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (113, 1054, N'320d2a1b-0749-4e46-8509-a6740b59696f', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (114, 1054, N'320d2a1b-0749-4e46-8509-a6740b59696f', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (115, 1054, N'320d2a1b-0749-4e46-8509-a6740b59696f', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (116, 1054, N'320d2a1b-0749-4e46-8509-a6740b59696f', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (117, 1054, N'320d2a1b-0749-4e46-8509-a6740b59696f', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (118, 1054, N'320d2a1b-0749-4e46-8509-a6740b59696f', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (119, 1054, N'320d2a1b-0749-4e46-8509-a6740b59696f', 46, NULL, NULL, N'Rồng phụng trái cây', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (120, 1054, N'320d2a1b-0749-4e46-8509-a6740b59696f', 49, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (121, 1064, N'9109c2ba-10e0-4b1b-a403-6b819bbac0f6', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (122, 1064, N'9109c2ba-10e0-4b1b-a403-6b819bbac0f6', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (123, 1064, N'9109c2ba-10e0-4b1b-a403-6b819bbac0f6', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (124, 1064, N'9109c2ba-10e0-4b1b-a403-6b819bbac0f6', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (125, 1064, N'9109c2ba-10e0-4b1b-a403-6b819bbac0f6', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (126, 1064, N'9109c2ba-10e0-4b1b-a403-6b819bbac0f6', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (127, 1064, N'9109c2ba-10e0-4b1b-a403-6b819bbac0f6', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (128, 1064, N'9109c2ba-10e0-4b1b-a403-6b819bbac0f6', 46, NULL, NULL, N'Thời trang', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (129, 1067, N'acedaf91-94a7-4efd-8d12-e03211fbeaaa', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (130, 1067, N'acedaf91-94a7-4efd-8d12-e03211fbeaaa', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (131, 1067, N'acedaf91-94a7-4efd-8d12-e03211fbeaaa', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (132, 1067, N'acedaf91-94a7-4efd-8d12-e03211fbeaaa', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (133, 1067, N'acedaf91-94a7-4efd-8d12-e03211fbeaaa', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (134, 1067, N'acedaf91-94a7-4efd-8d12-e03211fbeaaa', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (135, 1067, N'acedaf91-94a7-4efd-8d12-e03211fbeaaa', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (136, 1067, N'acedaf91-94a7-4efd-8d12-e03211fbeaaa', 46, NULL, NULL, N'Liên hệ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (137, 1051, N'0b3b0c10-04d4-4150-a3f5-7364080a2b97', 51, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (138, 1068, N'bc50fb6c-73e4-4567-8213-8d5201bb290a', 27, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (139, 1069, N'2bc79158-ee9b-4ec0-afaa-95c6ca3831f4', 6, NULL, NULL, N'/media/1001/4.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (140, 1069, N'2bc79158-ee9b-4ec0-afaa-95c6ca3831f4', 7, NULL, NULL, N'1140', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (141, 1069, N'2bc79158-ee9b-4ec0-afaa-95c6ca3831f4', 8, NULL, NULL, N'480', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (142, 1069, N'2bc79158-ee9b-4ec0-afaa-95c6ca3831f4', 9, NULL, NULL, N'104025', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (143, 1069, N'2bc79158-ee9b-4ec0-afaa-95c6ca3831f4', 10, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (144, 1070, N'3bef708e-6433-4c59-ad63-07ee4628912d', 6, NULL, NULL, N'/media/1002/3.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (145, 1070, N'3bef708e-6433-4c59-ad63-07ee4628912d', 7, NULL, NULL, N'1140', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (146, 1070, N'3bef708e-6433-4c59-ad63-07ee4628912d', 8, NULL, NULL, N'480', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (147, 1070, N'3bef708e-6433-4c59-ad63-07ee4628912d', 9, NULL, NULL, N'83664', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (148, 1070, N'3bef708e-6433-4c59-ad63-07ee4628912d', 10, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (149, 1051, N'0e9828d0-5dfc-42b4-8f28-9e495312b3f0', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (150, 1051, N'0e9828d0-5dfc-42b4-8f28-9e495312b3f0', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (151, 1051, N'0e9828d0-5dfc-42b4-8f28-9e495312b3f0', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (152, 1051, N'0e9828d0-5dfc-42b4-8f28-9e495312b3f0', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (153, 1051, N'0e9828d0-5dfc-42b4-8f28-9e495312b3f0', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (154, 1051, N'0e9828d0-5dfc-42b4-8f28-9e495312b3f0', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (155, 1051, N'0e9828d0-5dfc-42b4-8f28-9e495312b3f0', 35, NULL, NULL, N'Trang chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (156, 1051, N'0e9828d0-5dfc-42b4-8f28-9e495312b3f0', 46, NULL, NULL, N'Trang Chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (157, 1051, N'0e9828d0-5dfc-42b4-8f28-9e495312b3f0', 43, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (158, 1051, N'0e9828d0-5dfc-42b4-8f28-9e495312b3f0', 42, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (159, 1051, N'0e9828d0-5dfc-42b4-8f28-9e495312b3f0', 45, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (160, 1051, N'0e9828d0-5dfc-42b4-8f28-9e495312b3f0', 44, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (161, 1051, N'0e9828d0-5dfc-42b4-8f28-9e495312b3f0', 51, 1069, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (162, 1051, N'0e9828d0-5dfc-42b4-8f28-9e495312b3f0', 47, NULL, NULL, N'RongPhungHaiDiem', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (163, 1051, N'0e9828d0-5dfc-42b4-8f28-9e495312b3f0', 48, NULL, NULL, N'Rồng Phụng Hải Diễm', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (164, 1051, N'cd9f99b3-f51f-4426-ba64-ec743120f067', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (165, 1051, N'cd9f99b3-f51f-4426-ba64-ec743120f067', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (166, 1051, N'cd9f99b3-f51f-4426-ba64-ec743120f067', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (167, 1051, N'cd9f99b3-f51f-4426-ba64-ec743120f067', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (168, 1051, N'cd9f99b3-f51f-4426-ba64-ec743120f067', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (169, 1051, N'cd9f99b3-f51f-4426-ba64-ec743120f067', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (170, 1051, N'cd9f99b3-f51f-4426-ba64-ec743120f067', 35, NULL, NULL, N'Trang chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (171, 1051, N'cd9f99b3-f51f-4426-ba64-ec743120f067', 46, NULL, NULL, N'Trang Chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (172, 1051, N'cd9f99b3-f51f-4426-ba64-ec743120f067', 43, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (173, 1051, N'cd9f99b3-f51f-4426-ba64-ec743120f067', 42, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (174, 1051, N'cd9f99b3-f51f-4426-ba64-ec743120f067', 45, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (175, 1051, N'cd9f99b3-f51f-4426-ba64-ec743120f067', 44, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (176, 1051, N'cd9f99b3-f51f-4426-ba64-ec743120f067', 51, NULL, NULL, NULL, N'1069,1070')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (177, 1051, N'cd9f99b3-f51f-4426-ba64-ec743120f067', 47, NULL, NULL, N'RongPhungHaiDiem', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (178, 1051, N'cd9f99b3-f51f-4426-ba64-ec743120f067', 48, NULL, NULL, N'Rồng Phụng Hải Diễm', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (179, 1054, N'f88b72fc-f486-44e4-b9e7-67a9b23bca63', 39, NULL, NULL, N'rong-phung-trai-cay', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (180, 1054, N'f88b72fc-f486-44e4-b9e7-67a9b23bca63', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (181, 1054, N'f88b72fc-f486-44e4-b9e7-67a9b23bca63', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (182, 1054, N'f88b72fc-f486-44e4-b9e7-67a9b23bca63', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (183, 1054, N'f88b72fc-f486-44e4-b9e7-67a9b23bca63', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (184, 1054, N'f88b72fc-f486-44e4-b9e7-67a9b23bca63', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (185, 1054, N'f88b72fc-f486-44e4-b9e7-67a9b23bca63', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (186, 1054, N'f88b72fc-f486-44e4-b9e7-67a9b23bca63', 46, NULL, NULL, N'Rồng phụng trái cây', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (187, 1054, N'f88b72fc-f486-44e4-b9e7-67a9b23bca63', 49, 8, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (188, 1051, N'277ea9b0-a629-4f79-a5b4-667d8f38b160', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (189, 1051, N'277ea9b0-a629-4f79-a5b4-667d8f38b160', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (190, 1051, N'277ea9b0-a629-4f79-a5b4-667d8f38b160', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (191, 1051, N'277ea9b0-a629-4f79-a5b4-667d8f38b160', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (192, 1051, N'277ea9b0-a629-4f79-a5b4-667d8f38b160', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (193, 1051, N'277ea9b0-a629-4f79-a5b4-667d8f38b160', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (194, 1051, N'277ea9b0-a629-4f79-a5b4-667d8f38b160', 35, NULL, NULL, N'Trang chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (195, 1051, N'277ea9b0-a629-4f79-a5b4-667d8f38b160', 46, NULL, NULL, N'Trang Chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (196, 1051, N'277ea9b0-a629-4f79-a5b4-667d8f38b160', 43, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (197, 1051, N'277ea9b0-a629-4f79-a5b4-667d8f38b160', 42, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (198, 1051, N'277ea9b0-a629-4f79-a5b4-667d8f38b160', 45, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (199, 1051, N'277ea9b0-a629-4f79-a5b4-667d8f38b160', 44, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (200, 1051, N'277ea9b0-a629-4f79-a5b4-667d8f38b160', 51, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (201, 1051, N'277ea9b0-a629-4f79-a5b4-667d8f38b160', 47, NULL, NULL, N'RongPhungHaiDiem', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (202, 1051, N'277ea9b0-a629-4f79-a5b4-667d8f38b160', 48, NULL, NULL, N'Rồng Phụng Hải Diễm', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (203, 1051, N'0a704ff3-cc23-4db9-85df-8d50fc37efbf', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (204, 1051, N'0a704ff3-cc23-4db9-85df-8d50fc37efbf', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (205, 1051, N'0a704ff3-cc23-4db9-85df-8d50fc37efbf', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (206, 1051, N'0a704ff3-cc23-4db9-85df-8d50fc37efbf', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (207, 1051, N'0a704ff3-cc23-4db9-85df-8d50fc37efbf', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (208, 1051, N'0a704ff3-cc23-4db9-85df-8d50fc37efbf', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (209, 1051, N'0a704ff3-cc23-4db9-85df-8d50fc37efbf', 35, NULL, NULL, N'Trang chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (210, 1051, N'0a704ff3-cc23-4db9-85df-8d50fc37efbf', 46, NULL, NULL, N'Trang Chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (211, 1051, N'0a704ff3-cc23-4db9-85df-8d50fc37efbf', 43, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (212, 1051, N'0a704ff3-cc23-4db9-85df-8d50fc37efbf', 42, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (213, 1051, N'0a704ff3-cc23-4db9-85df-8d50fc37efbf', 45, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (214, 1051, N'0a704ff3-cc23-4db9-85df-8d50fc37efbf', 44, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (215, 1051, N'0a704ff3-cc23-4db9-85df-8d50fc37efbf', 51, NULL, NULL, NULL, N'[
  {
    "image": "1069",
    "link": "1051"
  },
  {
    "image": "1070",
    "link": "1060"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (216, 1051, N'0a704ff3-cc23-4db9-85df-8d50fc37efbf', 47, NULL, NULL, N'RongPhungHaiDiem', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (217, 1051, N'0a704ff3-cc23-4db9-85df-8d50fc37efbf', 48, NULL, NULL, N'Rồng Phụng Hải Diễm', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (218, 1061, N'6296266f-59a3-470d-9d3a-07437cde7c8f', 52, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (219, 1061, N'b6f779b1-9ccb-43d7-aa7e-9763a98e138c', 39, NULL, NULL, N'gioi-thieu', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (220, 1061, N'b6f779b1-9ccb-43d7-aa7e-9763a98e138c', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (221, 1061, N'b6f779b1-9ccb-43d7-aa7e-9763a98e138c', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (222, 1061, N'b6f779b1-9ccb-43d7-aa7e-9763a98e138c', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (223, 1061, N'b6f779b1-9ccb-43d7-aa7e-9763a98e138c', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (224, 1061, N'b6f779b1-9ccb-43d7-aa7e-9763a98e138c', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (225, 1061, N'b6f779b1-9ccb-43d7-aa7e-9763a98e138c', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (226, 1061, N'b6f779b1-9ccb-43d7-aa7e-9763a98e138c', 46, NULL, NULL, N'Giới thiệu', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (227, 1061, N'b6f779b1-9ccb-43d7-aa7e-9763a98e138c', 52, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (228, 1064, N'd2988503-33e8-4bba-b3b4-1da11e56ef8a', 39, NULL, NULL, N'thoi-trang', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (229, 1064, N'd2988503-33e8-4bba-b3b4-1da11e56ef8a', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (230, 1064, N'd2988503-33e8-4bba-b3b4-1da11e56ef8a', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (231, 1064, N'd2988503-33e8-4bba-b3b4-1da11e56ef8a', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (232, 1064, N'd2988503-33e8-4bba-b3b4-1da11e56ef8a', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (233, 1064, N'd2988503-33e8-4bba-b3b4-1da11e56ef8a', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (234, 1064, N'd2988503-33e8-4bba-b3b4-1da11e56ef8a', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (235, 1064, N'd2988503-33e8-4bba-b3b4-1da11e56ef8a', 46, NULL, NULL, N'Thời trang', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (236, 1067, N'a5daf209-1541-4e64-a8b3-a5d4cc71a30a', 39, NULL, NULL, N'lien-he', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (237, 1067, N'a5daf209-1541-4e64-a8b3-a5d4cc71a30a', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (238, 1067, N'a5daf209-1541-4e64-a8b3-a5d4cc71a30a', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (239, 1067, N'a5daf209-1541-4e64-a8b3-a5d4cc71a30a', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (240, 1067, N'a5daf209-1541-4e64-a8b3-a5d4cc71a30a', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (241, 1067, N'a5daf209-1541-4e64-a8b3-a5d4cc71a30a', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (242, 1067, N'a5daf209-1541-4e64-a8b3-a5d4cc71a30a', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (243, 1067, N'a5daf209-1541-4e64-a8b3-a5d4cc71a30a', 46, NULL, NULL, N'Liên hệ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (244, 1061, N'afb4777f-6d13-44d3-86c3-00e15c8d62a3', 39, NULL, NULL, N'gioi-thieu', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (245, 1061, N'afb4777f-6d13-44d3-86c3-00e15c8d62a3', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (246, 1061, N'afb4777f-6d13-44d3-86c3-00e15c8d62a3', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (247, 1061, N'afb4777f-6d13-44d3-86c3-00e15c8d62a3', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (248, 1061, N'afb4777f-6d13-44d3-86c3-00e15c8d62a3', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (249, 1061, N'afb4777f-6d13-44d3-86c3-00e15c8d62a3', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (250, 1061, N'afb4777f-6d13-44d3-86c3-00e15c8d62a3', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (251, 1061, N'afb4777f-6d13-44d3-86c3-00e15c8d62a3', 46, NULL, NULL, N'Giới thiệu', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (252, 1061, N'afb4777f-6d13-44d3-86c3-00e15c8d62a3', 52, NULL, NULL, NULL, N'<table border="0">
<tbody>
<tr>
<td colspan="3"><img src="http://shopcuoihoitamnhu.com/Image/Layout/icon_bl11.png" alt="" width="14px" /> <span class="texthot5">Shop dịch vụ cưới hỏi Tâm Như</span></td>
</tr>
<tr>
<td colspan="3">
<div>
<div><a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a> chuyên cung cấp các dịch vụ <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/688/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-trang">trang trí nhà cưới hỏi</a> trọn gói</div>
<div>* <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/690/trang-tri-nha-cuoi-hoi-an-tuong">Trang trí nhà cưới hỏi</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/679/ban-tho-gia-tien-ngay-cuoi">trang trí bàn thờ gia tiên</a>; </div>
<div>* Cung cấp <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/597/cong-cuoi-hoa-tuoi">cổng cưới hoa tươi</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/609/hoa-de-ban-trang-tri-dam-cuoi">hoa để bàn</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/596/hoa-cam-tay-co-dau---cai-ao">hoa cô dâu</a> trong ngày đám cưới hoặc đám hỏi, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/608/cat-dan-chu-xop---hoa-giay">cắt dán chữ xốp</a>; </div>
<div>* Cung cấp <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/593/mam-qua-le-vat-cuoi-hoi">mâm quả ngày cưới</a> (trầu cau, xôi gà, bánh cốm, bánh phu thê, trái cây tươi ngon, bánh bía,...), <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/648/rong-phung-trai-cay-ngay-cuoi">rồng phụng trái cây</a>ngày cưới; </div>
<div>* <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/621/cho-thue-xe-cuoi-4-cho-7-cho">Cho thuê xe hoa</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/643/cong-cuoi-hoa-vai">cổng cưới hoa vải</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/908/cong-cuoi-bong-bong">cổng cưới bong bóng</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/656/nha-bat-rap-cuoi-hien-dai-mau-dep">nhà bạt khung rạp</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/888/ban-tho-hoa-giay-ngay-cuoi">bàn thờ gia tiên hoa giấy</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1295/trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-no-hoa-hong-ng">bàn ghế hai họ</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/682/ban-ghe-cao-cap-theo-tong-nen-mautrang-hong-kem-vang">bàn ghế dựa đãi tiệc</a>, bàn ghế mũ inox, chén dĩa cưới hỏi </div>
<div>* Cho thuê <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/626/doi-ngu-nhan-vien-bung-mam-qua">nhân sự bưng quả</a>, nhân sự <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/680/to-chuc-su-kien-cuoi-hoi">tổ chức sự kiện,</a> <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/627/cho-thue-ban-nhac-mc-nhom-mua-le-tan-pg-pb">nhóm múa, lễ tân</a> </div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/QuangCao/dich-vu-cuoi-hoi-dich-vu-cuoi-hoi-vai-con-cong.jpg"><img src="http://shopcuoihoitamnhu.com/Image/QuangCao/dich-vu-cuoi-hoi-dich-vu-cuoi-hoi-vai-con-cong.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" width="700px" /></a></div>
<div>Dịch vụ cưới hỏi <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/974/trang-tri-nha-cuoi-hoi-voi-vai-con-cong">Trang trí nhà cưới hỏi với vải con cong</a> - <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a></div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a>  là nhà cung cấp <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-tam-nhu-cong-ty-trang-tri-dam-cuoi">dịch vụ cưới hỏi</a> mà các đôi lứa không nên bỏ qua khi chuẩn bị cho ngày hạnh phúc nhất của mình. Bởi vì chúng tôi đã có kinh nghiệm trên 8 năm cung cấp <a href="http://shopcuoihoitamnhu.com/">dịch vụ cưới hỏi</a>. Chúng tôi hiện đang có 2 cửa hàng tại mặt tiền đường Quang Trung và hệ thống 2 kho lưu trữ các đầy đủ trọn gói các sản phẩm <a href="http://shopcuoihoitamnhu.com/">dịch vụ cưới hỏi</a>. Vì thế, cửa hàng của chúng tôi luôn có đầy đủ tất cả các sản phẩm liên quan và có đầy đủ, phong phú các kiểu mẫu để quý khách chọn lựa với giá cả hợp lý và đảm bảo cung cấp dịch vụ đúng giờ, đúng cam kết.</div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/678/cho-thue-ban-ghe---chen-dia---vat-dung-dam-cuoi"><img src="http://shopcuoihoitamnhu.com/Image/QuangCao/dich-vu-cuoi-hoi-dich-vu-cuoi-hoi-cong-hoa.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" width="700px" /></a></div>
<div>Dịch vụ <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/643/cong-cuoi-hoa-vai">cho thuê cổng hoa cưới</a> cho ngày đám cưới hỏi trọn gói - <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a>  </div>
<div></div>
<div>Nếu bạn muốn chọn một nhà cung cấp <a href="http://shopcuoihoitamnhu.com/">dịch vụ cưới hỏi </a>với đúng sản phẩm bạn muốn và giá cả cạnh tranh thị trường thì hãy đến tham quan cửa tiệm chính của <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a>  tại số 737, Quang Trung, phường 12, quận Gò Vấp hoặc gọi 0913.623472 - 0974.241824 để trực tiếp xem thế giới sản phẩm cưới hỏi và để chúng tôi có cơ hội tư vấn chi tiết hơn cho nhu cầu của bạn.</div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/layout/full_dichvu_TN.jpg"><img src="http://shopcuoihoitamnhu.com/Image/layout/full_dichvu_TN.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" width="700px" /></a></div>
<div></div>
<div>
<div><a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a> chuyên <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/688/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-trang">trang trí nhà cưới hỏi</a> trọn gói, chuyên nghiệp với đa dạng mẫu mã cho quý khách lựa chọn gồm các gói:</div>
<div>- Trang trí nhà cưới hỏi theo tông nền màu <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/688/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-trang">trắng</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/686/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-trang-kem">trắng kem</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/689/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-vang-dong">vàng đồng</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/687/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-hong">hồng</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/764/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-do">đỏ </a>cho ngày lễ ăn hỏi gia tiên, đính hôn, đám hỏi, đám cưới</div>
<div>
<div>- Trang trí nhà cưới hỏi cao cấp <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/690/trang-tri-nha-cuoi-hoi-an-tuong">mẫu ấn tượng</a> theo tông nền màu trắng, trắng kem, hồng, vàng đồng, đỏ cho ngày lễ ăn hỏi gia tiên, đính hôn, đám hỏi, đám cưới của bạn thêm phần rực rỡ, nổi bật</div>
<div>- Trang trí nhà cưới hỏi cao cấp <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/889/trang-tri-nha-cuoi-hoi-voi-hoa-giay-lua">mẫu hoa giấy</a> theo tông nền màu <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/688/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-trang">trắng</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/686/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-trang-kem">trắng kem</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/687/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-hong">hồng</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/689/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-vang-dong">vàng đồng</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/764/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-do">đỏ</a> cho ngày lễ ăn hỏi gia tiên, đính hôn, đám hỏi, đám cưới của bạn thêm phần trẻ trung, rực rỡ và nổi bật với các tông hoa giấy <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1154/trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-no-da">trắng đỏ</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1149/trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-no-da">trắng hồng nhạt</a>,<a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1169/trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-no-ng">trắng hồng dâu</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1142/trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-no-da">trắng cam</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1175/trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-no-ng">trắng tím</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1178/trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-no-ng">trắng vàng</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1194/trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-no-ng">trắng xanh dương</a>, trắng xanh ngọc, trắng xanh biển, trắng xanh lá, trắng xanh chuối.</div>
</div>
<div>- Trang trí nhà cưới hỏi cao cấp đặc biệt với mẫu giải hình con cong</div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-no-dai-mau-do-mat-ban-do-tran-nha-voan-trang-do-ban-tho-hien-dai-mam-qua-4.jpg"><img src="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-no-dai-mau-do-mat-ban-do-tran-nha-voan-trang-do-ban-tho-hien-dai-mam-qua-4.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" /></a></div>
<div><a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/690/trang-tri-nha-cuoi-hoi-an-tuong">Trang trí nhà cưới hỏi ấn tượng</a> - mẫu màu hồng phấn <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a></div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/Product/dich-vu-cuoi-hoi-cong-ty-trang-tri-nha-trang-tri-nha-cuoi-hoi-tong-xanh-duong-voi-hoa-giay-dep-3.jpg"><img src="http://shopcuoihoitamnhu.com/Image/Product/dich-vu-cuoi-hoi-cong-ty-trang-tri-nha-trang-tri-nha-cuoi-hoi-tong-xanh-duong-voi-hoa-giay-dep-3.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" /></a></div>
<div>Dịch vụ cưới hỏi <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/889/trang-tri-nha-cuoi-hoi-voi-hoa-giay-lua">Trang trí nhà cưới hỏi với hoa giấy</a> tông trắng đỏ  - <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a></div>
<div></div>
<div>
<div><a href="http://shopcuoihoitamnhu.com/Image/Product/dich-vu-cuoi-hoi-cong-ty-trang-tri-nha-trang-tri-nha-cao-cap-voi-vai-con-cong-17.jpg"><img src="http://shopcuoihoitamnhu.com/Image/Product/dich-vu-cuoi-hoi-cong-ty-trang-tri-nha-trang-tri-nha-cao-cap-voi-vai-con-cong-17.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" /></a></div>
<div>Dịch vụ cưới hỏi <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/974/trang-tri-nha-cuoi-hoi-voi-vai-con-cong">Trang trí nhà cưới hỏi với vải con cong</a> tông hồng dâu  - <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a></div>
</div>
<div></div>
<div>
<div>Mỗi mẫu trang trí nhà cưới hỏi của TamNhu thường gồm có:</div>
<div>* <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/679/ban-tho-gia-tien-ngay-cuoi">Trang trí bàn thờ gia tiên</a> hay còn gọi là bàn thờ tổ tiên của TamNhu với </div>
<div>+ Các kiểu trang trí bàn thờ gồm có: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/924/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">mẫu truyền thống nhung đỏ</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/928/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">mẫu tự nhiên</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/978/ban-tho-to-tien-ngay-cuoi-tong-hong-canh-sen-mau-tu-nhien-duoc-t">mẫu hiện đại</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/944/ban-tho-to-tien-ngay-cuoi-mau-thien-chua-tong-xanh-la-cho-trang-">mẫu thiên chúa tin lành</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/946/ban-tho-to-tien-ngay-cuoi-mau-dep-voi-manh-tre-mau-do-chuc-phuc-">mẫu mành tre</a> với dây voan, hoa vải hoa tươi trang trí, chữ song hỷ, câu đối trang trí; </div>
<div>+ Chữ dán trên phong nền có thể là: <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-dich-vu-cuoi-hoi-ban-tho-to-tien-ngay-cuoi-tong-cam-mau-tu-nhien-duoc-trang-tri-bang-vai-voan-cao-cap-cho-le-an-hoi-gia-tien-dam-cuoi-day-du-nghi-le-4.jpg">Song hỷ</a> ; <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/946/ban-tho-to-tien-ngay-cuoi-mau-dep-voi-manh-tre-mau-do-chuc-phuc-">Phúc</a>; <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/936/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">Trăm năm hạnh phúc</a>;  Kính nhớ tổ tiên ;  Long phụng hòa minh - Sắc cầm hỏa hợp; Trăm năm tình viên mãn bạc đầu nghĩa phu thê</div>
<div>+ Trên bàn thờ có đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/955/ban-tho-to-tien-ngay-cuoi-mau-an-tuong-tong-hong-cho-trang-tri-l">1 bộ lư</a> để bình thường hoặc trang trí thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/993/ban-tho-to-tien-ngay-cuoi-tong-trang-do-mau-tu-nhien-duoc-trang-">hoa tươi</a></div>
<div>+ Đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/984/ban-tho-to-tien-ngay-cuoi-tong-hong-mau-tu-nhien-duoc-trang-tri-">hai bình hoa tươi</a> song hỷ hoặc một bình hoa tươi một mâm trái cây ngũ quả hoặc là đặc biệt hơn là mẫu trang trí hoa <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/986/ban-tho-to-tien-ngay-cuoi-tong-hong-mau-tu-nhien-duoc-trang-tri-">cắm đỗ bàn thờ</a></div>
<div>+ Đặt một đôi <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/648/rong-phung-trai-cay-ngay-cuoi">rồng phụng trái cây</a> sẽ mang lại không khí ấm áp, sung túc cho ngày lễ ăn hỏi, lễ cưới của bạn</div>
<div>+ Cạnh bàn thờ thì ở nhà gái còn đặt thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1031/hoa-giay-lua-tong-trang-do-long-lay-trang-tri-ban-tho-to-tien-n">một cái bàn nhỏ</a> được phủ mặt bàn được may bắt mắt để đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/859/mam-qua-tong-hop-qua-trai-cay-trau-cau-rong-phung-trai-cay-dac-s">mâm quả lễ vật</a> của nhà trai</div>
</div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/Product/dich-vu-cuoi-hoi-cong-ty-trang-tri-nha-dich-vu-cuoi-hoi-rong-phung-trai-cay-dep-1.jpg"><img src="http://shopcuoihoitamnhu.com/Image/Product/dich-vu-cuoi-hoi-cong-ty-trang-tri-nha-dich-vu-cuoi-hoi-rong-phung-trai-cay-dep-1.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" /></a></div>
<div><a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/648/rong-phung-trai-cay-ngay-cuoi">Rồng long phụng</a> được kết từ trái cây tươi ngon như thật  - <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a></div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/Product/dich-vu-cuoi-hoi-cong-ty-trang-tri-nha-doi-chim-cong-hoa-lan-dep-sac-sao-chung-ban-tho-ngay-cuoi-3.jpg"><img src="http://shopcuoihoitamnhu.com/Image/Product/dich-vu-cuoi-hoi-cong-ty-trang-tri-nha-doi-chim-cong-hoa-lan-dep-sac-sao-chung-ban-tho-ngay-cuoi-3.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" /></a></div>
<div><a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/2103/doi-chim-cong-hoa-lan-dep-sac-sao-chung-ban-tho-ngay-cuoi-3">Đôi chim cong hoa lan đẹp sắc sảo chưng bàn thờ ngày cưới</a></div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-trang-tri-ban-tho-gia-tien-to-tien-hoa-giay-tong-mau-trang-do-voi-rong-phung-va-hoa-tuoi--2.jpg"><img src="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-trang-tri-ban-tho-gia-tien-to-tien-hoa-giay-tong-mau-trang-do-voi-rong-phung-va-hoa-tuoi--2.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" /></a></div>
<div><a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/888/ban-tho-hoa-giay-ngay-cuoi">Trang trí bàn thờ hoa giấy</a> sang trọng, lỗng lẫy  - <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a></div>
<div></div>
<div><span>* Một bộ </span><a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/608/cat-dan-chu-xop---hoa-giay">chữ dán tường </a><span>của <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a> </span><span>thường theo kiểu </span><a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/196/chu-mop-xop-cat-dan-chu-xop-le-tan-hon-font-dep">thông dụng phổ biến</a><span>, hay </span><a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/216/chu-mop-xop-cat-dan-chu-xop-le-vu-quy-font-dep">chữ xốp đám cưới</a><span> theo font chữ và màu sắc tự chọn, </span><a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/256/chu-mop-xop-cat-dan-chu-xop-dac-biet-tong-tim-tren-khung-hoa-van">họa tiết </a><span>tự chọn dán đều, đẹp cân đối trên tường bên trái, bên phải theo kiểu đi vô hay đi ra tùy là lễ vu quy hay là lễ tân hôn.</span></div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-cat-dan-chu-mop-xop-tong-tim-lang-man-cho-le-vu-quy.jpg"><img src="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-cat-dan-chu-mop-xop-tong-tim-lang-man-cho-le-vu-quy.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" /></a></div>
<div><a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/608/cat-dan-chu-xop---hoa-giay">Cắt dán chữ mốp xốp </a>ngày cưới - <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a></div>
<div></div>
<div>
<div>* Một một ghế dựa được trang trí ngay ngắn, đẹp mắt để chủ hôn và hai họ trai gái ngồi làm lễ</div>
<div>+ Màu áo ghế: <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/688/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-trang">Trắng</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/686/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-trang-kem">kem</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/687/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-hong">hồng</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/689/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-vang-dong">vàng đồng</a></div>
<div>+ Nơ truyền thống: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1345/trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-voan-ngan-mau-">trắng</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1344/trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-voan-ngan-mau-">hồng</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1336/trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-voan-ngan-mau-">hồng dâu</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1329/trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-voan-ngan-mau-">cam</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1364/trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-voan-ngan-mau-">đỏ</a>, vàng,<a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1347/trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-voan-ngan-mau-">vàng đồng</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1360/trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-voan-ngan-mau-">xanh dương</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1350/trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-voan-ngan-mau-">xanh ngọc</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1359/trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-voan-ngan-mau-">xanh lá</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1357/trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-voan-ngan-mau-">xanh chuối</a>, tím sen, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1346/trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-voan-ngan-mau-">tím cà</a>.</div>
<div>+ Nơ vải hoa hồng sang trọng, lộng lẫy: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1224/trang-tri-nha-cuoi-hoi-tong-nen-mau-hong-ao-ghe-no-ngan-mau-tra">trắng</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1219/trang-tri-nha-cuoi-hoi-tong-nen-mau-hong-ao-ghe-no-ngan-mau-hon">hồng</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1222/trang-tri-nha-cuoi-hoi-tong-nen-mau-hong-ao-ghe-no-ngan-mau-hon">hồng dâu</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1218/trang-tri-nha-cuoi-hoi-tong-nen-mau-hong-ao-ghe-no-ngan-mau-cam">cam</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1217/trang-tri-nha-cuoi-hoi-tong-nen-mau-hong-ao-ghe-no-dai-mau-do-t">đỏ</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1225/trang-tri-nha-cuoi-hoi-tong-nen-mau-hong-ao-ghe-no-ngan-mau-van">vàng</a>,vàng đồng, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1228/trang-tri-nha-cuoi-hoi-tong-nen-mau-hong-ao-ghe-no-ngan-mau-xan">xanh dương</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1227/trang-tri-nha-cuoi-hoi-tong-nen-mau-hong-ao-ghe-no-ngan-mau-xan">xanh ngọc</a>, xanh lá, xanh chuối, tím sen, tím cà.</div>
<div>+ Nơ vài hoa hồng dài đặc biệt sang trọng, ấn tượng: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1119/trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-no-dai-mau-tra">trắng</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1112/trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-no-dai-mau-hon">hồng</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1127/trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-no-dai-mau-xan">xanh ngọc</a></div>
<div>
<div>+ Mặt bàn với nhiều mẫu mã bắt mắt, duyên dáng với vải truyền thống hay vải ren hiện đại</div>
<div>+ <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/609/hoa-de-ban-trang-tri-dam-cuoi">Hoa để bàn</a> một lẵng để chính giữa bàn hoặc 2 lẵng để cân đối đều 2 đầu. Đặc biệt, Dịch vụ cưới hỏi Tuấn Ngọc chuyên kết hoa tươi với rất nhiều mẫu mã đẹp, ấn tượng, sáng tạo mà giá cả rất phải chăng. Quý khách có thể dùng một loại hoa như: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/706/mau-trang-tri-dam-cuoi-voi-hoa-de-ban-hai-ho-le-tiec-mau-tu-cau-">hoa hồng đỏ</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/668/hoa-co-dau-cam-tay-tong-mau-trang-vang-duoc-ket-tu-hoa-hong-lan-">hoa hồng vàng</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/666/hoa-co-dau-cam-tay-tong-mau-trang-tim-pastel-duoc-ket-tu-hoa-hon">hoa hồng trắng</a>, hoa ly, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/730/mau-trang-tri-dam-cuoi-voi-hoa-de-ban-hai-ho-le-tiec-mau-oval-to">hoa lan tím</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/658/hoa-co-dau-cam-tay-tong-mau-trang-hong-pastel-duoc-ket-tu-hoa-ho">lan trắng</a>, lan đỏ, lan hồ điệp, lan ngọc điểm, lan vũ nữ, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/653/hoa-co-dau-cam-tay-tong-mau-hong-duoc-ket-tu-hoa-sen-thuan-khiet">hoa sen</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/686/hoa-co-dau-cam-tay-tong-mau-tim-pastel-duoc-ket-tu-hoa-hong-cam-">hoa cát tường</a>, hoa cúc vàng, hoa cút tím, hoa cúc trắng, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/686/hoa-co-dau-cam-tay-tong-mau-tim-pastel-duoc-ket-tu-hoa-hong-cam-">hoa đồng tiền</a>, ... hoặc kết hợp nhiều loại hoa thật ý nghĩa, tươi tắn, sặc sỡ cho ngày hạnh phúc lứa đôi.</div>
</div>
</div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/Product/dich-vu-cuoi-hoi-cong-ty-trang-tri-nha-cho-thue-ban-ghe-hai-ho-cao-cap-voi-vai-con-cong-14.jpg"><img src="http://shopcuoihoitamnhu.com/Image/Product/dich-vu-cuoi-hoi-cong-ty-trang-tri-nha-cho-thue-ban-ghe-hai-ho-cao-cap-voi-vai-con-cong-14.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" /></a></div>
<div><a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/688/trang-tri-nha-cuoi-hoi-theo-tong-nen-mau-trang">Cho thuê bàn ghế hai họ </a>- <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a></div>
<div></div>
<div><span>* </span><a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/605/trang-tri-chi-tiet-nha-cua-cau-thang-tran-nha-loi-di-bang-ten">Trần nhà </a><span>trong gói  trang trí </span><span>nhà cưới hỏi của </span><a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a><span> cũng được trang trí với đa dạng mẫu mã như: Dây bảy màu truyền thống, dây voan hiện đại với tất cả 12 màu (</span><a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1079/trang-tri-day-voan-tran-nha-tong-do-cho-ngay-trong-ngay-le-an-h">trắng</a><span>, </span><a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1063/trang-tri-cua-nha-tong-hong-voi-day-voan-hong-trai-chau-do-tron">hồng</a><span>, hồng dâu, cam, </span><a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1079/trang-tri-day-voan-tran-nha-tong-do-cho-ngay-trong-ngay-le-an-h">đỏ</a><span>, vàng,vàng đồng, xanh dương, </span><a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1058/trang-tri-cau-thang-tong-xanh-ngoc-voi-day-voan-trai-chaucho-ng">xanh ngọc</a><span>, xanh lá, xanh chuối, tím sen, tím cà.), </span><a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1064/trang-tri-cua-nha-tong-hong-voi-day-voan-trai-chau-do-trong-nga">tú cầu</a><span>, </span><a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1078/trang-tri-day-voan-tran-nha-tong-do-cho-ngay-trong-ngay-le-an-h">trái châu</a><span> với tất cả 6 màu, mỗi bộ 50 trái cầu</span></div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-trang-tri-chi-tiet-nha-cuoi-tran-nha-trang-hong-ket-tu-day-voan-va-trai-chau-trang-trong-2.jpg"><img src="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-trang-tri-chi-tiet-nha-cuoi-tran-nha-trang-hong-ket-tu-day-voan-va-trai-chau-trang-trong-2.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" /></a></div>
<div><a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1287/trang-tri-nha-cuoi-hoi-tong-nen-mau-trang-ao-ghe-no-hoa-hong-da">Trang trí trần nhà  bằng dây voan</a> trong ngày cưới - <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a></div>
<div></div>
<div>* Ngoài ra, trong ngày lễ ăn hỏi gia tiên, lễ đính hôn, đám cưới, đám hỏi người tổ chức lễ cưới còn chú trọng thuê <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a> thêm việc trang trí lối vào, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/605/trang-tri-chi-tiet-nha-cua-cau-thang-tran-nha-loi-di-bang-ten">trang trí của nhà</a>, cửa sổ, cầu thang, trần nhà nói chung là toàn bộ các chi tiết trong nhà để tạo một không gian lễ đồng bộ, ấn tượng theo tông tạo nên hiệu ứng ấm ấp, khó quên trong ngày lễ và hình ảnh tích cực đó sẽ theo cuộc sống hôn nhân của cô dâu, chú rể mãi về sau này giúp cho việc hôn nhân và làm ăn của đôi tân hôn ngày càng khấm khá, sung túc</div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-trang-tri-cua-nha-tong-trang-do-voi-day-voan-trai-chau-trong-ngay-le-an-hoi-gia-tien-dam-cuoi-cuoi-phong-cach-sang-trong-doc-dao.jpg"><img src="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-trang-tri-cua-nha-tong-trang-do-voi-day-voan-trai-chau-trong-ngay-le-an-hoi-gia-tien-dam-cuoi-cuoi-phong-cach-sang-trong-doc-dao.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" /></a></div>
<div>Trang trí trần nhà với <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1066/trang-tri-cua-nha-tong-trang-do-voi-day-voan-trai-chau-trong-ng">trái châu, tú cầu</a> - <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a></div>
<div></div>
<div><span><a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a> là một trong số rất ít công ty dịch vụ cưới hỏi đi đầu và chuyên cung cấp dịch vụ trang trí nhà cưới hỏi bằng hoa giấy lụa trọn gói:</span>
<div>- Trang trí nhà cưới hỏi bằng <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/889/trang-tri-nha-cuoi-hoi-voi-hoa-giay-lua">hoa giấy lụa</a> của <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a> với các tông màu sắc: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1140/trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-no-da">cam</a>, <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-no-dai-mau-hong-mat-ban-ren-hong-tran-nha-voan-trang-hong-ban-tho-hien-dai-rong-phung-1.jpg">hồng phấn</a>,<a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1169/trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-no-ng">hồng cánh sen</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1162/trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-no-da">đỏ</a>, <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-no-ngan-mau-tim-tran-nha-voan-trang-tim-ban-tho-hien-dai-hoa-giay-tim-rong-phung-trai-cay-1.jpg">tím cà</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1176/trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-no-ng">vàng</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1206/trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-vang-dong-ao-ghe-n">vàng đồng</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1203/trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-ren-n">xanh dương</a>, <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-no-ngan-mau-xanh-la-tran-nha-voan-trang-xanh-la-ban-tho-hien-dai-hoa-giay-xanh-la-rong-phung-trai-cay-1.jpg">xanh lá</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1184/trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-no-ng">xanh chuối</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1188/trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-no-ng">xanh ngọc</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1201/trang-tri-nha-cuoi-hoi-hoa-giay-tong-nen-mau-trang-ao-ghe-ren-n">xanh biển</a> trong ngày lễ ăn hỏi gia tiên, đính hôn, đám hỏi, đám cưới</div>
<div>- Trang trí chữ xốp dán tường xung với hoa giấy xung quanh trẻ trung, dễ thương của <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a> với các tông màu sắc: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/290/chu-mop-xop-tong-cam-mau-hoa-giay-chu-dep-tu-bo-chu-dan-phong-ch">cam</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/292/chu-mop-xop-tong-hong-mau-hoa-giay-chu-dep-tu-bo-chu-dan-phong-c">hồng phấn</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/291/chu-mop-xop-tong-hong-dau-mau-hoa-giay-chu-dep-tu-bo-chu-dan-pho">hồng cánh sen</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/311/chu-mop-xop-tong-tim-do-mau-le-vu-quy-chu-dep-kem-bo-trang-tri-p">đỏ</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/294/chu-mop-xop-tong-tim-ca-mau-hoa-giay-chu-dep-tu-bo-chu-dan-phong">tím</a>, <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/cat-dan-chu-xop-tong-vang-dong-mau-hoa-giay-chu-dep-tu-bo-chu-dan-phong-chu-dep-de-thuong-va-trang-tri-hoa-giay-xung-quanh-gop-phan-ton-them-ve-dep-lung-linh-ruc-ro-tron-ven-trong-.jpg">vàng đồng</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/316/chu-mop-xop-tong-xanh-duong-mau-hoa-giay-chu-dep-tu-bo-chu-dan-p">xanh dương</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/317/chu-mop-xop-tong-xanh-la-mau-hoa-giay-chu-dep-tu-bo-chu-dan-phon">xanh lá</a>, xanh chuối, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/293/chu-mop-xop-tong-trang-thuan-khiet-mau-hoa-giay-chu-dep-tu-bo-ch">xanh ngọc</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/314/chu-mop-xop-tong-xanh-bien-mau-hoa-giay-chu-dep-tu-bo-chu-dan-ph">xanh biển</a>trong ngày lễ ăn hỏi gia tiên, đính hôn, đám</div>
<div>hỏi, đám cưới</div>
<div>- Trang trí <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/888/ban-tho-hoa-giay-ngay-cuoi">bàn thờ gia tiên</a>, tổ tiên ngày cưới với hoa giấy bắt mắt, ấn tượng của <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a> với các tông màu sắc: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1038/hoa-giay-lua-tong-xanh-duong-tuoi-dep-trang-tri-ban-tho-to-tien">cam</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1027/hoa-giay-lua-tong-hong-trang-nha-trang-tri-ban-tho-to-tien-ngay">hồng phấn</a>, <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-dich-vu-cuoi-hoi-hoa-giay-lua-tong-hong-dau-tuoi-dep-trang-tri-ban-tho-to-tien-ngay-cuoi-tong-cho-le-an-hoi-gia-tien-dam-cuoi-sang-trong-moi-me.jpg">hồng cánh sen</a>,  đỏ, tím cà, tím, vàng, vàng đồng, xanh dương, xanh lá, xanh chuối, xanh ngọc ,<a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1039/hoa-giay-lua-tong-xanh-la-tuoi-dep-trang-tri-ban-tho-to-tien-ng">xanh biển</a> trong ngày lễ ăn hỏi gia tiên, đính hôn, đám hỏi, đám cưới</div>
<div>- <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/762/trang-tri-phong-cuoi-hoi-hoa-giay">Trang trí phông cưới hoa giấy lụa</a> với kỹ thuật tinh xảo nhất là trong việc <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/894/phong-cuoi-hoa-giay-lua-tong-cam-cho-le-vu-quy-tuoi-dep-sang-tro">dán chữ xốp lớn lên tấm phông lụa mỏn</a>g, các mẫu tang trí phông cưới hỏi hoa giấy tạo nên cảm giác nhẹ nhàng nhưng không kề kém phần trang trọng của <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a> với các tông màu sắc: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/893/phong-cuoi-hoa-giay-lua-tong-cam-cho-le-vu-quy-tuoi-dep-sang-tro">cam</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/900/phong-cuoi-hoa-giay-lua-tong-trang-hong-cho-le-vu-quy-voi-voan-h">hồng phấn</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/896/phong-cuoi-hoa-giay-lua-tong-hong-dau-cho-le-vu-quy-voi-voan-hoa">hồng cánh sen</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/902/phong-cuoi-hoa-giay-lua-tong-trang-do-cho-le-vu-quy-voi-voan-hoa">đỏ</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/905/phong-cuoi-hoa-giay-lua-tong-tim-hoa-ca-cho-le-vu-quy-an-tuong-v">tím</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/909/phong-cuoi-hoa-giay-lua-tong-vang-cho-le-vu-quy-dep-mat-an-tuong">vàng</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/915/phong-cuoi-hoa-giay-lua-tong-xanh-duong-cho-le-vu-quy-dep-mat-tr">xanh dương</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/917/phong-cuoi-hoa-giay-lua-tong-xanh-la-cho-le-vu-quy-trang-trong-a">xanh lá</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/913/phong-cuoi-hoa-giay-lua-tong-xanh-chuoi-cho-le-vu-quy-dep-mat-an">xanh chuối</a>, xanh ngọc,<a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-dich-vu-cuoi-hoi-phong-cuoi-hoa-giay-lua-tong-xanh-bien-cho-le-vu-quy-ngot-ngao-tuoi-tre-voi-voan-hoa-vai-chu-song-hy-ghe-dua-ket-no-dep-tu-cau-tran-nha-1.jpg">xanh biển</a></div>
</div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-phong-cuoi-an-hoi-tong-trang-hong-ket-tu-hoa-giay-bong-bong-va-voan-mem-mai.jpg"><img src="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-phong-cuoi-an-hoi-tong-trang-hong-ket-tu-hoa-giay-bong-bong-va-voan-mem-mai.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" /></a></div>
<div><a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/762/trang-tri-phong-cuoi-hoi-hoa-giay">Trang trí phông cưới hoa giấy lụa</a> - <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a></div>
<div></div>
<div>
<div>- <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/763/trang-tri-backdrop-hoa-giay">Trang trí backdrop cưới hỏi</a> bằng hoa giấy lụa cho ngày lễ ăn hỏi gia tiên, đính hôn, đám hỏi, đám cưới với nhiều mẫu đa đạng của <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a> với các tông màu sắc: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/138/tong-cam-mau-bang-ten-dep-voi-tran-trai-chau-tu-cau-do-trang-va-">cam</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/144/tong-trang-hong-mau-bang-ten-dep-voi-tran-nha-trai-chau-tu-cau-t">hồng phấn</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/141/tong-hong-dau-mau-bang-ten-dep-voi-tran-nha-day-voan-hong-trang-">hồng cánh sen</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/156/tong-do-mau-bang-ten-dep-voi-tran-nha-day-voan-trang-do-va-bo-gh">đỏ</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/145/tong-tim-ca-mau-bang-ten-elip-voi-tran-nha-day-voan-do-trang-tim">tím</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/147/tong-vang-mau-bang-ten-dep-voi-tran-nha-trai-chau-tu-cau-trang-v">vàng</a>, vàng đồng,<a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/151/tong-xanh-duong-mau-trai-tim-voi-tran-nha-trai-chau-tu-cau-trang">xanh dương</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/153/tong-xanh-la-mau-bang-ten-dep-voi-trai-chau-tu-cau-trang-xanh-la">xanh lá</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/149/tong-xanh-chuoi-mau-bang-ten-dep-voi-tran-nha-tu-cau-trang-xanh-">xanh chuối</a>, xanh ngọc, xanh biển</div>
<div>- <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/763/trang-tri-backdrop-hoa-giay">Trang trí backdrop hoa giấy</a> cho tiệc cưới ở nhà hàng ở khu vực đón khách, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/909/cho-thue-san-khau-dan-nhac">sân khấu</a>. Đối với dịch vụ trang trí tiệc cưới ở nhà hàng, <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a> còn đi kèm với dịch vụ <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/771/trang-tri-ban-ky-ten-don-khach">trang trí bàn ký tên đón khách</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/643/cong-cuoi-hoa-vai">trang trí cổng cưới đón khách với hoa vải</a>, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/597/cong-cuoi-hoa-tuoi">hoa tươi</a>, hoa giấy, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/908/cong-cuoi-bong-bong">bong bóng</a></div>
<div>- Ngoài ra, <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a> còn dùng hoa giấy lụa để <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/909/cho-thue-san-khau-dan-nhac">trang trí backdrop sân khấu</a> nhạc sống hoặc <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/772/trang-tri-cuoi-hoi-khac">trang trí các chi tiết khác</a> trong nhà cưới hỏi</div>
</div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-cho-thue-san-khau-backdrop-phong-dam-cuoi-dai-tiec-tu-hoa-giay-bong-bong-thap-ly-banh-kem-1.jpg"><img src="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-cho-thue-san-khau-backdrop-phong-dam-cuoi-dai-tiec-tu-hoa-giay-bong-bong-thap-ly-banh-kem-1.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" /></a></div>
<div>Trang trí, <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/909/cho-thue-san-khau-dan-nhac">cho thuê sân khấu</a> được trang trí đẹp mắt với <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-dich-vu-cuoi-hoi-cho-thue-san-khau-backdrop-phong-dam-cuoi-dai-tiec-tu-hoa-giay-bong-bong-thap-ly-banh-kem-1.jpg">hoa giấy</a> - <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a></div>
<div></div>
<div><span>Dịch vụ trang trí nhà cưới hỏi cao cấp của </span><a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi cưới hỏi Tâm Như</a><span> dành cho nhóm khách hàng có nguồn thu nhập tốt hoặc muốn có một đám cưới thật </span><a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/776/mau-rap-trang-tri-dam-cuoi-cao-cap-sang-trong-dac-biet-kem-cong-">lung linh</a><span>, hoàn hảo. Với các gói trang trí cao cấp này của </span><a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi cưới hỏi Tâm Như</a><span> chắc chắn sẽ mang đến cho bạn một đám cưới đẹp mắt, tươi tắn, </span><a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/888/ban-tho-hoa-giay-ngay-cuoi">trang trọng</a><span>, </span><a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/690/trang-tri-nha-cuoi-hoi-an-tuong">ấn tượng</a><span> làm đẹp lòng tất cả các khách mời đám cưới và để lại những loạt hình cưới kỷ niệm thật ngọt ngào, khó quên:</span>
<div>- Mâm quả cao cấp với <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/825/mam-qua-ket-cuom-ren-tong-hop-do-hong-vang-cao-cap-sang-trong-lo">mâm quả kết ren</a>, cườm tinh xảo hay cao cấp hơn là loại <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/837/mam-qua-son-mai-tong-hop-cao-cap-sang-trong-long-lau-cho-le-an-h">mâm quả sơn mài</a></div>
<div>- Trang trí chữ xốp dán tường có kèm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/317/chu-mop-xop-tong-xanh-la-mau-hoa-giay-chu-dep-tu-bo-chu-dan-phon">hoa giấy</a> trang trí xung quanh</div>
<div>- Trang trí bàn thờ gia tiên tổ tiên ngày cưới có kèm trang trí <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1027/hoa-giay-lua-tong-hong-trang-nha-trang-tri-ban-tho-to-tien-ngay">hoa giấy</a></div>
<div>-  <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/648/rong-phung-trai-cay-ngay-cuoi">Rồng (long) phụng trái cây</a> ngày cưới bắt mắt, sóng động như thật đặt biệt là mẫu rồng phụng <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/877/rong-long-phung-chuyen-dong-duoc-ket-tu-trai-cay-tuoi-ngon-nhu-t">chuyển động</a></div>
<div>- Trang trí <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/902/phong-cuoi-hoa-giay-lua-tong-trang-do-cho-le-vu-quy-voi-voan-hoa">phông cưới hỏi bằng hoa giấy</a> lụa trong khu vực làm lễ gia tiên</div>
<div>- Trang trí <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-dich-vu-cuoi-hoi-z-backdrop-hoa-giay-lua-mau-hoa-day-tuoi-dep-da-sac-mau-1.jpg">backdrop</a> <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/763/trang-tri-backdrop-hoa-giay">hoa giấy lụa</a> trong khu vực làm lễ đính hôn, ăn hỏi, lễ cưới</div>
<div>- Trang trí <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1084/cho-thue-san-khau-backdrop-phong-dam-cuoi-dai-tiec-tu-hoa-giay-">sân khấu bằng hoa giấy</a>, bong bóng cho tiệc cưới tại nhà hoặc tiệc cưới tại nhà hàng</div>
<div>- Khung rạp cưới mẫu <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/812/tong-do-mau-hien-dai-mau-moi-la-bat-mat-co-kem-cong-hoa-vai-di-t">hiện đại </a>hoặc ấn tượng hơn là <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/773/nha-bat-rap-voan-pha-le-hang-rao-tinh-yeu">rạp cưới voan</a>, pha lê và <a href="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-mau-cao-cap-sang-trong-dac-biet-kem-cong-hoa-vai-tong-xanh-nuoc-bien.jpg">hàng rào tình yêu</a></div>
<div>- <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/597/cong-cuoi-hoa-tuoi">Cổng cưới hoa tươi</a> cắm theo kích thước cổng nhà, ý thích của bạn về tông màu sắc, các loại hoa tươi và kiểu mẫu cổng hoa. Trên cổng hoa tươi đó có thể trang trí thêm <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-dich-vu-cuoi-hoi-hinh-tru-ngang-tong-xanh-ngoc-voi-cam-tu-cau-hoa-hong-va-hoa-ly-ruc-ro-cho-dam-cuoi-sang-trong-long-lay-2.jpg">dây pha lê </a>cho tiệc ấn tượng, lãng mạn hoặc trang trí thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/440/cong-cuoi-hoa-tuoi-hinh-tru-mai-ngang-bong-bong-tong-mau-hong-de">cổng phụ bong bóng </a>bảo đảm khu vực đón khách và tạm biệt khách của bạn trong ngày cưới sẽ không còn có thể <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/460/cong-cuoi-hoa-tuoi-hinh-tru-ngang-tong-xanh-ngoc">đẹp</a> hơn nữa</div>
<div>- Xe hoa đón rước dâu sẽ chọn dòng xe độc, lạ, không đụng hàng và trang trí thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1431/cho-thue-xe-hoa-don-ruoc-dau-mau-trang-4-cho-7-cho-ket-hoa-tuoi">hoa tươi</a> đầy sắc màu và <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-dich-vu-cuoi-hoi-cho-thue-xe-hoa-don-ruoc-dau-4-cho--7-cho-ket-hoa-vai-trai-tim-hoa-tuoi-gau-bong-2.jpg">đôi gấu bông dễ thương</a> sẽ thêm điểm cho nhà trai khi đến nhà gái đồng thời cũng làm đẹp lòng cô dâu</div>
</div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-dich-vu-cuoi-hoi-mam-qua-ket-cuom-ren-tong-hop-do-hong-vang-cao-cap-sang-trong-long-lau-cho-le-an-an-tuong-hoan-hao.jpg"><img src="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-mam-qua-ket-cuom-ren-tong-hop-do-hong-vang-cao-cap-sang-trong-long-lau-cho-le-an-an-tuong-hoan-hao.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" /></a></div>
<div>Mâm quả kết ren bắt mắt, trang trọng - <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a></div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-trang-tri-backdrop-hoa-tong-mau-tim-lang-man-de-thuong.jpg"><img src="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-trang-tri-backdrop-hoa-tong-mau-tim-lang-man-de-thuong.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" /></a></div>
<div><a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/159/z-backdrop-hoa-giay-lua-mau-hoa-day-tuoi-dep-da-sac-mau-1">Backdrop hoa giấy lụa</a> trang trí khu vực đón khách trong tiệc cưới - <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a></div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-mau-cao-cap-sang-trong-dac-biet-kem-cong-hoa-vai-tong-hong-tim-hoa-ca-mau-2.jpg"><img src="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-mau-cao-cap-sang-trong-dac-biet-kem-cong-hoa-vai-tong-hong-tim-hoa-ca-mau-2.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" /></a></div>
<div><a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/773/nha-bat-rap-voan-pha-le-hang-rao-tinh-yeu">Nhà bạt voan, pha lê hàng rào tình yêu</a> - <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a></div>
<div></div>
<div><a href="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-bo-tong-mau-cam-voi-ban-duoc-trang-trang-tri-day-voan-hong-va-hoa-tuoi-nen-anh-cuoi-gau-bong-kem-2-ghe-vai-ren-hoa-hong-sang-trong.jpg"><img src="http://shopcuoihoitamnhu.com/Image/Product/shop-dich-vu-cuoi-hoi-bo-tong-mau-cam-voi-ban-duoc-trang-trang-tri-day-voan-hong-va-hoa-tuoi-nen-anh-cuoi-gau-bong-kem-2-ghe-vai-ren-hoa-hong-sang-trong.jpg" alt="hinh-anh-dich-vu-cuoi-hoi" title="Bạn đang xem thông tin về dịch vụ cưới hỏi trên website của công ty chuyên trang trí nhà cưới hỏi trọn gói" /></a></div>
<div><a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/771/trang-tri-ban-ky-ten-don-khach">Trang trí bàn ký tên đón khách</a> - <a href="http://shopcuoihoitamnhu.com/">Shop dịch vụ cưới hỏi Tâm Như</a></div>
<div></div>
<div>-----------------------------------------------------------</div>
<div>Mọi chi tiết về việc tư vấn cưới hỏi, đặt dịch vụ quý khách vui lòng liên hệ</div>
<div>
<div>Shop Dịch Vụ Cưới Hỏi Tâm Như</div>
<div>Địa chỉ: 737 - 747 Quang Trung, Phường 12, Quận Gò Vấp, TP.Hồ Chí Minh</div>
<div>Email: shopcuoihoitamnhu@gmail.com </div>
<div>Điện thoại: 08.66 80 72 24 - Hotline: 0913.62 34 72 - 0974.24 18 24</div>
<div>Website: <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-tam-nhu-cong-ty-trang-tri-dam-cuoi">www.ShopCuoiHoiTamNhu.com</a></div>
</div>
</div>
</div>
</td>
</tr>
</tbody>
</table>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (253, 1061, N'a2c9b908-1db6-4d9d-a819-4446ed884f1a', 39, NULL, NULL, N'gioi-thieu', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (254, 1061, N'a2c9b908-1db6-4d9d-a819-4446ed884f1a', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (255, 1061, N'a2c9b908-1db6-4d9d-a819-4446ed884f1a', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (256, 1061, N'a2c9b908-1db6-4d9d-a819-4446ed884f1a', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (257, 1061, N'a2c9b908-1db6-4d9d-a819-4446ed884f1a', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (258, 1061, N'a2c9b908-1db6-4d9d-a819-4446ed884f1a', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (259, 1061, N'a2c9b908-1db6-4d9d-a819-4446ed884f1a', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (260, 1061, N'a2c9b908-1db6-4d9d-a819-4446ed884f1a', 46, NULL, NULL, N'Giới thiệu', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (261, 1061, N'a2c9b908-1db6-4d9d-a819-4446ed884f1a', 52, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (262, 1061, N'0393235a-c6cc-487e-a313-9a81c056471d', 39, NULL, NULL, N'gioi-thieu', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (263, 1061, N'0393235a-c6cc-487e-a313-9a81c056471d', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (264, 1061, N'0393235a-c6cc-487e-a313-9a81c056471d', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (265, 1061, N'0393235a-c6cc-487e-a313-9a81c056471d', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (266, 1061, N'0393235a-c6cc-487e-a313-9a81c056471d', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (267, 1061, N'0393235a-c6cc-487e-a313-9a81c056471d', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (268, 1061, N'0393235a-c6cc-487e-a313-9a81c056471d', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (269, 1061, N'0393235a-c6cc-487e-a313-9a81c056471d', 46, NULL, NULL, N'Giới thiệu', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (270, 1061, N'0393235a-c6cc-487e-a313-9a81c056471d', 52, NULL, NULL, NULL, N'<ul id="menu">
<li class="m1"><a href="http://emotionslive.co.uk/index.html" title="Fresh Stuff">Fresh Stuff</a></li>
<li class="m2"><a href="http://emotionslive.co.uk/portfolio.html" title="Portfolio">Portfolio</a></li>
<li class="m3"><a href="http://emotionslive.co.uk/about.html" title="About Me">About Me</a></li>
</ul>
<h1><a href="http://emotionslive.co.uk/index.html" title="EMOTIONS by Mike - freelance portfolio"><img src="http://emotionslive.co.uk/img/logo.gif" alt="EMOTIONS by Mike - freelance portfolio" /></a></h1>
<div id="txt"><img src="http://emotionslive.co.uk/img/h_portfolio.gif" alt="About This Site" />
<p><strong>I''ve been doing</strong> web design for 7 years and the works below represent only <br />a small part of what I have done up to date. If you want to see more designs please visit my new portfolio website at <strong><a href="http://www.creativemints.com/" target="_blank" title="Creative Mints">www.creativemints.com</a></strong></p>
<div id="line"></div>
<dl class="preview">
<dt><img src="http://emotionslive.co.uk/img/p_logo.gif" alt="" /></dt>
<dd><a href="http://emotionslive.co.uk/portfolio.html"><img src="http://emotionslive.co.uk/portfolio/20060609003709.jpg" border="0" alt="" width="94" height="55" /></a></dd>
</dl>
<dl class="preview">
<dt><img src="http://emotionslive.co.uk/img/p_web.gif" alt="" /></dt>
<dd class="p2"><a href="http://emotionslive.co.uk/portfolio.html"><img src="http://emotionslive.co.uk/portfolio/20060609003611.jpg" border="0" alt="" width="94" height="55" /></a></dd>
</dl>
<dl class="preview">
<dt><img src="http://emotionslive.co.uk/img/p_web.gif" alt="" /></dt>
<dd class="p3"><a href="http://emotionslive.co.uk/portfolio.html"><img src="http://emotionslive.co.uk/portfolio/20060609003458.jpg" border="0" alt="" width="94" height="55" /></a></dd>
</dl>
<dl class="preview">
<dt><img src="http://emotionslive.co.uk/img/p_web.gif" alt="" /></dt>
<dd><a href="http://emotionslive.co.uk/portfolio.html"><img src="http://emotionslive.co.uk/portfolio/20060609003116.jpg" border="0" alt="" width="94" height="55" /></a></dd>
</dl>
<dl class="preview">
<dt><img src="http://emotionslive.co.uk/img/p_logo.gif" alt="" /></dt>
<dd class="p2"><a href="http://emotionslive.co.uk/portfolio.html"><img src="http://emotionslive.co.uk/portfolio/20060609002941.jpg" border="0" alt="" width="94" height="55" /></a></dd>
</dl>
<dl class="preview">
<dt><img src="http://emotionslive.co.uk/img/p_web.gif" alt="" /></dt>
<dd class="p3"><a href="http://emotionslive.co.uk/portfolio.html"><img src="http://emotionslive.co.uk/portfolio/20060609002827.jpg" border="0" alt="" width="94" height="55" /></a></dd>
</dl>
<dl class="preview">
<dt><img src="http://emotionslive.co.uk/img/p_web.gif" alt="" /></dt>
<dd><a href="http://emotionslive.co.uk/portfolio.html"><img src="http://emotionslive.co.uk/portfolio/20060609002659.jpg" border="0" alt="" width="94" height="55" /></a></dd>
</dl>
<dl class="preview">
<dt><img src="http://emotionslive.co.uk/img/p_web.gif" alt="" /></dt>
<dd class="p2"><a href="http://emotionslive.co.uk/portfolio.html"><img src="http://emotionslive.co.uk/portfolio/20060609002548.jpg" border="0" alt="" width="94" height="55" /></a></dd>
</dl>
<dl class="preview">
<dt><img src="http://emotionslive.co.uk/img/p_web.gif" alt="" /></dt>
<dd class="p3"><a href="http://emotionslive.co.uk/portfolio.html"><img src="http://emotionslive.co.uk/portfolio/20060609002142.jpg" border="0" alt="" width="94" height="55" /></a></dd>
</dl>
<dl class="preview">
<dt><img src="http://emotionslive.co.uk/img/p_web.gif" alt="" /></dt>
<dd><a href="http://emotionslive.co.uk/portfolio.html"><img src="http://emotionslive.co.uk/portfolio/20051209205943.jpg" border="0" alt="" width="94" height="55" /></a></dd>
</dl>
<dl class="preview">
<dt><img src="http://emotionslive.co.uk/img/p_web.gif" alt="" /></dt>
<dd class="p2"><a href="http://emotionslive.co.uk/portfolio.html"><img src="http://emotionslive.co.uk/portfolio/20051209205810.jpg" border="0" alt="" width="94" height="55" /></a></dd>
</dl>
<dl class="preview">
<dt><img src="http://emotionslive.co.uk/img/p_char.gif" alt="" /></dt>
<dd class="p3"><a href="http://emotionslive.co.uk/portfolio.html"><img src="http://emotionslive.co.uk/portfolio/20051209205627.jpg" border="0" alt="" width="94" height="55" /></a></dd>
</dl>
<div class="clear"></div>
<div id="line3"><a class="left"><img src="http://emotionslive.co.uk/img/arr_l_d.gif" border="0" alt="Previous not aviable" /></a><a href="http://emotionslive.co.uk/portfolio2.html"><img src="http://emotionslive.co.uk/img/arr_r.gif" border="0" alt="Next" /></a></div>
</div>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (271, 1061, N'5517d347-96ff-4e3f-85d4-2343dfa8f41f', 39, NULL, NULL, N'gioi-thieu', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (272, 1061, N'5517d347-96ff-4e3f-85d4-2343dfa8f41f', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (273, 1061, N'5517d347-96ff-4e3f-85d4-2343dfa8f41f', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (274, 1061, N'5517d347-96ff-4e3f-85d4-2343dfa8f41f', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (275, 1061, N'5517d347-96ff-4e3f-85d4-2343dfa8f41f', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (276, 1061, N'5517d347-96ff-4e3f-85d4-2343dfa8f41f', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (277, 1061, N'5517d347-96ff-4e3f-85d4-2343dfa8f41f', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (278, 1061, N'5517d347-96ff-4e3f-85d4-2343dfa8f41f', 46, NULL, NULL, N'Giới thiệu', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (279, 1061, N'5517d347-96ff-4e3f-85d4-2343dfa8f41f', 52, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (280, 1061, N'98b41b26-60ef-4047-bdc1-28e675177697', 39, NULL, NULL, N'gioi-thieu', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (281, 1061, N'98b41b26-60ef-4047-bdc1-28e675177697', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (282, 1061, N'98b41b26-60ef-4047-bdc1-28e675177697', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (283, 1061, N'98b41b26-60ef-4047-bdc1-28e675177697', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (284, 1061, N'98b41b26-60ef-4047-bdc1-28e675177697', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (285, 1061, N'98b41b26-60ef-4047-bdc1-28e675177697', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (286, 1061, N'98b41b26-60ef-4047-bdc1-28e675177697', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (287, 1061, N'98b41b26-60ef-4047-bdc1-28e675177697', 46, NULL, NULL, N'Giới thiệu', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (288, 1061, N'98b41b26-60ef-4047-bdc1-28e675177697', 52, NULL, NULL, NULL, N'<p>RỒNG PHỤNG HẢI DIỄM</p>
<p>Chuyên cung cấp dịch vụ rồng phụng trái cây ngày cưới cho các cặp đôi hoàn hảo</p>
<div>Mỗi mẫu trang trí nhà cưới hỏi của <span>RỒNG PHỤNG HẢI DIỄM </span>thường gồm có:</div>
<div>* <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/679/ban-tho-gia-tien-ngay-cuoi">Trang trí bàn thờ gia tiên</a> hay còn gọi là bàn thờ tổ tiên của <span>RỒNG PHỤNG HẢI DIỄM </span>với </div>
<div>+ Các kiểu trang trí bàn thờ gồm có: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/924/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">mẫu truyền thống nhung đỏ</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/928/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">mẫu tự nhiên</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/978/ban-tho-to-tien-ngay-cuoi-tong-hong-canh-sen-mau-tu-nhien-duoc-t">mẫu hiện đại</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/944/ban-tho-to-tien-ngay-cuoi-mau-thien-chua-tong-xanh-la-cho-trang-">mẫu thiên chúa tin lành</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/946/ban-tho-to-tien-ngay-cuoi-mau-dep-voi-manh-tre-mau-do-chuc-phuc-">mẫu mành tre</a> với dây voan, hoa vải hoa tươi trang trí, chữ song hỷ, câu đối trang trí; </div>
<div>+ Chữ dán trên phong nền có thể là: <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-dich-vu-cuoi-hoi-ban-tho-to-tien-ngay-cuoi-tong-cam-mau-tu-nhien-duoc-trang-tri-bang-vai-voan-cao-cap-cho-le-an-hoi-gia-tien-dam-cuoi-day-du-nghi-le-4.jpg">Song hỷ</a> ; <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/946/ban-tho-to-tien-ngay-cuoi-mau-dep-voi-manh-tre-mau-do-chuc-phuc-">Phúc</a>; <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/936/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">Trăm năm hạnh phúc</a>;  Kính nhớ tổ tiên ;  Long phụng hòa minh - Sắc cầm hỏa hợp; Trăm năm tình viên mãn bạc đầu nghĩa phu thê</div>
<div>+ Trên bàn thờ có đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/955/ban-tho-to-tien-ngay-cuoi-mau-an-tuong-tong-hong-cho-trang-tri-l">1 bộ lư</a> để bình thường hoặc trang trí thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/993/ban-tho-to-tien-ngay-cuoi-tong-trang-do-mau-tu-nhien-duoc-trang-">hoa tươi</a></div>
<div>+ Đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/984/ban-tho-to-tien-ngay-cuoi-tong-hong-mau-tu-nhien-duoc-trang-tri-">hai bình hoa tươi</a> song hỷ hoặc một bình hoa tươi một mâm trái cây ngũ quả hoặc là đặc biệt hơn là mẫu trang trí hoa <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/986/ban-tho-to-tien-ngay-cuoi-tong-hong-mau-tu-nhien-duoc-trang-tri-">cắm đỗ bàn thờ</a></div>
<div>+ Đặt một đôi <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/648/rong-phung-trai-cay-ngay-cuoi">rồng phụng trái cây</a> sẽ mang lại không khí ấm áp, sung túc cho ngày lễ ăn hỏi, lễ cưới của bạn</div>
<div>+ Cạnh bàn thờ thì ở nhà gái còn đặt thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1031/hoa-giay-lua-tong-trang-do-long-lay-trang-tri-ban-tho-to-tien-n">một cái bàn nhỏ</a> được phủ mặt bàn được may bắt mắt để đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/859/mam-qua-tong-hop-qua-trai-cay-trau-cau-rong-phung-trai-cay-dac-s">mâm quả lễ vật</a> của nhà trai</div>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (289, 1061, N'f8614c47-59d5-4ded-8f1f-4ad80ac935b8', 39, NULL, NULL, N'gioi-thieu', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (290, 1061, N'f8614c47-59d5-4ded-8f1f-4ad80ac935b8', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (291, 1061, N'f8614c47-59d5-4ded-8f1f-4ad80ac935b8', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (292, 1061, N'f8614c47-59d5-4ded-8f1f-4ad80ac935b8', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (293, 1061, N'f8614c47-59d5-4ded-8f1f-4ad80ac935b8', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (294, 1061, N'f8614c47-59d5-4ded-8f1f-4ad80ac935b8', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (295, 1061, N'f8614c47-59d5-4ded-8f1f-4ad80ac935b8', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (296, 1061, N'f8614c47-59d5-4ded-8f1f-4ad80ac935b8', 46, NULL, NULL, N'Giới thiệu', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (297, 1061, N'f8614c47-59d5-4ded-8f1f-4ad80ac935b8', 52, NULL, NULL, NULL, N'<h2 style="color: #fff;">RỒNG PHỤNG HẢI DIỄM</h2>
<p>Chuyên cung cấp dịch vụ rồng phụng trái cây ngày cưới cho các cặp đôi hoàn hảo</p>
<div>Mỗi mẫu trang trí nhà cưới hỏi của <span>RỒNG PHỤNG HẢI DIỄM </span>thường gồm có:</div>
<div>* <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/679/ban-tho-gia-tien-ngay-cuoi">Trang trí bàn thờ gia tiên</a> hay còn gọi là bàn thờ tổ tiên của <span>RỒNG PHỤNG HẢI DIỄM </span>với </div>
<div>+ Các kiểu trang trí bàn thờ gồm có: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/924/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">mẫu truyền thống nhung đỏ</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/928/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">mẫu tự nhiên</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/978/ban-tho-to-tien-ngay-cuoi-tong-hong-canh-sen-mau-tu-nhien-duoc-t">mẫu hiện đại</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/944/ban-tho-to-tien-ngay-cuoi-mau-thien-chua-tong-xanh-la-cho-trang-">mẫu thiên chúa tin lành</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/946/ban-tho-to-tien-ngay-cuoi-mau-dep-voi-manh-tre-mau-do-chuc-phuc-">mẫu mành tre</a> với dây voan, hoa vải hoa tươi trang trí, chữ song hỷ, câu đối trang trí; </div>
<div>+ Chữ dán trên phong nền có thể là: <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-dich-vu-cuoi-hoi-ban-tho-to-tien-ngay-cuoi-tong-cam-mau-tu-nhien-duoc-trang-tri-bang-vai-voan-cao-cap-cho-le-an-hoi-gia-tien-dam-cuoi-day-du-nghi-le-4.jpg">Song hỷ</a> ; <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/946/ban-tho-to-tien-ngay-cuoi-mau-dep-voi-manh-tre-mau-do-chuc-phuc-">Phúc</a>; <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/936/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">Trăm năm hạnh phúc</a>;  Kính nhớ tổ tiên ;  Long phụng hòa minh - Sắc cầm hỏa hợp; Trăm năm tình viên mãn bạc đầu nghĩa phu thê</div>
<div>+ Trên bàn thờ có đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/955/ban-tho-to-tien-ngay-cuoi-mau-an-tuong-tong-hong-cho-trang-tri-l">1 bộ lư</a> để bình thường hoặc trang trí thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/993/ban-tho-to-tien-ngay-cuoi-tong-trang-do-mau-tu-nhien-duoc-trang-">hoa tươi</a></div>
<div>+ Đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/984/ban-tho-to-tien-ngay-cuoi-tong-hong-mau-tu-nhien-duoc-trang-tri-">hai bình hoa tươi</a> song hỷ hoặc một bình hoa tươi một mâm trái cây ngũ quả hoặc là đặc biệt hơn là mẫu trang trí hoa <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/986/ban-tho-to-tien-ngay-cuoi-tong-hong-mau-tu-nhien-duoc-trang-tri-">cắm đỗ bàn thờ</a></div>
<div>+ Đặt một đôi <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/648/rong-phung-trai-cay-ngay-cuoi">rồng phụng trái cây</a> sẽ mang lại không khí ấm áp, sung túc cho ngày lễ ăn hỏi, lễ cưới của bạn</div>
<div>+ Cạnh bàn thờ thì ở nhà gái còn đặt thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1031/hoa-giay-lua-tong-trang-do-long-lay-trang-tri-ban-tho-to-tien-n">một cái bàn nhỏ</a> được phủ mặt bàn được may bắt mắt để đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/859/mam-qua-tong-hop-qua-trai-cay-trau-cau-rong-phung-trai-cay-dac-s">mâm quả lễ vật</a> của nhà trai</div>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (298, 1061, N'5ccae885-baf3-478d-98b2-ce66df496a95', 39, NULL, NULL, N'gioi-thieu', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (299, 1061, N'5ccae885-baf3-478d-98b2-ce66df496a95', 40, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (300, 1061, N'5ccae885-baf3-478d-98b2-ce66df496a95', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (301, 1061, N'5ccae885-baf3-478d-98b2-ce66df496a95', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (302, 1061, N'5ccae885-baf3-478d-98b2-ce66df496a95', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (303, 1061, N'5ccae885-baf3-478d-98b2-ce66df496a95', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (304, 1061, N'5ccae885-baf3-478d-98b2-ce66df496a95', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (305, 1061, N'5ccae885-baf3-478d-98b2-ce66df496a95', 46, NULL, NULL, N'Giới thiệu', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (306, 1061, N'5ccae885-baf3-478d-98b2-ce66df496a95', 52, NULL, NULL, NULL, N'<p style="color: #fff;">RỒNG PHỤNG HẢI DIỄM</p>
<p style="color: #fff;">Chuyên cung cấp dịch vụ rồng phụng trái cây ngày cưới cho các cặp đôi hoàn hảo</p>
<div>Mỗi mẫu trang trí nhà cưới hỏi của <span>RỒNG PHỤNG HẢI DIỄM </span>thường gồm có:</div>
<div>* <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/679/ban-tho-gia-tien-ngay-cuoi">Trang trí bàn thờ gia tiên</a> hay còn gọi là bàn thờ tổ tiên của <span>RỒNG PHỤNG HẢI DIỄM </span>với </div>
<div>+ Các kiểu trang trí bàn thờ gồm có: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/924/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">mẫu truyền thống nhung đỏ</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/928/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">mẫu tự nhiên</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/978/ban-tho-to-tien-ngay-cuoi-tong-hong-canh-sen-mau-tu-nhien-duoc-t">mẫu hiện đại</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/944/ban-tho-to-tien-ngay-cuoi-mau-thien-chua-tong-xanh-la-cho-trang-">mẫu thiên chúa tin lành</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/946/ban-tho-to-tien-ngay-cuoi-mau-dep-voi-manh-tre-mau-do-chuc-phuc-">mẫu mành tre</a> với dây voan, hoa vải hoa tươi trang trí, chữ song hỷ, câu đối trang trí; </div>
<div>+ Chữ dán trên phong nền có thể là: <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-dich-vu-cuoi-hoi-ban-tho-to-tien-ngay-cuoi-tong-cam-mau-tu-nhien-duoc-trang-tri-bang-vai-voan-cao-cap-cho-le-an-hoi-gia-tien-dam-cuoi-day-du-nghi-le-4.jpg">Song hỷ</a> ; <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/946/ban-tho-to-tien-ngay-cuoi-mau-dep-voi-manh-tre-mau-do-chuc-phuc-">Phúc</a>; <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/936/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">Trăm năm hạnh phúc</a>;  Kính nhớ tổ tiên ;  Long phụng hòa minh - Sắc cầm hỏa hợp; Trăm năm tình viên mãn bạc đầu nghĩa phu thê</div>
<div>+ Trên bàn thờ có đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/955/ban-tho-to-tien-ngay-cuoi-mau-an-tuong-tong-hong-cho-trang-tri-l">1 bộ lư</a> để bình thường hoặc trang trí thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/993/ban-tho-to-tien-ngay-cuoi-tong-trang-do-mau-tu-nhien-duoc-trang-">hoa tươi</a></div>
<div>+ Đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/984/ban-tho-to-tien-ngay-cuoi-tong-hong-mau-tu-nhien-duoc-trang-tri-">hai bình hoa tươi</a> song hỷ hoặc một bình hoa tươi một mâm trái cây ngũ quả hoặc là đặc biệt hơn là mẫu trang trí hoa <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/986/ban-tho-to-tien-ngay-cuoi-tong-hong-mau-tu-nhien-duoc-trang-tri-">cắm đỗ bàn thờ</a></div>
<div>+ Đặt một đôi <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/648/rong-phung-trai-cay-ngay-cuoi">rồng phụng trái cây</a> sẽ mang lại không khí ấm áp, sung túc cho ngày lễ ăn hỏi, lễ cưới của bạn</div>
<div>+ Cạnh bàn thờ thì ở nhà gái còn đặt thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1031/hoa-giay-lua-tong-trang-do-long-lay-trang-tri-ban-tho-to-tien-n">một cái bàn nhỏ</a> được phủ mặt bàn được may bắt mắt để đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/859/mam-qua-tong-hop-qua-trai-cay-trau-cau-rong-phung-trai-cay-dac-s">mâm quả lễ vật</a> của nhà trai</div>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (307, 1061, N'c8e15daf-b350-4421-91d8-8733accf459e', 39, NULL, NULL, N'gioi-thieu', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (308, 1061, N'c8e15daf-b350-4421-91d8-8733accf459e', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (309, 1061, N'c8e15daf-b350-4421-91d8-8733accf459e', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (310, 1061, N'c8e15daf-b350-4421-91d8-8733accf459e', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (311, 1061, N'c8e15daf-b350-4421-91d8-8733accf459e', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (312, 1061, N'c8e15daf-b350-4421-91d8-8733accf459e', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (313, 1061, N'c8e15daf-b350-4421-91d8-8733accf459e', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (314, 1061, N'c8e15daf-b350-4421-91d8-8733accf459e', 46, NULL, NULL, N'Giới thiệu', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (315, 1061, N'c8e15daf-b350-4421-91d8-8733accf459e', 52, NULL, NULL, NULL, N'<p style="color: #fff;">RỒNG PHỤNG HẢI DIỄM</p>
<p style="color: #fff;">Chuyên cung cấp dịch vụ rồng phụng trái cây ngày cưới cho các cặp đôi hoàn hảo</p>
<div style="color: #000;">
<div><em>Mỗi mẫu trang trí nhà cưới hỏi của RỒNG PHỤNG HẢI DIỄM thường gồm có:</em></div>
<div><em>* <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/679/ban-tho-gia-tien-ngay-cuoi">Trang trí bàn thờ gia tiên</a> hay còn gọi là bàn thờ tổ tiên của RỒNG PHỤNG HẢI DIỄM với </em></div>
<div><em>+ Các kiểu trang trí bàn thờ gồm có: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/924/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">mẫu truyền thống nhung đỏ</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/928/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">mẫu tự nhiên</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/978/ban-tho-to-tien-ngay-cuoi-tong-hong-canh-sen-mau-tu-nhien-duoc-t">mẫu hiện đại</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/944/ban-tho-to-tien-ngay-cuoi-mau-thien-chua-tong-xanh-la-cho-trang-">mẫu thiên chúa tin lành</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/946/ban-tho-to-tien-ngay-cuoi-mau-dep-voi-manh-tre-mau-do-chuc-phuc-">mẫu mành tre</a> với dây voan, hoa vải hoa tươi trang trí, chữ song hỷ, câu đối trang trí; </em></div>
<div><em>+ Chữ dán trên phong nền có thể là: <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-dich-vu-cuoi-hoi-ban-tho-to-tien-ngay-cuoi-tong-cam-mau-tu-nhien-duoc-trang-tri-bang-vai-voan-cao-cap-cho-le-an-hoi-gia-tien-dam-cuoi-day-du-nghi-le-4.jpg">Song hỷ</a> ; <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/946/ban-tho-to-tien-ngay-cuoi-mau-dep-voi-manh-tre-mau-do-chuc-phuc-">Phúc</a>; <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/936/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">Trăm năm hạnh phúc</a>;  Kính nhớ tổ tiên ;  Long phụng hòa minh - Sắc cầm hỏa hợp; Trăm năm tình viên mãn bạc đầu nghĩa phu thê</em></div>
<div><em>+ Trên bàn thờ có đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/955/ban-tho-to-tien-ngay-cuoi-mau-an-tuong-tong-hong-cho-trang-tri-l">1 bộ lư</a> để bình thường hoặc trang trí thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/993/ban-tho-to-tien-ngay-cuoi-tong-trang-do-mau-tu-nhien-duoc-trang-">hoa tươi</a></em></div>
<div><em>+ Đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/984/ban-tho-to-tien-ngay-cuoi-tong-hong-mau-tu-nhien-duoc-trang-tri-">hai bình hoa tươi</a> song hỷ hoặc một bình hoa tươi một mâm trái cây ngũ quả hoặc là đặc biệt hơn là mẫu trang trí hoa <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/986/ban-tho-to-tien-ngay-cuoi-tong-hong-mau-tu-nhien-duoc-trang-tri-">cắm đỗ bàn thờ</a></em></div>
<div><em>+ Đặt một đôi <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/648/rong-phung-trai-cay-ngay-cuoi">rồng phụng trái cây</a> sẽ mang lại không khí ấm áp, sung túc cho ngày lễ ăn hỏi, lễ cưới của bạn</em></div>
<div><em>+ Cạnh bàn thờ thì ở nhà gái còn đặt thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1031/hoa-giay-lua-tong-trang-do-long-lay-trang-tri-ban-tho-to-tien-n">một cái bàn nhỏ</a> được phủ mặt bàn được may bắt mắt để đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/859/mam-qua-tong-hop-qua-trai-cay-trau-cau-rong-phung-trai-cay-dac-s">mâm quả lễ vật</a> của nhà trai</em></div>
</div>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (316, 1061, N'1578e266-12c6-410e-9a37-705153622ce0', 39, NULL, NULL, N'gioi-thieu', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (317, 1061, N'1578e266-12c6-410e-9a37-705153622ce0', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (318, 1061, N'1578e266-12c6-410e-9a37-705153622ce0', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (319, 1061, N'1578e266-12c6-410e-9a37-705153622ce0', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (320, 1061, N'1578e266-12c6-410e-9a37-705153622ce0', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (321, 1061, N'1578e266-12c6-410e-9a37-705153622ce0', 37, NULL, NULL, NULL, N'gioi thieu, rongphunghaidiem, rongphung, rong, phung')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (322, 1061, N'1578e266-12c6-410e-9a37-705153622ce0', 35, NULL, NULL, N'Giới thiệu', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (323, 1061, N'1578e266-12c6-410e-9a37-705153622ce0', 46, NULL, NULL, N'Giới thiệu', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (324, 1061, N'1578e266-12c6-410e-9a37-705153622ce0', 52, NULL, NULL, NULL, N'<p style="color: #fff;">RỒNG PHỤNG HẢI DIỄM</p>
<p style="color: #fff;">Chuyên cung cấp dịch vụ rồng phụng trái cây ngày cưới cho các cặp đôi hoàn hảo</p>
<div style="color: #000;">
<div><em>Mỗi mẫu trang trí nhà cưới hỏi của RỒNG PHỤNG HẢI DIỄM thường gồm có:</em></div>
<div><em>* <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/679/ban-tho-gia-tien-ngay-cuoi">Trang trí bàn thờ gia tiên</a> hay còn gọi là bàn thờ tổ tiên của RỒNG PHỤNG HẢI DIỄM với </em></div>
<div><em>+ Các kiểu trang trí bàn thờ gồm có: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/924/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">mẫu truyền thống nhung đỏ</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/928/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">mẫu tự nhiên</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/978/ban-tho-to-tien-ngay-cuoi-tong-hong-canh-sen-mau-tu-nhien-duoc-t">mẫu hiện đại</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/944/ban-tho-to-tien-ngay-cuoi-mau-thien-chua-tong-xanh-la-cho-trang-">mẫu thiên chúa tin lành</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/946/ban-tho-to-tien-ngay-cuoi-mau-dep-voi-manh-tre-mau-do-chuc-phuc-">mẫu mành tre</a> với dây voan, hoa vải hoa tươi trang trí, chữ song hỷ, câu đối trang trí; </em></div>
<div><em>+ Chữ dán trên phong nền có thể là: <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-dich-vu-cuoi-hoi-ban-tho-to-tien-ngay-cuoi-tong-cam-mau-tu-nhien-duoc-trang-tri-bang-vai-voan-cao-cap-cho-le-an-hoi-gia-tien-dam-cuoi-day-du-nghi-le-4.jpg">Song hỷ</a> ; <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/946/ban-tho-to-tien-ngay-cuoi-mau-dep-voi-manh-tre-mau-do-chuc-phuc-">Phúc</a>; <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/936/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">Trăm năm hạnh phúc</a>;  Kính nhớ tổ tiên ;  Long phụng hòa minh - Sắc cầm hỏa hợp; Trăm năm tình viên mãn bạc đầu nghĩa phu thê</em></div>
<div><em>+ Trên bàn thờ có đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/955/ban-tho-to-tien-ngay-cuoi-mau-an-tuong-tong-hong-cho-trang-tri-l">1 bộ lư</a> để bình thường hoặc trang trí thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/993/ban-tho-to-tien-ngay-cuoi-tong-trang-do-mau-tu-nhien-duoc-trang-">hoa tươi</a></em></div>
<div><em>+ Đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/984/ban-tho-to-tien-ngay-cuoi-tong-hong-mau-tu-nhien-duoc-trang-tri-">hai bình hoa tươi</a> song hỷ hoặc một bình hoa tươi một mâm trái cây ngũ quả hoặc là đặc biệt hơn là mẫu trang trí hoa <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/986/ban-tho-to-tien-ngay-cuoi-tong-hong-mau-tu-nhien-duoc-trang-tri-">cắm đỗ bàn thờ</a></em></div>
<div><em>+ Đặt một đôi <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/648/rong-phung-trai-cay-ngay-cuoi">rồng phụng trái cây</a> sẽ mang lại không khí ấm áp, sung túc cho ngày lễ ăn hỏi, lễ cưới của bạn</em></div>
<div><em>+ Cạnh bàn thờ thì ở nhà gái còn đặt thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1031/hoa-giay-lua-tong-trang-do-long-lay-trang-tri-ban-tho-to-tien-n">một cái bàn nhỏ</a> được phủ mặt bàn được may bắt mắt để đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/859/mam-qua-tong-hop-qua-trai-cay-trau-cau-rong-phung-trai-cay-dac-s">mâm quả lễ vật</a> của nhà trai</em></div>
</div>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (325, 1072, N'98dc6466-7a51-490f-95f1-ab247f7d6326', 27, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (326, 1073, N'428c9024-4448-493b-8d1f-38cdb7eed330', 27, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (327, 1074, N'ac0a75a2-d2b4-4a38-b9b6-b3f39a4f018f', 6, NULL, NULL, N'/media/1003/about-rp.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (328, 1074, N'ac0a75a2-d2b4-4a38-b9b6-b3f39a4f018f', 7, NULL, NULL, N'2520', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (329, 1074, N'ac0a75a2-d2b4-4a38-b9b6-b3f39a4f018f', 8, NULL, NULL, N'1890', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (330, 1074, N'ac0a75a2-d2b4-4a38-b9b6-b3f39a4f018f', 9, NULL, NULL, N'311219', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (331, 1074, N'ac0a75a2-d2b4-4a38-b9b6-b3f39a4f018f', 10, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (332, 1060, N'7e06ac74-54b3-47f5-ad3a-46fa745d08f9', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (333, 1060, N'7e06ac74-54b3-47f5-ad3a-46fa745d08f9', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (334, 1060, N'7e06ac74-54b3-47f5-ad3a-46fa745d08f9', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (335, 1060, N'7e06ac74-54b3-47f5-ad3a-46fa745d08f9', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (336, 1060, N'7e06ac74-54b3-47f5-ad3a-46fa745d08f9', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (337, 1060, N'7e06ac74-54b3-47f5-ad3a-46fa745d08f9', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (338, 1060, N'7e06ac74-54b3-47f5-ad3a-46fa745d08f9', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (339, 1060, N'7e06ac74-54b3-47f5-ad3a-46fa745d08f9', 46, NULL, NULL, N'Rồng phụng 1', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (340, 1060, N'7e06ac74-54b3-47f5-ad3a-46fa745d08f9', 50, 1074, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (341, 1075, N'bc50949e-2d1e-44e6-a141-e7184707ced2', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (342, 1075, N'bc50949e-2d1e-44e6-a141-e7184707ced2', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (343, 1075, N'bc50949e-2d1e-44e6-a141-e7184707ced2', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (344, 1075, N'bc50949e-2d1e-44e6-a141-e7184707ced2', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (345, 1075, N'bc50949e-2d1e-44e6-a141-e7184707ced2', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (346, 1075, N'bc50949e-2d1e-44e6-a141-e7184707ced2', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (347, 1075, N'bc50949e-2d1e-44e6-a141-e7184707ced2', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (348, 1075, N'bc50949e-2d1e-44e6-a141-e7184707ced2', 46, NULL, NULL, N'Rồng phụng 1', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (349, 1075, N'bc50949e-2d1e-44e6-a141-e7184707ced2', 50, 1074, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (350, 1075, N'ddd7dc6f-3740-4bbe-b62a-9b151727b442', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (351, 1075, N'ddd7dc6f-3740-4bbe-b62a-9b151727b442', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (352, 1075, N'ddd7dc6f-3740-4bbe-b62a-9b151727b442', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (353, 1075, N'ddd7dc6f-3740-4bbe-b62a-9b151727b442', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (354, 1075, N'ddd7dc6f-3740-4bbe-b62a-9b151727b442', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (355, 1075, N'ddd7dc6f-3740-4bbe-b62a-9b151727b442', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (356, 1075, N'ddd7dc6f-3740-4bbe-b62a-9b151727b442', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (357, 1075, N'ddd7dc6f-3740-4bbe-b62a-9b151727b442', 46, NULL, NULL, N'Rồng phụng 2', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (358, 1075, N'ddd7dc6f-3740-4bbe-b62a-9b151727b442', 50, 1074, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (359, 1076, N'3908088c-6865-45d9-a9bc-7ac46b4c03a7', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (360, 1076, N'3908088c-6865-45d9-a9bc-7ac46b4c03a7', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (361, 1076, N'3908088c-6865-45d9-a9bc-7ac46b4c03a7', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (362, 1076, N'3908088c-6865-45d9-a9bc-7ac46b4c03a7', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (363, 1076, N'3908088c-6865-45d9-a9bc-7ac46b4c03a7', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (364, 1076, N'3908088c-6865-45d9-a9bc-7ac46b4c03a7', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (365, 1076, N'3908088c-6865-45d9-a9bc-7ac46b4c03a7', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (366, 1076, N'3908088c-6865-45d9-a9bc-7ac46b4c03a7', 46, NULL, NULL, N'Rồng phụng 1', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (367, 1076, N'3908088c-6865-45d9-a9bc-7ac46b4c03a7', 50, 1074, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (368, 1077, N'8add66e7-8b4b-474c-9841-4ec38dc86b2d', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (369, 1077, N'8add66e7-8b4b-474c-9841-4ec38dc86b2d', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (370, 1077, N'8add66e7-8b4b-474c-9841-4ec38dc86b2d', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (371, 1077, N'8add66e7-8b4b-474c-9841-4ec38dc86b2d', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (372, 1077, N'8add66e7-8b4b-474c-9841-4ec38dc86b2d', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (373, 1077, N'8add66e7-8b4b-474c-9841-4ec38dc86b2d', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (374, 1077, N'8add66e7-8b4b-474c-9841-4ec38dc86b2d', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (375, 1077, N'8add66e7-8b4b-474c-9841-4ec38dc86b2d', 46, NULL, NULL, N'Rồng phụng 1', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (376, 1077, N'8add66e7-8b4b-474c-9841-4ec38dc86b2d', 50, 1074, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (377, 1078, N'0b7df8d4-043b-49ca-90f4-3d6841d6d6a9', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (378, 1078, N'0b7df8d4-043b-49ca-90f4-3d6841d6d6a9', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (379, 1078, N'0b7df8d4-043b-49ca-90f4-3d6841d6d6a9', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (380, 1078, N'0b7df8d4-043b-49ca-90f4-3d6841d6d6a9', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (381, 1078, N'0b7df8d4-043b-49ca-90f4-3d6841d6d6a9', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (382, 1078, N'0b7df8d4-043b-49ca-90f4-3d6841d6d6a9', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (383, 1078, N'0b7df8d4-043b-49ca-90f4-3d6841d6d6a9', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (384, 1078, N'0b7df8d4-043b-49ca-90f4-3d6841d6d6a9', 46, NULL, NULL, N'Rồng phụng 1', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (385, 1078, N'0b7df8d4-043b-49ca-90f4-3d6841d6d6a9', 50, 1074, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (386, 1079, N'173e0cc7-269c-4d3f-92c1-d2493fa77067', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (387, 1079, N'173e0cc7-269c-4d3f-92c1-d2493fa77067', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (388, 1079, N'173e0cc7-269c-4d3f-92c1-d2493fa77067', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (389, 1079, N'173e0cc7-269c-4d3f-92c1-d2493fa77067', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (390, 1079, N'173e0cc7-269c-4d3f-92c1-d2493fa77067', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (391, 1079, N'173e0cc7-269c-4d3f-92c1-d2493fa77067', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (392, 1079, N'173e0cc7-269c-4d3f-92c1-d2493fa77067', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (393, 1079, N'173e0cc7-269c-4d3f-92c1-d2493fa77067', 46, NULL, NULL, N'Rồng phụng 1', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (394, 1079, N'173e0cc7-269c-4d3f-92c1-d2493fa77067', 50, 1074, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (395, 1080, N'72bc2f55-bff3-478f-b893-40f33df84717', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (396, 1080, N'72bc2f55-bff3-478f-b893-40f33df84717', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (397, 1080, N'72bc2f55-bff3-478f-b893-40f33df84717', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (398, 1080, N'72bc2f55-bff3-478f-b893-40f33df84717', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (399, 1080, N'72bc2f55-bff3-478f-b893-40f33df84717', 36, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (400, 1080, N'72bc2f55-bff3-478f-b893-40f33df84717', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (401, 1080, N'72bc2f55-bff3-478f-b893-40f33df84717', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (402, 1080, N'72bc2f55-bff3-478f-b893-40f33df84717', 46, NULL, NULL, N'Rồng phụng 1', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (403, 1080, N'72bc2f55-bff3-478f-b893-40f33df84717', 50, 1074, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (404, 1081, N'1db2a172-fe8d-4538-bd05-b605b647aad1', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (405, 1081, N'1db2a172-fe8d-4538-bd05-b605b647aad1', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (406, 1081, N'1db2a172-fe8d-4538-bd05-b605b647aad1', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (407, 1081, N'1db2a172-fe8d-4538-bd05-b605b647aad1', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (408, 1081, N'1db2a172-fe8d-4538-bd05-b605b647aad1', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (409, 1081, N'1db2a172-fe8d-4538-bd05-b605b647aad1', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (410, 1081, N'1db2a172-fe8d-4538-bd05-b605b647aad1', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (411, 1081, N'1db2a172-fe8d-4538-bd05-b605b647aad1', 46, NULL, NULL, N'Rồng phụng 1', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (412, 1081, N'1db2a172-fe8d-4538-bd05-b605b647aad1', 50, 1074, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (413, 1082, N'b4edf91b-83cb-4ec4-88db-abf87c8ced06', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (414, 1082, N'b4edf91b-83cb-4ec4-88db-abf87c8ced06', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (415, 1082, N'b4edf91b-83cb-4ec4-88db-abf87c8ced06', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (416, 1082, N'b4edf91b-83cb-4ec4-88db-abf87c8ced06', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (417, 1082, N'b4edf91b-83cb-4ec4-88db-abf87c8ced06', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (418, 1082, N'b4edf91b-83cb-4ec4-88db-abf87c8ced06', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (419, 1082, N'b4edf91b-83cb-4ec4-88db-abf87c8ced06', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (420, 1082, N'b4edf91b-83cb-4ec4-88db-abf87c8ced06', 46, NULL, NULL, N'Rồng phụng 1', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (421, 1082, N'b4edf91b-83cb-4ec4-88db-abf87c8ced06', 50, 1074, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (422, 1083, N'b00da800-28a1-4700-a700-87f682d7e6e9', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (423, 1083, N'b00da800-28a1-4700-a700-87f682d7e6e9', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (424, 1083, N'b00da800-28a1-4700-a700-87f682d7e6e9', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (425, 1083, N'b00da800-28a1-4700-a700-87f682d7e6e9', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (426, 1083, N'b00da800-28a1-4700-a700-87f682d7e6e9', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (427, 1083, N'b00da800-28a1-4700-a700-87f682d7e6e9', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (428, 1083, N'b00da800-28a1-4700-a700-87f682d7e6e9', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (429, 1083, N'b00da800-28a1-4700-a700-87f682d7e6e9', 46, NULL, NULL, N'Rồng phụng 1', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (430, 1083, N'b00da800-28a1-4700-a700-87f682d7e6e9', 50, 1074, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (431, 1076, N'46d386db-1713-4cdc-9d7a-f75ae79daf02', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (432, 1076, N'46d386db-1713-4cdc-9d7a-f75ae79daf02', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (433, 1076, N'46d386db-1713-4cdc-9d7a-f75ae79daf02', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (434, 1076, N'46d386db-1713-4cdc-9d7a-f75ae79daf02', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (435, 1076, N'46d386db-1713-4cdc-9d7a-f75ae79daf02', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (436, 1076, N'46d386db-1713-4cdc-9d7a-f75ae79daf02', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (437, 1076, N'46d386db-1713-4cdc-9d7a-f75ae79daf02', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (438, 1076, N'46d386db-1713-4cdc-9d7a-f75ae79daf02', 46, NULL, NULL, N'Rồng phụng 3', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (439, 1076, N'46d386db-1713-4cdc-9d7a-f75ae79daf02', 50, 1074, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (440, 1077, N'a5dafcb1-40a8-4e45-983b-bd4990a09a8d', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (441, 1077, N'a5dafcb1-40a8-4e45-983b-bd4990a09a8d', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (442, 1077, N'a5dafcb1-40a8-4e45-983b-bd4990a09a8d', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (443, 1077, N'a5dafcb1-40a8-4e45-983b-bd4990a09a8d', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (444, 1077, N'a5dafcb1-40a8-4e45-983b-bd4990a09a8d', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (445, 1077, N'a5dafcb1-40a8-4e45-983b-bd4990a09a8d', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (446, 1077, N'a5dafcb1-40a8-4e45-983b-bd4990a09a8d', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (447, 1077, N'a5dafcb1-40a8-4e45-983b-bd4990a09a8d', 46, NULL, NULL, N'Rồng phụng 4', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (448, 1077, N'a5dafcb1-40a8-4e45-983b-bd4990a09a8d', 50, 1074, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (449, 1078, N'2a376053-1beb-43b8-b2df-d601f35ce4d4', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (450, 1078, N'2a376053-1beb-43b8-b2df-d601f35ce4d4', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (451, 1078, N'2a376053-1beb-43b8-b2df-d601f35ce4d4', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (452, 1078, N'2a376053-1beb-43b8-b2df-d601f35ce4d4', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (453, 1078, N'2a376053-1beb-43b8-b2df-d601f35ce4d4', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (454, 1078, N'2a376053-1beb-43b8-b2df-d601f35ce4d4', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (455, 1078, N'2a376053-1beb-43b8-b2df-d601f35ce4d4', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (456, 1078, N'2a376053-1beb-43b8-b2df-d601f35ce4d4', 46, NULL, NULL, N'Rồng phụng 5', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (457, 1078, N'2a376053-1beb-43b8-b2df-d601f35ce4d4', 50, 1074, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (458, 1079, N'46fb7960-012a-4195-8095-c54a538af568', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (459, 1079, N'46fb7960-012a-4195-8095-c54a538af568', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (460, 1079, N'46fb7960-012a-4195-8095-c54a538af568', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (461, 1079, N'46fb7960-012a-4195-8095-c54a538af568', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (462, 1079, N'46fb7960-012a-4195-8095-c54a538af568', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (463, 1079, N'46fb7960-012a-4195-8095-c54a538af568', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (464, 1079, N'46fb7960-012a-4195-8095-c54a538af568', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (465, 1079, N'46fb7960-012a-4195-8095-c54a538af568', 46, NULL, NULL, N'Rồng phụng 6', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (466, 1079, N'46fb7960-012a-4195-8095-c54a538af568', 50, 1074, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (467, 1080, N'8ce919f2-ba13-43e7-9ac1-53c0d74a42ba', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (468, 1080, N'8ce919f2-ba13-43e7-9ac1-53c0d74a42ba', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (469, 1080, N'8ce919f2-ba13-43e7-9ac1-53c0d74a42ba', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (470, 1080, N'8ce919f2-ba13-43e7-9ac1-53c0d74a42ba', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (471, 1080, N'8ce919f2-ba13-43e7-9ac1-53c0d74a42ba', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (472, 1080, N'8ce919f2-ba13-43e7-9ac1-53c0d74a42ba', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (473, 1080, N'8ce919f2-ba13-43e7-9ac1-53c0d74a42ba', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (474, 1080, N'8ce919f2-ba13-43e7-9ac1-53c0d74a42ba', 46, NULL, NULL, N'Rồng phụng 7', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (475, 1080, N'8ce919f2-ba13-43e7-9ac1-53c0d74a42ba', 50, 1074, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (476, 1081, N'c199d8fd-9ac2-4e4c-9e44-ee991a18b0bd', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (477, 1081, N'c199d8fd-9ac2-4e4c-9e44-ee991a18b0bd', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (478, 1081, N'c199d8fd-9ac2-4e4c-9e44-ee991a18b0bd', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (479, 1081, N'c199d8fd-9ac2-4e4c-9e44-ee991a18b0bd', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (480, 1081, N'c199d8fd-9ac2-4e4c-9e44-ee991a18b0bd', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (481, 1081, N'c199d8fd-9ac2-4e4c-9e44-ee991a18b0bd', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (482, 1081, N'c199d8fd-9ac2-4e4c-9e44-ee991a18b0bd', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (483, 1081, N'c199d8fd-9ac2-4e4c-9e44-ee991a18b0bd', 46, NULL, NULL, N'Rồng phụng 8', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (484, 1081, N'c199d8fd-9ac2-4e4c-9e44-ee991a18b0bd', 50, 1074, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (485, 1082, N'8f70a7ce-4378-412c-b7ea-b9d812c98f6b', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (486, 1082, N'8f70a7ce-4378-412c-b7ea-b9d812c98f6b', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (487, 1082, N'8f70a7ce-4378-412c-b7ea-b9d812c98f6b', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (488, 1082, N'8f70a7ce-4378-412c-b7ea-b9d812c98f6b', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (489, 1082, N'8f70a7ce-4378-412c-b7ea-b9d812c98f6b', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (490, 1082, N'8f70a7ce-4378-412c-b7ea-b9d812c98f6b', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (491, 1082, N'8f70a7ce-4378-412c-b7ea-b9d812c98f6b', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (492, 1082, N'8f70a7ce-4378-412c-b7ea-b9d812c98f6b', 46, NULL, NULL, N'Rồng phụng 9', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (493, 1082, N'8f70a7ce-4378-412c-b7ea-b9d812c98f6b', 50, 1074, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (494, 1083, N'19225619-e1fe-4985-b5f1-cef60a265740', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (495, 1083, N'19225619-e1fe-4985-b5f1-cef60a265740', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (496, 1083, N'19225619-e1fe-4985-b5f1-cef60a265740', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (497, 1083, N'19225619-e1fe-4985-b5f1-cef60a265740', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (498, 1083, N'19225619-e1fe-4985-b5f1-cef60a265740', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (499, 1083, N'19225619-e1fe-4985-b5f1-cef60a265740', 37, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (500, 1083, N'19225619-e1fe-4985-b5f1-cef60a265740', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (501, 1083, N'19225619-e1fe-4985-b5f1-cef60a265740', 46, NULL, NULL, N'Rồng phụng 10', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (502, 1083, N'19225619-e1fe-4985-b5f1-cef60a265740', 50, 1074, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (503, 1054, N'26bc6b27-9bca-45a1-a5a9-286acec584d4', 39, NULL, NULL, N'rong-phung-trai-cay', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (504, 1054, N'26bc6b27-9bca-45a1-a5a9-286acec584d4', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (505, 1054, N'26bc6b27-9bca-45a1-a5a9-286acec584d4', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (506, 1054, N'26bc6b27-9bca-45a1-a5a9-286acec584d4', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (507, 1054, N'26bc6b27-9bca-45a1-a5a9-286acec584d4', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (508, 1054, N'26bc6b27-9bca-45a1-a5a9-286acec584d4', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (509, 1054, N'26bc6b27-9bca-45a1-a5a9-286acec584d4', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (510, 1054, N'26bc6b27-9bca-45a1-a5a9-286acec584d4', 46, NULL, NULL, N'Rồng phụng trái cây', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (511, 1054, N'26bc6b27-9bca-45a1-a5a9-286acec584d4', 49, 4, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (512, 1085, N'bcf2d806-025a-4a68-b5f0-9f0cd4a690df', 6, NULL, NULL, N'/media/1004/t_o.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (513, 1084, N'b7e9212b-e4e4-42e3-82f2-b5809bf2a366', 6, NULL, NULL, N'/media/1005/cam_xoan2_1.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (514, 1084, N'b7e9212b-e4e4-42e3-82f2-b5809bf2a366', 7, NULL, NULL, N'1920', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (515, 1085, N'bcf2d806-025a-4a68-b5f0-9f0cd4a690df', 7, NULL, NULL, N'1920', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (516, 1084, N'b7e9212b-e4e4-42e3-82f2-b5809bf2a366', 8, NULL, NULL, N'321', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (517, 1085, N'bcf2d806-025a-4a68-b5f0-9f0cd4a690df', 8, NULL, NULL, N'321', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (518, 1084, N'b7e9212b-e4e4-42e3-82f2-b5809bf2a366', 9, NULL, NULL, N'179179', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (519, 1085, N'bcf2d806-025a-4a68-b5f0-9f0cd4a690df', 9, NULL, NULL, N'154528', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (520, 1084, N'b7e9212b-e4e4-42e3-82f2-b5809bf2a366', 10, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (521, 1085, N'bcf2d806-025a-4a68-b5f0-9f0cd4a690df', 10, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (522, 1051, N'1bb6b08c-b8b9-4f85-a64f-9fb69abfd6b2', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (523, 1051, N'1bb6b08c-b8b9-4f85-a64f-9fb69abfd6b2', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (524, 1051, N'1bb6b08c-b8b9-4f85-a64f-9fb69abfd6b2', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (525, 1051, N'1bb6b08c-b8b9-4f85-a64f-9fb69abfd6b2', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (526, 1051, N'1bb6b08c-b8b9-4f85-a64f-9fb69abfd6b2', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (527, 1051, N'1bb6b08c-b8b9-4f85-a64f-9fb69abfd6b2', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (528, 1051, N'1bb6b08c-b8b9-4f85-a64f-9fb69abfd6b2', 35, NULL, NULL, N'Trang chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (529, 1051, N'1bb6b08c-b8b9-4f85-a64f-9fb69abfd6b2', 46, NULL, NULL, N'Trang Chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (530, 1051, N'1bb6b08c-b8b9-4f85-a64f-9fb69abfd6b2', 43, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (531, 1051, N'1bb6b08c-b8b9-4f85-a64f-9fb69abfd6b2', 42, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (532, 1051, N'1bb6b08c-b8b9-4f85-a64f-9fb69abfd6b2', 45, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (533, 1051, N'1bb6b08c-b8b9-4f85-a64f-9fb69abfd6b2', 44, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (534, 1051, N'1bb6b08c-b8b9-4f85-a64f-9fb69abfd6b2', 51, NULL, NULL, NULL, N'[
  {
    "image": "1084",
    "link": "1051"
  },
  {
    "image": "1085",
    "link": "1054"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (535, 1051, N'1bb6b08c-b8b9-4f85-a64f-9fb69abfd6b2', 47, NULL, NULL, N'RongPhungHaiDiem', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (536, 1051, N'1bb6b08c-b8b9-4f85-a64f-9fb69abfd6b2', 48, NULL, NULL, N'Rồng Phụng Hải Diễm', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (537, 1054, N'96cb3f33-5906-4212-94e4-55faf83e9989', 39, NULL, NULL, N'rong-phung-trai-cay', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (538, 1054, N'96cb3f33-5906-4212-94e4-55faf83e9989', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (539, 1054, N'96cb3f33-5906-4212-94e4-55faf83e9989', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (540, 1054, N'96cb3f33-5906-4212-94e4-55faf83e9989', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (541, 1054, N'96cb3f33-5906-4212-94e4-55faf83e9989', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (542, 1054, N'96cb3f33-5906-4212-94e4-55faf83e9989', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (543, 1054, N'96cb3f33-5906-4212-94e4-55faf83e9989', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (544, 1054, N'96cb3f33-5906-4212-94e4-55faf83e9989', 46, NULL, NULL, N'Rồng phụng trái cây', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (545, 1054, N'96cb3f33-5906-4212-94e4-55faf83e9989', 49, 8, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (546, 1060, N'7e06ac74-54b3-47f5-ad3a-46fa745d08f9', 53, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (547, 1060, N'21eb0807-b5ec-4c86-83c2-05e74085ca68', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (548, 1060, N'21eb0807-b5ec-4c86-83c2-05e74085ca68', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (549, 1060, N'21eb0807-b5ec-4c86-83c2-05e74085ca68', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (550, 1060, N'21eb0807-b5ec-4c86-83c2-05e74085ca68', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (551, 1060, N'21eb0807-b5ec-4c86-83c2-05e74085ca68', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (552, 1060, N'21eb0807-b5ec-4c86-83c2-05e74085ca68', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (553, 1060, N'21eb0807-b5ec-4c86-83c2-05e74085ca68', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (554, 1060, N'21eb0807-b5ec-4c86-83c2-05e74085ca68', 46, NULL, NULL, N'Rồng phụng thâm quyến', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (555, 1060, N'21eb0807-b5ec-4c86-83c2-05e74085ca68', 50, 1074, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (556, 1060, N'21eb0807-b5ec-4c86-83c2-05e74085ca68', 53, NULL, NULL, N'500,000 ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (557, 1061, N'56619615-24f6-4f6b-921b-62bc8c5151ae', 39, NULL, NULL, N'gioi-thieu', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (558, 1061, N'56619615-24f6-4f6b-921b-62bc8c5151ae', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (559, 1061, N'56619615-24f6-4f6b-921b-62bc8c5151ae', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (560, 1061, N'56619615-24f6-4f6b-921b-62bc8c5151ae', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (561, 1061, N'56619615-24f6-4f6b-921b-62bc8c5151ae', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (562, 1061, N'56619615-24f6-4f6b-921b-62bc8c5151ae', 37, NULL, NULL, NULL, N'gioi thieu, rongphunghaidiem, rongphung, rong, phung')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (563, 1061, N'56619615-24f6-4f6b-921b-62bc8c5151ae', 35, NULL, NULL, N'Giới thiệu', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (564, 1061, N'56619615-24f6-4f6b-921b-62bc8c5151ae', 46, NULL, NULL, N'Giới thiệu', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (565, 1061, N'56619615-24f6-4f6b-921b-62bc8c5151ae', 52, NULL, NULL, NULL, N'<p>RỒNG PHỤNG HẢI DIỄM</p>
<p>Chuyên cung cấp dịch vụ rồng phụng trái cây ngày cưới cho các cặp đôi hoàn hảo</p>
<div>
<div><em>Mỗi mẫu trang trí nhà cưới hỏi của RỒNG PHỤNG HẢI DIỄM thường gồm có:</em></div>
<div><em>* <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/679/ban-tho-gia-tien-ngay-cuoi">Trang trí bàn thờ gia tiên</a> hay còn gọi là bàn thờ tổ tiên của RỒNG PHỤNG HẢI DIỄM với </em></div>
<div><em>+ Các kiểu trang trí bàn thờ gồm có: <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/924/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">mẫu truyền thống nhung đỏ</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/928/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">mẫu tự nhiên</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/978/ban-tho-to-tien-ngay-cuoi-tong-hong-canh-sen-mau-tu-nhien-duoc-t">mẫu hiện đại</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/944/ban-tho-to-tien-ngay-cuoi-mau-thien-chua-tong-xanh-la-cho-trang-">mẫu thiên chúa tin lành</a>, <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/946/ban-tho-to-tien-ngay-cuoi-mau-dep-voi-manh-tre-mau-do-chuc-phuc-">mẫu mành tre</a> với dây voan, hoa vải hoa tươi trang trí, chữ song hỷ, câu đối trang trí; </em></div>
<div><em>+ Chữ dán trên phong nền có thể là: <a href="http://shopcuoihoitamnhu.com/Image/ProductSmall/shop-dich-vu-cuoi-hoi-ban-tho-to-tien-ngay-cuoi-tong-cam-mau-tu-nhien-duoc-trang-tri-bang-vai-voan-cao-cap-cho-le-an-hoi-gia-tien-dam-cuoi-day-du-nghi-le-4.jpg">Song hỷ</a> ; <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/946/ban-tho-to-tien-ngay-cuoi-mau-dep-voi-manh-tre-mau-do-chuc-phuc-">Phúc</a>; <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/936/ban-tho-to-tien-ngay-cuoi-mau-nhung-do-truyen-thong-hy-cho-trang">Trăm năm hạnh phúc</a>;  Kính nhớ tổ tiên ;  Long phụng hòa minh - Sắc cầm hỏa hợp; Trăm năm tình viên mãn bạc đầu nghĩa phu thê</em></div>
<div><em>+ Trên bàn thờ có đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/955/ban-tho-to-tien-ngay-cuoi-mau-an-tuong-tong-hong-cho-trang-tri-l">1 bộ lư</a> để bình thường hoặc trang trí thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/993/ban-tho-to-tien-ngay-cuoi-tong-trang-do-mau-tu-nhien-duoc-trang-">hoa tươi</a></em></div>
<div><em>+ Đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/984/ban-tho-to-tien-ngay-cuoi-tong-hong-mau-tu-nhien-duoc-trang-tri-">hai bình hoa tươi</a> song hỷ hoặc một bình hoa tươi một mâm trái cây ngũ quả hoặc là đặc biệt hơn là mẫu trang trí hoa <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/986/ban-tho-to-tien-ngay-cuoi-tong-hong-mau-tu-nhien-duoc-trang-tri-">cắm đỗ bàn thờ</a></em></div>
<div><em>+ Đặt một đôi <a href="http://shopcuoihoitamnhu.com/dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/648/rong-phung-trai-cay-ngay-cuoi">rồng phụng trái cây</a> sẽ mang lại không khí ấm áp, sung túc cho ngày lễ ăn hỏi, lễ cưới của bạn</em></div>
<div><em>+ Cạnh bàn thờ thì ở nhà gái còn đặt thêm <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/1031/hoa-giay-lua-tong-trang-do-long-lay-trang-tri-ban-tho-to-tien-n">một cái bàn nhỏ</a> được phủ mặt bàn được may bắt mắt để đặt <a href="http://shopcuoihoitamnhu.com/ct-dich-vu-cuoi-hoi-cong-ty-chuyen-trang-tri-nha-tiec-dam-cuoi-le-gia-tien-an-hoi-tron-goi-o-tai-tphcm/859/mam-qua-tong-hop-qua-trai-cay-trau-cau-rong-phung-trai-cay-dac-s">mâm quả lễ vật</a> của nhà trai</em></div>
</div>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (566, 1060, N'23447f32-0980-4023-84b5-221a33c50188', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (567, 1060, N'23447f32-0980-4023-84b5-221a33c50188', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (568, 1060, N'23447f32-0980-4023-84b5-221a33c50188', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (569, 1060, N'23447f32-0980-4023-84b5-221a33c50188', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (570, 1060, N'23447f32-0980-4023-84b5-221a33c50188', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (571, 1060, N'23447f32-0980-4023-84b5-221a33c50188', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (572, 1060, N'23447f32-0980-4023-84b5-221a33c50188', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (573, 1060, N'23447f32-0980-4023-84b5-221a33c50188', 46, NULL, NULL, N'Rồng phụng thâm quyến', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (574, 1060, N'23447f32-0980-4023-84b5-221a33c50188', 50, 1074, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (575, 1060, N'23447f32-0980-4023-84b5-221a33c50188', 53, NULL, NULL, N'500,000 ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (576, 1051, N'1bb6b08c-b8b9-4f85-a64f-9fb69abfd6b2', 54, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (577, 1051, N'8e3f5936-254c-4afd-8645-54c9f1e69a53', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (578, 1051, N'8e3f5936-254c-4afd-8645-54c9f1e69a53', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (579, 1051, N'8e3f5936-254c-4afd-8645-54c9f1e69a53', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (580, 1051, N'8e3f5936-254c-4afd-8645-54c9f1e69a53', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (581, 1051, N'8e3f5936-254c-4afd-8645-54c9f1e69a53', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (582, 1051, N'8e3f5936-254c-4afd-8645-54c9f1e69a53', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (583, 1051, N'8e3f5936-254c-4afd-8645-54c9f1e69a53', 35, NULL, NULL, N'Trang chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (584, 1051, N'8e3f5936-254c-4afd-8645-54c9f1e69a53', 46, NULL, NULL, N'Trang Chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (585, 1051, N'8e3f5936-254c-4afd-8645-54c9f1e69a53', 43, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (586, 1051, N'8e3f5936-254c-4afd-8645-54c9f1e69a53', 42, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (587, 1051, N'8e3f5936-254c-4afd-8645-54c9f1e69a53', 45, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (588, 1051, N'8e3f5936-254c-4afd-8645-54c9f1e69a53', 44, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (589, 1051, N'8e3f5936-254c-4afd-8645-54c9f1e69a53', 51, NULL, NULL, NULL, N'[
  {
    "image": "1084",
    "link": "1051"
  },
  {
    "image": "1085",
    "link": "1054"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (590, 1051, N'8e3f5936-254c-4afd-8645-54c9f1e69a53', 47, NULL, NULL, N'RongPhungHaiDiem', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (591, 1051, N'8e3f5936-254c-4afd-8645-54c9f1e69a53', 48, NULL, NULL, N'Rồng Phụng Hải Diễm', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (592, 1051, N'8e3f5936-254c-4afd-8645-54c9f1e69a53', 54, NULL, NULL, N'1060,1079,1083', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (593, 1075, N'ddd7dc6f-3740-4bbe-b62a-9b151727b442', 53, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (594, 1060, N'd0cfce3d-73b7-4b70-a706-97dadad32652', 39, NULL, NULL, N'rong-phung-tham-quyen', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (595, 1060, N'd0cfce3d-73b7-4b70-a706-97dadad32652', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (596, 1060, N'd0cfce3d-73b7-4b70-a706-97dadad32652', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (597, 1060, N'd0cfce3d-73b7-4b70-a706-97dadad32652', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (598, 1060, N'd0cfce3d-73b7-4b70-a706-97dadad32652', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (599, 1060, N'd0cfce3d-73b7-4b70-a706-97dadad32652', 37, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (600, 1060, N'd0cfce3d-73b7-4b70-a706-97dadad32652', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (601, 1060, N'd0cfce3d-73b7-4b70-a706-97dadad32652', 46, NULL, NULL, N'Rồng phụng thâm quyến', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (602, 1060, N'd0cfce3d-73b7-4b70-a706-97dadad32652', 50, 1074, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (603, 1060, N'd0cfce3d-73b7-4b70-a706-97dadad32652', 53, NULL, NULL, N'500,000 ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (604, 1075, N'073301b3-c255-4ee9-a4d7-31e2dad09462', 39, NULL, NULL, N'rong-phung-2', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (605, 1075, N'073301b3-c255-4ee9-a4d7-31e2dad09462', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (606, 1075, N'073301b3-c255-4ee9-a4d7-31e2dad09462', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (607, 1075, N'073301b3-c255-4ee9-a4d7-31e2dad09462', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (608, 1075, N'073301b3-c255-4ee9-a4d7-31e2dad09462', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (609, 1075, N'073301b3-c255-4ee9-a4d7-31e2dad09462', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (610, 1075, N'073301b3-c255-4ee9-a4d7-31e2dad09462', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (611, 1075, N'073301b3-c255-4ee9-a4d7-31e2dad09462', 46, NULL, NULL, N'Rồng phụng 2', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (612, 1075, N'073301b3-c255-4ee9-a4d7-31e2dad09462', 50, 1074, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (613, 1075, N'073301b3-c255-4ee9-a4d7-31e2dad09462', 53, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (614, 1060, N'd0cfce3d-73b7-4b70-a706-97dadad32652', 55, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (615, 1060, N'8112a8b0-7c8c-4beb-b46c-1090cd411e33', 39, NULL, NULL, N'rong-phung-tham-quyen', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (616, 1060, N'8112a8b0-7c8c-4beb-b46c-1090cd411e33', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (617, 1060, N'8112a8b0-7c8c-4beb-b46c-1090cd411e33', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (618, 1060, N'8112a8b0-7c8c-4beb-b46c-1090cd411e33', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (619, 1060, N'8112a8b0-7c8c-4beb-b46c-1090cd411e33', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (620, 1060, N'8112a8b0-7c8c-4beb-b46c-1090cd411e33', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (621, 1060, N'8112a8b0-7c8c-4beb-b46c-1090cd411e33', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (622, 1060, N'8112a8b0-7c8c-4beb-b46c-1090cd411e33', 46, NULL, NULL, N'Rồng phụng thâm quyến', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (623, 1060, N'8112a8b0-7c8c-4beb-b46c-1090cd411e33', 50, 1074, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (624, 1060, N'8112a8b0-7c8c-4beb-b46c-1090cd411e33', 53, NULL, NULL, N'500,000 ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (625, 1060, N'8112a8b0-7c8c-4beb-b46c-1090cd411e33', 55, NULL, NULL, NULL, N'<p>Rồng phụng trái cây được kết rất cầu kỳ, khéo léo từ các loại trái cây tươi ngon, bắt mắt thì những con rồng long phụng rất tinh xảo sóng động như thật, nhất là loại rồng phụng cao cấp chuyển động. Ngoài ra, Rồng phượng là biểu tượng âm dương rất mạnh trong thần thoại. Rồng tượng trưng cho sức mạnh của nam. Phượng tượng trưng cho sự kiều diễm và vẻ đẹp nữ tính khi đặt bên cạnh rồng. Cho nên trên bàn thờ lễ gia tiên đặt một đôi rồng phụng vừa tạo cảnh đẹp mắt. long trọng của buổi lễ vừa tạo nên phong thủy tích cực, tốt đẹp cho cuộc sống hôn nhân của đôi lứa sau này</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (626, 1060, N'451c8e02-903f-4a40-8793-123e2217059c', 39, NULL, NULL, N'rong-phung-tham-quyen', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (627, 1060, N'451c8e02-903f-4a40-8793-123e2217059c', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (628, 1060, N'451c8e02-903f-4a40-8793-123e2217059c', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (629, 1060, N'451c8e02-903f-4a40-8793-123e2217059c', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (630, 1060, N'451c8e02-903f-4a40-8793-123e2217059c', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (631, 1060, N'451c8e02-903f-4a40-8793-123e2217059c', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (632, 1060, N'451c8e02-903f-4a40-8793-123e2217059c', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (633, 1060, N'451c8e02-903f-4a40-8793-123e2217059c', 46, NULL, NULL, N'Rồng phụng thâm quyến', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (634, 1060, N'451c8e02-903f-4a40-8793-123e2217059c', 50, 1074, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (635, 1060, N'451c8e02-903f-4a40-8793-123e2217059c', 53, NULL, NULL, N'500,000 ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (636, 1060, N'451c8e02-903f-4a40-8793-123e2217059c', 55, NULL, NULL, NULL, N'<p>Rồng phụng trái cây được kết rất cầu kỳ, khéo léo từ các loại trái cây tươi ngon, bắt mắt thì những con rồng long phụng rất tinh xảo sóng động như thật, nhất là loại rồng phụng cao cấp chuyển động.</p>
<p>Ngoài ra, Rồng phượng là biểu tượng âm dương rất mạnh trong thần thoại.</p>
<p>Rồng tượng trưng cho sức mạnh của nam.</p>
<p>Phượng tượng trưng cho sự kiều diễm và vẻ đẹp nữ tính khi đặt bên cạnh rồng. Cho nên trên bàn thờ lễ gia tiên đặt một đôi rồng phụng vừa tạo cảnh đẹp mắt. long trọng của buổi lễ vừa tạo nên phong thủy tích cực, tốt đẹp cho cuộc sống hôn nhân của đôi lứa sau này</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (637, 1060, N'451c8e02-903f-4a40-8793-123e2217059c', 56, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (638, 1060, N'234ee45c-16b0-4249-bca5-f3db02bfc504', 39, NULL, NULL, N'rong-phung-tham-quyen', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (639, 1060, N'234ee45c-16b0-4249-bca5-f3db02bfc504', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (640, 1060, N'234ee45c-16b0-4249-bca5-f3db02bfc504', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (641, 1060, N'234ee45c-16b0-4249-bca5-f3db02bfc504', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (642, 1060, N'234ee45c-16b0-4249-bca5-f3db02bfc504', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (643, 1060, N'234ee45c-16b0-4249-bca5-f3db02bfc504', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (644, 1060, N'234ee45c-16b0-4249-bca5-f3db02bfc504', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (645, 1060, N'234ee45c-16b0-4249-bca5-f3db02bfc504', 46, NULL, NULL, N'Rồng phụng thâm quyến', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (646, 1060, N'234ee45c-16b0-4249-bca5-f3db02bfc504', 50, 1074, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (647, 1060, N'234ee45c-16b0-4249-bca5-f3db02bfc504', 53, NULL, NULL, N'500,000 ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (648, 1060, N'234ee45c-16b0-4249-bca5-f3db02bfc504', 56, NULL, NULL, NULL, N'<p>1.Thanh toán trực tiêp </p>
<p>Quý khách vui lòng liên hệ số điện thoại 0982357990 để đặt hàng và thanh toán ngay sau khi nhận hàng<br /><br /><br />2.Chuyển khoản ngân hàng<br /><br />Để thuận tiện cho quý khách chúng tôi cung cấp phương thức chuyển khoản ngân hàng . Quý khách chỉ cần chuyển khoản số tiền và quý khách đã đặt mua sản phẩm đên tài khoản của chúng tôi.Ngay sau khi nhận được tiền chúng tôi sẽ tiến hành giao hàng cho quý khách<br /> Thông tin ngân hàng<br />VietComBank chi nhánh Tp Hồ chí minh . <br />Số tài khoản :123456789</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (649, 1060, N'234ee45c-16b0-4249-bca5-f3db02bfc504', 55, NULL, NULL, NULL, N'<p>Rồng phụng trái cây được kết rất cầu kỳ, khéo léo từ các loại trái cây tươi ngon, bắt mắt thì những con rồng long phụng rất tinh xảo sóng động như thật, nhất là loại rồng phụng cao cấp chuyển động.</p>
<p>Ngoài ra, Rồng phượng là biểu tượng âm dương rất mạnh trong thần thoại.</p>
<p>Rồng tượng trưng cho sức mạnh của nam.</p>
<p>Phượng tượng trưng cho sự kiều diễm và vẻ đẹp nữ tính khi đặt bên cạnh rồng. Cho nên trên bàn thờ lễ gia tiên đặt một đôi rồng phụng vừa tạo cảnh đẹp mắt. long trọng của buổi lễ vừa tạo nên phong thủy tích cực, tốt đẹp cho cuộc sống hôn nhân của đôi lứa sau này</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (650, 1060, N'80b6e65c-d346-484b-b7b9-a10ce547372f', 39, NULL, NULL, N'rong-phung-tham-quyen', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (651, 1060, N'80b6e65c-d346-484b-b7b9-a10ce547372f', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (652, 1060, N'80b6e65c-d346-484b-b7b9-a10ce547372f', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (653, 1060, N'80b6e65c-d346-484b-b7b9-a10ce547372f', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (654, 1060, N'80b6e65c-d346-484b-b7b9-a10ce547372f', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (655, 1060, N'80b6e65c-d346-484b-b7b9-a10ce547372f', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (656, 1060, N'80b6e65c-d346-484b-b7b9-a10ce547372f', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (657, 1060, N'80b6e65c-d346-484b-b7b9-a10ce547372f', 46, NULL, NULL, N'Rồng phụng thâm quyến', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (658, 1060, N'80b6e65c-d346-484b-b7b9-a10ce547372f', 50, 1074, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (659, 1060, N'80b6e65c-d346-484b-b7b9-a10ce547372f', 53, NULL, NULL, N'500,000 ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (660, 1060, N'80b6e65c-d346-484b-b7b9-a10ce547372f', 56, NULL, NULL, NULL, N'<p>1.Thanh toán trực tiêp </p>
<p>Quý khách vui lòng liên hệ số điện thoại 0982357990 để đặt hàng và thanh toán ngay sau khi nhận hàng<br /><br />2.Chuyển khoản ngân hàng<br /><br />Để thuận tiện cho quý khách chúng tôi cung cấp phương thức chuyển khoản ngân hàng . Quý khách chỉ cần chuyển khoản số tiền và quý khách đã đặt mua sản phẩm đên tài khoản của chúng tôi.Ngay sau khi nhận được tiền chúng tôi sẽ tiến hành giao hàng cho quý khách<br /> Thông tin ngân hàng<br />VietComBank chi nhánh Tp Hồ chí minh . <br />Số tài khoản :123456789</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (661, 1060, N'80b6e65c-d346-484b-b7b9-a10ce547372f', 55, NULL, NULL, NULL, N'<p>Rồng phụng trái cây được kết rất cầu kỳ, khéo léo từ các loại trái cây tươi ngon, bắt mắt thì những con rồng long phụng rất tinh xảo sóng động như thật, nhất là loại rồng phụng cao cấp chuyển động.</p>
<p>Ngoài ra, Rồng phượng là biểu tượng âm dương rất mạnh trong thần thoại.</p>
<p>Rồng tượng trưng cho sức mạnh của nam.</p>
<p>Phượng tượng trưng cho sự kiều diễm và vẻ đẹp nữ tính khi đặt bên cạnh rồng. Cho nên trên bàn thờ lễ gia tiên đặt một đôi rồng phụng vừa tạo cảnh đẹp mắt. long trọng của buổi lễ vừa tạo nên phong thủy tích cực, tốt đẹp cho cuộc sống hôn nhân của đôi lứa sau này</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (662, 1060, N'fceb75cc-76d0-431c-bafa-5243b30e1f6e', 39, NULL, NULL, N'rong-phung-tham-quyen', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (663, 1060, N'fceb75cc-76d0-431c-bafa-5243b30e1f6e', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (664, 1060, N'fceb75cc-76d0-431c-bafa-5243b30e1f6e', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (665, 1060, N'fceb75cc-76d0-431c-bafa-5243b30e1f6e', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (666, 1060, N'fceb75cc-76d0-431c-bafa-5243b30e1f6e', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (667, 1060, N'fceb75cc-76d0-431c-bafa-5243b30e1f6e', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (668, 1060, N'fceb75cc-76d0-431c-bafa-5243b30e1f6e', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (669, 1060, N'fceb75cc-76d0-431c-bafa-5243b30e1f6e', 46, NULL, NULL, N'Rồng phụng thâm quyến', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (670, 1060, N'fceb75cc-76d0-431c-bafa-5243b30e1f6e', 50, 1074, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (671, 1060, N'fceb75cc-76d0-431c-bafa-5243b30e1f6e', 53, NULL, NULL, N'500,000 ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (672, 1060, N'fceb75cc-76d0-431c-bafa-5243b30e1f6e', 56, NULL, NULL, NULL, N'<p><strong>1.Thanh toán trực tiêp </strong></p>
<p>Quý khách vui lòng liên hệ số điện thoại 0982357990 để đặt hàng và thanh toán ngay sau khi nhận hàng<br /><br /><strong>2.Chuyển khoản ngân hàng</strong></p>
<p>Để thuận tiện cho quý khách chúng tôi cung cấp phương thức chuyển khoản ngân hàng . Quý khách chỉ cần chuyển khoản số tiền và quý khách đã đặt mua sản phẩm đên tài khoản của chúng tôi.Ngay sau khi nhận được tiền chúng tôi sẽ tiến hành giao hàng cho quý khách<br /> Thông tin ngân hàng<br />VietComBank chi nhánh Tp Hồ chí minh . <br />Số tài khoản :123456789</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (673, 1060, N'fceb75cc-76d0-431c-bafa-5243b30e1f6e', 55, NULL, NULL, NULL, N'<p>Rồng phụng trái cây được kết rất cầu kỳ, khéo léo từ các loại trái cây tươi ngon, bắt mắt thì những con rồng long phụng rất tinh xảo sóng động như thật, nhất là loại rồng phụng cao cấp chuyển động.</p>
<p>Ngoài ra, Rồng phượng là biểu tượng âm dương rất mạnh trong thần thoại.</p>
<p>Rồng tượng trưng cho sức mạnh của nam.</p>
<p>Phượng tượng trưng cho sự kiều diễm và vẻ đẹp nữ tính khi đặt bên cạnh rồng. Cho nên trên bàn thờ lễ gia tiên đặt một đôi rồng phụng vừa tạo cảnh đẹp mắt. long trọng của buổi lễ vừa tạo nên phong thủy tích cực, tốt đẹp cho cuộc sống hôn nhân của đôi lứa sau này</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (674, 1060, N'641deaa3-5cac-4217-a44a-af90be9d18fb', 39, NULL, NULL, N'rong-phung-tham-quyen', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (675, 1060, N'641deaa3-5cac-4217-a44a-af90be9d18fb', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (676, 1060, N'641deaa3-5cac-4217-a44a-af90be9d18fb', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (677, 1060, N'641deaa3-5cac-4217-a44a-af90be9d18fb', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (678, 1060, N'641deaa3-5cac-4217-a44a-af90be9d18fb', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (679, 1060, N'641deaa3-5cac-4217-a44a-af90be9d18fb', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (680, 1060, N'641deaa3-5cac-4217-a44a-af90be9d18fb', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (681, 1060, N'641deaa3-5cac-4217-a44a-af90be9d18fb', 46, NULL, NULL, N'Rồng phụng thâm quyến', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (682, 1060, N'641deaa3-5cac-4217-a44a-af90be9d18fb', 50, 1074, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (683, 1060, N'641deaa3-5cac-4217-a44a-af90be9d18fb', 53, NULL, NULL, N'500,000 ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (684, 1060, N'641deaa3-5cac-4217-a44a-af90be9d18fb', 56, NULL, NULL, NULL, N'<p><strong>1.Thanh toán trực tiêp </strong></p>
<p>Quý khách vui lòng liên hệ số điện thoại 0982357990 để đặt hàng và thanh toán ngay sau khi nhận hàng<br /><br /><strong>2.Chuyển khoản ngân hàng</strong></p>
<p>Để thuận tiện cho quý khách chúng tôi cung cấp phương thức chuyển khoản ngân hàng . Quý khách chỉ cần chuyển khoản số tiền và quý khách đã đặt mua sản phẩm đên tài khoản của chúng tôi.Ngay sau khi nhận được tiền chúng tôi sẽ tiến hành giao hàng cho quý khách<br /><em>Thông tin ngân hàng</em><br />VietComBank chi nhánh Tp Hồ chí minh . <br />Số tài khoản :123456789</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (685, 1060, N'641deaa3-5cac-4217-a44a-af90be9d18fb', 55, NULL, NULL, NULL, N'<p>Rồng phụng trái cây được kết rất cầu kỳ, khéo léo từ các loại trái cây tươi ngon, bắt mắt thì những con rồng long phụng rất tinh xảo sóng động như thật, nhất là loại rồng phụng cao cấp chuyển động.</p>
<p>Ngoài ra, Rồng phượng là biểu tượng âm dương rất mạnh trong thần thoại.</p>
<p>Rồng tượng trưng cho sức mạnh của nam.</p>
<p>Phượng tượng trưng cho sự kiều diễm và vẻ đẹp nữ tính khi đặt bên cạnh rồng. Cho nên trên bàn thờ lễ gia tiên đặt một đôi rồng phụng vừa tạo cảnh đẹp mắt. long trọng của buổi lễ vừa tạo nên phong thủy tích cực, tốt đẹp cho cuộc sống hôn nhân của đôi lứa sau này</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (686, 1060, N'7f404a2e-91e3-42f6-a1e5-9dfd3b263f7e', 39, NULL, NULL, N'rong-phung-tham-quyen', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (687, 1060, N'7f404a2e-91e3-42f6-a1e5-9dfd3b263f7e', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (688, 1060, N'7f404a2e-91e3-42f6-a1e5-9dfd3b263f7e', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (689, 1060, N'7f404a2e-91e3-42f6-a1e5-9dfd3b263f7e', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (690, 1060, N'7f404a2e-91e3-42f6-a1e5-9dfd3b263f7e', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (691, 1060, N'7f404a2e-91e3-42f6-a1e5-9dfd3b263f7e', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (692, 1060, N'7f404a2e-91e3-42f6-a1e5-9dfd3b263f7e', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (693, 1060, N'7f404a2e-91e3-42f6-a1e5-9dfd3b263f7e', 46, NULL, NULL, N'Rồng phụng thâm quyến', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (694, 1060, N'7f404a2e-91e3-42f6-a1e5-9dfd3b263f7e', 50, 1074, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (695, 1060, N'7f404a2e-91e3-42f6-a1e5-9dfd3b263f7e', 53, NULL, NULL, N'500,000 ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (696, 1060, N'7f404a2e-91e3-42f6-a1e5-9dfd3b263f7e', 56, NULL, NULL, NULL, N'<p><strong>1.Thanh toán trực tiêp </strong></p>
<p>Quý khách vui lòng liên hệ số điện thoại 0982357990 để đặt hàng và thanh toán ngay sau khi nhận hàng<br /><br /><strong>2.Chuyển khoản ngân hàng</strong></p>
<p>Để thuận tiện cho quý khách chúng tôi cung cấp phương thức chuyển khoản ngân hàng . Quý khách chỉ cần chuyển khoản số tiền và quý khách đã đặt mua sản phẩm đên tài khoản của chúng tôi.Ngay sau khi nhận được tiền chúng tôi sẽ tiến hành giao hàng cho quý khách<br /><strong><em>Thông tin ngân hàng</em></strong><br /><em>VietComBank chi nhánh Tp Hồ chí minh . </em><br /><em>Số tài khoản :12345678</em>9</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (697, 1060, N'7f404a2e-91e3-42f6-a1e5-9dfd3b263f7e', 55, NULL, NULL, NULL, N'<p>Rồng phụng trái cây được kết rất cầu kỳ, khéo léo từ các loại trái cây tươi ngon, bắt mắt thì những con rồng long phụng rất tinh xảo sóng động như thật, nhất là loại rồng phụng cao cấp chuyển động.</p>
<p>Ngoài ra, Rồng phượng là biểu tượng âm dương rất mạnh trong thần thoại.</p>
<p>Rồng tượng trưng cho sức mạnh của nam.</p>
<p>Phượng tượng trưng cho sự kiều diễm và vẻ đẹp nữ tính khi đặt bên cạnh rồng. Cho nên trên bàn thờ lễ gia tiên đặt một đôi rồng phụng vừa tạo cảnh đẹp mắt. long trọng của buổi lễ vừa tạo nên phong thủy tích cực, tốt đẹp cho cuộc sống hôn nhân của đôi lứa sau này</p>')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (698, 1075, N'073301b3-c255-4ee9-a4d7-31e2dad09462', 56, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (699, 1075, N'073301b3-c255-4ee9-a4d7-31e2dad09462', 55, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (700, 1076, N'46d386db-1713-4cdc-9d7a-f75ae79daf02', 53, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (701, 1076, N'46d386db-1713-4cdc-9d7a-f75ae79daf02', 56, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (702, 1076, N'46d386db-1713-4cdc-9d7a-f75ae79daf02', 55, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (703, 1077, N'a5dafcb1-40a8-4e45-983b-bd4990a09a8d', 53, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (704, 1077, N'a5dafcb1-40a8-4e45-983b-bd4990a09a8d', 56, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (705, 1077, N'a5dafcb1-40a8-4e45-983b-bd4990a09a8d', 55, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (706, 1078, N'2a376053-1beb-43b8-b2df-d601f35ce4d4', 53, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (707, 1078, N'2a376053-1beb-43b8-b2df-d601f35ce4d4', 56, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (708, 1078, N'2a376053-1beb-43b8-b2df-d601f35ce4d4', 55, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (709, 1079, N'46fb7960-012a-4195-8095-c54a538af568', 53, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (710, 1079, N'46fb7960-012a-4195-8095-c54a538af568', 56, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (711, 1079, N'46fb7960-012a-4195-8095-c54a538af568', 55, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (712, 1080, N'8ce919f2-ba13-43e7-9ac1-53c0d74a42ba', 53, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (713, 1080, N'8ce919f2-ba13-43e7-9ac1-53c0d74a42ba', 56, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (714, 1080, N'8ce919f2-ba13-43e7-9ac1-53c0d74a42ba', 55, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (715, 1081, N'c199d8fd-9ac2-4e4c-9e44-ee991a18b0bd', 53, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (716, 1081, N'c199d8fd-9ac2-4e4c-9e44-ee991a18b0bd', 56, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (717, 1081, N'c199d8fd-9ac2-4e4c-9e44-ee991a18b0bd', 55, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (718, 1082, N'8f70a7ce-4378-412c-b7ea-b9d812c98f6b', 53, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (719, 1082, N'8f70a7ce-4378-412c-b7ea-b9d812c98f6b', 56, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (720, 1082, N'8f70a7ce-4378-412c-b7ea-b9d812c98f6b', 55, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (721, 1083, N'19225619-e1fe-4985-b5f1-cef60a265740', 53, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (722, 1083, N'19225619-e1fe-4985-b5f1-cef60a265740', 56, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (723, 1083, N'19225619-e1fe-4985-b5f1-cef60a265740', 55, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (724, 1051, N'513f7a26-d9ad-449e-a18c-c2c494483c37', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (725, 1051, N'513f7a26-d9ad-449e-a18c-c2c494483c37', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (726, 1051, N'513f7a26-d9ad-449e-a18c-c2c494483c37', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (727, 1051, N'513f7a26-d9ad-449e-a18c-c2c494483c37', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (728, 1051, N'513f7a26-d9ad-449e-a18c-c2c494483c37', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (729, 1051, N'513f7a26-d9ad-449e-a18c-c2c494483c37', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (730, 1051, N'513f7a26-d9ad-449e-a18c-c2c494483c37', 35, NULL, NULL, N'Trang chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (731, 1051, N'513f7a26-d9ad-449e-a18c-c2c494483c37', 46, NULL, NULL, N'Trang Chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (732, 1051, N'513f7a26-d9ad-449e-a18c-c2c494483c37', 43, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (733, 1051, N'513f7a26-d9ad-449e-a18c-c2c494483c37', 42, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (734, 1051, N'513f7a26-d9ad-449e-a18c-c2c494483c37', 45, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (735, 1051, N'513f7a26-d9ad-449e-a18c-c2c494483c37', 44, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (736, 1051, N'513f7a26-d9ad-449e-a18c-c2c494483c37', 51, NULL, NULL, NULL, N'[
  {
    "image": "1084",
    "link": "1051"
  },
  {
    "image": "1085",
    "link": "1054"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (737, 1051, N'513f7a26-d9ad-449e-a18c-c2c494483c37', 47, NULL, NULL, N'RongPhungHaiDiem', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (738, 1051, N'513f7a26-d9ad-449e-a18c-c2c494483c37', 48, NULL, NULL, N'Hải Diễm Studio', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (739, 1051, N'513f7a26-d9ad-449e-a18c-c2c494483c37', 54, NULL, NULL, N'1060,1079,1083', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (740, 1051, N'04956f8b-b357-4faa-bfde-d6ccea57d318', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (741, 1051, N'04956f8b-b357-4faa-bfde-d6ccea57d318', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (742, 1051, N'04956f8b-b357-4faa-bfde-d6ccea57d318', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (743, 1051, N'04956f8b-b357-4faa-bfde-d6ccea57d318', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (744, 1051, N'04956f8b-b357-4faa-bfde-d6ccea57d318', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (745, 1051, N'04956f8b-b357-4faa-bfde-d6ccea57d318', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (746, 1051, N'04956f8b-b357-4faa-bfde-d6ccea57d318', 35, NULL, NULL, N'Trang chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (747, 1051, N'04956f8b-b357-4faa-bfde-d6ccea57d318', 46, NULL, NULL, N'Hải Diễm Studio', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (748, 1051, N'04956f8b-b357-4faa-bfde-d6ccea57d318', 43, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (749, 1051, N'04956f8b-b357-4faa-bfde-d6ccea57d318', 42, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (750, 1051, N'04956f8b-b357-4faa-bfde-d6ccea57d318', 45, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (751, 1051, N'04956f8b-b357-4faa-bfde-d6ccea57d318', 44, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (752, 1051, N'04956f8b-b357-4faa-bfde-d6ccea57d318', 51, NULL, NULL, NULL, N'[
  {
    "image": "1084",
    "link": "1051"
  },
  {
    "image": "1085",
    "link": "1054"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (753, 1051, N'04956f8b-b357-4faa-bfde-d6ccea57d318', 47, NULL, NULL, N'RongPhungHaiDiem', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (754, 1051, N'04956f8b-b357-4faa-bfde-d6ccea57d318', 48, NULL, NULL, N'Trang Chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (755, 1051, N'04956f8b-b357-4faa-bfde-d6ccea57d318', 54, NULL, NULL, N'1060,1079,1083', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (756, 1051, N'f0bda49c-8fc3-4b69-ada0-8f92c5064f85', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (757, 1051, N'f0bda49c-8fc3-4b69-ada0-8f92c5064f85', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (758, 1051, N'f0bda49c-8fc3-4b69-ada0-8f92c5064f85', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (759, 1051, N'f0bda49c-8fc3-4b69-ada0-8f92c5064f85', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (760, 1051, N'f0bda49c-8fc3-4b69-ada0-8f92c5064f85', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (761, 1051, N'f0bda49c-8fc3-4b69-ada0-8f92c5064f85', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (762, 1051, N'f0bda49c-8fc3-4b69-ada0-8f92c5064f85', 35, NULL, NULL, N'Hải Diễm Studio', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (763, 1051, N'f0bda49c-8fc3-4b69-ada0-8f92c5064f85', 46, NULL, NULL, N'Hải Diễm Studio', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (764, 1051, N'f0bda49c-8fc3-4b69-ada0-8f92c5064f85', 43, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (765, 1051, N'f0bda49c-8fc3-4b69-ada0-8f92c5064f85', 42, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (766, 1051, N'f0bda49c-8fc3-4b69-ada0-8f92c5064f85', 45, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (767, 1051, N'f0bda49c-8fc3-4b69-ada0-8f92c5064f85', 44, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (768, 1051, N'f0bda49c-8fc3-4b69-ada0-8f92c5064f85', 51, NULL, NULL, NULL, N'[
  {
    "image": "1084",
    "link": "1051"
  },
  {
    "image": "1085",
    "link": "1054"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (769, 1051, N'f0bda49c-8fc3-4b69-ada0-8f92c5064f85', 47, NULL, NULL, N'RongPhungHaiDiem', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (770, 1051, N'f0bda49c-8fc3-4b69-ada0-8f92c5064f85', 48, NULL, NULL, N'Trang Chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (771, 1051, N'f0bda49c-8fc3-4b69-ada0-8f92c5064f85', 54, NULL, NULL, N'1060,1079,1083', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (772, 1051, N'ca355191-3b9b-4a47-998f-af9572dc2f2c', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (773, 1051, N'ca355191-3b9b-4a47-998f-af9572dc2f2c', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (774, 1051, N'ca355191-3b9b-4a47-998f-af9572dc2f2c', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (775, 1051, N'ca355191-3b9b-4a47-998f-af9572dc2f2c', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (776, 1051, N'ca355191-3b9b-4a47-998f-af9572dc2f2c', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (777, 1051, N'ca355191-3b9b-4a47-998f-af9572dc2f2c', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (778, 1051, N'ca355191-3b9b-4a47-998f-af9572dc2f2c', 35, NULL, NULL, N'Hải Diễm Studio', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (779, 1051, N'ca355191-3b9b-4a47-998f-af9572dc2f2c', 46, NULL, NULL, N'Hải Diễm Studio', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (780, 1051, N'ca355191-3b9b-4a47-998f-af9572dc2f2c', 43, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (781, 1051, N'ca355191-3b9b-4a47-998f-af9572dc2f2c', 42, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (782, 1051, N'ca355191-3b9b-4a47-998f-af9572dc2f2c', 45, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (783, 1051, N'ca355191-3b9b-4a47-998f-af9572dc2f2c', 44, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (784, 1051, N'ca355191-3b9b-4a47-998f-af9572dc2f2c', 51, NULL, NULL, NULL, N'[
  {
    "image": "1084",
    "link": "1051"
  },
  {
    "image": "1085",
    "link": "1054"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (785, 1051, N'ca355191-3b9b-4a47-998f-af9572dc2f2c', 47, NULL, NULL, N'Hải Diễm Studio', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (786, 1051, N'ca355191-3b9b-4a47-998f-af9572dc2f2c', 48, NULL, NULL, N'Trang chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (787, 1051, N'ca355191-3b9b-4a47-998f-af9572dc2f2c', 54, NULL, NULL, N'1060,1079,1083', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (788, 1087, N'767511d8-b1ce-4f95-970b-496b023b9ae1', 6, NULL, NULL, N'/media/1006/bo13.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (789, 1087, N'767511d8-b1ce-4f95-970b-496b023b9ae1', 7, NULL, NULL, N'1500', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (790, 1087, N'767511d8-b1ce-4f95-970b-496b023b9ae1', 8, NULL, NULL, N'600', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (791, 1087, N'767511d8-b1ce-4f95-970b-496b023b9ae1', 9, NULL, NULL, N'281041', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (792, 1087, N'767511d8-b1ce-4f95-970b-496b023b9ae1', 10, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (793, 1088, N'4b7c8499-f699-44b0-aafe-934fb97e67a9', 6, NULL, NULL, N'/media/1007/ken_9149.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (794, 1088, N'4b7c8499-f699-44b0-aafe-934fb97e67a9', 7, NULL, NULL, N'2000', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (795, 1088, N'4b7c8499-f699-44b0-aafe-934fb97e67a9', 8, NULL, NULL, N'800', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (796, 1088, N'4b7c8499-f699-44b0-aafe-934fb97e67a9', 9, NULL, NULL, N'459311', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (797, 1088, N'4b7c8499-f699-44b0-aafe-934fb97e67a9', 10, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (798, 1089, N'99ba302f-a63f-4837-a474-f7a7badcb8a5', 6, NULL, NULL, N'/media/1008/nupa5843x-copy.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (799, 1089, N'99ba302f-a63f-4837-a474-f7a7badcb8a5', 7, NULL, NULL, N'2000', NULL)
GO
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (800, 1089, N'99ba302f-a63f-4837-a474-f7a7badcb8a5', 8, NULL, NULL, N'800', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (801, 1089, N'99ba302f-a63f-4837-a474-f7a7badcb8a5', 9, NULL, NULL, N'581514', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (802, 1089, N'99ba302f-a63f-4837-a474-f7a7badcb8a5', 10, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (803, 1051, N'40b31455-abe2-496e-8552-70fb9b5a8b9b', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (804, 1051, N'40b31455-abe2-496e-8552-70fb9b5a8b9b', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (805, 1051, N'40b31455-abe2-496e-8552-70fb9b5a8b9b', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (806, 1051, N'40b31455-abe2-496e-8552-70fb9b5a8b9b', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (807, 1051, N'40b31455-abe2-496e-8552-70fb9b5a8b9b', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (808, 1051, N'40b31455-abe2-496e-8552-70fb9b5a8b9b', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (809, 1051, N'40b31455-abe2-496e-8552-70fb9b5a8b9b', 35, NULL, NULL, N'Hải Diễm Studio', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (810, 1051, N'40b31455-abe2-496e-8552-70fb9b5a8b9b', 46, NULL, NULL, N'Hải Diễm Studio', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (811, 1051, N'40b31455-abe2-496e-8552-70fb9b5a8b9b', 43, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (812, 1051, N'40b31455-abe2-496e-8552-70fb9b5a8b9b', 42, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (813, 1051, N'40b31455-abe2-496e-8552-70fb9b5a8b9b', 45, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (814, 1051, N'40b31455-abe2-496e-8552-70fb9b5a8b9b', 44, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (815, 1051, N'40b31455-abe2-496e-8552-70fb9b5a8b9b', 51, NULL, NULL, NULL, N'[
  {
    "image": "1087",
    "link": "1051"
  },
  {
    "image": "1088",
    "link": "1054"
  },
  {
    "image": "1089",
    "link": "1064"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (816, 1051, N'40b31455-abe2-496e-8552-70fb9b5a8b9b', 47, NULL, NULL, N'Hải Diễm Studio', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (817, 1051, N'40b31455-abe2-496e-8552-70fb9b5a8b9b', 48, NULL, NULL, N'Trang chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (818, 1051, N'40b31455-abe2-496e-8552-70fb9b5a8b9b', 54, NULL, NULL, N'1060,1079,1083', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (819, 1090, N'6222f248-ad2a-40c7-829a-32f5e4c72e1b', 6, NULL, NULL, N'/media/1009/ken_3524.jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (820, 1090, N'6222f248-ad2a-40c7-829a-32f5e4c72e1b', 7, NULL, NULL, N'2000', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (821, 1090, N'6222f248-ad2a-40c7-829a-32f5e4c72e1b', 8, NULL, NULL, N'800', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (822, 1090, N'6222f248-ad2a-40c7-829a-32f5e4c72e1b', 9, NULL, NULL, N'1009446', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (823, 1090, N'6222f248-ad2a-40c7-829a-32f5e4c72e1b', 10, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (824, 1051, N'5f8d5863-3134-4944-80eb-dd307184b4af', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (825, 1051, N'5f8d5863-3134-4944-80eb-dd307184b4af', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (826, 1051, N'5f8d5863-3134-4944-80eb-dd307184b4af', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (827, 1051, N'5f8d5863-3134-4944-80eb-dd307184b4af', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (828, 1051, N'5f8d5863-3134-4944-80eb-dd307184b4af', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (829, 1051, N'5f8d5863-3134-4944-80eb-dd307184b4af', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (830, 1051, N'5f8d5863-3134-4944-80eb-dd307184b4af', 35, NULL, NULL, N'Hải Diễm Studio', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (831, 1051, N'5f8d5863-3134-4944-80eb-dd307184b4af', 46, NULL, NULL, N'Hải Diễm Studio', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (832, 1051, N'5f8d5863-3134-4944-80eb-dd307184b4af', 43, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (833, 1051, N'5f8d5863-3134-4944-80eb-dd307184b4af', 42, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (834, 1051, N'5f8d5863-3134-4944-80eb-dd307184b4af', 45, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (835, 1051, N'5f8d5863-3134-4944-80eb-dd307184b4af', 44, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (836, 1051, N'5f8d5863-3134-4944-80eb-dd307184b4af', 51, NULL, NULL, NULL, N'[
  {
    "image": "1090",
    "link": "1051"
  },
  {
    "image": "1088",
    "link": "1054"
  },
  {
    "image": "1089",
    "link": "1064"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (837, 1051, N'5f8d5863-3134-4944-80eb-dd307184b4af', 47, NULL, NULL, N'Hải Diễm Studio', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (838, 1051, N'5f8d5863-3134-4944-80eb-dd307184b4af', 48, NULL, NULL, N'Trang chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (839, 1051, N'5f8d5863-3134-4944-80eb-dd307184b4af', 54, NULL, NULL, N'1060,1079,1083', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (840, 1091, N'7c3727a4-9a60-4323-99a5-cb6a96f5fc0f', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (841, 1091, N'7c3727a4-9a60-4323-99a5-cb6a96f5fc0f', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (842, 1091, N'7c3727a4-9a60-4323-99a5-cb6a96f5fc0f', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (843, 1091, N'7c3727a4-9a60-4323-99a5-cb6a96f5fc0f', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (844, 1091, N'7c3727a4-9a60-4323-99a5-cb6a96f5fc0f', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (845, 1091, N'7c3727a4-9a60-4323-99a5-cb6a96f5fc0f', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (846, 1091, N'7c3727a4-9a60-4323-99a5-cb6a96f5fc0f', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (847, 1091, N'7c3727a4-9a60-4323-99a5-cb6a96f5fc0f', 46, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (848, 1091, N'183abdde-38df-401f-8a9a-5b5b92b1c6f5', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (849, 1091, N'183abdde-38df-401f-8a9a-5b5b92b1c6f5', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (850, 1091, N'183abdde-38df-401f-8a9a-5b5b92b1c6f5', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (851, 1091, N'183abdde-38df-401f-8a9a-5b5b92b1c6f5', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (852, 1091, N'183abdde-38df-401f-8a9a-5b5b92b1c6f5', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (853, 1091, N'183abdde-38df-401f-8a9a-5b5b92b1c6f5', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (854, 1091, N'183abdde-38df-401f-8a9a-5b5b92b1c6f5', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (855, 1091, N'183abdde-38df-401f-8a9a-5b5b92b1c6f5', 46, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (856, 1054, N'a70a6727-ec61-46b0-8add-d519d5665122', 39, NULL, NULL, N'rong-phung-trai-cay', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (857, 1054, N'a70a6727-ec61-46b0-8add-d519d5665122', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (858, 1054, N'a70a6727-ec61-46b0-8add-d519d5665122', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (859, 1054, N'a70a6727-ec61-46b0-8add-d519d5665122', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (860, 1054, N'a70a6727-ec61-46b0-8add-d519d5665122', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (861, 1054, N'a70a6727-ec61-46b0-8add-d519d5665122', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (862, 1054, N'a70a6727-ec61-46b0-8add-d519d5665122', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (863, 1054, N'a70a6727-ec61-46b0-8add-d519d5665122', 46, NULL, NULL, N'Rồng phụng trái cây', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (864, 1054, N'a70a6727-ec61-46b0-8add-d519d5665122', 49, 8, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (865, 1064, N'a8cf8090-7e09-4ff4-9618-2b22639c0ef6', 39, NULL, NULL, N'thoi-trang', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (866, 1064, N'a8cf8090-7e09-4ff4-9618-2b22639c0ef6', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (867, 1064, N'a8cf8090-7e09-4ff4-9618-2b22639c0ef6', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (868, 1064, N'a8cf8090-7e09-4ff4-9618-2b22639c0ef6', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (869, 1064, N'a8cf8090-7e09-4ff4-9618-2b22639c0ef6', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (870, 1064, N'a8cf8090-7e09-4ff4-9618-2b22639c0ef6', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (871, 1064, N'a8cf8090-7e09-4ff4-9618-2b22639c0ef6', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (872, 1064, N'a8cf8090-7e09-4ff4-9618-2b22639c0ef6', 46, NULL, NULL, N'Thời trang', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (873, 1067, N'e9bb6e16-8721-4ebb-806c-59d174ba10bc', 39, NULL, NULL, N'lien-he', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (874, 1067, N'e9bb6e16-8721-4ebb-806c-59d174ba10bc', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (875, 1067, N'e9bb6e16-8721-4ebb-806c-59d174ba10bc', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (876, 1067, N'e9bb6e16-8721-4ebb-806c-59d174ba10bc', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (877, 1067, N'e9bb6e16-8721-4ebb-806c-59d174ba10bc', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (878, 1067, N'e9bb6e16-8721-4ebb-806c-59d174ba10bc', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (879, 1067, N'e9bb6e16-8721-4ebb-806c-59d174ba10bc', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (880, 1067, N'e9bb6e16-8721-4ebb-806c-59d174ba10bc', 46, NULL, NULL, N'Liên hệ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (881, 1095, N'5bf2a256-2b5c-4c34-919a-e22019bba8db', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (882, 1095, N'5bf2a256-2b5c-4c34-919a-e22019bba8db', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (883, 1095, N'5bf2a256-2b5c-4c34-919a-e22019bba8db', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (884, 1095, N'5bf2a256-2b5c-4c34-919a-e22019bba8db', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (885, 1095, N'5bf2a256-2b5c-4c34-919a-e22019bba8db', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (886, 1095, N'5bf2a256-2b5c-4c34-919a-e22019bba8db', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (887, 1095, N'5bf2a256-2b5c-4c34-919a-e22019bba8db', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (888, 1095, N'5bf2a256-2b5c-4c34-919a-e22019bba8db', 46, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (889, 1095, N'ee8ab800-7d8c-459d-aa6d-4b6ee5745ef3', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (890, 1095, N'ee8ab800-7d8c-459d-aa6d-4b6ee5745ef3', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (891, 1095, N'ee8ab800-7d8c-459d-aa6d-4b6ee5745ef3', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (892, 1095, N'ee8ab800-7d8c-459d-aa6d-4b6ee5745ef3', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (893, 1095, N'ee8ab800-7d8c-459d-aa6d-4b6ee5745ef3', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (894, 1095, N'ee8ab800-7d8c-459d-aa6d-4b6ee5745ef3', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (895, 1095, N'ee8ab800-7d8c-459d-aa6d-4b6ee5745ef3', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (896, 1095, N'ee8ab800-7d8c-459d-aa6d-4b6ee5745ef3', 46, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (897, 1095, N'aa56a071-75ee-4e02-8692-2fdb6b8387df', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (898, 1095, N'aa56a071-75ee-4e02-8692-2fdb6b8387df', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (899, 1095, N'aa56a071-75ee-4e02-8692-2fdb6b8387df', 41, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (900, 1095, N'aa56a071-75ee-4e02-8692-2fdb6b8387df', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (901, 1095, N'aa56a071-75ee-4e02-8692-2fdb6b8387df', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (902, 1095, N'aa56a071-75ee-4e02-8692-2fdb6b8387df', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (903, 1095, N'aa56a071-75ee-4e02-8692-2fdb6b8387df', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (904, 1095, N'aa56a071-75ee-4e02-8692-2fdb6b8387df', 46, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (905, 1096, N'37fcec08-3a90-4aac-aa05-2f2598373048', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (906, 1096, N'37fcec08-3a90-4aac-aa05-2f2598373048', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (907, 1096, N'37fcec08-3a90-4aac-aa05-2f2598373048', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (908, 1096, N'37fcec08-3a90-4aac-aa05-2f2598373048', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (909, 1096, N'37fcec08-3a90-4aac-aa05-2f2598373048', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (910, 1096, N'37fcec08-3a90-4aac-aa05-2f2598373048', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (911, 1096, N'37fcec08-3a90-4aac-aa05-2f2598373048', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (912, 1096, N'37fcec08-3a90-4aac-aa05-2f2598373048', 46, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (913, 1096, N'54ec8e19-1ddd-42dc-bc73-8dd548635909', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (914, 1096, N'54ec8e19-1ddd-42dc-bc73-8dd548635909', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (915, 1096, N'54ec8e19-1ddd-42dc-bc73-8dd548635909', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (916, 1096, N'54ec8e19-1ddd-42dc-bc73-8dd548635909', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (917, 1096, N'54ec8e19-1ddd-42dc-bc73-8dd548635909', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (918, 1096, N'54ec8e19-1ddd-42dc-bc73-8dd548635909', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (919, 1096, N'54ec8e19-1ddd-42dc-bc73-8dd548635909', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (920, 1096, N'54ec8e19-1ddd-42dc-bc73-8dd548635909', 46, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (921, 1096, N'76abe1dd-e84c-4289-b75e-10e06a077b44', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (922, 1096, N'76abe1dd-e84c-4289-b75e-10e06a077b44', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (923, 1096, N'76abe1dd-e84c-4289-b75e-10e06a077b44', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (924, 1096, N'76abe1dd-e84c-4289-b75e-10e06a077b44', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (925, 1096, N'76abe1dd-e84c-4289-b75e-10e06a077b44', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (926, 1096, N'76abe1dd-e84c-4289-b75e-10e06a077b44', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (927, 1096, N'76abe1dd-e84c-4289-b75e-10e06a077b44', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (928, 1096, N'76abe1dd-e84c-4289-b75e-10e06a077b44', 46, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (929, 1097, N'8d6722a8-d3e0-4cd2-aa1a-38a03e31cf5b', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (930, 1097, N'8d6722a8-d3e0-4cd2-aa1a-38a03e31cf5b', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (931, 1097, N'8d6722a8-d3e0-4cd2-aa1a-38a03e31cf5b', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (932, 1097, N'8d6722a8-d3e0-4cd2-aa1a-38a03e31cf5b', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (933, 1097, N'8d6722a8-d3e0-4cd2-aa1a-38a03e31cf5b', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (934, 1097, N'8d6722a8-d3e0-4cd2-aa1a-38a03e31cf5b', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (935, 1097, N'8d6722a8-d3e0-4cd2-aa1a-38a03e31cf5b', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (936, 1097, N'8d6722a8-d3e0-4cd2-aa1a-38a03e31cf5b', 46, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (937, 1097, N'24d1129b-d1a9-499a-a7e9-0439ec85ba78', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (938, 1097, N'24d1129b-d1a9-499a-a7e9-0439ec85ba78', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (939, 1097, N'24d1129b-d1a9-499a-a7e9-0439ec85ba78', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (940, 1097, N'24d1129b-d1a9-499a-a7e9-0439ec85ba78', 38, 1, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (941, 1097, N'24d1129b-d1a9-499a-a7e9-0439ec85ba78', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (942, 1097, N'24d1129b-d1a9-499a-a7e9-0439ec85ba78', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (943, 1097, N'24d1129b-d1a9-499a-a7e9-0439ec85ba78', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (944, 1097, N'24d1129b-d1a9-499a-a7e9-0439ec85ba78', 46, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (945, 1098, N'c017604c-b864-4b43-9a1c-020f34c95337', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (946, 1098, N'c017604c-b864-4b43-9a1c-020f34c95337', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (947, 1098, N'c017604c-b864-4b43-9a1c-020f34c95337', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (948, 1098, N'c017604c-b864-4b43-9a1c-020f34c95337', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (949, 1098, N'c017604c-b864-4b43-9a1c-020f34c95337', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (950, 1098, N'c017604c-b864-4b43-9a1c-020f34c95337', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (951, 1098, N'c017604c-b864-4b43-9a1c-020f34c95337', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (952, 1098, N'c017604c-b864-4b43-9a1c-020f34c95337', 46, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (953, 1099, N'010a175d-4c8f-4b37-a093-38e18c351e78', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (954, 1099, N'010a175d-4c8f-4b37-a093-38e18c351e78', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (955, 1099, N'010a175d-4c8f-4b37-a093-38e18c351e78', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (956, 1099, N'010a175d-4c8f-4b37-a093-38e18c351e78', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (957, 1099, N'010a175d-4c8f-4b37-a093-38e18c351e78', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (958, 1099, N'010a175d-4c8f-4b37-a093-38e18c351e78', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (959, 1099, N'010a175d-4c8f-4b37-a093-38e18c351e78', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (960, 1099, N'010a175d-4c8f-4b37-a093-38e18c351e78', 46, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (961, 1100, N'9e5427b3-fbf8-44c7-bf68-a03caa807bb2', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (962, 1100, N'9e5427b3-fbf8-44c7-bf68-a03caa807bb2', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (963, 1100, N'9e5427b3-fbf8-44c7-bf68-a03caa807bb2', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (964, 1100, N'9e5427b3-fbf8-44c7-bf68-a03caa807bb2', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (965, 1100, N'9e5427b3-fbf8-44c7-bf68-a03caa807bb2', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (966, 1100, N'9e5427b3-fbf8-44c7-bf68-a03caa807bb2', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (967, 1100, N'9e5427b3-fbf8-44c7-bf68-a03caa807bb2', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (968, 1100, N'9e5427b3-fbf8-44c7-bf68-a03caa807bb2', 46, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (969, 1064, N'a6e32bb5-b8d7-4308-a434-1541890c5503', 39, NULL, NULL, N'thoi-trang', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (970, 1064, N'a6e32bb5-b8d7-4308-a434-1541890c5503', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (971, 1064, N'a6e32bb5-b8d7-4308-a434-1541890c5503', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (972, 1064, N'a6e32bb5-b8d7-4308-a434-1541890c5503', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (973, 1064, N'a6e32bb5-b8d7-4308-a434-1541890c5503', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (974, 1064, N'a6e32bb5-b8d7-4308-a434-1541890c5503', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (975, 1064, N'a6e32bb5-b8d7-4308-a434-1541890c5503', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (976, 1064, N'a6e32bb5-b8d7-4308-a434-1541890c5503', 46, NULL, NULL, N'Thời trang', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (977, 1064, N'ee4812fa-927a-4a0e-8bad-742d43c4b313', 39, NULL, NULL, N'thoi-trang', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (978, 1064, N'ee4812fa-927a-4a0e-8bad-742d43c4b313', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (979, 1064, N'ee4812fa-927a-4a0e-8bad-742d43c4b313', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (980, 1064, N'ee4812fa-927a-4a0e-8bad-742d43c4b313', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (981, 1064, N'ee4812fa-927a-4a0e-8bad-742d43c4b313', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (982, 1064, N'ee4812fa-927a-4a0e-8bad-742d43c4b313', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (983, 1064, N'ee4812fa-927a-4a0e-8bad-742d43c4b313', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (984, 1064, N'ee4812fa-927a-4a0e-8bad-742d43c4b313', 46, NULL, NULL, N'Thời trang', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (985, 1105, N'bd103ce8-eddd-4e3f-9047-3b4721f9c8af', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (986, 1105, N'bd103ce8-eddd-4e3f-9047-3b4721f9c8af', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (987, 1105, N'bd103ce8-eddd-4e3f-9047-3b4721f9c8af', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (988, 1105, N'bd103ce8-eddd-4e3f-9047-3b4721f9c8af', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (989, 1105, N'bd103ce8-eddd-4e3f-9047-3b4721f9c8af', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (990, 1105, N'bd103ce8-eddd-4e3f-9047-3b4721f9c8af', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (991, 1105, N'bd103ce8-eddd-4e3f-9047-3b4721f9c8af', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (992, 1105, N'bd103ce8-eddd-4e3f-9047-3b4721f9c8af', 46, NULL, NULL, N'Thời Trang', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (993, 1054, N'a3936bd3-9633-4eb8-bd23-2dc3cebb3336', 39, NULL, NULL, N'rong-phung-trai-cay', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (994, 1054, N'a3936bd3-9633-4eb8-bd23-2dc3cebb3336', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (995, 1054, N'a3936bd3-9633-4eb8-bd23-2dc3cebb3336', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (996, 1054, N'a3936bd3-9633-4eb8-bd23-2dc3cebb3336', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (997, 1054, N'a3936bd3-9633-4eb8-bd23-2dc3cebb3336', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (998, 1054, N'a3936bd3-9633-4eb8-bd23-2dc3cebb3336', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (999, 1054, N'a3936bd3-9633-4eb8-bd23-2dc3cebb3336', 35, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1000, 1054, N'a3936bd3-9633-4eb8-bd23-2dc3cebb3336', 46, NULL, NULL, N'Rồng phụng trái cây', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1001, 1054, N'a3936bd3-9633-4eb8-bd23-2dc3cebb3336', 49, 8, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1002, 1091, N'cf5a2a93-1698-431c-8632-d328f668e2d8', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1003, 1091, N'cf5a2a93-1698-431c-8632-d328f668e2d8', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1004, 1091, N'cf5a2a93-1698-431c-8632-d328f668e2d8', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1005, 1091, N'cf5a2a93-1698-431c-8632-d328f668e2d8', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1006, 1091, N'cf5a2a93-1698-431c-8632-d328f668e2d8', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1007, 1091, N'cf5a2a93-1698-431c-8632-d328f668e2d8', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1008, 1091, N'cf5a2a93-1698-431c-8632-d328f668e2d8', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1009, 1091, N'cf5a2a93-1698-431c-8632-d328f668e2d8', 46, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1010, 1105, N'382747bc-08c2-4e4a-9c0c-97c7a1265ccf', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1011, 1105, N'382747bc-08c2-4e4a-9c0c-97c7a1265ccf', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1012, 1105, N'382747bc-08c2-4e4a-9c0c-97c7a1265ccf', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1013, 1105, N'382747bc-08c2-4e4a-9c0c-97c7a1265ccf', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1014, 1105, N'382747bc-08c2-4e4a-9c0c-97c7a1265ccf', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1015, 1105, N'382747bc-08c2-4e4a-9c0c-97c7a1265ccf', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1016, 1105, N'382747bc-08c2-4e4a-9c0c-97c7a1265ccf', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1017, 1105, N'382747bc-08c2-4e4a-9c0c-97c7a1265ccf', 46, NULL, NULL, N'Thời Trang', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1018, 1097, N'b17ed075-fc03-4823-915c-c2f42e6bbbee', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1019, 1097, N'b17ed075-fc03-4823-915c-c2f42e6bbbee', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1020, 1097, N'b17ed075-fc03-4823-915c-c2f42e6bbbee', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1021, 1097, N'b17ed075-fc03-4823-915c-c2f42e6bbbee', 38, 1, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1022, 1097, N'b17ed075-fc03-4823-915c-c2f42e6bbbee', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1023, 1097, N'b17ed075-fc03-4823-915c-c2f42e6bbbee', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1024, 1097, N'b17ed075-fc03-4823-915c-c2f42e6bbbee', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1025, 1097, N'b17ed075-fc03-4823-915c-c2f42e6bbbee', 46, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1026, 1067, N'ae6cde7e-dbff-4194-b987-ce007c079900', 39, NULL, NULL, N'lien-he', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1027, 1067, N'ae6cde7e-dbff-4194-b987-ce007c079900', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1028, 1067, N'ae6cde7e-dbff-4194-b987-ce007c079900', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1029, 1067, N'ae6cde7e-dbff-4194-b987-ce007c079900', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1030, 1067, N'ae6cde7e-dbff-4194-b987-ce007c079900', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1031, 1067, N'ae6cde7e-dbff-4194-b987-ce007c079900', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1032, 1067, N'ae6cde7e-dbff-4194-b987-ce007c079900', 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1033, 1067, N'ae6cde7e-dbff-4194-b987-ce007c079900', 46, NULL, NULL, N'Liên hệ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1034, 1051, N'f7ebfe78-f3e5-4649-ae4f-552b71efd81e', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1035, 1051, N'f7ebfe78-f3e5-4649-ae4f-552b71efd81e', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1036, 1051, N'f7ebfe78-f3e5-4649-ae4f-552b71efd81e', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1037, 1051, N'f7ebfe78-f3e5-4649-ae4f-552b71efd81e', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1038, 1051, N'f7ebfe78-f3e5-4649-ae4f-552b71efd81e', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1039, 1051, N'f7ebfe78-f3e5-4649-ae4f-552b71efd81e', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1040, 1051, N'f7ebfe78-f3e5-4649-ae4f-552b71efd81e', 35, NULL, NULL, N'Hải Diễm Studio', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1041, 1051, N'f7ebfe78-f3e5-4649-ae4f-552b71efd81e', 46, NULL, NULL, N'Hải Diễm Studio', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1042, 1051, N'f7ebfe78-f3e5-4649-ae4f-552b71efd81e', 43, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1043, 1051, N'f7ebfe78-f3e5-4649-ae4f-552b71efd81e', 42, NULL, NULL, N'facebook.com/hai.diem.7', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1044, 1051, N'f7ebfe78-f3e5-4649-ae4f-552b71efd81e', 45, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1045, 1051, N'f7ebfe78-f3e5-4649-ae4f-552b71efd81e', 44, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1046, 1051, N'f7ebfe78-f3e5-4649-ae4f-552b71efd81e', 51, NULL, NULL, NULL, N'[
  {
    "image": "1090",
    "link": "1051"
  },
  {
    "image": "1088",
    "link": "1054"
  },
  {
    "image": "1089",
    "link": "1064"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1047, 1051, N'f7ebfe78-f3e5-4649-ae4f-552b71efd81e', 47, NULL, NULL, N'Hải Diễm Studio', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1048, 1051, N'f7ebfe78-f3e5-4649-ae4f-552b71efd81e', 48, NULL, NULL, N'Trang chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1049, 1051, N'f7ebfe78-f3e5-4649-ae4f-552b71efd81e', 54, NULL, NULL, N'1060,1079,1083', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1050, 1051, N'13c73743-50ed-482d-8fef-25839c46f9ff', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1051, 1051, N'13c73743-50ed-482d-8fef-25839c46f9ff', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1052, 1051, N'13c73743-50ed-482d-8fef-25839c46f9ff', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1053, 1051, N'13c73743-50ed-482d-8fef-25839c46f9ff', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1054, 1051, N'13c73743-50ed-482d-8fef-25839c46f9ff', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1055, 1051, N'13c73743-50ed-482d-8fef-25839c46f9ff', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1056, 1051, N'13c73743-50ed-482d-8fef-25839c46f9ff', 35, NULL, NULL, N'Hải Diễm Studio', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1057, 1051, N'13c73743-50ed-482d-8fef-25839c46f9ff', 46, NULL, NULL, N'Hải Diễm Studio', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1058, 1051, N'13c73743-50ed-482d-8fef-25839c46f9ff', 43, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1059, 1051, N'13c73743-50ed-482d-8fef-25839c46f9ff', 42, NULL, NULL, N'https://www.facebook.com/cao.hoangvu', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1060, 1051, N'13c73743-50ed-482d-8fef-25839c46f9ff', 45, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1061, 1051, N'13c73743-50ed-482d-8fef-25839c46f9ff', 44, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1062, 1051, N'13c73743-50ed-482d-8fef-25839c46f9ff', 51, NULL, NULL, NULL, N'[
  {
    "image": "1090",
    "link": "1051"
  },
  {
    "image": "1088",
    "link": "1054"
  },
  {
    "image": "1089",
    "link": "1064"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1063, 1051, N'13c73743-50ed-482d-8fef-25839c46f9ff', 47, NULL, NULL, N'Hải Diễm Studio', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1064, 1051, N'13c73743-50ed-482d-8fef-25839c46f9ff', 48, NULL, NULL, N'Trang chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1065, 1051, N'13c73743-50ed-482d-8fef-25839c46f9ff', 54, NULL, NULL, N'1060,1079,1083', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1066, 1051, N'a8cf7d00-85c0-4025-b273-282210c591c6', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1067, 1051, N'a8cf7d00-85c0-4025-b273-282210c591c6', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1068, 1051, N'a8cf7d00-85c0-4025-b273-282210c591c6', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1069, 1051, N'a8cf7d00-85c0-4025-b273-282210c591c6', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1070, 1051, N'a8cf7d00-85c0-4025-b273-282210c591c6', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1071, 1051, N'a8cf7d00-85c0-4025-b273-282210c591c6', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1072, 1051, N'a8cf7d00-85c0-4025-b273-282210c591c6', 35, NULL, NULL, N'Hải Diễm Studio', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1073, 1051, N'a8cf7d00-85c0-4025-b273-282210c591c6', 46, NULL, NULL, N'Hải Diễm Studio', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1074, 1051, N'a8cf7d00-85c0-4025-b273-282210c591c6', 43, NULL, NULL, N'https://twitter.com/', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1075, 1051, N'a8cf7d00-85c0-4025-b273-282210c591c6', 42, NULL, NULL, N'https://www.facebook.com/cao.hoangvu', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1076, 1051, N'a8cf7d00-85c0-4025-b273-282210c591c6', 45, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1077, 1051, N'a8cf7d00-85c0-4025-b273-282210c591c6', 44, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1078, 1051, N'a8cf7d00-85c0-4025-b273-282210c591c6', 51, NULL, NULL, NULL, N'[
  {
    "image": "1090",
    "link": "1051"
  },
  {
    "image": "1088",
    "link": "1054"
  },
  {
    "image": "1089",
    "link": "1064"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1079, 1051, N'a8cf7d00-85c0-4025-b273-282210c591c6', 47, NULL, NULL, N'Hải Diễm Studio', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1080, 1051, N'a8cf7d00-85c0-4025-b273-282210c591c6', 48, NULL, NULL, N'Trang chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1081, 1051, N'a8cf7d00-85c0-4025-b273-282210c591c6', 54, NULL, NULL, N'1060,1079,1083', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1082, 1051, N'aeee99cc-07a0-4bf8-8c40-c595fc138103', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1083, 1051, N'aeee99cc-07a0-4bf8-8c40-c595fc138103', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1084, 1051, N'aeee99cc-07a0-4bf8-8c40-c595fc138103', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1085, 1051, N'aeee99cc-07a0-4bf8-8c40-c595fc138103', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1086, 1051, N'aeee99cc-07a0-4bf8-8c40-c595fc138103', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1087, 1051, N'aeee99cc-07a0-4bf8-8c40-c595fc138103', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1088, 1051, N'aeee99cc-07a0-4bf8-8c40-c595fc138103', 35, NULL, NULL, N'Hải Diễm Studio', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1089, 1051, N'aeee99cc-07a0-4bf8-8c40-c595fc138103', 46, NULL, NULL, N'Hải Diễm Studio', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1090, 1051, N'aeee99cc-07a0-4bf8-8c40-c595fc138103', 43, NULL, NULL, N'https://twitter.com/', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1091, 1051, N'aeee99cc-07a0-4bf8-8c40-c595fc138103', 42, NULL, NULL, N'https://www.facebook.com/cao.hoangvu', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1092, 1051, N'aeee99cc-07a0-4bf8-8c40-c595fc138103', 45, NULL, NULL, N'https://www.instagram.com/', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1093, 1051, N'aeee99cc-07a0-4bf8-8c40-c595fc138103', 44, NULL, NULL, N'https://plus.google.com/', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1094, 1051, N'aeee99cc-07a0-4bf8-8c40-c595fc138103', 51, NULL, NULL, NULL, N'[
  {
    "image": "1090",
    "link": "1051"
  },
  {
    "image": "1088",
    "link": "1054"
  },
  {
    "image": "1089",
    "link": "1064"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1095, 1051, N'aeee99cc-07a0-4bf8-8c40-c595fc138103', 47, NULL, NULL, N'Hải Diễm Studio', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1096, 1051, N'aeee99cc-07a0-4bf8-8c40-c595fc138103', 48, NULL, NULL, N'Trang chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1097, 1051, N'aeee99cc-07a0-4bf8-8c40-c595fc138103', 54, NULL, NULL, N'1060,1079,1083', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1098, 1051, N'54aa5a90-c79e-4c01-9891-8da238d90341', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1099, 1051, N'54aa5a90-c79e-4c01-9891-8da238d90341', 40, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1100, 1051, N'54aa5a90-c79e-4c01-9891-8da238d90341', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1101, 1051, N'54aa5a90-c79e-4c01-9891-8da238d90341', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1102, 1051, N'54aa5a90-c79e-4c01-9891-8da238d90341', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1103, 1051, N'54aa5a90-c79e-4c01-9891-8da238d90341', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1104, 1051, N'54aa5a90-c79e-4c01-9891-8da238d90341', 35, NULL, NULL, N'Hải Diễm Studio', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1105, 1051, N'54aa5a90-c79e-4c01-9891-8da238d90341', 46, NULL, NULL, N'Hải Diễm Studio', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1106, 1051, N'54aa5a90-c79e-4c01-9891-8da238d90341', 43, NULL, NULL, N'https://twitter.com/', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1107, 1051, N'54aa5a90-c79e-4c01-9891-8da238d90341', 42, NULL, NULL, N'https://www.facebook.com/cao.hoangvu', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1108, 1051, N'54aa5a90-c79e-4c01-9891-8da238d90341', 45, NULL, NULL, N'https://www.instagram.com/', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1109, 1051, N'54aa5a90-c79e-4c01-9891-8da238d90341', 44, NULL, NULL, N'http://feedburner.google.com/fb/a/mailverify?uri=tympanus&loc=en_US', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1110, 1051, N'54aa5a90-c79e-4c01-9891-8da238d90341', 51, NULL, NULL, NULL, N'[
  {
    "image": "1090",
    "link": "1051"
  },
  {
    "image": "1088",
    "link": "1054"
  },
  {
    "image": "1089",
    "link": "1064"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1111, 1051, N'54aa5a90-c79e-4c01-9891-8da238d90341', 47, NULL, NULL, N'Hải Diễm Studio', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1112, 1051, N'54aa5a90-c79e-4c01-9891-8da238d90341', 48, NULL, NULL, N'Trang chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1113, 1051, N'54aa5a90-c79e-4c01-9891-8da238d90341', 54, NULL, NULL, N'1060,1079,1083', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1114, 1051, N'3e017249-2472-43b9-b323-f7cb117ecdb9', 39, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1115, 1051, N'3e017249-2472-43b9-b323-f7cb117ecdb9', 40, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1116, 1051, N'3e017249-2472-43b9-b323-f7cb117ecdb9', 41, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1117, 1051, N'3e017249-2472-43b9-b323-f7cb117ecdb9', 38, 0, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1118, 1051, N'3e017249-2472-43b9-b323-f7cb117ecdb9', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1119, 1051, N'3e017249-2472-43b9-b323-f7cb117ecdb9', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1120, 1051, N'3e017249-2472-43b9-b323-f7cb117ecdb9', 35, NULL, NULL, N'Hải Diễm Studio', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1121, 1051, N'3e017249-2472-43b9-b323-f7cb117ecdb9', 46, NULL, NULL, N'Hải Diễm Studio', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1122, 1051, N'3e017249-2472-43b9-b323-f7cb117ecdb9', 43, NULL, NULL, N'https://twitter.com/', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1123, 1051, N'3e017249-2472-43b9-b323-f7cb117ecdb9', 42, NULL, NULL, N'https://www.facebook.com/cao.hoangvu', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1124, 1051, N'3e017249-2472-43b9-b323-f7cb117ecdb9', 45, NULL, NULL, N'https://www.instagram.com/', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1125, 1051, N'3e017249-2472-43b9-b323-f7cb117ecdb9', 44, NULL, NULL, N'http://feedburner.google.com/fb/a/mailverify?uri=tympanus&loc=en_US', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1126, 1051, N'3e017249-2472-43b9-b323-f7cb117ecdb9', 51, NULL, NULL, NULL, N'[
  {
    "image": "1088",
    "link": "1054"
  },
  {
    "image": "1090",
    "link": "1051"
  },
  {
    "image": "1089",
    "link": "1064"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1127, 1051, N'3e017249-2472-43b9-b323-f7cb117ecdb9', 47, NULL, NULL, N'Hải Diễm Studio', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1128, 1051, N'3e017249-2472-43b9-b323-f7cb117ecdb9', 48, NULL, NULL, N'Trang chủ', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1129, 1051, N'3e017249-2472-43b9-b323-f7cb117ecdb9', 54, NULL, NULL, N'1060,1079,1083', NULL)
SET IDENTITY_INSERT [dbo].[cmsPropertyData] OFF
SET IDENTITY_INSERT [dbo].[cmsPropertyType] ON 

INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (6, -90, 1032, 3, N'umbracoFile', N'Upload image', 0, 0, NULL, NULL, N'00000006-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (7, -92, 1032, 3, N'umbracoWidth', N'Width', 0, 0, NULL, NULL, N'00000007-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (8, -92, 1032, 3, N'umbracoHeight', N'Height', 0, 0, NULL, NULL, N'00000008-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (9, -92, 1032, 3, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, N'00000009-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (10, -92, 1032, 3, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, N'0000000a-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (24, -90, 1033, 4, N'umbracoFile', N'Upload file', 0, 0, NULL, NULL, N'00000018-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (25, -92, 1033, 4, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, N'00000019-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (26, -92, 1033, 4, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, N'0000001a-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (27, -38, 1031, 5, N'contents', N'Contents:', 0, 0, NULL, NULL, N'0000001b-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (28, -89, 1044, 11, N'umbracoMemberComments', N'Comments', 0, 0, NULL, NULL, N'0000001c-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (29, -92, 1044, 11, N'umbracoMemberFailedPasswordAttempts', N'Failed Password Attempts', 1, 0, NULL, NULL, N'0000001d-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (30, -49, 1044, 11, N'umbracoMemberApproved', N'Is Approved', 2, 0, NULL, NULL, N'0000001e-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (31, -49, 1044, 11, N'umbracoMemberLockedOut', N'Is Locked Out', 3, 0, NULL, NULL, N'0000001f-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (32, -92, 1044, 11, N'umbracoMemberLastLockoutDate', N'Last Lockout Date', 4, 0, NULL, NULL, N'00000020-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (33, -92, 1044, 11, N'umbracoMemberLastLogin', N'Last Login Date', 5, 0, NULL, NULL, N'00000021-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (34, -92, 1044, 11, N'umbracoMemberLastPasswordChangeDate', N'Last Password Change Date', 6, 0, NULL, NULL, N'00000022-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (35, -88, 1048, 12, N'pagetitle', N'PageTitle', 0, 0, N'', N'Tiêu đề trang', N'f34c5936-1c07-4033-b536-bd3164728994')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (36, -89, 1048, 12, N'pageDescription', N'Page Description', 1, 0, N'', N'Mô tả trang', N'37eb3a2b-c9b4-4f6f-b66b-4fc2ab2e098b')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (37, -89, 1048, 12, N'pageKeywords', N'Page Keywords', 2, 0, N'', N'Những từ khóa của trang', N'c97e80c8-509e-4cf1-b465-7ce85e18b12b')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (38, -49, 1048, NULL, N'hideInNavigation', N'Hide in navigation?', 0, 0, N'', N'Nếu chọn "Yes",thì trang sẽ ẩn trên menu top', N'a3d90761-ebd8-42d4-b3b5-cc4e09ed81ca')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (39, -88, 1048, NULL, N'umbracoUrlName', N'Umbraco Url Name', 1, 0, N'', N'', N'ab2f9c96-62bc-4d0b-b9a3-4b6f2ce6b29c')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (40, -88, 1048, NULL, N'umbracoUrlAlias', N'Umbraco Url Alias', 2, 0, N'', N'', N'e9440b2d-98d9-40c1-b9e1-7852bd6002e1')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (41, 1034, 1048, NULL, N'invisibleRedirect', N'Invisible Redirect', 3, 0, N'', N'', N'cfc66cb2-3b54-48e1-b7ac-7bf2ed038bdc')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (42, -88, 1050, 13, N'facebookLink', N'Facebook link', 0, 0, N'', N'', N'1bdf996b-15cd-4ed2-9a35-27c3e2f9fb3f')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (43, -88, 1050, 13, N'twitterLink', N'Twitter link', 1, 0, N'', N'', N'960efb7b-a436-47bd-a4b1-080852e4dbf6')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (44, -88, 1050, 13, N'googleplusLink', N'Google+ link', 2, 0, N'', N'', N'a31788c5-0386-4279-b867-a1666149e8c1')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (45, -88, 1050, 13, N'instagramLink', N'Instagram link', 3, 0, N'', N'', N'05cf3f5e-8c41-429e-a4a4-59760fa3eacf')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (46, -88, 1048, 15, N'pageName', N'Page Name', 0, 0, N'', N'', N'999c7c46-5c11-4538-98cf-5b29258f2779')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (47, -88, 1050, 16, N'copyright', N'Copyright', 0, 0, N'', N'', N'5404cbc0-b2e6-4860-b6d3-7f6594df8e39')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (48, -88, 1050, 16, N'siteName', N'Site Name', 1, 0, N'', N'', N'26bac3ad-35de-43a1-be4f-a9f85132607a')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (49, -51, 1053, 17, N'shownumberofproduct', N'ShowNumberofProduct', 0, 0, N'', N'', N'76c12452-b060-445d-9351-cc7d9491ca48')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (50, 1035, 1059, 18, N'hinhAnh', N'Hình ảnh', 0, 0, N'', N'', N'dd564f4f-f0ec-484e-83b3-17a51045ebc4')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (51, 1071, 1050, 14, N'bannerImage', N'Banner Image', 0, 0, N'', N'chọn hình ảnh hiển thị trên slider', N'4836dfa7-df04-4bf8-a2f9-ea2b2a85b191')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (52, -87, 1056, 19, N'content', N'Content', 0, 0, N'', N'Nội dung trang about', N'8a49c909-6b5c-42e4-8994-6de2251f979a')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (53, -88, 1059, 18, N'price', N'Price', 1, 0, N'', N'giá của sản phẩm', N'49acdc27-aefd-4658-8239-5278141f431e')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (54, 1086, 1050, 20, N'productHightlight', N'Product Hightlight', 0, 0, N'', N'Chọn những sản phẩm nổi bật lên trang chủ', N'301c9098-5178-4351-8bab-9b513a8b9635')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (55, -87, 1059, 21, N'moTa', N'Mô tả', 0, 0, N'', N'mô tả sản phẩm', N'251d0488-50b5-426e-9e2e-f0e31a8de8c7')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [validationRegExp], [Description], [UniqueID]) VALUES (56, -87, 1059, 21, N'phuongThucThanhToan', N'Phương thức thanh toán', 1, 0, N'', N'phương thức thanh toán', N'7f87de03-a2a1-42ec-b825-5c93dfbfeb9d')
SET IDENTITY_INSERT [dbo].[cmsPropertyType] OFF
SET IDENTITY_INSERT [dbo].[cmsPropertyTypeGroup] ON 

INSERT [dbo].[cmsPropertyTypeGroup] ([id], [parentGroupId], [contenttypeNodeId], [text], [sortorder]) VALUES (3, NULL, 1032, N'Image', 1)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [parentGroupId], [contenttypeNodeId], [text], [sortorder]) VALUES (4, NULL, 1033, N'File', 1)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [parentGroupId], [contenttypeNodeId], [text], [sortorder]) VALUES (5, NULL, 1031, N'Contents', 1)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [parentGroupId], [contenttypeNodeId], [text], [sortorder]) VALUES (11, NULL, 1044, N'Membership', 1)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [parentGroupId], [contenttypeNodeId], [text], [sortorder]) VALUES (12, NULL, 1048, N'MetaTag', 1)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [parentGroupId], [contenttypeNodeId], [text], [sortorder]) VALUES (13, NULL, 1050, N'Social', 0)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [parentGroupId], [contenttypeNodeId], [text], [sortorder]) VALUES (14, NULL, 1050, N'Banner', 1)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [parentGroupId], [contenttypeNodeId], [text], [sortorder]) VALUES (15, NULL, 1048, N'Content', 0)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [parentGroupId], [contenttypeNodeId], [text], [sortorder]) VALUES (16, 15, 1050, N'Content', 0)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [parentGroupId], [contenttypeNodeId], [text], [sortorder]) VALUES (17, 15, 1053, N'Content', 0)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [parentGroupId], [contenttypeNodeId], [text], [sortorder]) VALUES (18, 15, 1059, N'Content', 0)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [parentGroupId], [contenttypeNodeId], [text], [sortorder]) VALUES (19, 15, 1056, N'Content', 0)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [parentGroupId], [contenttypeNodeId], [text], [sortorder]) VALUES (20, NULL, 1050, N'Product Future', 1)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [parentGroupId], [contenttypeNodeId], [text], [sortorder]) VALUES (21, NULL, 1059, N'Product Infomation', 1)
SET IDENTITY_INSERT [dbo].[cmsPropertyTypeGroup] OFF
SET IDENTITY_INSERT [dbo].[cmsTaskType] ON 

INSERT [dbo].[cmsTaskType] ([id], [alias]) VALUES (1, N'toTranslate')
SET IDENTITY_INSERT [dbo].[cmsTaskType] OFF
SET IDENTITY_INSERT [dbo].[cmsTemplate] ON 

INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (1, 1047, N'MasterPage', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = null;
}')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (2, 1049, N'Homepage', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = "MasterPage.cshtml";
}')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (3, 1052, N'productPage', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = "MasterPage.cshtml";
}')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (4, 1055, N'About', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = "MasterPage.cshtml";
}')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (5, 1057, N'ProductItem', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = null;
}')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (6, 1062, N'Fashion', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = "MasterPage.cshtml";
}')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (7, 1065, N'ContactPage', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = "MasterPage.cshtml";
}')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (8, 1093, N'ServiceDetailPage', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = null;
}')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (9, 1101, N'News', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = null;
}')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias], [design]) VALUES (10, 1103, N'NewsDetail', N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = null;
}')
SET IDENTITY_INSERT [dbo].[cmsTemplate] OFF
SET IDENTITY_INSERT [dbo].[umbracoLanguage] ON 

INSERT [dbo].[umbracoLanguage] ([id], [languageISOCode], [languageCultureName]) VALUES (1, N'en-US', N'en-US')
INSERT [dbo].[umbracoLanguage] ([id], [languageISOCode], [languageCultureName]) VALUES (2, N'vi-VN', N'Vietnamese (Vietnam)')
SET IDENTITY_INSERT [dbo].[umbracoLanguage] OFF
SET IDENTITY_INSERT [dbo].[umbracoLog] ON 

INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1, 0, 1046, CAST(N'2016-04-05 10:46:53.283' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (2, 0, -1, CAST(N'2016-04-05 10:47:24.957' AS DateTime), N'Delete', N'Delete Content of Type 1046 performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (3, 0, 1046, CAST(N'2016-04-05 10:47:25.003' AS DateTime), N'Delete', N'Delete ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (4, 0, 1047, CAST(N'2016-04-05 10:47:32.283' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (5, 0, 1048, CAST(N'2016-04-05 10:47:32.317' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (6, 0, 1048, CAST(N'2016-04-05 10:47:41.863' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (7, 0, 1048, CAST(N'2016-04-05 10:48:37.937' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (8, 0, 1048, CAST(N'2016-04-05 10:49:29.993' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (9, 0, 1048, CAST(N'2016-04-05 10:50:55.757' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (10, 0, 1048, CAST(N'2016-04-05 10:51:19.200' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (11, 0, 1048, CAST(N'2016-04-05 10:52:12.993' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (12, 0, 1048, CAST(N'2016-04-05 10:52:40.640' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (13, 0, 1048, CAST(N'2016-04-05 10:52:58.020' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (14, 0, 1048, CAST(N'2016-04-05 10:53:18.050' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (15, 0, 1049, CAST(N'2016-04-05 10:53:32.437' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (16, 0, 1050, CAST(N'2016-04-05 10:53:32.470' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (17, 0, 1048, CAST(N'2016-04-05 10:54:02.660' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (18, 0, 1048, CAST(N'2016-04-05 10:56:20.967' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (19, 0, 1050, CAST(N'2016-04-05 10:56:40.220' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (20, 0, 1050, CAST(N'2016-04-05 10:56:45.573' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (21, 0, 1050, CAST(N'2016-04-05 10:57:32.717' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (22, 0, 1050, CAST(N'2016-04-05 10:57:44.080' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (23, 0, 1050, CAST(N'2016-04-05 10:57:56.567' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (24, 0, 1050, CAST(N'2016-04-05 10:58:10.097' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (25, 0, 1048, CAST(N'2016-04-05 10:58:41.387' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (26, 0, 1048, CAST(N'2016-04-05 10:58:48.613' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (27, 0, 1048, CAST(N'2016-04-05 10:58:57.500' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (28, 0, 1050, CAST(N'2016-04-05 11:07:09.287' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (29, 0, 0, CAST(N'2016-04-05 11:08:21.087' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (30, 0, 1051, CAST(N'2016-04-05 11:08:50.723' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (31, 0, 1051, CAST(N'2016-04-05 11:09:53.733' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (32, 0, -1, CAST(N'2016-04-05 13:18:32.667' AS DateTime), N'Save', N'Save Stylesheet performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (33, 0, 1050, CAST(N'2016-04-05 13:21:56.893' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (34, 0, 1051, CAST(N'2016-04-05 13:22:00.887' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (35, 0, 1050, CAST(N'2016-04-05 13:44:52.083' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (36, 0, 1051, CAST(N'2016-04-05 13:45:03.650' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (37, 0, 1051, CAST(N'2016-04-05 13:45:37.250' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (38, 0, 1051, CAST(N'2016-04-05 13:46:06.493' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (39, 0, 1052, CAST(N'2016-04-05 15:19:59.723' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (40, 0, 1053, CAST(N'2016-04-05 15:19:59.767' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (41, 0, 1050, CAST(N'2016-04-05 15:20:18.797' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (42, 0, 0, CAST(N'2016-04-05 15:20:22.963' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (43, 0, 1054, CAST(N'2016-04-05 15:20:40.890' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (44, 0, 1053, CAST(N'2016-04-05 15:22:56.033' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (45, 0, 1054, CAST(N'2016-04-05 15:23:37.573' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (46, 0, 1052, CAST(N'2016-04-05 15:24:06.717' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (47, 0, 1055, CAST(N'2016-04-05 15:28:23.373' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (48, 0, 1056, CAST(N'2016-04-05 15:28:23.437' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (49, 0, -1, CAST(N'2016-04-05 15:28:42.737' AS DateTime), N'Publish', N'ContentService.RebuildXmlStructures completed, the xml has been regenerated in the database')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (50, 0, 1053, CAST(N'2016-04-05 15:28:42.773' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (51, 0, 1052, CAST(N'2016-04-05 15:30:08.477' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (52, 0, 1053, CAST(N'2016-04-05 15:30:14.243' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (53, 0, 1055, CAST(N'2016-04-05 15:30:55.580' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (54, 0, 1049, CAST(N'2016-04-05 15:31:03.163' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (55, 0, 1052, CAST(N'2016-04-05 15:32:43.460' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (56, 0, 1052, CAST(N'2016-04-05 15:37:35.510' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (57, 0, 1057, CAST(N'2016-04-05 15:38:52.830' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (58, 0, 1058, CAST(N'2016-04-05 15:38:52.900' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (59, 0, 1053, CAST(N'2016-04-05 15:38:59.460' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (60, 0, 1053, CAST(N'2016-04-05 15:40:08.423' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (61, 0, 0, CAST(N'2016-04-05 15:40:33.177' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (62, 0, -1, CAST(N'2016-04-05 15:41:07.557' AS DateTime), N'Delete', N'Delete Content of Type 1058 performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (63, 0, 1058, CAST(N'2016-04-05 15:41:07.633' AS DateTime), N'Delete', N'Delete ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (64, 0, 1059, CAST(N'2016-04-05 15:41:22.317' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (65, 0, 1059, CAST(N'2016-04-05 15:41:32.423' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (66, 0, 1053, CAST(N'2016-04-05 15:41:37.367' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (67, 0, 1059, CAST(N'2016-04-05 15:42:31.513' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (68, 0, 0, CAST(N'2016-04-05 15:42:39.240' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (69, 0, 1060, CAST(N'2016-04-05 15:42:51.343' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (70, 0, 1059, CAST(N'2016-04-05 15:43:39.667' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (71, 0, 1050, CAST(N'2016-04-05 15:44:05.530' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (72, 0, 1050, CAST(N'2016-04-05 15:44:23.940' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (73, 0, 1050, CAST(N'2016-04-05 15:44:27.577' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (74, 0, 1056, CAST(N'2016-04-05 15:45:30.997' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (75, 0, 1053, CAST(N'2016-04-05 15:45:49.223' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (76, 0, 0, CAST(N'2016-04-05 15:46:05.743' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (77, 0, 1061, CAST(N'2016-04-05 15:46:21.067' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (78, 0, 0, CAST(N'2016-04-05 15:46:40.923' AS DateTime), N'Sort', N'Sorting content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (79, 0, 1062, CAST(N'2016-04-05 15:49:02.910' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (80, 0, 1063, CAST(N'2016-04-05 15:49:02.967' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (81, 0, 1050, CAST(N'2016-04-05 15:49:11.127' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (82, 0, 1063, CAST(N'2016-04-05 15:50:22.900' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (83, 0, 0, CAST(N'2016-04-05 15:50:27.937' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (84, 0, 1064, CAST(N'2016-04-05 15:50:38.340' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (85, 0, 1065, CAST(N'2016-04-05 15:57:28.240' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (86, 0, 1066, CAST(N'2016-04-05 15:57:28.323' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (87, 0, 1050, CAST(N'2016-04-05 15:57:36.623' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (88, 0, 1066, CAST(N'2016-04-05 15:58:03.553' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (89, 0, 0, CAST(N'2016-04-05 15:58:07.980' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (90, 0, 1067, CAST(N'2016-04-05 15:58:14.853' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (91, 0, 1065, CAST(N'2016-04-06 13:20:56.030' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (92, 0, 1062, CAST(N'2016-04-06 13:21:03.043' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (93, 0, 1050, CAST(N'2016-04-06 13:44:38.070' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (94, 0, 0, CAST(N'2016-04-06 13:44:47.493' AS DateTime), N'New', N'Media ''Banner'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (95, 0, 1068, CAST(N'2016-04-06 13:44:47.570' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (96, 0, 0, CAST(N'2016-04-06 13:46:19.603' AS DateTime), N'New', N'Media ''4.jpg'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (97, 0, 1069, CAST(N'2016-04-06 13:46:19.737' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (98, 0, 0, CAST(N'2016-04-06 13:46:27.123' AS DateTime), N'New', N'Media ''3.jpg'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (99, 0, 1070, CAST(N'2016-04-06 13:46:27.160' AS DateTime), N'Save', N'Save Media performed by user')
GO
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (100, 0, 1051, CAST(N'2016-04-06 13:46:35.380' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (101, 0, 1050, CAST(N'2016-04-06 13:46:51.383' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (102, 0, 1051, CAST(N'2016-04-06 13:47:04.067' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (103, 0, 1054, CAST(N'2016-04-06 13:48:44.420' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (104, 0, -1, CAST(N'2016-04-06 13:54:03.367' AS DateTime), N'PackagerInstall', N'Package ''U7 Grid Data Type'' installed. Package guid: ')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (105, 0, -1, CAST(N'2016-04-06 13:54:05.420' AS DateTime), N'Save', N'Save ContentTypes performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (106, 0, 1071, CAST(N'2016-04-06 13:55:54.487' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (107, 0, 1050, CAST(N'2016-04-06 13:56:16.167' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (108, 0, 1071, CAST(N'2016-04-06 13:56:39.473' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (109, 0, 1051, CAST(N'2016-04-06 13:56:51.040' AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (110, 0, 1051, CAST(N'2016-04-06 13:57:05.517' AS DateTime), N'Save', N'Save Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (111, 0, 1071, CAST(N'2016-04-06 13:57:31.593' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (112, 0, 1071, CAST(N'2016-04-06 13:57:42.693' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (113, 0, 1050, CAST(N'2016-04-06 13:57:57.770' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (114, 0, 1051, CAST(N'2016-04-06 13:59:01.823' AS DateTime), N'Publish', N'Publish with Children performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (115, 0, 1050, CAST(N'2016-04-06 13:59:43.387' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (116, 0, 1050, CAST(N'2016-04-06 13:59:46.980' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (117, 0, 1051, CAST(N'2016-04-06 13:59:56.220' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (118, 0, 1050, CAST(N'2016-04-06 14:00:20.260' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (119, 0, 1051, CAST(N'2016-04-06 14:00:46.453' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (120, 0, 1056, CAST(N'2016-04-06 14:23:04.590' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (121, 0, 1061, CAST(N'2016-04-06 14:23:56.040' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (122, 0, 1064, CAST(N'2016-04-06 14:24:11.717' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (123, 0, 1067, CAST(N'2016-04-06 14:24:21.867' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (124, 0, 1061, CAST(N'2016-04-06 14:25:12.873' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (125, 0, 1061, CAST(N'2016-04-06 15:52:26.320' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (126, 0, 1061, CAST(N'2016-04-06 15:52:50.927' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (127, 0, 1061, CAST(N'2016-04-06 15:54:03.300' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (128, 0, 1061, CAST(N'2016-04-06 16:00:04.267' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (129, 0, 1061, CAST(N'2016-04-06 16:00:54.167' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (130, 0, 1061, CAST(N'2016-04-06 16:01:30.123' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (131, 0, 1061, CAST(N'2016-04-06 16:02:17.027' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (132, 0, 1061, CAST(N'2016-04-06 16:06:17.073' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (133, 0, 0, CAST(N'2016-04-06 16:52:02.650' AS DateTime), N'New', N'Media ''Product'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (134, 0, 1072, CAST(N'2016-04-06 16:52:02.713' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (135, 0, 0, CAST(N'2016-04-06 16:52:17.377' AS DateTime), N'New', N'Media ''RP01'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (136, 0, 1073, CAST(N'2016-04-06 16:52:17.390' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (137, 0, 0, CAST(N'2016-04-06 16:52:21.487' AS DateTime), N'New', N'Media ''about-rp.jpg'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (138, 0, 1074, CAST(N'2016-04-06 16:52:21.620' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (139, 0, 1060, CAST(N'2016-04-06 16:52:26.857' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (140, 0, 1060, CAST(N'2016-04-06 16:54:17.730' AS DateTime), N'Copy', N'Copy Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (141, 0, 1075, CAST(N'2016-04-06 16:54:26.667' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (142, 0, 1060, CAST(N'2016-04-06 16:54:38.883' AS DateTime), N'Copy', N'Copy Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (143, 0, 1060, CAST(N'2016-04-06 16:54:50.603' AS DateTime), N'Copy', N'Copy Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (144, 0, 1060, CAST(N'2016-04-06 16:54:57.290' AS DateTime), N'Copy', N'Copy Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (145, 0, 1060, CAST(N'2016-04-06 16:55:03.567' AS DateTime), N'Copy', N'Copy Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (146, 0, 1060, CAST(N'2016-04-06 16:55:10.560' AS DateTime), N'Copy', N'Copy Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (147, 0, 1060, CAST(N'2016-04-06 16:55:19.287' AS DateTime), N'Copy', N'Copy Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (148, 0, 1060, CAST(N'2016-04-06 16:55:29.097' AS DateTime), N'Copy', N'Copy Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (149, 0, 1060, CAST(N'2016-04-06 16:55:35.033' AS DateTime), N'Copy', N'Copy Content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (150, 0, 1076, CAST(N'2016-04-06 16:55:46.320' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (151, 0, 1077, CAST(N'2016-04-06 16:55:55.637' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (152, 0, 1078, CAST(N'2016-04-06 16:56:03.533' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (153, 0, 1079, CAST(N'2016-04-06 16:56:11.370' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (154, 0, 1080, CAST(N'2016-04-06 16:56:21.267' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (155, 0, 1081, CAST(N'2016-04-06 16:56:30.237' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (156, 0, 1082, CAST(N'2016-04-06 16:56:38.480' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (157, 0, 1083, CAST(N'2016-04-06 16:56:45.967' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (158, 0, 1054, CAST(N'2016-04-07 10:51:10.430' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (159, 0, 0, CAST(N'2016-04-12 13:19:48.690' AS DateTime), N'New', N'Media ''t_o.jpg'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (160, 0, 0, CAST(N'2016-04-12 13:19:48.690' AS DateTime), N'New', N'Media ''cam_xoan2_1.jpg'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (161, 0, 1084, CAST(N'2016-04-12 13:19:48.983' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (162, 0, 1085, CAST(N'2016-04-12 13:19:48.990' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (163, 0, 1051, CAST(N'2016-04-12 13:20:10.060' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (164, 0, 1054, CAST(N'2016-04-12 13:23:33.397' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (165, 0, 1059, CAST(N'2016-04-12 13:44:46.333' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (166, 0, 1060, CAST(N'2016-04-12 13:45:13.053' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (167, 0, 1061, CAST(N'2016-04-12 14:17:15.980' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (168, 0, 1060, CAST(N'2016-04-12 16:10:23.957' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (169, 0, 1050, CAST(N'2016-04-12 16:11:09.053' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (170, 0, 1050, CAST(N'2016-04-12 16:12:04.770' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (171, 0, 1050, CAST(N'2016-04-12 16:13:11.457' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (172, 0, 1086, CAST(N'2016-04-12 16:15:14.367' AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (173, 0, 1050, CAST(N'2016-04-12 16:15:33.290' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (174, 0, 1051, CAST(N'2016-04-12 16:15:50.927' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (175, 0, 1060, CAST(N'2016-04-13 13:57:35.570' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (176, 0, 1075, CAST(N'2016-04-13 13:57:51.580' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (177, 0, 1059, CAST(N'2016-04-13 13:58:36.677' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (178, 0, 1059, CAST(N'2016-04-13 14:00:52.107' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (179, 0, 1060, CAST(N'2016-04-13 14:02:25.427' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (180, 0, 1060, CAST(N'2016-04-13 14:09:09.380' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (181, 0, 1059, CAST(N'2016-04-13 14:14:24.420' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (182, 0, 1060, CAST(N'2016-04-13 14:19:06.910' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (183, 0, 1060, CAST(N'2016-04-13 14:20:04.830' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (184, 0, 1060, CAST(N'2016-04-13 14:20:26.807' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (185, 0, 1060, CAST(N'2016-04-13 14:21:13.363' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (186, 0, 1060, CAST(N'2016-04-13 14:21:26.480' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (187, 0, 1051, CAST(N'2016-04-29 10:45:24.043' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (188, 0, 2, CAST(N'2016-07-09 17:04:48.110' AS DateTime), N'Save', N'Save Language performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (189, 0, 1, CAST(N'2016-07-09 17:05:36.563' AS DateTime), N'Save', N'Save DictionaryItem performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (190, 0, 1, CAST(N'2016-07-09 17:05:36.690' AS DateTime), N'Save', N'Save DictionaryItem performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (191, 0, 1051, CAST(N'2017-01-08 16:12:26.917' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (192, 0, 1051, CAST(N'2017-01-08 16:15:48.700' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (193, 0, 1051, CAST(N'2017-01-08 16:16:12.263' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (194, 0, 1051, CAST(N'2017-01-08 16:17:31.220' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (195, 0, 1069, CAST(N'2017-01-08 16:30:53.927' AS DateTime), N'Move', N'Move Media to Recycle Bin performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (196, 0, 1070, CAST(N'2017-01-08 16:31:00.667' AS DateTime), N'Move', N'Move Media to Recycle Bin performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (197, 0, 1084, CAST(N'2017-01-08 16:31:03.983' AS DateTime), N'Move', N'Move Media to Recycle Bin performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (198, 0, 1085, CAST(N'2017-01-08 16:31:07.793' AS DateTime), N'Move', N'Move Media to Recycle Bin performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (199, 0, 0, CAST(N'2017-01-08 16:33:56.713' AS DateTime), N'New', N'Media ''Bo1.3.jpg'' was created')
GO
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (200, 0, 0, CAST(N'2017-01-08 16:33:56.990' AS DateTime), N'New', N'Media ''KEN_9149.jpg'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (201, 0, 1087, CAST(N'2017-01-08 16:33:57.130' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (202, 0, 1088, CAST(N'2017-01-08 16:33:57.233' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (203, 0, 0, CAST(N'2017-01-08 16:33:57.233' AS DateTime), N'New', N'Media ''NUPA5843x-copy.jpg'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (204, 0, 1089, CAST(N'2017-01-08 16:33:57.367' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (205, 0, 1051, CAST(N'2017-01-08 16:34:29.223' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (206, 0, 0, CAST(N'2017-01-08 16:36:18.720' AS DateTime), N'New', N'Media ''KEN_3524.jpg'' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (207, 0, 1090, CAST(N'2017-01-08 16:36:18.863' AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (208, 0, 1051, CAST(N'2017-01-08 16:36:22.850' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (209, 0, 0, CAST(N'2017-01-08 16:41:23.927' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (210, 0, 1091, CAST(N'2017-01-08 16:41:38.293' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (211, 0, 0, CAST(N'2017-01-08 16:42:06.770' AS DateTime), N'Sort', N'Sorting content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (212, 0, 1092, CAST(N'2017-01-08 16:54:21.197' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (213, 0, 1093, CAST(N'2017-01-08 16:54:48.493' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (214, 0, 1094, CAST(N'2017-01-08 16:54:48.507' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (215, 0, 1050, CAST(N'2017-01-08 16:55:47.207' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (216, 0, 0, CAST(N'2017-01-08 16:55:51.917' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (217, 0, 1095, CAST(N'2017-01-08 16:56:01.573' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (218, 0, 1092, CAST(N'2017-01-08 16:56:16.173' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (219, 0, 1095, CAST(N'2017-01-08 16:56:21.267' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (220, 0, 1095, CAST(N'2017-01-08 16:56:27.520' AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (221, 0, 1095, CAST(N'2017-01-08 16:56:27.683' AS DateTime), N'Delete', N'Trashed content with Id: ''1095'' related to original parent content with Id: ''1051''')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (222, 0, 1095, CAST(N'2017-01-08 16:56:27.683' AS DateTime), N'Move', N'Move Content to Recycle Bin performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (223, 0, 1092, CAST(N'2017-01-08 16:56:52.280' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (224, 0, 0, CAST(N'2017-01-08 16:57:03.777' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (225, 0, 1096, CAST(N'2017-01-08 16:57:09.420' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (226, 0, 1096, CAST(N'2017-01-08 16:57:20.590' AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (227, 0, 1096, CAST(N'2017-01-08 16:57:20.630' AS DateTime), N'Delete', N'Trashed content with Id: ''1096'' related to original parent content with Id: ''-1''')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (228, 0, 1096, CAST(N'2017-01-08 16:57:20.640' AS DateTime), N'Move', N'Move Content to Recycle Bin performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (229, 0, 0, CAST(N'2017-01-08 16:57:25.460' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (230, 0, 1097, CAST(N'2017-01-08 16:57:30.847' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (231, 0, 1097, CAST(N'2017-01-08 16:58:22.760' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (232, 0, 1097, CAST(N'2017-01-08 16:58:33.020' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (233, 0, 1051, CAST(N'2017-01-08 16:58:35.890' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (234, 0, 1092, CAST(N'2017-01-08 17:00:08.457' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (235, 0, 1094, CAST(N'2017-01-08 17:00:28.570' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (236, 0, 0, CAST(N'2017-01-08 17:00:41.497' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (237, 0, 1098, CAST(N'2017-01-08 17:00:58.837' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (238, 0, 0, CAST(N'2017-01-08 17:01:01.827' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (239, 0, 1099, CAST(N'2017-01-08 17:01:08.603' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (240, 0, 0, CAST(N'2017-01-08 17:01:23.290' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (241, 0, 1100, CAST(N'2017-01-08 17:01:29.810' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (242, 0, 1101, CAST(N'2017-01-08 17:03:50.320' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (243, 0, 1102, CAST(N'2017-01-08 17:03:50.423' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (244, 0, 1103, CAST(N'2017-01-08 17:03:59.333' AS DateTime), N'Save', N'Save Template performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (245, 0, 1104, CAST(N'2017-01-08 17:03:59.387' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (246, 0, 1050, CAST(N'2017-01-08 17:04:07.913' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (247, 0, 1102, CAST(N'2017-01-08 17:04:15.607' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (248, 0, 1064, CAST(N'2017-01-08 17:04:41.340' AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (249, 0, 1064, CAST(N'2017-01-08 17:04:41.383' AS DateTime), N'Delete', N'Trashed content with Id: ''1064'' related to original parent content with Id: ''1051''')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (250, 0, 1064, CAST(N'2017-01-08 17:04:41.387' AS DateTime), N'Move', N'Move Content to Recycle Bin performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (251, 0, 0, CAST(N'2017-01-08 17:04:46.273' AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (252, 0, 1105, CAST(N'2017-01-08 17:04:58.010' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (253, 0, 1102, CAST(N'2017-01-08 17:05:23.303' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (254, 0, 1104, CAST(N'2017-01-08 17:05:32.863' AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (255, 0, 0, CAST(N'2017-01-08 17:06:17.647' AS DateTime), N'Sort', N'Sorting content performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (256, 0, 1051, CAST(N'2017-01-08 17:16:24.740' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (257, 0, 1051, CAST(N'2017-01-08 17:17:15.150' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (258, 0, 1051, CAST(N'2017-01-08 17:19:21.103' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (259, 0, 1051, CAST(N'2017-01-08 17:19:59.203' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (260, 0, 1051, CAST(N'2017-01-08 17:20:37.293' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (261, 0, 1051, CAST(N'2017-01-08 17:53:47.453' AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (262, 0, 1051, CAST(N'2017-01-08 20:16:50.813' AS DateTime), N'Publish', N'Save and Publish performed by user')
SET IDENTITY_INSERT [dbo].[umbracoLog] OFF
SET IDENTITY_INSERT [dbo].[umbracoMigration] ON 

INSERT [dbo].[umbracoMigration] ([id], [name], [createDate], [version]) VALUES (1, N'Umbraco', CAST(N'2016-04-05 10:37:10.927' AS DateTime), N'7.3.0')
SET IDENTITY_INSERT [dbo].[umbracoMigration] OFF
SET IDENTITY_INSERT [dbo].[umbracoNode] ON 

INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-97, 0, -1, 0, 1, N'-1,-97', 2, N'aa2c52a0-ce87-4e65-a47c-7df09358585d', N'List View - Members', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-04-05 10:37:10.430' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-96, 0, -1, 0, 1, N'-1,-96', 2, N'3a0156c4-3b8c-4803-bdc1-6871faa83fff', N'List View - Media', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-04-05 10:37:10.430' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-95, 0, -1, 0, 1, N'-1,-95', 2, N'c0808dd3-8133-4e4b-8ce8-e2bea84a96a4', N'List View - Content', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-04-05 10:37:10.430' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-92, 0, -1, 0, 1, N'-1,-92', 35, N'f0bc4bfb-b499-40d6-ba86-058885a5178c', N'Label', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-04-05 10:37:10.427' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-90, 0, -1, 0, 1, N'-1,-90', 34, N'84c6b441-31df-4ffe-b67e-67d5bc3ae65a', N'Upload', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-04-05 10:37:10.427' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-89, 0, -1, 0, 1, N'-1,-89', 33, N'c6bac0dd-4ab9-45b1-8e30-e4b619ee5da3', N'Textbox multiple', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-04-05 10:37:10.427' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-88, 0, -1, 0, 1, N'-1,-88', 32, N'0cc0eba1-9960-42c9-bf9b-60e150b429ae', N'Textstring', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-04-05 10:37:10.427' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-87, 0, -1, 0, 1, N'-1,-87', 4, N'ca90c950-0aff-4e72-b976-a30b1ac57dad', N'Richtext editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-04-05 10:37:10.430' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-51, 0, -1, 0, 1, N'-1,-51', 2, N'2e6d3631-066e-44b8-aec4-96f09099b2b5', N'Numeric', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-04-05 10:37:10.430' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-49, 0, -1, 0, 1, N'-1,-49', 2, N'92897bc6-a5f3-4ffe-ae27-f2e7e33dda49', N'True/false', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-04-05 10:37:10.430' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-43, 0, -1, 0, 1, N'-1,-43', 2, N'fbaf13a8-4036-41f2-93a3-974f678c312a', N'Checkbox list', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-04-05 10:37:10.430' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-42, 0, -1, 0, 1, N'-1,-42', 2, N'0b6a45e7-44ba-430d-9da5-4e46060b9e03', N'Dropdown', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-04-05 10:37:10.430' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-41, 0, -1, 0, 1, N'-1,-41', 2, N'5046194e-4237-453c-a547-15db3a07c4e1', N'Date Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-04-05 10:37:10.430' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-40, 0, -1, 0, 1, N'-1,-40', 2, N'bb5f57c9-ce2b-4bb9-b697-4caca783a805', N'Radiobox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-04-05 10:37:10.430' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-39, 0, -1, 0, 1, N'-1,-39', 2, N'f38f0ac7-1d27-439c-9f3f-089cd8825a53', N'Dropdown multiple', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-04-05 10:37:10.430' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-38, 0, -1, 0, 1, N'-1,-38', 2, N'fd9f1447-6c61-4a7c-9595-5aa39147d318', N'Folder Browser', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-04-05 10:37:10.430' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-37, 0, -1, 0, 1, N'-1,-37', 2, N'0225af17-b302-49cb-9176-b9f35cab9c17', N'Approved Color', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-04-05 10:37:10.430' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-36, 0, -1, 0, 1, N'-1,-36', 2, N'e4d66c0f-b935-4200-81f0-025f7256b89a', N'Date Picker with time', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-04-05 10:37:10.430' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-21, 0, -1, 0, 0, N'-1,-21', 0, N'bf7c7cbc-952f-4518-97a2-69e9c7b33842', N'Recycle Bin', N'cf3d8e34-1c1c-41e9-ae56-878b57b32113', CAST(N'2016-04-05 10:37:10.427' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-20, 0, -1, 0, 0, N'-1,-20', 0, N'0f582a79-1e41-4cf0-bfa0-76340651891a', N'Recycle Bin', N'01bb7ff2-24dc-4c0c-95a2-c24ef72bbac8', CAST(N'2016-04-05 10:37:10.427' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-1, 0, -1, 0, 0, N'-1', 0, N'916724a5-173d-4619-b97e-b9de133dd6f5', N'SYSTEM DATA: umbraco master root', N'ea7d8624-4cfe-4578-a871-24aa946bf34d', CAST(N'2016-04-05 10:37:10.423' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1031, 0, -1, 0, 1, N'-1,1031', 2, N'f38bd2d7-65d0-48e6-95dc-87ce06ec2d3d', N'Folder', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2016-04-05 10:37:10.430' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1032, 0, -1, 0, 1, N'-1,1032', 2, N'cc07b313-0843-4aa8-bbda-871c8da728c8', N'Image', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2016-04-05 10:37:10.433' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1033, 0, -1, 0, 1, N'-1,1033', 2, N'4c52d8ab-54e6-40cd-999c-7a5f24903e4d', N'File', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2016-04-05 10:37:10.433' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1034, 0, -1, 0, 1, N'-1,1034', 2, N'a6857c73-d6e9-480c-b6e6-f15f6ad11125', N'Content Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-04-05 10:37:10.433' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1035, 0, -1, 0, 1, N'-1,1035', 2, N'93929b9a-93a2-4e2a-b239-d99334440a59', N'Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-04-05 10:37:10.433' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1036, 0, -1, 0, 1, N'-1,1036', 2, N'2b24165f-9782-4aa3-b459-1de4a4d21f60', N'Member Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-04-05 10:37:10.433' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1040, 0, -1, 0, 1, N'-1,1040', 2, N'21e798da-e06e-4eda-a511-ed257f78d4fa', N'Related Links', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-04-05 10:37:10.433' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1041, 0, -1, 0, 1, N'-1,1041', 2, N'b6b73142-b9c1-4bf8-a16d-e1c23320b549', N'Tags', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-04-05 10:37:10.433' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1043, 0, -1, 0, 1, N'-1,1043', 2, N'1df9f033-e6d4-451f-b8d2-e0cbc50a836f', N'Image Cropper', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-04-05 10:37:10.433' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1044, 0, -1, 0, 1, N'-1,1044', 0, N'd59be02f-1df9-4228-aa1e-01917d806cda', N'Member', N'9b5416fb-e72f-45a9-a07b-5a9a2709ce43', CAST(N'2016-04-05 10:37:10.433' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1045, 0, -1, 0, 1, N'-1,1045', 2, N'7e3962cc-ce20-4ffc-b661-5897a894ba7e', N'Multiple Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-04-05 10:37:10.433' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1047, 0, -1, NULL, 1, N'-1,1047', 0, N'64d69b92-f0fe-4c9a-a40c-8ea04bb827ce', N'MasterPage', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2016-04-05 10:47:32.197' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1048, 0, -1, 0, 1, N'-1,1048', 0, N'f6d8a232-e5f2-4e1a-8afa-54ecb9c4dea0', N'MasterPage', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2016-04-05 10:47:32.303' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1049, 0, 1047, NULL, 1, N'-1,1047,1049', 0, N'004fa063-d2e0-4188-995a-f4431ca5f4da', N'Homepage', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2016-04-05 10:53:32.417' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1050, 0, 1048, 0, 2, N'-1,1048,1050', 6, N'35bbe81e-ddba-413a-96ce-c418ee1a7e21', N'Homepage', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2016-04-05 10:53:32.457' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1051, 0, -1, 0, 1, N'-1,1051', 0, N'03c97828-eb70-410c-a4a0-39b92ca110b5', N'Trang Chủ', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-04-05 11:08:50.610' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1052, 0, 1047, NULL, 1, N'-1,1047,1052', 0, N'cb3bc478-e0a0-4fbe-8a05-b46c961b2b1a', N'ProductPage', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2016-04-05 15:19:59.697' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1053, 0, 1048, 0, 2, N'-1,1048,1053', 1, N'38b778dc-0248-4203-ab04-3419136c6254', N'Product', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2016-04-05 15:19:59.737' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1054, 0, 1051, 0, 2, N'-1,1051,1054', 1, N'38fa5bd4-6653-4309-93fe-8763bf2bda58', N'Rồng phụng trái cây', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-04-05 15:20:40.827' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1055, 0, 1047, NULL, 1, N'-1,1047,1055', 0, N'81fa9a59-2d10-4e9e-b34b-92bdf5f4755d', N'About', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2016-04-05 15:28:23.357' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1056, 0, 1048, 0, 2, N'-1,1048,1056', 2, N'3137830e-be64-421b-9c56-732aa0e736e6', N'About', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2016-04-05 15:28:23.387' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1057, 0, -1, NULL, 1, N'-1,1057', 0, N'17b1049a-c35a-469e-925c-5a901c2ba737', N'Product Item', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2016-04-05 15:38:52.807' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1059, 0, 1048, 0, 2, N'-1,1048,1059', 3, N'ab4cde05-8232-42ae-8d3f-9863e5ba7a5d', N'Product Item', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2016-04-05 15:41:22.287' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1060, 0, 1054, 0, 3, N'-1,1051,1054,1060', 0, N'2013ba88-b3f3-42b6-905a-a8a0e70712af', N'Rồng phụng thâm quyến', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-04-05 15:42:51.230' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1061, 0, 1051, 0, 2, N'-1,1051,1061', 0, N'5154808d-5144-4df6-88c9-9f25184c52e0', N'Giới thiệu', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-04-05 15:46:21.013' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1062, 0, 1047, NULL, 1, N'-1,1047,1062', 0, N'a26fab97-d5f9-44dc-8838-8e6341a90a30', N'Fashion', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2016-04-05 15:49:02.873' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1063, 0, 1048, 0, 2, N'-1,1048,1063', 4, N'908b4be0-2d63-4b59-9d9f-905512626987', N'Fashion', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2016-04-05 15:49:02.940' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1064, 1, -20, 0, 1, N'-1,-20,1064', 3, N'fd7cd0d9-6aa7-43ce-98d1-492fa4ac233f', N'Thời trang', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-04-05 15:50:38.280' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1065, 0, 1047, NULL, 1, N'-1,1047,1065', 0, N'63873c22-4713-469f-9cfb-ca7c9d1a6813', N'ContactPage', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2016-04-05 15:57:28.203' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1066, 0, 1048, 0, 2, N'-1,1048,1066', 5, N'a4ef2cbb-4e4d-4f26-a559-eb304d187043', N'ContactPage', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2016-04-05 15:57:28.303' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1067, 0, 1051, 0, 2, N'-1,1051,1067', 5, N'cde7de7e-66d3-4acb-bbfe-fe0832d6aad0', N'Liên hệ', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-04-05 15:58:14.797' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1068, 0, -1, 0, 1, N'-1,1068', 0, N'848e301b-db30-45ce-b1e3-9039cf2463e4', N'Banner', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2016-04-06 13:44:47.493' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1069, 1, -21, 0, 1, N'-1,-21,1069', 1, N'19ed5e8f-f706-467d-83b6-facb47d71432', N'4.jpg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2016-04-06 13:46:19.697' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1070, 1, -21, 0, 1, N'-1,-21,1070', 2, N'a1f423eb-4a53-4191-aa95-e29d5cb697af', N'3.jpg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2016-04-06 13:46:27.147' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1071, 0, -1, 0, 1, N'-1,1071', 25, N'deb30dca-3cf5-4402-a2b5-339494dc794c', N'Data Grid', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-04-06 13:55:54.447' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1072, 0, -1, 0, 1, N'-1,1072', 1, N'ed18a64e-08a4-47e1-a2a2-7990909f2fca', N'Product', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2016-04-06 16:52:02.657' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1073, 0, 1072, 0, 2, N'-1,1072,1073', 0, N'6bdd26f2-d572-4d97-945f-fd7742f232f5', N'RP01', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2016-04-06 16:52:17.377' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1074, 0, 1073, 0, 3, N'-1,1072,1073,1074', 0, N'dc2d051c-412e-4a59-9e38-668cee0783c9', N'about-rp.jpg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2016-04-06 16:52:21.607' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1075, 0, 1054, 0, 3, N'-1,1051,1054,1075', 1, N'c705a36f-e322-4713-9235-6f4d254dedbd', N'Rồng phụng 2', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-04-06 16:54:17.677' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1076, 0, 1054, 0, 3, N'-1,1051,1054,1076', 2, N'52440f67-43b2-4f69-ad14-7e579baf7dee', N'Rồng phụng 3', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-04-06 16:54:38.843' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1077, 0, 1054, 0, 3, N'-1,1051,1054,1077', 3, N'18b48326-0e4f-4812-9964-d8d12b7468cc', N'Rồng phụng 4', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-04-06 16:54:50.563' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1078, 0, 1054, 0, 3, N'-1,1051,1054,1078', 4, N'f381174a-a127-4b79-8ca7-d8c8052a303f', N'Rồng phụng 5', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-04-06 16:54:57.273' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1079, 0, 1054, 0, 3, N'-1,1051,1054,1079', 5, N'8bba6abb-96a1-41ae-90a7-f7d581f77c3c', N'Rồng phụng 6', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-04-06 16:55:03.553' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1080, 0, 1054, 0, 3, N'-1,1051,1054,1080', 6, N'0ba31968-0791-443f-9e41-7095b732738f', N'Rồng phụng 7', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-04-06 16:55:10.547' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1081, 0, 1054, 0, 3, N'-1,1051,1054,1081', 7, N'4a2c3e26-08d6-4d58-b79a-e2648b4f623e', N'Rồng phụng 8', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-04-06 16:55:19.273' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1082, 0, 1054, 0, 3, N'-1,1051,1054,1082', 8, N'db905eac-ba15-4931-9318-e504e36938e7', N'Rồng phụng 9', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-04-06 16:55:29.083' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1083, 0, 1054, 0, 3, N'-1,1051,1054,1083', 9, N'6d077c0a-690f-4ba5-8a8a-adf9883c849c', N'Rồng phụng 10', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2016-04-06 16:55:35.020' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1084, 1, -21, 0, 1, N'-1,-21,1084', 3, N'8d68ceab-2403-4754-abbc-1fb0c7869e97', N'cam_xoan2_1.jpg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2016-04-12 13:19:48.813' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1085, 1, -21, 0, 1, N'-1,-21,1085', 4, N'e660bbc1-4c7c-4b9f-8ea6-cd241e50f44f', N't_o.jpg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2016-04-12 13:19:48.813' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1086, 0, -1, 0, 1, N'-1,1086', 26, N'55c57113-4067-457a-a658-cfe9ab745aa7', N'Product Highlight Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2016-04-12 16:15:14.330' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1087, 0, 1068, 0, 2, N'-1,1068,1087', 0, N'78baaaac-1a26-4ad6-a5b1-07e6530685ec', N'Bo1.3.jpg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2017-01-08 16:33:57.053' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1088, 0, 1068, 0, 2, N'-1,1068,1088', 1, N'0826ab98-3181-451c-8c8f-d3b6b81eb2f1', N'KEN_9149.jpg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2017-01-08 16:33:57.207' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1089, 0, 1068, 0, 2, N'-1,1068,1089', 2, N'd48691a6-391b-414c-8c9d-7eb326367268', N'NUPA5843x-copy.jpg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2017-01-08 16:33:57.350' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1090, 0, 1068, 0, 2, N'-1,1068,1090', 3, N'843830a7-8352-4aad-aa56-e30697df7401', N'KEN_3524.jpg', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2017-01-08 16:36:18.830' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1091, 0, 1051, 0, 2, N'-1,1051,1091', 2, N'a452b061-d348-4550-99ec-160b8e7ed6da', N'Album Ảnh', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2017-01-08 16:41:38.213' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1092, 0, 1048, 0, 2, N'-1,1048,1092', 6, N'6685f6b2-6700-4275-96ba-20e843e8ffb0', N'ServicesPage', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2017-01-08 16:54:21.083' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1093, 0, -1, NULL, 1, N'-1,1093', 0, N'345a697a-2f28-4e1d-8a4a-a08374a5293a', N'Service Detail Page', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2017-01-08 16:54:48.383' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1094, 0, 1048, 0, 2, N'-1,1048,1094', 7, N'cac3a759-373f-463f-81a5-f1dc50a419d7', N'Service Detail Page', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2017-01-08 16:54:48.500' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1095, 1, -20, 0, 1, N'-1,-20,1095', 1, N'2ac255c2-6bbf-4e05-8792-8b24c326e477', N'Dịch vụ', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2017-01-08 16:56:01.457' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1096, 1, -20, 0, 1, N'-1,-20,1096', 2, N'3b1be09c-1016-4e93-8c30-affcc53a656d', N'Dịch vụ (1)', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2017-01-08 16:57:09.377' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1097, 0, 1051, 0, 2, N'-1,1051,1097', 4, N'4cf1918d-7ec5-475f-87bf-f4d79196a4be', N'Dịch vụ', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2017-01-08 16:57:30.647' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1098, 0, 1097, 0, 3, N'-1,1051,1097,1098', 0, N'b5ecd9af-5bf0-442a-9757-0f3e549eb168', N'Trang Điểm Cô Dâu', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2017-01-08 17:00:58.780' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1099, 0, 1097, 0, 3, N'-1,1051,1097,1099', 1, N'369064bc-d371-44b9-bffd-78c426aa0403', N'Cho Thuê Xe Cưới', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2017-01-08 17:01:08.580' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1100, 0, 1097, 0, 3, N'-1,1051,1097,1100', 2, N'631782bb-a103-457f-b3ed-6a9ec62448dc', N'Chụp Hình Cưới', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2017-01-08 17:01:29.787' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1101, 0, -1, NULL, 1, N'-1,1101', 0, N'9e59b81e-a39a-452a-9569-18315359fb90', N'News', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2017-01-08 17:03:50.277' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1102, 0, 1048, 0, 2, N'-1,1048,1102', 8, N'b7f68d5c-9bac-4ccb-8959-f6905ea5f813', N'News', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2017-01-08 17:03:50.407' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1103, 0, -1, NULL, 1, N'-1,1103', 0, N'863774ce-0e53-42d8-bd1e-85c9c5d88431', N'News Detail', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2017-01-08 17:03:59.327' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1104, 0, 1048, 0, 2, N'-1,1048,1104', 9, N'324811e4-965f-464f-b779-c52d8a41c19a', N'News Detail', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2017-01-08 17:03:59.363' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1105, 0, 1051, 0, 2, N'-1,1051,1105', 3, N'c352b05e-da4a-4f4f-8f46-0a2a30dcee85', N'Thời Trang', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2017-01-08 17:04:57.970' AS DateTime))
SET IDENTITY_INSERT [dbo].[umbracoNode] OFF
SET IDENTITY_INSERT [dbo].[umbracoRelation] ON 

INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (1, 1051, 1095, 2, CAST(N'2017-01-08 16:56:27.647' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (2, -1, 1096, 2, CAST(N'2017-01-08 16:57:20.613' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (3, 1051, 1064, 2, CAST(N'2017-01-08 17:04:41.383' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[umbracoRelation] OFF
SET IDENTITY_INSERT [dbo].[umbracoRelationType] ON 

INSERT [dbo].[umbracoRelationType] ([id], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (1, 1, N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'Relate Document On Copy', N'relateDocumentOnCopy')
INSERT [dbo].[umbracoRelationType] ([id], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (2, 0, N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'Relate Parent Document On Delete', N'relateParentDocumentOnDelete')
SET IDENTITY_INSERT [dbo].[umbracoRelationType] OFF
SET IDENTITY_INSERT [dbo].[umbracoServer] ON 

INSERT [dbo].[umbracoServer] ([id], [address], [computerName], [registeredDate], [lastNotifiedDate], [isActive], [isMaster]) VALUES (1, N'http://localhost:29212/umbraco', N'HSSSC1PCL00010//LM/W3SVC/9/ROOT', CAST(N'2016-04-05 10:37:22.520' AS DateTime), CAST(N'2016-04-13 15:42:22.167' AS DateTime), 0, 0)
INSERT [dbo].[umbracoServer] ([id], [address], [computerName], [registeredDate], [lastNotifiedDate], [isActive], [isMaster]) VALUES (2, N'http://rongphung.guline.com:80/umbraco', N'GULINESOLUTION//LM/W3SVC/35/ROOT', CAST(N'2016-04-11 13:48:49.530' AS DateTime), CAST(N'2016-09-07 21:35:40.463' AS DateTime), 0, 0)
INSERT [dbo].[umbracoServer] ([id], [address], [computerName], [registeredDate], [lastNotifiedDate], [isActive], [isMaster]) VALUES (3, N'http://localhost:29212/umbraco', N'USER-PC//LM/W3SVC/12/ROOT', CAST(N'2016-09-10 09:51:40.973' AS DateTime), CAST(N'2016-12-31 16:52:53.567' AS DateTime), 0, 0)
INSERT [dbo].[umbracoServer] ([id], [address], [computerName], [registeredDate], [lastNotifiedDate], [isActive], [isMaster]) VALUES (4, N'http://localhost:29212/umbraco', N'USER-PC//LM/W3SVC/3/ROOT', CAST(N'2017-01-08 16:07:36.180' AS DateTime), CAST(N'2017-01-11 18:09:51.217' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[umbracoServer] OFF
SET IDENTITY_INSERT [dbo].[umbracoUser] ON 

INSERT [dbo].[umbracoUser] ([id], [userDisabled], [userNoConsole], [userType], [startStructureID], [startMediaID], [userName], [userLogin], [userPassword], [userEmail], [userLanguage], [securityStampToken], [failedLoginAttempts], [lastLockoutDate], [lastPasswordChangeDate], [lastLoginDate]) VALUES (0, 0, 0, 1, -1, -1, N'Hoang Vu', N'admin@admin.com', N'WWQRCSb3HLy/5+k2PmXAvr1Vj4s=', N'admin@admin.com', N'en-GB', N'ae173a25-b1e1-40ed-b408-23db3a3d6a83', 0, NULL, CAST(N'2016-04-05 10:37:11.270' AS DateTime), CAST(N'2016-04-05 10:37:11.130' AS DateTime))
INSERT [dbo].[umbracoUser] ([id], [userDisabled], [userNoConsole], [userType], [startStructureID], [startMediaID], [userName], [userLogin], [userPassword], [userEmail], [userLanguage], [securityStampToken], [failedLoginAttempts], [lastLockoutDate], [lastPasswordChangeDate], [lastLoginDate]) VALUES (1, 0, 0, 1, -1, -1, N'customer', N'customer', N'WWQRCSb3HLy/5+k2PmXAvr1Vj4s=', N'customer@customer.com', N'en', N'872605f3-df1b-4fe9-9e7a-3a50cf6ba9fb', 0, NULL, CAST(N'2016-07-09 17:02:32.483' AS DateTime), CAST(N'2016-07-09 17:02:07.493' AS DateTime))
SET IDENTITY_INSERT [dbo].[umbracoUser] OFF
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'content')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'developer')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'forms')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'media')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'member')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'settings')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'users')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (1, N'content')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (1, N'media')
SET IDENTITY_INSERT [dbo].[umbracoUserType] ON 

INSERT [dbo].[umbracoUserType] ([id], [userTypeAlias], [userTypeName], [userTypeDefaultPermissions]) VALUES (1, N'admin', N'Administrators', N'CADMOSKTPIURZ:5F7')
INSERT [dbo].[umbracoUserType] ([id], [userTypeAlias], [userTypeName], [userTypeDefaultPermissions]) VALUES (2, N'writer', N'Writer', N'CAH:F')
INSERT [dbo].[umbracoUserType] ([id], [userTypeAlias], [userTypeName], [userTypeDefaultPermissions]) VALUES (3, N'editor', N'Editors', N'CADMOSKTPUZ:5F')
INSERT [dbo].[umbracoUserType] ([id], [userTypeAlias], [userTypeName], [userTypeDefaultPermissions]) VALUES (4, N'translator', N'Translator', N'AF')
SET IDENTITY_INSERT [dbo].[umbracoUserType] OFF
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroUseInEditor]  DEFAULT ('0') FOR [macroUseInEditor]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroRefreshRate]  DEFAULT ('0') FOR [macroRefreshRate]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroCacheByPage]  DEFAULT ('1') FOR [macroCacheByPage]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroCachePersonalized]  DEFAULT ('0') FOR [macroCachePersonalized]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroDontRender]  DEFAULT ('0') FOR [macroDontRender]
GO
ALTER TABLE [dbo].[cmsMacroProperty] ADD  CONSTRAINT [DF_cmsMacroProperty_macroPropertySortOrder]  DEFAULT ('0') FOR [macroPropertySortOrder]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_Email]  DEFAULT ('''') FOR [Email]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_LoginName]  DEFAULT ('''') FOR [LoginName]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_Password]  DEFAULT ('''') FOR [Password]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_memberCanEdit]  DEFAULT ('0') FOR [memberCanEdit]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_viewOnProfile]  DEFAULT ('0') FOR [viewOnProfile]
GO
ALTER TABLE [dbo].[cmsTask] ADD  CONSTRAINT [DF_cmsTask_closed]  DEFAULT ('0') FOR [closed]
GO
ALTER TABLE [dbo].[cmsTask] ADD  CONSTRAINT [DF_cmsTask_DateTime]  DEFAULT (getdate()) FOR [DateTime]
GO
ALTER TABLE [dbo].[umbracoAccess] ADD  CONSTRAINT [DF_umbracoAccess_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoAccess] ADD  CONSTRAINT [DF_umbracoAccess_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoAccessRule] ADD  CONSTRAINT [DF_umbracoAccessRule_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoAccessRule] ADD  CONSTRAINT [DF_umbracoAccessRule_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoExternalLogin] ADD  CONSTRAINT [DF_umbracoExternalLogin_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[cmsContent]  WITH CHECK ADD  CONSTRAINT [FK_cmsContent_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContent] CHECK CONSTRAINT [FK_cmsContent_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType] CHECK CONSTRAINT [FK_cmsContentType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child] FOREIGN KEY([childContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child]
GO
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent] FOREIGN KEY([parentContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent]
GO
ALTER TABLE [dbo].[cmsDataType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDataType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDataType] CHECK CONSTRAINT [FK_cmsDataType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsDocument]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocument_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDocument] CHECK CONSTRAINT [FK_cmsDocument_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_umbracoNode_id] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsLanguageText]  WITH CHECK ADD  CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[cmsLanguageText] CHECK CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[cmsMacroProperty]  WITH CHECK ADD  CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id] FOREIGN KEY([macro])
REFERENCES [dbo].[cmsMacro] ([id])
GO
ALTER TABLE [dbo].[cmsMacroProperty] CHECK CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id]
GO
ALTER TABLE [dbo].[cmsMember]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMember] CHECK CONSTRAINT [FK_cmsMember_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId] FOREIGN KEY([Member])
REFERENCES [dbo].[cmsMember] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId]
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id] FOREIGN KEY([MemberGroup])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_umbracoNode_id] FOREIGN KEY([NodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyData_cmsPropertyType_id] FOREIGN KEY([propertytypeid])
REFERENCES [dbo].[cmsPropertyType] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyData] CHECK CONSTRAINT [FK_cmsPropertyData_cmsPropertyType_id]
GO
ALTER TABLE [dbo].[cmsPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyData_umbracoNode_id] FOREIGN KEY([contentNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyData] CHECK CONSTRAINT [FK_cmsPropertyData_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id] FOREIGN KEY([propertyTypeGroupId])
REFERENCES [dbo].[cmsPropertyTypeGroup] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id]
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyTypeGroup_cmsPropertyTypeGroup_id] FOREIGN KEY([parentGroupId])
REFERENCES [dbo].[cmsPropertyTypeGroup] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup] CHECK CONSTRAINT [FK_cmsPropertyTypeGroup_cmsPropertyTypeGroup_id]
GO
ALTER TABLE [dbo].[cmsStylesheet]  WITH CHECK ADD  CONSTRAINT [FK_cmsStylesheet_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsStylesheet] CHECK CONSTRAINT [FK_cmsStylesheet_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType] FOREIGN KEY([propertyTypeId])
REFERENCES [dbo].[cmsPropertyType] ([id])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsTags_id] FOREIGN KEY([tagId])
REFERENCES [dbo].[cmsTags] ([id])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsTags_id]
GO
ALTER TABLE [dbo].[cmsTags]  WITH CHECK ADD  CONSTRAINT [FK_cmsTags_cmsTags] FOREIGN KEY([ParentId])
REFERENCES [dbo].[cmsTags] ([id])
GO
ALTER TABLE [dbo].[cmsTags] CHECK CONSTRAINT [FK_cmsTags_cmsTags]
GO
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_cmsTaskType_id] FOREIGN KEY([taskTypeId])
REFERENCES [dbo].[cmsTaskType] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_cmsTaskType_id]
GO
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_umbracoUser] FOREIGN KEY([parentUserId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_umbracoUser]
GO
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_umbracoUser1] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_umbracoUser1]
GO
ALTER TABLE [dbo].[cmsTemplate]  WITH CHECK ADD  CONSTRAINT [FK_cmsTemplate_umbracoNode] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsTemplate] CHECK CONSTRAINT [FK_cmsTemplate_umbracoNode]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id1] FOREIGN KEY([loginNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id1]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id2] FOREIGN KEY([noAccessNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id2]
GO
ALTER TABLE [dbo].[umbracoAccessRule]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id] FOREIGN KEY([accessId])
REFERENCES [dbo].[umbracoAccess] ([id])
GO
ALTER TABLE [dbo].[umbracoAccessRule] CHECK CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id]
GO
ALTER TABLE [dbo].[umbracoDomains]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDomains_umbracoNode_id] FOREIGN KEY([domainRootStructureID])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoDomains] CHECK CONSTRAINT [FK_umbracoDomains_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoNode_umbracoNode_id] FOREIGN KEY([parentID])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoNode] CHECK CONSTRAINT [FK_umbracoNode_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode] FOREIGN KEY([parentId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode1] FOREIGN KEY([childId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode1]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id] FOREIGN KEY([relType])
REFERENCES [dbo].[umbracoRelationType] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id]
GO
ALTER TABLE [dbo].[umbracoUser]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser_umbracoUserType_id] FOREIGN KEY([userType])
REFERENCES [dbo].[umbracoUserType] ([id])
GO
ALTER TABLE [dbo].[umbracoUser] CHECK CONSTRAINT [FK_umbracoUser_umbracoUserType_id]
GO
ALTER TABLE [dbo].[umbracoUser2app]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2app_umbracoUser_id] FOREIGN KEY([user])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2app] CHECK CONSTRAINT [FK_umbracoUser2app_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodePermission_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodePermission] CHECK CONSTRAINT [FK_umbracoUser2NodePermission_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodePermission_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodePermission] CHECK CONSTRAINT [FK_umbracoUser2NodePermission_umbracoUser_id]
GO
USE [master]
GO
ALTER DATABASE [guline_rongphung] SET  READ_WRITE 
GO
