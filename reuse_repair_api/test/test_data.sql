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
	street1 	varchar(255) DEFAULT NULL,
	street2 	varchar(255) DEFAULT NULL,
	city		varchar(255) DEFAULT NULL,
	state		varchar(2) DEFAULT NULL,
	zip			varchar(10) DEFAULT NULL,
	webpage		varchar(255) DEFAULT NULL,
	phone		varchar(255) DEFAULT NULL,
	notes		varchar(255) DEFAULT NULL,
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
	Users (`username`, `password`)
VALUES
	("TestUser", "password1"),
	("TestUser2", "password1");

/* ========================================================================
	TEST DATA: OrganizationTypes
   ======================================================================== */
INSERT INTO 
	OrganizationType (`description`)
VALUES 
	("Reuse"),
	("Repair"),
	("Reuse and Repair");

/* ========================================================================
	TEST DATA: Reuse and Repair Categories
   ======================================================================== */
INSERT INTO 
	ItemCategories(`description`)
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
	Items (`id`, `description`, `category`)
VALUES
	(1, 'Arts and crafts',1),			/* category = Household */
	(2, 'Barbeque grills',1),
	(3, 'Books',1),
	(4, 'Canning jars',1),
	(5, 'Cleaning supplies',1),
	(6, 'Clothes hangers',1),
	(7, 'Cookware',1),
	(8, 'Dishes',1),
	(9, 'Fabric',1),
	(10, 'Food storage containers',1),
	(11, 'Furniture',1),
	(12, 'Luggage',1),
	(13, 'Mattresses',1),
	(14, 'Ornaments',1),
	(15, 'Toiletries',1),
	(16, 'Utensils',1),
	
	(17, 'Blankets',2),				/* category = Bedding/Bath */
	(18, 'Comforters',2),
	(19, 'Linens',2),
	(20, 'Sheets',2),
	(21, 'Small rugs',2),
	(22, 'Towels',2),
	
	(23, 'Arts and crafts',3),			/* category = Children's Goods */
	(24, 'Baby carriers',3),
	(25, 'Baby gates',3),
	(26, 'Bike trailers',3),
	(27, 'Books',3),
	(28, 'Child car seats',3),
	(29, 'Clothes',3),
	(30, 'Crayons',3),
	(31, 'Cribs',3),
	(32, 'Diapers',3),
	(33, 'High chairs',3),
	(34, 'Maternity',3),
	(35, 'Musical instruments',3),
	(36, 'Nursing items',3),
	(37, 'Playpens',3),
	(38, 'School supplies',3),
	(39, 'Strollers',3),
	(40, 'Toys',3),
	
	
	(41, 'Blenders',4),				/* category = Appliances - Small */
	(42, 'Dehumidifiers',4),
	(43, 'Fans',4),
	(44, 'Microwaves',4),
	(45, 'Space heaters',4),
	(46, 'Toasters',4),
	(47, 'Vacuum cleaners',4),
	
	(48, 'Dishwashers',5),			/* category = Appliances - Large */
	(49, 'Freezers',5),
	(50, 'Refrigerators',5),
	(51, 'Stoves',5),
	(52, 'Washers/Dryers',5),
	
	(53, 'Bricks',6),				/* category = Building/Home Improvement */
	(54, 'Carpet padding',6),
	(55, 'Carpets',6),
	(56, 'Ceramic tiles',6),
	(57, 'Doors',6),
	(58, 'Drywall',6),
	(59, 'Electrical supplies',6),
	(60, 'Hand tools',6),
	(61, 'Hardware',6),
	(62, 'Insulation',6),
	(63, 'Ladders',6),
	(64, 'Light fixtures',6),
	(65, 'Lighting ballasts',6),
	(66, 'Lumber',6),
	(67, 'Motors',6),
	(68, 'Paint',6),
	(69, 'Pipe',6),
	(70, 'Plumbing',6),
	(71, 'Power tools',6),
	(72, 'Reusable metal items',6),
	(73, 'Roofing',6),
	(74, 'Vinyl',6),
	(75, 'Windows',6),
	
	(76, 'Belts',7),					/* category = Wearable Items */				
	(77, 'Boots',7),
	(78, 'Clothes',7),
	(79, 'Coats',7),
	(80, 'Hats',7),
	(81, 'Rainwear',7),
	(82, 'Sandals',7),
	(83, 'Shoes',7),
	
	(84, 'Calculators',8),				/* category = Useable Electronics */
	(85, 'Cameras',8),
	(86, 'Cassette players',8),
	(87, 'CD players',8),
	(88, 'CDs',8),
	(89, 'Cell phones',8),
	(90, 'Computers',8),
	(91, 'Curling irons',8),
	(92, 'DVD players',8),
	(93, 'Game consoles',8),
	(94, 'GPS systems',8),
	(95, 'Hair dryers',8),
	(96, 'Monitors',8),
	(97, 'MP3 players',8),
	(98, 'Printers',8),
	(99, 'Projectors',8),
	(100, 'Receivers',8),
	(101, 'Scanners',8),
	(102, 'Speakers',8),
	(103,'Tablets',8),
	(104, 'Telephones',8),
	(105, 'TVs',8),
	
	(106, 'Backpacks',9),				/* category = Sporting Equipment/Camping */
	(107, 'Balls',9),
	(108, 'Barbells',9),
	(109, 'Bicycles',9),
	(110, 'Bike tires',9),
	(111, 'Camping equipment',9),
	(112, 'Day packs',9),
	(113, 'Dumbbells',9),
	(114, 'Exercise equipment',9),
	(115, 'Golf clubs',9),
	(116, 'Helmets',9),
	(117, 'Hiking boots',9),
	(118, 'Skateboards',9),
	(119, 'Skis',9),
	(120 ,'Small boats',9),
	(121, 'Snowshoes',9),
	(122, 'Sporting goods',9),
	(123, 'Tennis rackets',9),
	(124, 'Tents',9),
	
	(126, 'Chain saws',10),			/* category = Garden */
	(127, 'Fencing',10),
	(128, 'Garden pots',10),
	(129, 'Garden tools',10),
	(130 ,'Hand clippers',10),
	(131, 'Hoses',10),
	(132, 'Lawn furniture',10),
	(133, 'Livestock supplies',10),
	(134, 'Loppers',10),
	(135, 'Mowers',10),
	(136, 'Seeders',10),
	(137, 'Soil amendment',10),
	(138, 'Sprinklers',10),
	(139, 'Wheelbarrows',10),
	
	(140, 'Beverages',11),			/* category = Food */
	(141, 'Surplus garden produce',11),
	(142, 'Unopened canned goods',11),
	(143, 'Unopened packaged food',11),
	
	(144, 'Adult diapers',12),			/* category = Medical Supplies */	
	(145, 'Blood pressure monitors',12),
	(146, 'Canes',12),
	(147, 'Crutches',12),
	(148, 'Eye glasses',12),
	(149, 'Glucose meters',12),
	(150, 'Hearing aids',12),
	(151, 'Hospital beds',12),
	(152, 'Reach extenders',12),
	(153, 'Shower chairs',12),
	(154, 'Walkers',12),
	(155, 'Wheelchairs',12),
	
	(156, 'Calculators',13),			/* category = Office Equipment */
	(157, 'Computers',13),
	(158, 'Fax machines',13),
	(159, 'Headsets',13),
	(160, 'Monitors',13),
	(161, 'Office furniture',13),
	(162, 'Paper shredders',13),
	(163, 'Printer cartridge refilling',13),
	(164, 'Printers',13),
	(165, 'Scanners',13),
	(166, 'Telephones',13),
	
	(167, 'Bubble wrap',14),			/* category = Packing Materials */
	(168, 'Clean foam peanuts',14),
	(169, 'Foam sheets',14),
	
	(170, 'Egg cartons',15),			/* category = Miscellaneous */
	(171, 'Firewood',15),
	(172, 'Fabric',15),
	(173, 'Paper bags',15),
	(174, 'Pet supplies',15),
	(175, 'Shopping bags',15),
	(176, 'Vehicles/Parts',15),
	(177, 'Computer paper',15),
	(178, 'Reusable metal items',15),
	
	(179, 'Cell phones',16),			/* category = Repair Items */
	(180, 'Small appliances',16),
	(181, 'Books',16),
	(182, 'Clothes',16),
	(183, 'Computers',16),
	(184, 'Furniture',16),
	(185, 'Lamps',16),
	(186, 'Lawn power equipment',16),
	(187, 'Outdoor gear',16),
	(188, 'Sandals',16),
	(189, 'Shoes/Boots',16),
	(190, 'Upholstery, car',16),
	(191, 'Upholstery, furniture',16)
	;


