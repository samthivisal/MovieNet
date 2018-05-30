
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/30/2018 10:50:57
-- Generated from EDMX file: C:\Users\Visal\Desktop\MovieNet\MovieNetBack\DataModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [MovieNetDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_UserComments]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CommentsSet] DROP CONSTRAINT [FK_UserComments];
GO
IF OBJECT_ID(N'[dbo].[FK_MovieActor_Movie]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MovieActor] DROP CONSTRAINT [FK_MovieActor_Movie];
GO
IF OBJECT_ID(N'[dbo].[FK_MovieActor_Actor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MovieActor] DROP CONSTRAINT [FK_MovieActor_Actor];
GO
IF OBJECT_ID(N'[dbo].[FK_MovieComments]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CommentsSet] DROP CONSTRAINT [FK_MovieComments];
GO
IF OBJECT_ID(N'[dbo].[FK_UserStars]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StarsSet] DROP CONSTRAINT [FK_UserStars];
GO
IF OBJECT_ID(N'[dbo].[FK_MovieStars]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StarsSet] DROP CONSTRAINT [FK_MovieStars];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[UserSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserSet];
GO
IF OBJECT_ID(N'[dbo].[MovieSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MovieSet];
GO
IF OBJECT_ID(N'[dbo].[ActorSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ActorSet];
GO
IF OBJECT_ID(N'[dbo].[CommentsSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CommentsSet];
GO
IF OBJECT_ID(N'[dbo].[StarsSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StarsSet];
GO
IF OBJECT_ID(N'[dbo].[MovieActor]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MovieActor];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'UserSet'
CREATE TABLE [dbo].[UserSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Username] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'MovieSet'
CREATE TABLE [dbo].[MovieSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [Type] nvarchar(max)  NOT NULL,
    [Resume] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ActorSet'
CREATE TABLE [dbo].[ActorSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Firstname] nvarchar(max)  NOT NULL,
    [Lastname] nvarchar(max)  NOT NULL,
    [Birthday] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CommentsSet'
CREATE TABLE [dbo].[CommentsSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Text] nvarchar(max)  NOT NULL,
    [User_Id] int  NOT NULL,
    [Movie_Id] int  NOT NULL
);
GO

-- Creating table 'StarsSet'
CREATE TABLE [dbo].[StarsSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Value] nvarchar(max)  NOT NULL,
    [User_Id] int  NOT NULL,
    [Movie_Id] int  NOT NULL
);
GO

-- Creating table 'MovieActor'
CREATE TABLE [dbo].[MovieActor] (
    [Movie_Id] int  NOT NULL,
    [Actor_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'UserSet'
ALTER TABLE [dbo].[UserSet]
ADD CONSTRAINT [PK_UserSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MovieSet'
ALTER TABLE [dbo].[MovieSet]
ADD CONSTRAINT [PK_MovieSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ActorSet'
ALTER TABLE [dbo].[ActorSet]
ADD CONSTRAINT [PK_ActorSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CommentsSet'
ALTER TABLE [dbo].[CommentsSet]
ADD CONSTRAINT [PK_CommentsSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'StarsSet'
ALTER TABLE [dbo].[StarsSet]
ADD CONSTRAINT [PK_StarsSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Movie_Id], [Actor_Id] in table 'MovieActor'
ALTER TABLE [dbo].[MovieActor]
ADD CONSTRAINT [PK_MovieActor]
    PRIMARY KEY CLUSTERED ([Movie_Id], [Actor_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [User_Id] in table 'CommentsSet'
ALTER TABLE [dbo].[CommentsSet]
ADD CONSTRAINT [FK_UserComments]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserComments'
CREATE INDEX [IX_FK_UserComments]
ON [dbo].[CommentsSet]
    ([User_Id]);
GO

-- Creating foreign key on [Movie_Id] in table 'MovieActor'
ALTER TABLE [dbo].[MovieActor]
ADD CONSTRAINT [FK_MovieActor_Movie]
    FOREIGN KEY ([Movie_Id])
    REFERENCES [dbo].[MovieSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Actor_Id] in table 'MovieActor'
ALTER TABLE [dbo].[MovieActor]
ADD CONSTRAINT [FK_MovieActor_Actor]
    FOREIGN KEY ([Actor_Id])
    REFERENCES [dbo].[ActorSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MovieActor_Actor'
CREATE INDEX [IX_FK_MovieActor_Actor]
ON [dbo].[MovieActor]
    ([Actor_Id]);
GO

-- Creating foreign key on [Movie_Id] in table 'CommentsSet'
ALTER TABLE [dbo].[CommentsSet]
ADD CONSTRAINT [FK_MovieComments]
    FOREIGN KEY ([Movie_Id])
    REFERENCES [dbo].[MovieSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MovieComments'
CREATE INDEX [IX_FK_MovieComments]
ON [dbo].[CommentsSet]
    ([Movie_Id]);
GO

-- Creating foreign key on [User_Id] in table 'StarsSet'
ALTER TABLE [dbo].[StarsSet]
ADD CONSTRAINT [FK_UserStars]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserStars'
CREATE INDEX [IX_FK_UserStars]
ON [dbo].[StarsSet]
    ([User_Id]);
GO

-- Creating foreign key on [Movie_Id] in table 'StarsSet'
ALTER TABLE [dbo].[StarsSet]
ADD CONSTRAINT [FK_MovieStars]
    FOREIGN KEY ([Movie_Id])
    REFERENCES [dbo].[MovieSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MovieStars'
CREATE INDEX [IX_FK_MovieStars]
ON [dbo].[StarsSet]
    ([Movie_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------