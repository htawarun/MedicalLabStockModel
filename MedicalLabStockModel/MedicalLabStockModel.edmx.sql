
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/05/2016 15:45:44
-- Generated from EDMX file: C:\Projects\FirstRepo\MedicalLabStockSystem\MedicalLabStockModel\MedicalLabStockModel\MedicalLabStockModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [MedicalLabStock];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_BoxLot]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Boxes] DROP CONSTRAINT [FK_BoxLot];
GO
IF OBJECT_ID(N'[dbo].[FK_ReAgentManufacturer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ReAgents] DROP CONSTRAINT [FK_ReAgentManufacturer];
GO
IF OBJECT_ID(N'[dbo].[FK_SupplierLot]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Lots] DROP CONSTRAINT [FK_SupplierLot];
GO
IF OBJECT_ID(N'[dbo].[FK_LotReAgent]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Lots] DROP CONSTRAINT [FK_LotReAgent];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Suppliers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Suppliers];
GO
IF OBJECT_ID(N'[dbo].[Lots]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Lots];
GO
IF OBJECT_ID(N'[dbo].[Manufacturers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Manufacturers];
GO
IF OBJECT_ID(N'[dbo].[Boxes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Boxes];
GO
IF OBJECT_ID(N'[dbo].[ReAgents]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ReAgents];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Suppliers'
CREATE TABLE [dbo].[Suppliers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Lots'
CREATE TABLE [dbo].[Lots] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SupplierId] int  NOT NULL,
    [ReAgentId] int  NOT NULL,
    [Expiry] datetime  NOT NULL
);
GO

-- Creating table 'Manufacturers'
CREATE TABLE [dbo].[Manufacturers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Boxes'
CREATE TABLE [dbo].[Boxes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [LotId] int  NOT NULL
);
GO

-- Creating table 'ReAgents'
CREATE TABLE [dbo].[ReAgents] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ManufacturerId] int  NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Suppliers'
ALTER TABLE [dbo].[Suppliers]
ADD CONSTRAINT [PK_Suppliers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Lots'
ALTER TABLE [dbo].[Lots]
ADD CONSTRAINT [PK_Lots]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Manufacturers'
ALTER TABLE [dbo].[Manufacturers]
ADD CONSTRAINT [PK_Manufacturers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Boxes'
ALTER TABLE [dbo].[Boxes]
ADD CONSTRAINT [PK_Boxes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ReAgents'
ALTER TABLE [dbo].[ReAgents]
ADD CONSTRAINT [PK_ReAgents]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [LotId] in table 'Boxes'
ALTER TABLE [dbo].[Boxes]
ADD CONSTRAINT [FK_BoxLot]
    FOREIGN KEY ([LotId])
    REFERENCES [dbo].[Lots]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BoxLot'
CREATE INDEX [IX_FK_BoxLot]
ON [dbo].[Boxes]
    ([LotId]);
GO

-- Creating foreign key on [ManufacturerId] in table 'ReAgents'
ALTER TABLE [dbo].[ReAgents]
ADD CONSTRAINT [FK_ReAgentManufacturer]
    FOREIGN KEY ([ManufacturerId])
    REFERENCES [dbo].[Manufacturers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ReAgentManufacturer'
CREATE INDEX [IX_FK_ReAgentManufacturer]
ON [dbo].[ReAgents]
    ([ManufacturerId]);
GO

-- Creating foreign key on [SupplierId] in table 'Lots'
ALTER TABLE [dbo].[Lots]
ADD CONSTRAINT [FK_SupplierLot]
    FOREIGN KEY ([SupplierId])
    REFERENCES [dbo].[Suppliers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SupplierLot'
CREATE INDEX [IX_FK_SupplierLot]
ON [dbo].[Lots]
    ([SupplierId]);
GO

-- Creating foreign key on [ReAgentId] in table 'Lots'
ALTER TABLE [dbo].[Lots]
ADD CONSTRAINT [FK_LotReAgent]
    FOREIGN KEY ([ReAgentId])
    REFERENCES [dbo].[ReAgents]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LotReAgent'
CREATE INDEX [IX_FK_LotReAgent]
ON [dbo].[Lots]
    ([ReAgentId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------