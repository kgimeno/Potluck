USE [Potluck];
GO
DELETE FROM Menus;
GO
DELETE FROM Events;
GO

INSERT INTO Events VALUES ('Bob''s Burger Showdown', '11-NOV-2014', '100 Main Street', 'Boulder', 'CO', '80305');
INSERT INTO Events VALUES ('Betty''s Baby Shower', '14-FEB-2015', '100 Main Street', 'Parker', 'CO', '80263');
INSERT INTO Events VALUES ('Holly''s Holiday Fest', '23-DEC-2014', '100 Main Street', 'Denver', 'CO', '80247');
INSERT INTO Events VALUES ('Frank''s Fourth of July BBQ', '04-JUL-2015', '100 Main Street', 'Longmont', 'CO', '80505');
INSERT INTO Events VALUES ('Cathy''s Cake Festival', '31-JAN-2015', '100 Main Street', 'Broomfield', 'CO', '80021');

INSERT INTO Menus VALUES ('Burger', 1, (SELECT eventId from Events WHERE eventName = 'Bob''s Burger Showdown'));
INSERT INTO Menus VALUES ('Buns', 1, (SELECT eventId from Events WHERE eventName = 'Bob''s Burger Showdown'));
INSERT INTO Menus VALUES ('Cheese', 0, (SELECT eventId from Events WHERE eventName = 'Bob''s Burger Showdown'));
INSERT INTO Menus VALUES ('Tomato', 1, (SELECT eventId from Events WHERE eventName = 'Bob''s Burger Showdown'));
INSERT INTO Menus VALUES ('Bacon', 1, (SELECT eventId from Events WHERE eventName = 'Bob''s Burger Showdown'));
INSERT INTO Menus VALUES ('Lettuce', 0, (SELECT eventId from Events WHERE eventName = 'Bob''s Burger Showdown'));
INSERT INTO Menus VALUES ('Potatoes', 1, (SELECT eventId from Events WHERE eventName = 'Bob''s Burger Showdown'));
INSERT INTO Menus VALUES ('Mustard', 0, (SELECT eventId from Events WHERE eventName = 'Bob''s Burger Showdown'));
INSERT INTO Menus VALUES ('Ketchup', 0, (SELECT eventId from Events WHERE eventName = 'Bob''s Burger Showdown'));
INSERT INTO Menus VALUES ('Pickles', 0, (SELECT eventId from Events WHERE eventName = 'Bob''s Burger Showdown'));

INSERT INTO Menus VALUES ('Cake', 1, (SELECT eventId from Events WHERE eventName = 'Betty''s Baby Shower'));
INSERT INTO Menus VALUES ('Sandwiches', 1, (SELECT eventId from Events WHERE eventName = 'Betty''s Baby Shower'));
INSERT INTO Menus VALUES ('Paper plates', 0, (SELECT eventId from Events WHERE eventName = 'Betty''s Baby Shower'));
INSERT INTO Menus VALUES ('Deviled eggs', 1, (SELECT eventId from Events WHERE eventName = 'Betty''s Baby Shower'));
INSERT INTO Menus VALUES ('Vegetable tray', 1, (SELECT eventId from Events WHERE eventName = 'Betty''s Baby Shower'));
INSERT INTO Menus VALUES ('Napkins', 0, (SELECT eventId from Events WHERE eventName = 'Betty''s Baby Shower'));
INSERT INTO Menus VALUES ('Cheese platter', 1, (SELECT eventId from Events WHERE eventName = 'Betty''s Baby Shower'));
INSERT INTO Menus VALUES ('Plasticware', 0, (SELECT eventId from Events WHERE eventName = 'Betty''s Baby Shower'));
INSERT INTO Menus VALUES ('Plastic cups', 0, (SELECT eventId from Events WHERE eventName = 'Betty''s Baby Shower'));
INSERT INTO Menus VALUES ('Soda pop', 0, (SELECT eventId from Events WHERE eventName = 'Betty''s Baby Shower'));

