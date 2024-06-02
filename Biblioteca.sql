-- Criação do Banco de Dados "Livros"
CREATE DATABASE [Livros]
GO
USE [Livros]
GO

-- Tabela Atores
CREATE TABLE [dbo].Atores NOT NULL,
	[PrimeiroNome] varchar NULL,
	[UltimoNome] varchar NULL,
	[Genero] varchar NULL,
	CONSTRAINT [PK_Atores] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]

-- Tabela Livros
CREATE TABLE [dbo].Livros NOT NULL,
	[Titulo] varchar NULL,
	[AutorId] [int] NOT NULL,
	[AnoPublicacao] [int] NULL,
	CONSTRAINT [PK_Livros] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_Livros_Atores] FOREIGN KEY ([AutorId]) REFERENCES [dbo].[Atores] ([Id])
) ON [PRIMARY]

-- Tabela LivrosGenero
CREATE TABLE [dbo].LivrosGenero NOT NULL,
	[LivroId] [int] NOT NULL,
	[GeneroId] [int] NOT NULL,
	CONSTRAINT [PK_LivrosGenero] PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_LivrosGenero_Livros] FOREIGN KEY ([LivroId]) REFERENCES [dbo].[Livros] ([Id]),
	CONSTRAINT [FK_LivrosGenero_Generos] FOREIGN KEY ([GeneroId]) REFERENCES [dbo].[Generos] ([Id])
) ON [PRIMARY]

-- Tabela Generos
CREATE TABLE [dbo].Generos NOT NULL,
	[Genero] varchar NULL,
	CONSTRAINT [PK_Generos] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