/* ========================================================================
	PROCEDURES FOR CREATING OrganizationItems ENTITIES
   ======================================================================== */	
DELIMITER $$  
CREATE PROCEDURE addHousehold(IN orgID INT(255))
	BEGIN
      		DECLARE num INT(255) Default 1 ;
    	simple_loop: LOOP
    		INSERT INTO OrganizationItems (`org_id`, `item_id`)
    		VALUES (orgID, num);
    		SET num = num + 1;
         	IF num > 16 THEN
        		LEAVE simple_loop;
        	END IF; 	
   	END LOOP simple_loop;
END $$
DELIMITER ;
	
DELIMITER $$  
CREATE PROCEDURE addBeddingBath(IN orgID INT(255))
	BEGIN
      		DECLARE num INT(255) Default 17 ;
    	simple_loop: LOOP
    		INSERT INTO OrganizationItems (`org_id`, `item_id`)
    		VALUES (orgID, num);
    		SET num = num + 1;
         	IF num > 22 THEN
        		LEAVE simple_loop;
        	END IF; 	
   	END LOOP simple_loop;
END $$
DELIMITER ;
	


/* ========================================================================
	TEST DATA: Adding Reuse Businesses
   ======================================================================== */
INSERT INTO
	Organizations (id, org_type, name, street1, street2, city, state, zip, webpage, phone, notes)
