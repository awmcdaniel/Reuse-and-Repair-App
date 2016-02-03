DROP DATABASE IF EXISTS test_api;
CREATE DATABASE IF NOT EXISTS test_api;
USE test_api;


CREATE TABLE Users (
	id 			int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	username	varchar(255) NOT NULL,
	password	varchar(255) NOT NULL
);

CREATE TABLE OrganizationType (
	id 			int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	description	varchar(255)
);

CREATE TABLE Organizations (
	id 			int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	org_type	int UNSIGNED,
	name 		varchar(255) NOT NULL,
	street1 	varchar(255),
	street2 	varchar(255),
	city		varchar(255),
	state		varchar(2),
	zip			varchar(10),
	webpage		varchar(255),
	phone		varchar(255),
	notes		varchar(255),
	created_at	datetime,
	updated_at	datetime,
	FOREIGN KEY (org_type) REFERENCES OrganizationType (id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE ItemCategories (
	id 			int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	description	varchar(255)
);

CREATE TABLE Items (
	id 			int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	description varchar(255) NOT NULL,
	category	int UNSIGNED,
	created_at	datetime,
	updated_at	datetime,
	FOREIGN KEY (category) REFERENCES ItemCategories (id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE OrganizationItems (
	id 			int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	org_id		int UNSIGNED NOT NULL,
	item_id		int UNSIGNED NOT NULL,
	FOREIGN KEY (org_id) REFERENCES Organizations (id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (item_id) REFERENCES Items (id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE OrganizationHours (
	org_id 		int UNSIGNED UNIQUE NOT NULL,
	mon_start	time,
	mon_end		time,
	tue_start	time,
	tue_end		time,
	wed_start	time,
	wed_end		time,
	thu_start	time,
	thu_end		time,
	fri_start	time,
	fri_end		time,
	sat_start	time,
	sat_end		time,
	sun_start	time,
	sun_end		time,
	FOREIGN KEY (org_id) REFERENCES Organizations (id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);


/* ========================================================================
	TEST DATA: Users
   ======================================================================== */
INSERT INTO
	Users (username, password)
VALUES
	("TestUser", "password1"),
	("TestUser2", "password1");

/* ========================================================================
	TEST DATA: OrganizationTypes
   ======================================================================== */
INSERT INTO 
	OrganizationType (description)
VALUES 
	("Reuse"),
	("Repair"),
	("Reuse and Repair");

/* ========================================================================
	TEST DATA: Reuse and Repair Categories
   ======================================================================== */
INSERT INTO 
	ItemCategories(description)
VALUES 
	("Household"),
	("Bedding/Bath"),
	("Children's Goods"),
	("Appliances - Small"),
	("Appliances - Large"),
	("Building / Home Improvement"),
	("Wearable items"),
	("Usable Electronics"),
	("Sporting Equipments / Camping"),
	("Garden"),
	("Food"),
	("Medical Supplies"),
	("Office Equipments"),
	("Packing Materials"),
	("Miscellaneous"),
	("Repair Items")
	;

/* ========================================================================
	TEST DATA: Reuse and Repair Items under categories
   ======================================================================== */
INSERT INTO
	Items (description, category)
VALUES
	('Arts and crafts',1),
	('Barbeque grill',1),
	('Book',1),
	('Canning jar',1),
	('Cleaning supplie',1),
	('Clothes hanger',1),
	('Cookwar',1),
	('Dishe',1),
	('Fabri',1),
	('Food storage container',1),
	('Furnitur',1),
	('Luggag',1),
	('Mattresse',1),
	('Ornament',1),
	('Toiletrie',1),
	('Utensil',1),
	('Blanket',2),
	('Comforter',2),
	('Linen',2),
	('Sheet',2),
	('Small rug',2),
	('Towels',2),
	('Arts and crafts',3),
	('Baby carrier',3),
	('Baby gate',3),
	('Bike trailer',3),
	('Book',3),
	('Child car seat',3),
	('Clothe',3),
	('Crayon',3),
	('Crib',3),
	('Diapers',3),
	('High chair',3),
	('Maternit',3),
	('Musical instrument',3),
	('Nursing item',3),
	('Playpen',3),
	('School supplie',3),
	('Stroller',3),
	('Toy',3),
	('Blender',4),
	('Dehumidifier',4),
	('Fan',4),
	('Microwave',4),
	('Space heater',4),
	('Toaster',4),
	('Vacuum cleaner',4),
	('Dishwasher',5),
	('Freezer',5),
	('Refrigerator',5),
	('Stove',5),
	('Washers/ dryer',5),
	('Brick',6),
	('Carpet paddin',6),
	('Carpet',6),
	('Ceramic tile',6),
	('Door',6),
	('Drywal',6),
	('Electrical supplie',6),
	('Hand tool',6),
	('Hardwar',6),
	('Insulatio',6),
	('Ladder',6),
	('Light fixture',6),
	('Lighting ballast',6),
	('Lumbe',6),
	('Motor',6),
	('Pain',6),
	('Pip',6),
	('Plumbin',6),
	('Power tool',6),
	('Reusable metal item',6),
	('Roofing',6),
	('Viny',6),
	('Window',6),
	('Belt',7),
	('Boot',7),
	('Clothe',7),
	('Coat',7),
	('Hat',7),
	('Rainwea',7),
	('Sandal',7),
	('Shoe',7),
	('Calculator',8),
	('Camera',8),
	('Cassette player',8),
	('Cd player',8),
	('Cd',8),
	('Cell phone',8),
	('Computers',8),
	('Curling iron',8),
	('DVD player',8),
	('Game console',8),
	('GPS system',8),
	('Hair dryer',8),
	('Monitor',8),
	('MP3 player',8),
	('Printer',8),
	('Projector',8),
	('Receiver',8),
	('Scanner',8),
	('Speaker',8),
	('Tablet',8),
	('Telephone',8),
	('TV',8),
	('Backpack',9),
	('Ball',9),
	('Barbell',9),
	('Bicycle',9),
	('Bike tires',9),
	('Camping equipmen',9),
	('Day pack',9),
	('Dumbbell',9),
	('Exercise equipmen',9),
	('Golf club',9),
	('Helmet',9),
	('Hiking boot',9),
	('Skateboard',9),
	('Ski',9),
	('Small boat',9),
	('Snowshoe',9),
	('Sporting good',9),
	('Tennis racket',9),
	('Tent',9),
	('Chain saw',10),
	('Fencin',10),
	('Garden pot',10),
	('Garden tool',10),
	('Hand clipper',10),
	('Hose',10),
	('Lawn furnitur',10),
	('Livestock supplie',10),
	('Lopper',10),
	('Mower',10),
	('Seeder',10),
	('Soil amendmen',10),
	('Sprinkler',10),
	('Wheel barrow',10),
	('Beverage',11),
	('Surplus garden produc',11),
	('Unopened canned good',11),
	('Unopened packaged foo',11),
	('Adult diaper',12),
	('Blood pressure monitor',12),
	('Cane',12),
	('Crutche',12),
	('Eye glasse',12),
	('Glucose meter',12),
	('Hearing aid',12),
	('Hospital bed',12),
	('Reach extender',12),
	('Shower chair',12),
	('Walker',12),
	('Wheelchair',12),
	('Calculator',13),
	('Computers',13),
	('Fax machine',13),
	('Headset',13),
	('Monitor',13),
	('Office furniture',13),
	('Paper shredder',13),
	('Printer cartridge refillin',13),
	('Printer',13),
	('Scanner',13),
	('Telephone',13),
	('Bubble wra',14),
	('Clean foam peanut',14),
	('Foam sheet',14),
	('Egg carton',15),
	('Firewood',15),
	('Fabric',15),
	('Paper bag',15),
	('Pet supplies',15),
	('Shopping bags',15),
	('Vehicles/parts',15),
	('Computer paper',15),
	('Reusable metal items',15),
	('Cell phones',16),
	('Small appliances',16),
	('Books',16),
	('Clothes',16),
	('Computers',16),
	('Furniture',16),
	('Lamps',16),
	('Lawn power equipment',16),
	('Outdoor gear',16),
	('Sandals',16),
	('Shoes, boots',16),
	('Upholstery, car',16),
	('Upholstery, furniture',16);


/* ========================================================================
	TEST DATA: Adding Reuse Businesses
   ======================================================================== */
INSERT INTO
	Organizations (id, org_type, name, street1, street2, city, state, zip, webpage, phone, notes)
VALUES
	(1, 1, 'Albany-Corvallis ReUseIt'),
	(2, 1, 'Arc Thrift Stores  (Corvallis)'),
	(3, 1, 'Arc Thrift Stores (Philomath)'),
	(4, 1, 'Beekman Place Antique Mall'),
	(5, 1, 'Benton County Extension / 4-H  Activities'),
	(6, 1, 'Benton County Master Gardeners'),
	(7, 1, 'Book Bin'),
	(8, 1, 'Browser\'s Bookstore'),
	(9, 1, 'Boys & Girls Club \/ STARS'),
	(10, 1, 'Buckingham Palace'),
	(11, 1, 'Calvary Community Outreach'),
	(12, 1, 'CARDV (Center Against Rape/Domestic Violence)'),
	(13, 1, 'Career Closet for Women'),
	(14, 1, 'Cat\'s Meow Humane Society Thrift Shop'),
	(15, 1, 'Children\'s Farm Home'),
	(16, 1, 'Chintimini Wildlife Rehabilitation Ctr'),
	(17, 1, 'Community Outreach'),
	(18, 1, 'Corvallis Environmental Center'),
	(19, 1, 'Corvallis Bicycle Collective'),
	(20, 1, 'Corvallis Furniture'),
	(21, 1, 'Corvallis-Uzhhorod Sister Cities/The TOUCH Project'),
	(22, 1, 'Cosmic Chameleon'),
	(23, 1, 'Craigslist and Freecycle.org'),
	(24, 1, 'First Alternative Co-op Recycling Center'),
	(25, 1, 'First Alternative Co-op Store (South store)'),
	(26, 1, 'First Alternative Co-op Store (North store)'),
	(27, 1, 'Furniture Exchange'),
	(28, 1, 'Furniture Share (formerly Benton FS)'),
	(29, 1, 'Home Grown Gardens'),
	(30, 1, 'Garland Nursery'),
	(31, 1, 'Goodwill Industries'),
	(32, 1, 'Habitat for Humanity ReStore'),
	(33, 1, 'Happy Trails Records, Tapes & CDs'),
	(34, 1, 'Heartland Humane Society'),
	(35, 1, 'Home Life Inc.'),
	(36, 1, 'Jackson Street Youth Shelter'),
	(37, 1, 'Linn Benton Food Share'),
	(38, 1, 'Lions Club (box inside Elks Lodge)'),
	(39, 1, 'Love INC'),
	(40, 1, 'Mario Pastega House'),
	(41, 1, 'Mary\'s River Gleaners'),
	(42, 1, 'Midway Farms'),
	(43, 1, 'Neighbor to Neighbor'),
	(44, 1, 'Osborn Aquatic Center'),
	(45, 1, 'OSU Emergency Food Pantry'),
	(46, 1, 'OSU Folk Club Thrift Shop'),
	(47, 1, 'OSU Organic Growers Club (Crop & Soil Science Dept)'),
	(48, 1, 'Pak Mail (Timberhill Shopping Ctr)'),
	(49, 1, 'Parent Enhancement Program'),
	(50, 1, 'Pastors for Peace-Caravan to Cuba (Mike Beilstein)'),
	(51, 1, 'Philomath Community Garden (Chris Shonnard)'),
	(52, 1, 'Philomath Community Services'),
	(53, 1, 'Play It Again Sports'),
	(54, 1, 'Presbyterian Piecemakers'),
	(55, 1, 'Public Library Corvallis, Friends of'),
	(56, 1, 'Quilts From Caring Hands'),
	(57, 1, 'Rapid Refill Ink'),
	(58, 1, 're·volve'),
	(59, 1, 'Schools--Public, Private, Charter'),
	(60, 1, 'Second Glance'),
	(61, 1, 'The Annex'),
	(62, 1, 'The Alley'),
	(63, 1, 'Senior Center of Corvallis'),
	(64, 1, 'South Corvallis Food Bank'),
	(65, 1, 'St. Vincent de Paul Food Bank'),
	(66, 1, 'Stone Soup  (St Mary\'s Church)'),
	(67, 1, 'UPS Store (Philomath)'),
	(68, 1, 'UPS Stores (Corvallis)'),
	(69, 1, 'Vina Moses'),
	(70, 1, 'Spaeth Heritage House')
	;


/* ========================================================================
	TEST DATA: Adding Repair Businesses
   ======================================================================== */
INSERT INTO
	Organizations (id, org_type, name, street1, street2, city, state, zip, webpage, phone, notes)
VALUES
	(71, 2, 'Bellevue Computers', '1865 NW 9th St', '', 'Corvallis', 'OR', '', 'http://www.bellevuepc.com/', '541-757-3487', 'repair computers and laptops'),
	(72, 2, 'Book Binding', '108 SW 3rd St', '', 'Corvallis', 'OR', '97333', 'http://www.cornerstoneassociates.com/bj-bookbinding-about-us.html', '541-5757-9861', 'Rebind and Restore books'),
	(73, 2, 'Cell Phone Sick Bay'),
	(74, 2, 'Covallis Technical'),
	(75, 2, 'Foam Man'),
	(76, 2, 'Footwise'),
	(77, 2, 'Furniture Restoration Center'),
	(78, 2, 'Geeks \'N\' Nerds'),
	(79, 2, 'OSU Repair Fair'),
	(80, 2, 'P.K Furniture Repair & Refinishing'),
	(81, 2, 'Corvalis Power Equipment'),
	(82, 2, 'Robnett\'s'),
	(83, 2, 'Sedlack'),
	(84, 2, 'Specialty Sewing By Leslie')
	;


/* ========================================================================
	TEST DATA: Associating Items to businesses
   ======================================================================== */
INSERT INTO
	OrganizationItems (org_id, item_id)
VALUES
	(71, 184), /* (Bellevue Computers, Computers) */
	(72, 181)
	;


/* ========================================================================
	TEST DATA: Hours
   ======================================================================== */
INSERT INTO 
	OrganizationHours (`org_id`, `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, `thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`) 
VALUES 
	('71', '09:00:00', '18:00:00', '09:00:00', '18:00:00', '09:00:00', '18:00:00', '09:00:00', '18:00:00', '09:00:00', '18:00:00', '10:00:00', '17:00:00', NULL, NULL),
	('72', '09:00:00', '17:00:00', '09:00:00', '17:00:00', '09:00:00', '17:00:00', '09:00:00', '17:00:00', '09:00:00', '17:00:00', NULL, NULL, NULL, NULL),
	('73', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '11:00:00', '16:00:00', NULL, NULL),
	('74', '09:00:00', '17:00:00', '09:00:00', '17:00:00', '09:00:00', '17:00:00', '09:00:00', '17:00:00', '09:00:00', '17:00:00', NULL, NULL, NULL, NULL),
	/* need to call to confirm hours:541-754-9378 ('75', ),*/
	('76', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '11:00:00', '17:00:00'),
	('77', '09:00:00', '17:00:00', '09:00:00', '17:00:00', '09:00:00', '17:00:00', '09:00:00', '17:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
	/* need to call to confirm hours:(541) 753-0018 ('78', ),*/
	('79', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('80', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', NULL, NULL, NULL, NULL),
	('81', '08:00:00', '17:00:00', '08:00:00', '17:00:00', '08:00:00', '17:00:00', '08:00:00', '17:00:00', '08:00:00', '17:00:00', '08:30:00', '12:00:00', NULL, NULL),
	('82', '07:30:00', '18:00:00', '07:30:00', '18:00:00', '07:30:00', '18:00:00', '07:30:00', '18:00:00', '07:30:00', '18:00:00', '08:30:00', '17:30:00', '10:00:00', '16:00:00'),
	('83', '09:30:00', '18:00:00', '09:30:00', '18:00:00', '09:30:00', '18:00:00', '09:30:00', '18:00:00', '09:30:00', '18:00:00', '09:30:00', '17:00:00', '12:00:00', '16:00:00')
	/* need to call to confirm hours: 541) 758-4556 ('84', )*/
	;