DROP DATABASE IF EXISTS test_api;
CREATE DATABASE IF NOT EXISTS test_api;
USE test_api;


CREATE TABLE Users (
	id 			int AUTO_INCREMENT PRIMARY KEY,
	f_name		varchar(255),
	l_name		varchar(255),
	auth_level	SMALLINT
);

CREATE TABLE Roles (
	id			int PRIMARY KEY,
	description	varchar(255)
);

CREATE TABLE UserRoles (
	user_id		int NOT NULL,
	role_id		int NOT NULL,
	CONSTRAINT PK_UserRoles PRIMARY KEY 
	(
		user_id,
		role_id
	),
	FOREIGN KEY (user_id) REFERENCES users (id),
	FOREIGN KEY (role_id) REFERENCES roles (id)
);

CREATE TABLE ItemType (
	id 			int AUTO_INCREMENT PRIMARY KEY,
	description	varchar(255)
);

CREATE TABLE Organizations (
	id 			int AUTO_INCREMENT PRIMARY KEY,
	org_type	int,
	name 		varchar(255) NOT NULL,
	street1 	varchar(255),
	street2 	varchar(255),
	city		varchar(255),
	state		varchar(2),
	zip			varchar(10),
	webpage		varchar(255),
	phone		varchar(255),
	notes		varchar(255),
	longtitude	decimal(65,30),
	latitude	decimal(65,30),
	created_at	datetime,
	updated_at	timestamp DEFAULT CURRENT_TIMESTAMP,
	updated_by	int,
	FOREIGN KEY (updated_by) REFERENCES users (id),
	FOREIGN KEY (org_type) REFERENCES ItemType (id)
);

CREATE TABLE ItemCategories (
	id 			int PRIMARY KEY,
	description	varchar(255)
);

CREATE TABLE Items (
	id 			int AUTO_INCREMENT PRIMARY KEY,
	name 		varchar(255) NOT NULL,
	type		int NOT NULL,
	category	int,
	created_at	datetime DEFAULT CURRENT_TIMESTAMP,
	updated_at	timestamp DEFAULT CURRENT_TIMESTAMP,
	updated_by	int,
	FOREIGN KEY (updated_by) REFERENCES users (id),
	FOREIGN KEY (type) REFERENCES ItemType (id),
	FOREIGN KEY (category) REFERENCES ItemCategories (id)
);

CREATE TABLE OrganizationItems (
	org_id		int NOT NULL,
	item_id		int NOT NULL,
	CONSTRAINT PK_OrganizationItems PRIMARY KEY 
	(
		org_id,
		item_id
	),
	FOREIGN KEY (org_id) REFERENCES Organizations (id),
	FOREIGN KEY (item_id) REFERENCES Items (id)
);


/* ========================================================================
	TEST DATA: User Roles
   ======================================================================== */
INSERT INTO 
	Roles (id, description)
VALUES 
	(1, "Normal"),
	(2, "SuperUser"),
	(3, "Admin");

/* ========================================================================
	TEST DATA: Users
   ======================================================================== */
INSERT INTO
	Users (f_name, l_name, auth_level)
VALUES
	("Normal", "User", 1),
	("Super", "User", 2),
	("Admin", "User", 3);

/* ========================================================================
	TEST DATA: Item Types
   ======================================================================== */
INSERT INTO 
	ItemType (id, description)
VALUES 
	(1, "Reuse"),
	(2, "Repair"),
	(3, "Reuse and Repair");

/* ========================================================================
	TEST DATA: Reuse and Repair Categories
   ======================================================================== */
INSERT INTO 
	ItemCategories(id, description)
VALUES 
	(0, "Repair Items"),
	(1, "Household"),
	(2, "Bedding/Bath"),
	(3, "Children's Goods"),
	(4, "Appliances - Small"),
	(5, "Appliances - Large"),
	(6, "Building / Home Improvement"),
	(7, "Wearable items"),
	(8, "Usable Electronics"),
	(9, "Sporting Equipments / Camping"),
	(10, "Garden"),
	(11, "Food"),
	(12, "Medical Supplies"),
	(13, "Office Equipments"),
	(14, "Packing Materials"),
	(15, "Miscellaneous")
	;

/* ========================================================================
	TEST DATA: Reuse and Repair Items under categories
   ======================================================================== */
INSERT INTO
	Items (id, name, type, category)