INSERT INTO Menus VALUES ('Cookies', 1, (SELECT eventId from Events WHERE eventName = 'Holly''s Holiday Fest'));
INSERT INTO Menus VALUES ('Deviled eggs', 1, (SELECT eventId from Events WHERE eventName = 'Holly''s Holiday Fest'));
INSERT INTO Menus VALUES ('Vegetable tray', 0, (SELECT eventId from Events WHERE eventName = 'Holly''s Holiday Fest'));
INSERT INTO Menus VALUES ('Paper plates', 1, (SELECT eventId from Events WHERE eventName = 'Holly''s Holiday Fest'));
INSERT INTO Menus VALUES ('Pie', 1, (SELECT eventId from Events WHERE eventName = 'Holly''s Holiday Fest'));
INSERT INTO Menus VALUES ('Paper cups', 0, (SELECT eventId from Events WHERE eventName = 'Holly''s Holiday Fest'));
INSERT INTO Menus VALUES ('Sandwiches', 1, (SELECT eventId from Events WHERE eventName = 'Holly''s Holiday Fest'));
INSERT INTO Menus VALUES ('Chips and salsa', 0, (SELECT eventId from Events WHERE eventName = 'Holly''s Holiday Fest'));
INSERT INTO Menus VALUES ('Bean dip', 0, (SELECT eventId from Events WHERE eventName = 'Holly''s Holiday Fest'));
INSERT INTO Menus VALUES ('Soda pop', 0, (SELECT eventId from Events WHERE eventName = 'Holly''s Holiday Fest'));

INSERT INTO Menus VALUES ('Chocolate cake', 1, (SELECT eventId from Events WHERE eventName = 'Cathy''s Cake Festival'));
INSERT INTO Menus VALUES ('Carrot cake', 1, (SELECT eventId from Events WHERE eventName = 'Cathy''s Cake Festival'));
INSERT INTO Menus VALUES ('Devil''s cake', 0, (SELECT eventId from Events WHERE eventName = 'Cathy''s Cake Festival'));
INSERT INTO Menus VALUES ('Marble cake', 1, (SELECT eventId from Events WHERE eventName = 'Cathy''s Cake Festival'));
INSERT INTO Menus VALUES ('Spice cake', 1, (SELECT eventId from Events WHERE eventName = 'Cathy''s Cake Festival'));
INSERT INTO Menus VALUES ('Vanilla cake', 0, (SELECT eventId from Events WHERE eventName = 'Cathy''s Cake Festival'));
INSERT INTO Menus VALUES ('Red velvet cake', 1, (SELECT eventId from Events WHERE eventName = 'Cathy''s Cake Festival'));
INSERT INTO Menus VALUES ('Coffee cake', 0, (SELECT eventId from Events WHERE eventName = 'Cathy''s Cake Festival'));
INSERT INTO Menus VALUES ('Hazelnut cake', 0, (SELECT eventId from Events WHERE eventName = 'Cathy''s Cake Festival'));
INSERT INTO Menus VALUES ('Lemon poppy seed cake', 0, (SELECT eventId from Events WHERE eventName = 'Cathy''s Cake Festival'));

INSERT INTO Menus VALUES ('Burger', 1, (SELECT eventId from Events WHERE eventName = 'Frank''s Fourth of July BBQ'));
INSERT INTO Menus VALUES ('Buns', 1, (SELECT eventId from Events WHERE eventName = 'Frank''s Fourth of July BBQ'));
INSERT INTO Menus VALUES ('Cheese', 0, (SELECT eventId from Events WHERE eventName = 'Frank''s Fourth of July BBQ'));
INSERT INTO Menus VALUES ('Bratwurst', 1, (SELECT eventId from Events WHERE eventName = 'Frank''s Fourth of July BBQ'));
INSERT INTO Menus VALUES ('Condiment', 1, (SELECT eventId from Events WHERE eventName = 'Frank''s Fourth of July BBQ'));
INSERT INTO Menus VALUES ('Pie', 0, (SELECT eventId from Events WHERE eventName = 'Frank''s Fourth of July BBQ'));
INSERT INTO Menus VALUES ('Cookies', 1, (SELECT eventId from Events WHERE eventName = 'Frank''s Fourth of July BBQ'));
INSERT INTO Menus VALUES ('Deviled eggs', 0, (SELECT eventId from Events WHERE eventName = 'Frank''s Fourth of July BBQ'));
INSERT INTO Menus VALUES ('Potatoes', 0, (SELECT eventId from Events WHERE eventName = 'Frank''s Fourth of July BBQ'));
INSERT INTO Menus VALUES ('Soda pop', 0, (SELECT eventId from Events WHERE eventName = 'Frank''s Fourth of July BBQ'));