
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 10/26/2014 09:53:10
-- Generated from EDMX file: C:\Users\Kelly\Documents\Visual Studio 2012\Projects\Practicum\Draft 15 (Alter DB)\Potluck\Potluck\Models\PotluckModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Potluck];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Events'
CREATE TABLE [dbo].[Events] (
    [eventId] int IDENTITY(1,1) NOT NULL,
    [eventName] nvarchar(max)  NOT NULL,
    [eventDate] datetime  NOT NULL,
    [eventStreetAddr] nvarchar(max)  NOT NULL,
    [eventCity] nvarchar(max)  NOT NULL,
    [eventState] nvarchar(max)  NOT NULL,
    [eventZip] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Menus'
CREATE TABLE [dbo].[Menus] (
    [menuId] int IDENTITY(1,1) NOT NULL,
    [itemName] nvarchar(max)  NOT NULL,
    [isMenuItem] bit  NOT NULL,
    [Event_eventId] int  NOT NULL
);
GO

-- Creating table 'Items'
CREATE TABLE [dbo].[Items] (
    [itemId] int IDENTITY(1,1) NOT NULL,
    [itemName] nvarchar(max)  NOT NULL,
    [Menu_menuId] int  NOT NULL
);
GO

-- Creating table 'EventUsers'
CREATE TABLE [dbo].[EventUsers] (
    [eventUserId] int IDENTITY(1,1) NOT NULL,
    [Event_eventId] int  NOT NULL,
    [User_userId] int  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [userId] int IDENTITY(1,1) NOT NULL,
    [lastName] nvarchar(max)  NOT NULL,
    [firstName] nvarchar(max)  NOT NULL,
    [email] nvarchar(max)  NOT NULL,
    [username] nvarchar(max)  NOT NULL,
    [password] nvarchar(max)  NOT NULL,
    [isPlanner] bit  NOT NULL
);
GO

-- Creating table 'UserItems'
CREATE TABLE [dbo].[UserItems] (
    [userItemId] int IDENTITY(1,1) NOT NULL,
    [Item_itemId] int  NOT NULL,
    [User_userId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [eventId] in table 'Events'
ALTER TABLE [dbo].[Events]
ADD CONSTRAINT [PK_Events]
    PRIMARY KEY CLUSTERED ([eventId] ASC);
GO

-- Creating primary key on [menuId] in table 'Menus'
ALTER TABLE [dbo].[Menus]
ADD CONSTRAINT [PK_Menus]
    PRIMARY KEY CLUSTERED ([menuId] ASC);
GO

-- Creating primary key on [itemId] in table 'Items'
ALTER TABLE [dbo].[Items]
ADD CONSTRAINT [PK_Items]
    PRIMARY KEY CLUSTERED ([itemId] ASC);
GO

-- Creating primary key on [eventUserId] in table 'EventUsers'
ALTER TABLE [dbo].[EventUsers]
ADD CONSTRAINT [PK_EventUsers]
    PRIMARY KEY CLUSTERED ([eventUserId] ASC);
GO

-- Creating primary key on [userId] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([userId] ASC);
GO

-- Creating primary key on [userItemId] in table 'UserItems'
ALTER TABLE [dbo].[UserItems]
ADD CONSTRAINT [PK_UserItems]
    PRIMARY KEY CLUSTERED ([userItemId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Event_eventId] in table 'EventUsers'
ALTER TABLE [dbo].[EventUsers]
ADD CONSTRAINT [FK_EventEventUser]
    FOREIGN KEY ([Event_eventId])
    REFERENCES [dbo].[Events]
        ([eventId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EventEventUser'
CREATE INDEX [IX_FK_EventEventUser]
ON [dbo].[EventUsers]
    ([Event_eventId]);
GO

-- Creating foreign key on [User_userId] in table 'EventUsers'
ALTER TABLE [dbo].[EventUsers]
ADD CONSTRAINT [FK_UserEventUser]
    FOREIGN KEY ([User_userId])
    REFERENCES [dbo].[Users]
        ([userId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserEventUser'
CREATE INDEX [IX_FK_UserEventUser]
ON [dbo].[EventUsers]
    ([User_userId]);
GO

-- Creating foreign key on [Menu_menuId] in table 'Items'
ALTER TABLE [dbo].[Items]
ADD CONSTRAINT [FK_MenuItem]
    FOREIGN KEY ([Menu_menuId])
    REFERENCES [dbo].[Menus]
        ([menuId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_MenuItem'
CREATE INDEX [IX_FK_MenuItem]
ON [dbo].[Items]
    ([Menu_menuId]);
GO

-- Creating foreign key on [Item_itemId] in table 'UserItems'
ALTER TABLE [dbo].[UserItems]
ADD CONSTRAINT [FK_ItemUserItem]
    FOREIGN KEY ([Item_itemId])
    REFERENCES [dbo].[Items]
        ([itemId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ItemUserItem'
CREATE INDEX [IX_FK_ItemUserItem]
ON [dbo].[UserItems]
    ([Item_itemId]);
GO

-- Creating foreign key on [User_userId] in table 'UserItems'
ALTER TABLE [dbo].[UserItems]
ADD CONSTRAINT [FK_UserUserItem]
    FOREIGN KEY ([User_userId])
    REFERENCES [dbo].[Users]
        ([userId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserUserItem'
CREATE INDEX [IX_FK_UserUserItem]
ON [dbo].[UserItems]
    ([User_userId]);
GO

-- Creating foreign key on [Event_eventId] in table 'Menus'
ALTER TABLE [dbo].[Menus]
ADD CONSTRAINT [FK_MenuEvent]
    FOREIGN KEY ([Event_eventId])
    REFERENCES [dbo].[Events]
        ([eventId])
--    ON DELETE NO ACTION ON UPDATE NO ACTION;
    ON DELETE CASCADE;

-- Creating non-clustered index for FOREIGN KEY 'FK_MenuEvent'
CREATE INDEX [IX_FK_MenuEvent]
ON [dbo].[Menus]
    ([Event_eventId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------