VALUES
	(1, 1, 'Albany-Corvallis ReUseIt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 1, 'Arc Thrift Stores  (Corvallis)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 1, 'Arc Thrift Stores (Philomath)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 1, 'Beekman Place Antique Mall', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(5, 1, 'Benton County Extension / 4-H  Activities', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(6, 1, 'Benton County Master Gardeners', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(7, 1, 'Book Bin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 1, 'Browser\'s Bookstore', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(9, 1, 'Boys & Girls Club \/ STARS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(10, 1, 'Buckingham Palace', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 1, 'Calvary Community Outreach', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(12, 1, 'CARDV (Center Against Rape/Domestic Violence)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(13, 1, 'Career Closet for Women', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(14, 1, 'Cat\'s Meow Humane Society Thrift Shop', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(15, 1, 'Children\'s Farm Home', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(16, 1, 'Chintimini Wildlife Rehabilitation Ctr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(17, 1, 'Community Outreach', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(18, 1, 'Corvallis Environmental Center', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(19, 1, 'Corvallis Bicycle Collective', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(20, 1, 'Corvallis Furniture', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(21, 1, 'Corvallis-Uzhhorod Sister Cities/The TOUCH Project', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(22, 1, 'Cosmic Chameleon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(23, 1, 'Craigslist and Freecycle.org', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(24, 1, 'First Alternative Co-op Recycling Center', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(25, 1, 'First Alternative Co-op Store (South store)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(26, 1, 'First Alternative Co-op Store (North store)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(27, 1, 'Furniture Exchange', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(28, 1, 'Furniture Share (formerly Benton FS)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(29, 1, 'Home Grown Gardens', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(30, 1, 'Garland Nursery', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(31, 1, 'Goodwill Industries', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(32, 1, 'Habitat for Humanity ReStore', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(33, 1, 'Happy Trails Records, Tapes & CDs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(34, 1, 'Heartland Humane Society', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(35, 1, 'Home Life Inc.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(36, 1, 'Jackson Street Youth Shelter', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(37, 1, 'Linn Benton Food Share', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(38, 1, 'Lions Club (box inside Elks Lodge)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(39, 1, 'Love INC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(40, 1, 'Mario Pastega House', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(41, 1, 'Mary\'s River Gleaners', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(42, 1, 'Midway Farms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(43, 1, 'Neighbor to Neighbor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(44, 1, 'Osborn Aquatic Center', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(45, 1, 'OSU Emergency Food Pantry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(46, 1, 'OSU Folk Club Thrift Shop', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(47, 1, 'OSU Organic Growers Club (Crop & Soil Science Dept)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(48, 1, 'Pak Mail (Timberhill Shopping Ctr)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(49, 1, 'Parent Enhancement Program', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(50, 1, 'Pastors for Peace-Caravan to Cuba (Mike Beilstein)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(51, 1, 'Philomath Community Garden (Chris Shonnard)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(52, 1, 'Philomath Community Services', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(53, 1, 'Play It Again Sports', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(54, 1, 'Presbyterian Piecemakers', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(55, 1, 'Public Library Corvallis, Friends of', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(56, 1, 'Quilts From Caring Hands', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(57, 1, 'Rapid Refill Ink', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(58, 1, 're·volve', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(59, 1, 'Schools--Public Private Charter', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(60, 1, 'Second Glance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(61, 1, 'The Annex', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(62, 1, 'The Alley', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(63, 1, 'Senior Center of Corvallis', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(64, 1, 'South Corvallis Food Bank', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(65, 1, 'St. Vincent de Paul Food Bank', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(66, 1, 'Stone Soup  (St Mary\'s Church)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(67, 1, 'UPS Store (Philomath)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(68, 1, 'UPS Stores (Corvallis)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(69, 1, 'Vina Moses', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(70, 1, 'Spaeth Heritage House', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
	;


/* ========================================================================
	TEST DATA: Adding Repair Businesses
   ======================================================================== */
INSERT INTO
	Organizations (id, org_type, name, street1, street2, city, state, zip, webpage, phone, notes)
VALUES
	(71, 2, 'Bellevue Computers', '1865 NW 9th St', '', 'Corvallis', 'OR', '', 'http://www.bellevuepc.com/', '541-757-3487', 'repair computers and laptops'),
	(72, 2, 'Book Binding', '108 SW 3rd St', '', 'Corvallis', 'OR', '97333', 'http://www.cornerstoneassociates.com/bj-bookbinding-about-us.html', '541-5757-9861', 'Rebind and Restore books'),
	(73, 2, 'Cell Phone Sick Bay', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(74, 2, 'Covallis Technical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(75, 2, 'Foam Man', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(76, 2, 'Footwise', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(77, 2, 'Furniture Restoration Center', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(78, 2, 'Geeks \'N\' Nerds', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(79, 2, 'OSU Repair Fair', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(80, 2, 'P.K Furniture Repair & Refinishing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(81, 2, 'Corvalis Power Equipment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(82, 2, 'Robnett\'s', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(83, 2, 'Sedlack', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(84, 2, 'Specialty Sewing By Leslie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
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
	('1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL), /* no hours online*/ 
	('41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL), /* no hours online*/
	('42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL), /* no hours online*/
	('43', NULL, NULL, '09:30:00', '13:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL), /* no hours online*/
	('45', '17:00:00', '20:00:00', NULL, NULL, '17:00:00', '20:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('46', NULL, NULL, '09:30:00', '14:00:00', '09:30:00', '14:00:00', '09:30:00', '14:00:00', '09:30:00', '12:30:00', NULL, NULL, NULL, NULL),
	('47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL), /* no hours online*/
	('48', '09:00:00', '17:30:00', '09:00:00', '17:30:00', '09:00:00', '17:30:00', '09:00:00', '17:30:00', '09:00:00', '17:30:00', '09:00:00', '16:00:00', NULL, NULL),
	('49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL), /* no hours online*/
	('50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL), /* no hours online*/
	('51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL), /* no hours online*/
	('52', NULL, NULL, '17:00:00', '20:00:00', NULL, NULL, '09:00:00', '12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
	('53', '09:00:00', '19:00:00', '09:00:00', '19:00:00', '09:00:00', '19:00:00', '09:00:00', '19:00:00', '09:00:00', '19:00:00', '09:00:00', '18:00:00', '10:00:00', '17:00:00'),
	('54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL), /* no hours online*/
	('55', '10:00:00', '20:00:00', '10:00:00', '20:00:00', '10:00:00', '20:00:00', '10:00:00', '20:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '13:00:00', '17:00:00'),
	('56', NULL, NULL, NULL, NULL, '09:30:00', '14:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	('57', '09:00:00', '17:30:00', '09:00:00', '17:30:00', '09:00:00', '17:30:00', '09:00:00', '17:30:00', '09:00:00', '17:30:00', '10:00:00', '15:00:00', NULL, NULL),
	('58', NULL, NULL, '11:00:00', '18:00:00', NULL, NULL, '11:00:00', '18:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
	('59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL), /*no hours online*/
	('60', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '12:00:00', '17:00:00'),
	('61', '11:00:00', '18:00:00', '11:00:00', '18:00:00', '11:00:00', '18:00:00', '11:00:00', '18:00:00', '11:00:00', '18:00:00', '11:00:00', '18:00:00', '12:00:00', '17:00:00'),
	('62', '11:00:00', '18:00:00', '11:00:00', '18:00:00', '11:00:00', '18:00:00', '11:00:00', '18:00:00', '11:00:00', '18:00:00', '11:00:00', '18:00:00', '12:00:00', '17:00:00'),
	('63', '08:00:00', '16:00:00', '08:00:00', '16:00:00', '08:00:00', '16:00:00', '08:00:00', '16:00:00', '08:00:00', '16:00:00', NULL, NULL, NULL, NULL),
	('64', '13:00:00', '15:00:00', NULL, NULL, '13:00:00', '15:00:00', '17:00:00', '19:00:00', NULL, NULL, '10:00:00', '12:00:00', NULL, NULL),
	('65', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL), /* no hours online */
	('66', '17:30:00', '18:30:00', NULL, NULL, '11:30:00', '12:30:00', '17:30:00', '18:30:00', '11:30:00', '12:30:00', NULL, NULL, NULL, NULL),
	('67', '07:30:00', '18:00:00', '07:30:00', '18:00:00', '07:30:00', '18:00:00', '07:30:00', '18:00:00', '07:30:00', '18:00:00', '09:30:00', '15:00:00', NULL, NULL),
	('68', '07:30:00', '18:00:00', '07:30:00', '18:00:00', '07:30:00', '18:00:00', '07:30:00', '18:00:00', '07:30:00', '18:00:00', '09:30:00', '15:00:00', NULL, NULL),
	('69', '09:00:00', '16:00:00', '09:00:00', '16:00:00', '09:00:00', '16:00:00', '09:00:00', '16:00:00', '09:00:00', '16:00:00', NULL, NULL, NULL, NULL),
	('70', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL), /* no hours online*/
	('71', '09:00:00', '18:00:00', '09:00:00', '18:00:00', '09:00:00', '18:00:00', '09:00:00', '18:00:00', '09:00:00', '18:00:00', '10:00:00', '17:00:00', NULL, NULL),
	('72', '09:00:00', '17:00:00', '09:00:00', '17:00:00', '09:00:00', '17:00:00', '09:00:00', '17:00:00', '09:00:00', '17:00:00', NULL, NULL, NULL, NULL),
	('73', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '11:00:00', '16:00:00', NULL, NULL),
	('74', '09:00:00', '17:00:00', '09:00:00', '17:00:00', '09:00:00', '17:00:00', '09:00:00', '17:00:00', '09:00:00', '17:00:00', NULL, NULL, NULL, NULL),
	('75', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL), /* no hours online*/
	('76', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '11:00:00', '17:00:00'),
	('77', '09:00:00', '17:00:00', '09:00:00', '17:00:00', '09:00:00', '17:00:00', '09:00:00', '17:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
	('78', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL), /* no hours online*/
	('79', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL), /* no hours online*/
	('80', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', NULL, NULL, NULL, NULL),
	('81', '08:00:00', '17:00:00', '08:00:00', '17:00:00', '08:00:00', '17:00:00', '08:00:00', '17:00:00', '08:00:00', '17:00:00', '08:30:00', '12:00:00', NULL, NULL),
	('82', '07:30:00', '18:00:00', '07:30:00', '18:00:00', '07:30:00', '18:00:00', '07:30:00', '18:00:00', '07:30:00', '18:00:00', '08:30:00', '17:30:00', '10:00:00', '16:00:00'),
	('83', '09:30:00', '18:00:00', '09:30:00', '18:00:00', '09:30:00', '18:00:00', '09:30:00', '18:00:00', '09:30:00', '18:00:00', '09:30:00', '17:00:00', '12:00:00', '16:00:00'),
	('84', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL) /* no hours online*/
	;


/* add items from categories */
CALL addHousehold(1);
CALL addBeddingBath(1);


/* ==================================================
	Automatically add an entry for Organization in OrganizationHours.
	NOTE: place this at the very end of the file!
====================================================*/

CREATE TRIGGER new_org_added
AFTER INSERT ON Organizations
FOR EACH ROW
	INSERT INTO OrganizationHours (org_id)
	VALUES (NEW.id);

/* END OF FILE: DO NOT MAKE ENTRIES BELOW */