VALUES
	(1, 'Arts and crafts ',1,1),
	(2, 'Barbeque grills',1,1),
	(3, 'Books',1,1),
	(4, 'Canning jars',1,1),
	(5, 'Cleaning supplies',1,1),
	(6, 'Clothes hangers',1,1),
	(7, 'Cookware',1,1),
	(8, 'Cookware',1,1),
	(9, 'Dishes',1,1),
	(10, 'Fabric',1,1),
	(11, 'Food storage containers',1,1),
	(12, 'Furniture',1,1),
	(13, 'Luggage',1,1),
	(14, 'Mattresses',1,1),
	(15, 'Ornaments',1,1),
	(16, 'Toiletries',1,1),
	(17, 'Utensils',1,1),
	(18, 'Blankets',1,2),
	(19, 'Comforters',1,2),
	(20, 'Linens',1,2),
	(21, 'Sheets',1,2),
	(22, 'Small rugs',1,2),
	(23, 'Towels ',1,2),
	(24, 'Arts and crafts ',1,3),
	(25, 'Baby carriers',1,3),
	(26, 'Baby gates',1,3),
	(27, 'Bike trailers',1,3),
	(28, 'Books',1,3),
	(29, 'Child car seats',1,3),
	(30, 'Clothes',1,3),
	(31, 'Crayons',1,3),
	(32, 'Cribs',1,3),
	(33, 'Diapers ',1,3),
	(34, 'High chairs',1,3),
	(35, 'Maternity',1,3),
	(36, 'Musical instruments',1,3),
	(37, 'Nursing items',1,3),
	(38, 'Playpens',1,3),
	(39, 'School supplies',1,3),
	(40, 'Strollers',1,3),
	(41, 'Toys',1,3),
	(42, 'Blenders',1,4),
	(43, 'Dehumidifiers',1,4),
	(44, 'Fans',1,4),
	(45, 'Microwaves',1,4),
	(46, 'Space heaters',1,4),
	(47, 'Toasters',1,4),
	(48, 'Vacuum cleaners',1,4),
	(49, 'Dishwashers',1,5),
	(50, 'Freezers',1,5),
	(51, 'Refrigerators',1,5),
	(52, 'Stoves',1,5),
	(53, 'Washers/ dryers',1,5),
	(54, 'Bricks',1,6),
	(55, 'Carpet padding',1,6),
	(56, 'Carpets',1,6),
	(57, 'Ceramic tiles',1,6),
	(58, 'Doors',1,6),
	(59, 'Drywall',1,6),
	(60, 'Electrical supplies',1,6),
	(61, 'Hand tools',1,6),
	(62, 'Hardware',1,6),
	(63, 'Insulation',1,6),
	(64, 'Ladders',1,6),
	(65, 'Light fixtures',1,6),
	(66, 'Lighting ballasts',1,6),
	(67, 'Lumber',1,6),
	(68, 'Motors',1,6),
	(69, 'Paint',1,6),
	(70, 'Pipe',1,6),
	(71, 'Plumbing',1,6),
	(72, 'Power tools',1,6),
	(73, 'Reusable metal items',1,6),
	(74, 'Roofing ',1,6),
	(75, 'Vinyl',1,6),
	(76, 'Windows',1,6),
	(77, 'Belts',1,7),
	(78, 'Boots',1,7),
	(79, 'Clothes',1,7),
	(80, 'Coats',1,7),
	(81, 'Hats',1,7),
	(82, 'Rainwear',1,7),
	(83, 'Sandals',1,7),
	(84, 'Shoes',1,7),
	(85, 'Calculators',1,8),
	(86, 'Cameras',1,8),
	(87, 'Cassette players',1,8),
	(88, 'Cd players',1,8),
	(89, 'Cds',1,8),
	(90, 'Cell phones',1,8),
	(91, 'Computers ',1,8),
	(92, 'Curling irons',1,8),
	(93, 'DVD players',1,8),
	(94, 'Game consoles',1,8),
	(95, 'GPS systems',1,8),
	(96, 'Hair dryers',1,8),
	(97, 'Monitors',1,8),
	(98, 'MP3 players',1,8),
	(99, 'Printers',1,8),
	(100, 'Projectors',1,8),
	(101, 'Receivers',1,8),
	(102, 'Scanners',1,8),
	(103, 'Speakers',1,8),
	(104, 'Tablets',1,8),
	(105, 'Telephones',1,8),
	(106, 'TVs',1,8),
	(107, 'Backpacks',1,9),
	(108, 'Balls',1,9),
	(109, 'Barbells',1,9),
	(110, 'Bicycles',1,9),
	(111, 'Bike tires ',1,9),
	(112, 'Camping equipment',1,9),
	(113, 'Day packs',1,9),
	(114, 'Dumbbells',1,9),
	(115, 'Exercise equipment',1,9),
	(116, 'Golf clubs',1,9),
	(117, 'Helmets',1,9),
	(118, 'Hiking boots',1,9),
	(119, 'Skateboards',1,9),
	(120, 'Skis',1,9),
	(121, 'Small boats',1,9),
	(122, 'Snowshoes',1,9),
	(123, 'Sporting goods',1,9),
	(124, 'Tennis rackets',1,9),
	(125, 'Tents',1,9),
	(126, 'Chain saws',1,10),
	(127, 'Fencing',1,10),
	(128, 'Garden pots',1,10),
	(129, 'Garden tools',1,10),
	(130, 'Hand clippers',1,10),
	(131, 'Hoses',1,10),
	(132, 'Lawn furniture',1,10),
	(133, 'Livestock supplies',1,10),
	(134, 'Loppers',1,10),
	(135, 'Mowers',1,10),
	(136, 'Seeders',1,10),
	(137, 'Soil amendment',1,10),
	(138, 'Sprinklers',1,10),
	(139, 'Wheel barrows',1,10),
	(140, 'Beverages',1,11),
	(141, 'Surplus garden produce',1,11),
	(142, 'Unopened canned goods',1,11),
	(143, 'Unopened packaged food',1,11),
	(144, 'Adult diapers',1,12),
	(145, 'Blood pressure monitors',1,12),
	(146, 'Canes',1,12),
	(147, 'Crutches',1,12),
	(148, 'Eye glasses',1,12),
	(149, 'Glucose meters',1,12),
	(150, 'Hearing aids',1,12),
	(151, 'Hospital beds',1,12),
	(152, 'Reach extenders',1,12),
	(153, 'Shower chairs',1,12),
	(154, 'Walkers',1,12),
	(155, 'Wheelchairs',1,12),
	(156, 'Calculators',1,13),
	(157, 'Computers ',1,13),
	(158, 'Fax machines',1,13),
	(159, 'Headsets',1,13),
	(160, 'Monitors',1,13),
	(161, 'Office furniture',1,13),
	(162, 'Paper shredders',1,13),
	(163, 'Printer cartridge refilling',1,13),
	(164, 'Printers',1,13),
	(165, 'Scanners',1,13),
	(166, 'Telephones',1,13),
	(167, 'Bubble wrap',1,14),
	(168, 'Clean foam peanuts',1,14),
	(169, 'Foam sheets',1,14),
	(170, 'Egg cartons',1,15),
	(171, 'Firewood',1,15),
	(172, 'Fabric',1,15),
	(173, 'Paper bags',1,15),
	(174, 'Pet supplies',1,15),
	(175, 'Shopping  bags',1,15),
	(176, 'Vehicles/ parts',1,15),
	(177, 'Computer paper',1,15),
	(178, 'Reusable metal items',1,15),
	/* Repair Items begin here*/
	(179, 'Cell phones',2,0),
	(180, 'small appliances',2,0),
	(181, 'Books',2,0),
	(182, 'Cell phones',2,0),
	(183, 'Clothes',2,0),
	(184, 'Computers',2,0),
	(185, 'Furniture',2,0),
	(186, 'Lamps',2,0),
	(187, 'Lawn power equipment',2,0),
	(188, 'Outdoor Gear',2,0),
	(189, 'Sandals',2,0),
	(190, 'Shoes, boots',2,0),
	(191, 'Upholstery, car',2,0),
	(192, 'Upholstery, Furniture',2,0)
	;


/* ========================================================================
	TEST DATA: Adding Repair Businesses
   ======================================================================== */
INSERT INTO
	Organizations (id, org_type, name, street1, street2, city, state, zip, webpage, phone, notes)
VALUES
	(1, 2, 'Bellevue Computers', '1865 NW 9th St', '', 'Corvallis', 'OR', '', 'http://www.bellevuepc.com/', '541-757-3487', 'repair computers and laptops'),
	(2, 2, 'Book Binding', '108 SW 3rd St', '', 'Corvallis', 'OR', '97333', 'http://www.cornerstoneassociates.com/bj-bookbinding-about-us.html', '541-5757-9861', 'Rebind and Restore books')
	;


/* ========================================================================
	TEST DATA: Associating Items to businesses
   ======================================================================== */
INSERT INTO
	OrganizationItems (org_id, item_id)
VALUES
	(1, 184), /* (Bellevue Computers, Computers) */
	(2, 181)
	;

