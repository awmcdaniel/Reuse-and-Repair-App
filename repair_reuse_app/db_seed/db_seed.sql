USE repair_reuse_app;

CREATE TABLE users (
	id 			int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	username		varchar(255) NOT NULL,
	password		varchar(255) NOT NULL
);

CREATE TABLE organizationtype (
	id 			int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	description		varchar(255)
);

CREATE TABLE organizations (
	id 			int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	org_type		int UNSIGNED,
	name 		varchar(255) NOT NULL,
	street1 		varchar(255) DEFAULT NULL,
	street2 		varchar(255) DEFAULT NULL,
	city			varchar(255) DEFAULT NULL,
	state			varchar(2) DEFAULT NULL,
	zip			varchar(10) DEFAULT NULL,
	webpage		varchar(255) DEFAULT NULL,
	phone		varchar(255) DEFAULT NULL,
	notes		varchar(255) DEFAULT NULL,
	created_at	datetime,
	updated_at	datetime,
	FOREIGN KEY (org_type) REFERENCES organizationtype (id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE itemcategories (
	id 			int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	description		varchar(255)
);

CREATE TABLE items (
	id 			int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	description 	varchar(255) NOT NULL,
	category		int UNSIGNED,
	created_at	datetime,
	updated_at	datetime,
	FOREIGN KEY (category) REFERENCES itemcategories (id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE organizationitems (
	id 			int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	org_id		int UNSIGNED NOT NULL,
	item_id		int UNSIGNED NOT NULL,
	FOREIGN KEY (org_id) REFERENCES organizations (id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (item_id) REFERENCES items (id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE organizationhours (
	org_id 		int UNSIGNED UNIQUE NOT NULL,
	mon_start		time,
	mon_end		time,
	tue_start		time,
	tue_end		time,
	wed_start		time,
	wed_end		time,
	thu_start		time,
	thu_end		time,
	fri_start		time,
	fri_end		time,
	sat_start		time,
	sat_end		time,
	sun_start		time,
	sun_end		time,
	FOREIGN KEY (org_id) REFERENCES organizations (id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

/* ========================================================================
	ADD users ENTITIES
   ======================================================================== */
INSERT INTO
	users (`username`, `password`)
VALUES
	("TestUser", "password1"),
	("TestUser2", "password1")
	;
	
/* ========================================================================
	ADD organizationtype ENTITIES
   ======================================================================== */
INSERT INTO 
	organizationtype (`id`, `description`)
VALUES 
	(1, "Reuse"),
	(2, "Repair"),
	(3, "Reuse and Repair")
	;

/* ========================================================================
	ADD itemcategories ENTITIES
   ======================================================================== */
INSERT INTO 
	itemcategories(`id`, `description`)
VALUES 
	(1, "Repair items"),
	(2, "Household"),
	(3, "Bedding/Bath"),
	(4, "Children's Goods"),
	(5, "Appliances - Small"),
	(6, "Appliances - Large"),
	(7, "Building/Home Improvement"),
	(8, "Wearable items"),
	(9, "Usable Electronics"),
	(10, "Sporting Equipment/Camping"),
	(11, "Garden"),
	(12, "Food"),
	(13, "Medical Supplies"),
	(14, "Office Equipment"),
	(15, "Packing Materials"),
	(16, "Miscellaneous")
	;
	

	
/* ========================================================================
	ADD items ENTITIES
   ======================================================================== */

INSERT INTO
	items (`id`, `description`, `category`)
VALUES

	(1, 'Cell phones', 1),				/* category = Repair items */
	(2, 'Small appliances', 1),
	(3, 'Books', 1),
	(4, 'Clothes', 1),
	(5, 'Computers', 1),
	(6, 'Furniture', 1),
	(7, 'Lamps', 1),
	(8, 'Lawn power equipment', 1),
	(9, 'Outdoor gear', 1),
	(10, 'Sandals', 1),
	(11, 'Shoes/Boots', 1),
	(12, 'Upholstery, car', 1),
	(13, 'Upholstery, furniture', 1),
	
	(14, 'Arts and crafts', 2),			/* category = Household */
	(15, 'Barbeque grills', 2),
	(16, 'Books', 2),
	(17, 'Canning jars', 2),
	(18, 'Cleaning supplies', 2),
	(19, 'Clothes hangers', 2),
	(20, 'Cookware', 2),
	(21, 'Dishes', 2),
	(22, 'Fabric', 2),
	(23, 'Food storage containers', 2),
	(24, 'Furniture', 2),
	(25, 'Luggage', 2),
	(26, 'Mattresses', 2),
	(27, 'Ornaments', 2),
	(28, 'Toiletries', 2),
	(29, 'Utensils', 2),
	
	(30, 'Blankets', 3),				/* category = Bedding/Bath */
	(31, 'Comforters', 3),
	(32, 'Linens', 3),
	(33, 'Sheets', 3),
	(34, 'Small rugs', 3),
	(35, 'Towels', 3),
	
	(36, 'Arts and crafts', 4),			/* category = Children's Goods */
	(37, 'Baby carriers', 4),
	(38, 'Baby gates', 4),
	(39, 'Bike trailers', 4),
	(40, 'Books', 4),
	(41, 'Child car seats', 4),
	(42, 'Clothes', 4),
	(43, 'Crayons', 4),
	(44, 'Cribs', 4),
	(45, 'Diapers', 4),
	(46, 'High chairs', 4),
	(47, 'Maternity', 4),
	(48, 'Musical instruments', 4),
	(49, 'Nursing items', 4),
	(50, 'Playpens', 4),
	(51, 'School supplies', 4),
	(52, 'Strollers', 4),
	(53, 'Toys', 4),
	
	(54, 'Blenders', 5),				/* category = Appliances - Small */
	(55, 'Dehumidifiers', 5),
	(56, 'Fans', 5),
	(57, 'Microwaves', 5),
	(58, 'Space heaters', 5),
	(59, 'Toasters', 5),
	(60, 'Vacuum cleaners', 5),
	
	(61, 'Dishwashers', 6),			/* category = Appliances - Large */
	(62, 'Freezers', 6),
	(63, 'Refrigerators', 6),
	(64, 'Stoves', 6),
	(65, 'Washers/Dryers', 6),
	
	(66, 'Bricks', 7),					/* category = Building/Home Improvement */
	(67, 'Carpet padding', 7),
	(68, 'Carpets', 7),
	(69, 'Ceramic tiles', 7),
	(70, 'Doors', 7),
	(71, 'Drywall', 7),
	(72, 'Electrical supplies', 7),
	(73, 'Hand tools', 7),
	(74, 'Hardware', 7),
	(75, 'Insulation', 7),
	(76, 'Ladders', 7),
	(77, 'Light fixtures', 7),
	(78, 'Lighting ballasts', 7),
	(79, 'Lumber', 7),
	(80, 'Motors', 7),
	(81, 'Paint', 7),
	(82, 'Pipe', 7),
	(83, 'Plumbing', 7),
	(84, 'Power tools', 7),
	(85, 'Reusable metal items', 7),
	(86, 'Roofing', 7),
	(87, 'Vinyl', 7),
	(88, 'Windows', 7),
	
	(89, 'Belts', 8),					/* category = Wearable items */				
	(90, 'Boots', 8),
	(91, 'Clothes', 8),
	(92, 'Coats', 8),
	(93, 'Hats', 8),
	(94, 'Rainwear', 8),
	(95, 'Sandals', 8),
	(96, 'Shoes', 8),
	
	(97, 'Calculators', 9),				/* category = Useable Electronics */
	(98, 'Cameras', 9),
	(99, 'Cassette players', 9),
	(100, 'CD players', 9),
	(101, 'CDs', 9),
	(102, 'Cell phones', 9),
	(103, 'Computers', 9),
	(104, 'Curling irons', 9),
	(105, 'DVD players', 9),
	(106, 'Game consoles', 9),
	(107, 'GPS systems', 9),
	(108, 'Hair dryers', 9),
	(109, 'Monitors', 9),
	(110, 'MP3 players', 9),
	(111, 'Printers', 9),
	(112, 'Projectors', 9),
	(113, 'Receivers', 9),
	(114, 'Scanners', 9),
	(115, 'Speakers', 9),
	(116,'Tablets', 9),
	(117, 'Telephones', 9),
	(118, 'TVs', 9),
	
	(119, 'Backpacks', 10),			/* category = Sporting Equipment/Camping */
	(120, 'Balls', 10),
	(121, 'Barbells', 10),
	(122, 'Bicycles', 10),
	(123, 'Bike tires', 10),
	(124, 'Camping equipment', 10),
	(125, 'Day packs', 10),
	(126, 'Dumbbells', 10),
	(127, 'Exercise equipment', 10),
	(128, 'Golf clubs', 10),
	(129, 'Helmets', 10),
	(130, 'Hiking boots', 10),
	(131, 'Skateboards', 10),
	(132, 'Skis', 10),
	(133 ,'Small boats', 10),
	(134, 'Snowshoes', 10),
	(135, 'Sporting goods', 10),
	(136, 'Tennis rackets', 10),
	(137, 'Tents', 10),
	
	(138, 'Chain saws', 11),			/* category = Garden */
	(139, 'Fencing', 11),
	(140, 'Garden pots', 11),
	(141, 'Garden tools', 11),
	(142 ,'Hand clippers', 11),
	(143, 'Hoses', 11),
	(144, 'Lawn furniture', 11),
	(145, 'Livestock supplies', 11),
	(146, 'Loppers', 11),
	(147, 'Mowers', 11),
	(148, 'Seeders', 11),
	(149, 'Soil amendment', 11),
	(150, 'Sprinklers', 11),
	(151, 'Wheelbarrows', 11),
	
	(152, 'Beverages', 12),			/* category = Food */
	(153, 'Surplus garden produce', 12),
	(154, 'Unopened canned goods', 12),
	(155, 'Unopened packaged food', 12),
	
	(156, 'Adult diapers', 13),			/* category = Medical Supplies */	
	(157, 'Blood pressure monitors', 13),
	(158, 'Canes', 13),
	(159, 'Crutches', 13),
	(160, 'Eye glasses', 13),
	(161, 'Glucose meters', 13),
	(162, 'Hearing aids', 13),
	(163, 'Hospital beds', 13),
	(164, 'Reach extenders', 13),
	(165, 'Shower chairs', 13),
	(166, 'Walkers', 13),
	(167, 'Wheelchairs', 13),
	
	(168, 'Calculators', 14),			/* category = Office Equipment */
	(169, 'Computers', 14),
	(170, 'Fax machines', 14),
	(171, 'Headsets', 14),
	(172, 'Monitors', 14),
	(173, 'Office furniture', 14),
	(174, 'Paper shredders', 14),
	(175, 'Printer cartridge refilling', 14),
	(176, 'Printers', 14),
	(177, 'Scanners', 14),
	(178, 'Telephones', 14),

	(179, 'Bubble wrap', 15),			/* category = Packing Materials */
	(180, 'Clean foam peanuts', 15),
	(181, 'Foam sheets', 15),

	(182, 'Egg cartons', 16),			/* category = Miscellaneous */
	(183, 'Firewood', 16),
	(184, 'Fabric', 16),
	(185, 'Paper bags', 16),
	(186, 'Pet supplies', 16),
	(187, 'Shopping bags', 16),
	(188, 'Vehicles/Parts', 16),
	(189, 'Computer paper', 16),
	(190, 'Reusable metal items', 16),
	(192, 'Brown paper',  16),
	(193, 'Garden pots', 16),
	(194, 'Office supplies', 16)
	;
	
/* ========================================================================
	ADD REUSE organizations ENTITIES WITH CORRESPONDING Hours AND organizationitems ENTITIES
   ======================================================================== */

/* 1 - ALBANY-CORVALLIS REUSEIT */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(1, 1, 'Albany-Corvallis ReUseIt', 
	Null, 
	Null, 
	Null, 
	Null, 
	Null, 
	'https://groups.yahoo.com/neo/groups/albanycorvallisReUseIt/info', 
	Null, 
	'Yahoo Groups Website')
	;
	
INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(1,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null)
	;
	
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (1, 189);		/* computer paper */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (1, 182);		/* egg cartons */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (1, 184);		/* fabric */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (1, 183);		/* firewood */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (1, 153);		/* food garden */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (1, 186);		/* pet supplies */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (1, 188);		/* vehicles parts */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (1, 193);		/* garden pots */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (1, 194);		/* office supplies */

/* 2 - ARC THRIFT STORES (CORVALLIS) */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(2, 1, 'Arc Thrift Stores (Corvallis)',
	'928 NW Beca Ave.',
	Null,
	'Corvallis',
	'OR',
	'97330', 
	'http://www.arcbenton.org/',
	'(541)754-9011',
	Null)
	;
	
INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(2,
	'10:00', '17:30',
	'10:00', '17:30',
	'10:00', '17:30',
	'10:00', '17:30',
	'10:00', '17:30',
	'10:00', '17:30',
	'10:00', '17:30')
	;
	

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (2, 184);		/* fabric */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (2, 186);		/* pet supplies */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (2, 188);		/* vehicles parts */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (2, 193);		/* garden pots */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (2, 194);		/* office supplies */

/* 3 - ARC THRIFT STORES (Philomath) */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(3, 1, 'Arc Thrift Stores (Philomath)',
	'936 Main St.',
	Null,
	'Philomath',
	'OR',
	'97370', 
	'http://www.arcbenton.org/',
	'(541)929-3946',
	Null)
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(3,
	'10:00', '17:30',
	'10:00', '17:30',
	'10:00', '17:30',
	'10:00', '17:30',
	'10:00', '17:30',
	'10:00', '17:30',
	'12:00', '17:30')
	;
	
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (3, 184);		/* fabric */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (3, 186);		/* pet supplies */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (3, 188);		/* vehicles parts */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (3, 193);		/* garden pots */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (3, 194);		/* office supplies */

/* 4 - BEEKMAN PLACE ANTIQUE MALL */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(4, 1, 'Beekman Place Antique Mall',
	'601 SW Western Blvd.',
	Null,
	'Corvallis',
	'OR',
	'97333', 
	'https://www.antiquemalls.com/or/corvallis/97333/16882',
	'(541)753-8250',
	Null)
	;
	
INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(4,
	Null, Null,
	'11:00', '17:00',
	'11:00', '17:00',
	'11:00', '17:00',
	'11:00', '17:00',
	'11:00', '17:00',
	'11:00', '17:00')
	;	
	


/* 5 - BENTON COUNTY EXTENSION - 4H ACTIVITIES */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(5, 1, 'Benton County Extension - 4H Activities',
	'1849 NW 9th St.',
	Null,
	'Corvallis',
	'OR',
	'97330', 
	'http://extension.oregonstate.edu/benton/',
	'(541)766-6750',
	Null)
	;
	
INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(5,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null)
	;
	
INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (5, 14);			/* art supplies */
INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (5, 184);		/* fabric */
INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (5, 51);			/* school supplies */

/* 6 - BENTON COUNTY MASTER GARDENS */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(6, 1, 'Benton County Master Gardens',
	'1849 NW 9th St.',
	Null,
	'Corvallis',
	'OR',
	'97330', 
	'http://extension.oregonstate.edu/benton/horticulture/mg',
	'(541)766-6750',
	Null)
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(6,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null)
	;
	
INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (6, 16);		/* books */


/* 7 - BOOK BIN */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(7, 1, 'Book Bin',
	'215 SW 4th St.',
	Null,
	'Corvallis',
	'OR',
	'97333', 
	'http://bookbin.com/',
	'(541)752-0040',
	Null)
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(7,
	'08:30', '21:00',
	'08:30', '21:00',
	'08:30', '21:00',
	'08:30', '21:00',
	'08:30', '21:00',
	'08:30', '21:00',
	'09:00', '19:00')
	;	
	
INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (7, 16);		/* books */


/* 8 - BROWSER'S BOOKSTORE */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(8, 1, 'Browser\'s Bookstore',
	'121 NW 4th St.',
	Null,
	'Corvallis',
	'OR',
	'97330', 
	'http://www.browsersbookstore.com/',
	'(888)758-1121',
	Null)
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(8,
	'09:30', '18:00',
	'09:30', '18:00',
	'09:30', '18:00',
	'09:30', '18:00',
	'09:30', '18:00',
	'09:30', '18:00',
	Null, Null)
	;
	
INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (8, 16);		/* books */


/* 9 - BOYS & GIRLS CLUB/STARS (AFTER SCHOOL PROGRAMS) */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(9, 1, 'Boy & Girls Club/STARS (after school programs)',
	'1112 NW Circle Blvd.',
	Null,
	'Corvallis',
	'OR',
	'97330', 
	'http://www.bgccorvallis.org/',
	'(541)757-1909',
	Null)
	;
	
INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(9,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null)
	;
	
INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (9, 14);			/* art supplies */
INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (9, 189);		/* computer paper */
INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (9, 182);		/* egg cartons */
INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (9, 184);		/* fabric */
INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (9, 51);			/* school supplies */
INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (9, 28);			/* toiletries */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (9, 193);		/* garden pots */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (9, 194);		/* office supplies */

/* 10 - BUCKINGHAM PALACE */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(10, 1, 'Buckingham Palace',
	'600 SW 3rd St.',
	Null,
	'Corvallis',
	'OR',
	'97333', 
	null,
	'(541)752-7980',
	'Friday to Sunday only')
	;
	
INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(10,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null)
	;

INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (10, 14);			/* art supplies */
INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (10, 16);			/* books */
INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (10, 184);			/* fabric */
INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (10, 24);			/* furniture */

/* 11 -  CALVARY COMMUNITY OUTREACH */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(11, 1, 'Calvary Community Outreach',
	'2125 NW Lester Ave.',
	Null,
	'Corvallis',
	'OR',
	'97330', 
	'http://www.communityoutreachinc.org/',
	'(541)760-5941',
	Null)
	;
	
INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(11,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null)
	;
	
/* 12 - CARDV (Center Against Rape/Domestic Violence) */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(12, 1, 'CARDV (Center Against Rape/Domestic Violence)',
	'4786 SW Philomath Blvd.',
	Null,
	'Corvallis',
	'OR',
	'97333', 
	'http://cardv.org/',
	'(541)758-0219',
	Null)
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(12,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null)
	;
	

INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (12, 153);				/* food garden */


/* 13 - CAREER CLOSET FOR WOMEN */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(13, 1, 'Career Closet for Women',
	'942 NW 9th St.',
	'Suite A',
	'Corvallis',
	'OR',
	'97330', 
	'https//sicorvallis.wordpress.com/',
	'(541)754-6979',
	'Drop off')
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(13,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null)
	;
	


/* 14 - CAT'S MEOW HUMANE SOCIETY THRIFT SHOP */	
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(14, 1, 'Cat\'s Meow Humane Society Thrift Shop',
	'411 SW 3rd St.',
	Null,
	'Corvallis',
	'OR',
	'97333', 
	'http://www.heartlandhumane.org/',
	'(541)757-0673',
	Null)
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(14,
	'10:00', '17:00',
	'10:00', '17:00',
	'10:00', '17:00',
	'10:00', '17:00',
	'10:00', '17:00',
	'10:00', '17:00',
	Null, Null)
	;	
	

INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (14, 184);				/* fabric */

INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (14, 186);				/* pet supplies */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (14, 194);		/* office supplies */

/* 15 - CHILDREN'S FARM HOME */	
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(15, 1, 'Children\'s Farm Home',
	'4455 NE Hwy. 20',
	Null,
	'Corvallis',
	'OR',
	'97330', 
	'http://www.trilliumfamily.org/',
	'(541)757-1852',
	Null)
	;
	
INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(15,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null)
	;
	

INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (15, 14);				/* art supplies */

INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (15, 24);				/*  furniture */

INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (15, 28);				/* toiletries */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (15, 194);		/* office supplies */

/* 16 - CHINTIMINI WILDLIFE REHABILITATION CENTER */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(16, 1, 'Chintimini Wildlife Rehabilitation Center',
	'311 Lewisburg Rd.',
	Null,
	'Corvallis',
	'OR',
	'97330', 
	'http://www.chintiminiwildlife.org/',
	'(541)745-5324',
	Null)
	;
	
INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(16,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null)
	;
	
INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (16, 153);				/* food garden */

INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (16, 186);				/* pet supplies */


/* 17 - COMMUNITY OUTREACH (HOMELESS SHELTER) */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(17, 1, 'Community Outreach (Homeless Shelter)',
	'865 NW Reiman Ave.',
	Null,
	'Corvallis',
	'OR',
	'97330', 
	'http://www.communityoutreachinc.org/services/emergency-shelter-program/family-shelter/',
	'(541)758-3000',
	Null)
	;
	
INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(17,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null)
	;
	

INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (17, 153);				/* food garden */
INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (17, 14);				/* art supplies */

INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (17, 51);				/* school supplies */
INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (17, 28);				/* toiletries */

/* 18 - CORVALLIS ENVIRONMENTAL CENTER */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(18, 1, 'Corvallis Environmental Center',
	'214 SW Monroe Ave.',
	Null,
	'Corvallis',
	'OR',
	'97333', 
	'http://www.corvallisenvironmentalcenter.org/',
	'(541)753-9211',
	Null)
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(18,
	'09:00', '17:00',
	'09:00', '17:00',
	'09:00', '17:00',
	'09:00', '17:00',
	Null, Null,
	Null, Null,
	Null, Null)
	;	
	
INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (18, 14);				/* art supplies */
INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (18, 189);				/* computer paper */

INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (18, 51);				/* school supplies */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (18, 193);		/* garden pots */

/* 19 - CORVALLIS BICYCLE COLLECTIVE */	
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(19, 1, 'Corvallis Bicycle Collective',
	'33900 SE Roche Ln./Hwy. 34',
	Null,
	'Corvallis',
	'OR',
	'97333', 
	'http://corvallisbikes.org/',
	'(541)224-6885',
	Null)
	;
	
INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(19,
	Null, Null,
	'12:00', '16:00',
	'12:00', '16:00',
	'12:00', '16:00',
	'12:00', '16:00',
	'12:00', '16:00',
	'12:00', '16:00')
	;	
	


/* 20 - CORVALLIS FURNITURE */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(20, 1, 'Corvallis Furniture',
	'720 NE Granger Ave.',
	'Building J',
	'Corvallis',
	'OR',
	'97333', 
	'http://corvallisfurniture.com/',
	'(541)231-8103',
	Null)
	;
	
INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(20,
	'10:00', '15:00',
	'10:00', '18:00',
	'10:00', '18:00',
	'10:00', '18:00',
	'10:00', '18:00',
	'10:00', '15:00',
	'10:00', '15:00')
	;	
	

INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (20, 24);				/* furniture */

/* 21 - CORVALLIS-UZHHOROD SISTER CITIES/THE TOUCH PROJECT */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(21, 1, 'Corvallis-Uzhhorod Sister Cities/The TOUCH Project',
	Null,
	Null,
	'Corvallis',
	'OR',
	Null, 
	'http://www.sistercities.corvallis.or.us/uzhhorod',
	'(541)753-5170',
	Null)
	;
	
INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(21,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null)
	;
	


/* 22 - COSMIC CHAMELEON */	
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(22, 1, 'Cosmic Chameleon',
	'138 SW 2nd St.',
	Null,
	'Corvallis',
	'OR',
	'97333', 
	Null,
	'(541)752-9001',
	Null)
	;
	
INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(22,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null)
	;
	


/* 23 - CRAIGSLIST (CORVALLIS.CRAIGSLIST.ORG) AND FREECYCLE.ORG */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(23, 1, 'Cosmic Chameleon',
	Null,
	Null,
	Null,
	Null,
	Null,
	'https://corvallis.craigslist.org/',
	Null,
	Null)
	;
	
INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(23,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null)
	;
	

INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (23, 189);				/* computer paper */
INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (23, 182);				/* egg cartons */
INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (23, 184);				/* fabric */
INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (23, 183);				/* firewood */
INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (23, 153);				/* food garden */
INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (23, 186);				/* pet supplies */
INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (23, 188);				/* vehicles parts */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (23, 193);		/* garden pots */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (23, 194);		/* office supplies */

/* 24 - FIRST ALTERNATIVE CO-OP RECYCLING CENTER  (SOUTH STORE)*/
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(24, 1, 'First Alternative Co-op Recycling Center (South Store)',
	'1007 SE 3rd St.',
	Null,
	'Corvallis',
	'OR',
	'97333', 
	'http://firstalt.coop/',
	'(541)753-3115',
	Null)
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(24,
	'07:00', '22:00',
	'07:00', '22:00',
	'07:00', '22:00',
	'07:00', '22:00',
	'07:00', '22:00',
	'07:00', '22:00',
	'07:00', '22:00')
	;
	

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (24, 193);		/* garden pots */

/* 25 - FIRST ALTERNATIVE CO-OP RECYCLING CENTER  (NORTH STORE)*/
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(25, 1, 'First Alternative Co-op Recycling Center (North Store)',
	'2885 NW Grant St.',
	Null,
	'Corvallis',
	'OR',
	'97333', 
	'http://firstalt.coop/',
	'(541)452-3115',
	Null)
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(25,
	'07:00', '22:00',
	'07:00', '22:00',
	'07:00', '22:00',
	'07:00', '22:00',
	'07:00', '22:00',
	'07:00', '22:00',
	'07:00', '22:00')
	;
	

INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (25, 182);				/* egg cartons */
INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (25, 160);				/* eyeglasses */
INSERT INTO organizationitems (`org_id`, `item_id`) VALUES (25, 175);				/* printer refills */

/* 26 - FURNITURE EXCHANGE */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(26, 1, 'Furniture Exchange',
	'210 NW 2nd St.',
	Null,
	'Corvallis',
	'OR',
	'97330', 
	'http://www.furnitureexchange-usa.com/',
	'(541)833-0183',
	Null)
	;
	
INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(26,
	Null, Null,
	'10:00', '17:30',
	'10:00', '17:30',
	'10:00', '17:30',
	'10:00', '17:30',
	'10:00', '17:30',
	Null, Null)
	;	
	


/* 27 - FURNITURE SHARE (FORMERLY BENTON FS) */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(27, 1, 'Furniture Share (Formerly Benton FS)',
	'155 SE Lily Ave.',
	Null,
	'Corvallis',
	'OR',
	'97333', 
	'http://furnitureshare.org/',
	'(541)754-9511',
	Null)
	;	

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(27,
	Null, Null,
	'09:00', '16:00',
	'09:00', '16:00',
	'09:00', '16:00',
	'09:00', '16:00',
	Null, Null,
	Null, Null)
	;	
	


/* 28 - HOME GROWN GARDENS */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(28, 1, 'Home Grown Gardens',
	'4845 SE 3rd St.',
	Null,
	'Corvallis',
	'OR',
	'97333', 
	'http://homegrowngardens77.vpweb.com/',
	'(541)758-2137',
	Null)
	;	
	
INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(28,
	'10:00', '17:00',
	'10:00', '17:00',
	'10:00', '17:00',
	'10:00', '17:00',
	'10:00', '17:00',
	'10:00', '17:00',
	'12:00', '17:00')
	;	
	
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (28, 193);		/* garden pots */

/* 29 - GARLAND NURSERY */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(29, 1, 'Garland Nursey',
	'5470 NE Hwy. 20',
	Null,
	'Corvallis',
	'OR',
	'97330', 
	'http://garlandnursery.com/',
	'(541)753-6601',
	Null)
	;	
	
INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(29,
	'09:00', '17:00',
	'09:00', '17:00',
	'09:00', '17:00',
	'09:00', '17:00',
	'09:00', '17:00',
	'09:00', '17:00',
	'10:00', '17:00')
	;
	
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (29, 193);		/* garden pots */

/* 30 - GOODWILL INDUSTRIES */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(30, 1, 'Goodwill Industries',
	'1325 NW 9th St.',
	Null,
	'Corvallis',
	'OR',
	'97330', 
	'http://www.goodwill.org/locator/',
	'(541)752-8278',
	Null)
	;	
	
INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(30,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null)
	;
	

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (30, 184);		/*  fabric */

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (30, 193);		/*  garden pots */

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (30, 186);		/*  pet supplies */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (30, 194);		/* office supplies */

/* 31- HABITAT FOR HUMANITY RESTORE */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(31, 1, 'Habitat for Humanity ReStore',
	'4840 SW Philomath Blvd.',
	Null,
	'Corvallis',
	'OR',
	'97333', 
	'http://bentonhabitat.org/',
	'(541)752-6637',
	Null)
	;	

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(31,
	'09:00', '18:00',
	'09:00', '18:00',
	'09:00', '18:00',
	'09:00', '18:00',
	'09:00', '18:00',
	'09:00', '18:00',
	Null, Null)
	;	
	

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (31, 183);		/*  firewood */

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (31, 193);		/*  garden pots */

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (31, 194);		/* office supplies */

/* 32 - HAPPY TRAILS RECORDS, TAPES, & CDS */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(32, 1, 'Happy Trails Records, Tapes, & CDs',
	'100 SW 3rd St.',
	Null,
	'Corvallis',
	'OR',
	'97333', 
	'http://www.corvallisbusiness.com/happytrails.html',
	'(541)752-9032',
	Null)
	;	
	
INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(32,
	'10:30', '19:00',
	'10:30', '19:00',
	'10:30', '19:00',
	'10:30', '19:00',
	'10:30', '21:00',
	'10:30', '21:00',
	'12:00', '18:00')
	;
	


/* 33 - HEARTLAND HUMANE SOCIETY */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(33, 1, 'Heartland Humane Society',
	'398 SW Twin Oaks Cir.',
	Null,
	'Corvallis',
	'OR',
	'97333', 
	'http://heartlandhumane.org/',
	'(541)757-9000',
	Null)
	;	

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(33,
	Null, Null,
	'12:00', '18:00',
	'12:00', '18:00',
	Null, Null,
	'12:00', '18:00',
	'12:00', '17:00',
	'12:00', '17:00')
	;	
	

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (33, 186);		/* pet supplies */

/* 34 - HOME LIFE INC (FOR DEVELOP. DISABLED) */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(34, 1, 'Home Life Inc. (for develop. disabled)',
	'2068 NW Fillmore Ave.',
	Null,
	'Corvallis',
	'OR',
	'97330', 
	'http://homelifeinc.org/',
	'(541)753-9015',
	'For developmentally disabled')
	;	
	
INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(34,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null)
	;
	

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (34, 193);		/* garden pots */

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (34, 194);		/* office supplies */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (34, 188);		/* vehicles parts */

/* 35 - JACKSON STREET YOUTH SHELTER */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(35, 1, 'Jackson Street Youth Shelter',
	'555 NW Jackson St.',
	Null,
	'Corvallis',
	'OR',
	'97330', 
	'http://www.jsysi.org/',
	'(541)754-2404',
	Null)
	;	

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(35,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null)
	;
	
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (35, 14);		/* art supplies */

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (35, 153);		/* art supplies */

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (35, 194);		/* office supplies */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (35, 28);		/* toiletries */

/* 36 - LINN BENTON FOOD SHARE (LARGE FOOD DONATIONS) */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(36, 1, 'Linn Benton Food Share',
	'545 SW 2nd St.',
	Null,
	'Corvallis',
	'OR',
	'97333', 
	'http://communityservices.us/nutrition/detail/category/linn-benton-food-share/',
	'(541)752-1010',
	'Large food donations')
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(36,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null)
	;
	

	
/* 37 - LIONS CLUB (BOX INSIDE ELKS LODGE) */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(37, 1, 'Lions Club',
	'1400 NW 9th St.',
	Null,
	'Corvallis',
	'OR',
	'97330', 
	'http://www.e-clubhouse.org/sites/midvalley/',
	'(541)758-0222',
	'Box inside Elks Lodge')
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(37,
	'10:00', '18:00',
	'10:00', '18:00',
	'10:00', '18:00',
	'10:00', '18:00',
	'10:00', '18:00',
	'10:00', '18:00',
	'12:00', '17:00')
	;	
	
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (37, 160);		/* eyeglasses */

/* 38 - LOVE INC (FOR LOW INCOME CITIZENS) */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(38, 1, 'Love INC',
	'2330 NW Professional Dr.',
	'#102',
	'Corvallis',
	'OR',
	'97330', 
	'http://www.yourloveinc.org/',
	'(541)757-8111',
	'For low income citizens')
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(38,
	'09:30', '15:30',
	'09:30', '15:30',
	'09:30', '15:30',
	'09:30', '15:30',
	Null, Null,
	Null, Null,
	Null, Null)
	;
	

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (38, 184);		/* fabric */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (38, 183);		/* firewood */

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (38, 194);		/* office supplies */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (38, 186);		/* pet supplies */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (38, 188);		/* vehicle parts */

/* 39 - MANO PASTEGA HOUSE (GOOD SAM PATIENT FAMILY HOUSING) */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(39, 1, 'Mano Pastega House',
	'3505 NW Samaritan Dr.',
	Null,
	'Corvallis',
	'OR',
	'97330', 
	'http://samhealth.org/locations/mariopasegahouse/Pages/default.aspx',
	'(541)768-4650',
	'Good Sam patient family housing')
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(39,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null)
	;
	
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (39, 16);		/* books */


/* 40 - MARY'S RIVER GLEANERS (FOR LOW INCOME CITIZENS) */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(40, 1, 'Mary\'s River Gleaners',
	'PO Box 2309',
	Null,
	'Corvallis',
	'OR',
	'97399', 
	Null,
	'(541)752-1010',
	'For low income citizens')
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(40,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null)
	;


INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (40, 184);		/* fabric */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (40, 183);		/* firewood */

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (40, 153);		/* food garden */

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (40, 193);		/* garden pots */

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (40, 194);		/* office supplies */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (40, 186);		/* pet supplies */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (40, 188);		/* vehicles parts */

/* 41 - MIDWAY FARMS */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(41, 1, 'Midway Farms',
	'6980 US Hwy. 20',
	'Hwy. 20 between Corvallis and Albany',
	'Albany',
	'OR',
	'97321', 
	'http://www.midwayfarmsorego.com/',
	'(541)740-6141',
	Null)
	;
	
INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(41,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null)
	;


INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (41, 182);		/* egg cartons */

/* 42 - NEIGHBOR TO NEIGHBOR */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(42, 1, 'Neighbor to Neighbor',
	'1123 Main St.',
	Null,
	'Philomath',
	'OR',
	'97370', 
	Null,
	'(541)929-6614',
	'Food pantry')
	;	

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(42,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null)
	;
	

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (42, 153);		/* food garden */

/* 43 - OSBORN AQUATIC CENTER */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES
	(43, 1, 'Osborn Aquatic Center',
	'1940 NW Highland Dr.',
	Null,
	'',
	'OR',
	'07730', 
	'http://www.corvallisoregon.gov/index.aspx?page=57',
	'(541)766-7946',
	Null)
	;
	
INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(43,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null,
	Null, Null)
	;



/* 44 - OSU EMERGENCY FOOD PANTRY */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES		
	(44, 1, 'OSU Emergency Food Pantry', 
	'2150 SW Jefferson Way',
	NULL, 
	'Corvallis', 
	'OR', 
	'97331', 
	'http://studentlife.oregonstate.edu/hsrc/osu-emergency-food-pantry', 
	'(541)737-3473', 
	NULL)
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(44, 
	'17:00:00', '20:00:00', 
	NULL, NULL, 
	'17:00:00', '20:00:00', 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL)
	;
	

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (44, 153);		/* food garden */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (44, 28);		/* toiletries */

/* 45 - OSU FOLK CLUB THRIFT SHOP */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES		
	(45, 1, 'OSU Folk Club Thrift Shop', 
	'144 NW 2nd St.', 
	NULL,
	'Corvallis', 
	'OR', 
	'97330', 
	'http://oregonstate.edu/osufolk/hours', 
	'(541)752-4733', 
	NULL)
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(45, 
	NULL, NULL, 
	'09:30:00', '14:00:00', 
	'09:30:00', '14:00:00', 
	'09:30:00', '14:00:00', 
	'09:30:00', '12:30:00', 
	NULL, NULL, 
	NULL, NULL)
	;
	

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (45, 184);		/* fabric */

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (45, 193);		/* garden pots */

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (45, 194);		/* office supplies */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (45, 186);		/* pet supplies */

/* 46 - OSU ORGANIC GROWERS CLUB (CROP & SOIL SCIENCE DEPT.) */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES		
	(46, 1, 'OSU Organic Growers Club (Crop & Soil Science Dept)', 
	NULL, 
	NULL, 
	'Corvallis', 
	'OR', 
	NULL, 
	'http://cropandsoil.oregonstate.edu/organic_grower', 
	'(541)737-6810', 
	NULL)
	;
	
INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(46, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL,
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL,
	NULL, NULL)
	;
	 


/* 47 - PAK MAIL (TIMBERHILL SHOPPING CTR.) */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(47, 1, 
	'Pak Mail (Timberhill Shopping Ctr)', 
	'2397 NW Kings Blvd.', 
	NULL, 
	'Corvallis', 
	'OR',
	'97330', 
	'http://www.pakmail.com/stores/pak-mail-corvallis/', 
	'(541)754-8411', 
	NULL)
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(47, 
	'09:00:00', '17:30:00', 
	'09:00:00', '17:30:00', 
	'09:00:00', '17:30:00', 
	'09:00:00', '17:30:00', 
	'09:00:00', '17:30:00', 
	'09:00:00', '16:00:00', 
	NULL, NULL)
	;
	


/* 48 - PARENT ENHANCEMENT PROGRAM  */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(48, 1, 
	'Parent Enhancement Program', 
	'421 NW 4th St.', 
	NULL, 
	'Corvallis', 
	'OR', 
	'97330', 
	'http://www.downtowncorvallis.org/members/directory.php?show=779', 
	'(541)758-8292', 
	NULL)
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(48,
	'09:00:00', '17:30:00', 
	'09:00:00', '17:30:00', 
	'09:00:00', '17:30:00', 
	'09:00:00', '17:30:00', 
	'09:00:00', '17:30:00',
	 '09:00:00', '16:00:00', 
	 NULL, NULL)
	 ;

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (48, 14);		/* art supplies */

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (48, 16);		/* books */

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (48, 184);		/* fabric */

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (48, 194);		/* office supplies */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (48, 28);		/* toiletries */

/* 49 - PASTORS FOR PEACE-CARAVAN TO CUBA */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(49, 1, 'Pastors for Peace-Caravan to Cuba', 
	NULL, 
	NULL, 
	'Corvallis', 
	'OR', 
	NULL,
	'www.ccds.org or www.ifconews.org.', 
	'(541)754-1858', 
	'Contact Mike Beilstein')
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(49,
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL)
	;



/* 50 - PHILOMATH COMMUNITY GARDEN */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(50, 1, 
	'Philomath Community Garden', 
	NULL, 
	NULL, 
	'Corvallis', 
	'OR', 
	NULL, 
	'http://philomathcommunityservices.org/', 
	'(541)929-3524', 
	'Contact Chris Shonnard')
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(50, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL)
	;
	


/* 51 - PHILOMATH COMMUNITY SERVICES */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(51, 1, 'Philomath Community Services', 
	'360 S 9th St.', 
	NULL, 
	'Philomath', 
	'OR', 
	'97370', 
	'http://philomathcommunityservices.org/', 
	'(541)929-2499', 
	NULL)
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(51, 
	NULL, NULL, 
	'17:00:00', '20:00:00', 
	NULL, NULL, 
	'09:00:00', '12:00:00', 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL)
	;
	
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (51, 16);		/* books */

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (51, 183);		/* firewood */

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (51, 153);		/* food garden */

/* 52 - PLAY IT AGAIN SPORTS */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(52, 1, 'Play It Again Sports', 
	'1422 NW 9th St.', 
	NULL, 
	'Corvallis', 
	'OR', 
	'97330', 
	'http://www.playitagainsportscorvallis.com/', 
	'(541)754-7529', 
	NULL)
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(52, 
	'09:00:00', '19:00:00', 
	'09:00:00', '19:00:00', 
	'09:00:00', '19:00:00', 
	'09:00:00', '19:00:00', 
	'09:00:00', '19:00:00', 
	'09:00:00', '18:00:00', 
	'10:00:00', '17:00:00')
	;
	


/* 53 - PRESBYTERIAN PIECEMAKERS */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(53, 1, 'Presbyterian Piecemakers', 
	'114 SW 8th St.', 
	NULL, 
	'Corvallis', 
	'OR', 
	'97333', 
	'http://1stpres.org/', 
	'(541)753-7516', 
	NULL)
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(53, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL)
	;
	
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (53, 184);		/* fabric */

/* 54 - PUBLIC LIBRARY CORVALLIS, FRIENDS OF */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(54, 1, 'Public Library Corvallis, Friends of', 
	'645 NW Monroe Ave.', 
	NULL, 
	'Corvallis', 
	'OR', 
	'97330', 
	'http://cbcpubliclibrary.net/', 
	'(541)766-6928', 
	NULL)
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(54, 
	'10:00:00', '20:00:00', 
	'10:00:00', '20:00:00', 
	'10:00:00', '20:00:00', 
	'10:00:00', '20:00:00', 
	'10:00:00', '18:00:00', 
	'10:00:00', '18:00:00', 
	'13:00:00', '17:00:00')
	;
	
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (54, 16);		/* books */

/* 55 - QUILTS FROM CARING HANDS */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(55, 1, 'Quilts From Caring Hands', 
	'1495 NW 20th St.', 
	NULL, 
	'Corvallis', 
	'OR', 
	'97730', 
	'http://www.quiltsfromcaringhands.com/', 
	'(541)758-8161', 
	NULL)
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(55, 
	NULL, NULL, 
	NULL, NULL, 
	'09:30:00', '14:00:00', 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL)
	;
	
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (55, 184);		/* fabric */

/* 56 - RAPID REFILL INK */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(56, 1, 'Rapid Refill Ink', 
	'254 SW Madison Ave.', 
	NULL, 
	'Corvallis', 
	'OR', 
	'97333', 
	'http://www.rapidinkandtoner.com/oregon/corvallis-store-0107', 
	'(541)758-8444', 
	NULL)
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(56, 
	'09:00:00', '17:30:00', 
	'09:00:00', '17:30:00',
	'09:00:00', '17:30:00',
	'09:00:00', '17:30:00', 
	'09:00:00', '17:30:00', 
	'10:00:00', '15:00:00', 
	NULL, NULL)
	;
	
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (56, 175);		/* ink refill */

/* 57 - RE-VOLVE (WOMEN'S RESALE BOUTIQUE) */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(57, 1, 're-volve (Women\'s Resale Boutique)', 
	'103 SW 2nd St.', 
	NULL, 
	'Corvallis', 
	'OR', 
	'97333', 
	'http://www.revolveresale.com/', 
	'541-754-1154', 
	NULL)
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(57, 
	NULL, NULL, 
	'11:00:00', '18:00:00', 
	NULL, NULL, 
	'11:00:00', '18:00:00', 
	NULL, NULL,
	NULL, NULL, 
	NULL, NULL)
	;
	


/* 58 - SCHOOLS - PUBLIC, PRIVATE, CHARTER */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(58, 1, 'Schools - Public, Private, Charter', 
	NULL, 
	NULL, 
	'Corvallis', 
	'OR', 
	NULL, 
	'http://www.glanceagain.com/', 
	NULL, 
	'Various locations and phone numbers')
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(58, 
	NULL, NULL,
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL)
	;
	
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (58, 14);		/* art supplies */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (58, 16);		/* books */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (58, 194);		/* office supplies */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (58, 51);		/* school supplies */

/* 59 - SECOND GLANCE */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(59, 1, 'Second Glance', 
	'312 SW 3rd St.', 
	NULL, 
	'Corvallis', 
	'OR', 
	'97333', 
	'http://www.glanceagain.com/', 
	'(541)758-9099', 
	NULL)
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(59, 
	'10:00:00', '18:00:00', 
	'10:00:00', '18:00:00', 
	'10:00:00', '18:00:00', 
	'10:00:00', '18:00:00', 
	'10:00:00', '18:00:00', 
	'10:00:00', '18:00:00', 
	'12:00:00', '17:00:00')
	;
	


/* 60 - THE ANNEX */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(60, 1, 'The Annex', 
	'214 SW Jefferson Ave.', 
	NULL,
	'Corvallis', 
	'OR', 
	'97333', 
	'http://www.glanceagain.com/', 
	'(541)758-9099', 
	NULL)
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(60, 
	'11:00:00', '18:00:00', 
	'11:00:00', '18:00:00', 
	'11:00:00', '18:00:00', 
	'11:00:00', '18:00:00', 
	'11:00:00', '18:00:00', 
	'11:00:00', '18:00:00', 
	'12:00:00', '17:00:00')
	;



/* 61 - THE ALLEY */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(61, 1, 'The Alley', 
	'312 SW Jefferson Ave.', 
	NULL, 
	'Corvallis', 
	'OR', 
	'97333', 
	'http://www.glanceagain.com/2011/11/second-glance-alley/', 
	'(541)753-4069', 
	NULL)
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(61, 
	'11:00:00', '18:00:00', 
	'11:00:00', '18:00:00', 
	'11:00:00', '18:00:00', 
	'11:00:00', '18:00:00', 
	'11:00:00', '18:00:00', 
	'11:00:00', '18:00:00', 
	'12:00:00', '17:00:00')
	;
	


/* 62 - SENIOR CENTER OF CORVALLIS */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(62, 1, 'Senior Center of Corvallis', 
	'2601 NW Tyler Ave.', 
	NULL, 
	'Corvallis', 
	'OR', 
	'97330', 
	'http://www.corvallisoregon.gov/index.aspx?page=257', 
	'(541)766-6959', 
	NULL)
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(62, 
	'08:00:00', '16:00:00', 
	'08:00:00', '16:00:00', 
	'08:00:00', '16:00:00', 
	'08:00:00', '16:00:00', 
	'08:00:00', '16:00:00', 
	NULL, NULL, 
	NULL, NULL)
	;
	

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (62, 102);		/* cellphones */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (62, 153);		/* food garden */


/* 63 -SOUTH CORVALLIS FOOD BANK */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(63, 1, 'South Corvallis Food Bank', 
	'1798 SW 3rd St.',
	NULL, 
	'Covallis', 
	'OR', 
	'97333', 
	'http://www.southcorvallisfoodbank.org/', 
	'(541)753-4263', 
	NULL)
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(63, 
	'13:00:00', '15:00:00', 
	NULL, NULL, 
	'13:00:00', '15:00:00', 
	'17:00:00', '19:00:00', 
	NULL, NULL, 
	'10:00:00', '12:00:00', 
	NULL, NULL)
	;
	

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (63, 153);		/* food garden */

/* 64 - ST. VINCENT DE PAUL FOOD BANK */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(64, 1, 'St. Vincent de Paul Food Bank', 
	'501 NW 25th St.', 
	NULL, 
	'Corvallis', 
	'OR', 
	'97330', 
	NULL, 
	'(541)757-1988', 
	NULL)
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(64, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL,
	NULL, NULL, 
	NULL, NULL)
	 ;
	 

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (64, 153);		/* food garden */

/* 65 - STONE SOUP (ST. MARY'S CHURCH */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(65, 1, 'Stone Soup  (St Mary\'s Church)', 
	'501 NW 25th St.', 
	NULL, 
	'Corvallis', 
	'OR', 
	'97330', 
	'http://www.stonesoupcorvallis.org/about.html', 
	'(541)757-1988', 
	NULL)
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(65, 
	'17:30:00', '18:30:00', 
	NULL, NULL, 
	'11:30:00', '12:30:00', 
	'17:30:00', '18:30:00', 
	'11:30:00', '12:30:00', 
	NULL, NULL, 
	NULL, NULL)
	;
	

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (65, 153);		/* food garden */

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (65, 186);		/* pet supplies */

/* 66 - UPS STORE (PHILOMATH) */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(66, 1, 'UPS Store (Philomath)', 
	'5060 SW Philomath Blvd.', 
	NULL,
	'Corvallis', 
	'OR', 
	'97333',
	'https://corvallis-or-5088.theupsstorelocal.com/', 
	'(541)752-1830', 
	NULL)
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES		
	(66, 
	'07:30:00', '18:00:00', 
	'07:30:00', '18:00:00', 
	'07:30:00', '18:00:00', 
	'07:30:00', '18:00:00', 
	'07:30:00', '18:00:00', 
	'09:30:00', '15:00:00', 
	NULL, NULL)
	;
	


/* 67 - UPS STORE (CORVALLIS) */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(67, 1, 'UPS Stores (Corvallis)', 
	'922 NW Circle Blvd.',
	'#160', 
	'Corvallis', 
	'OR', 
	'97330', 
	'https://corvallis-or-5088.theupsstorelocal.com/',
	'(541)752-0056', 
	NULL)
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(67, 
	'07:30:00', '18:00:00', 
	'07:30:00', '18:00:00', 
	'07:30:00', '18:00:00', 
	'07:30:00', '18:00:00', 
	'07:30:00', '18:00:00', 
	'09:30:00', '15:00:00', 
	NULL, NULL)
	;
	


/* 68 - VINA MOSES */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(68, 1, 'Vina Moses', 
	'968 NW Garfield Ave.', 
	NULL, 
	'Corvallis', 
	'OR', 
	'97330', 
	'http://www.vinamoses.org/', 
	'(541)753-1420', 
	'For low income citizens')
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(68, 
	'09:00:00', '16:00:00', 
	'09:00:00', '16:00:00', 
	'09:00:00', '16:00:00', 
	'09:00:00', '16:00:00', 
	'09:00:00', '16:00:00', 
	NULL, NULL, 
	NULL, NULL)
	;
	

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (68, 160);		/* eyeglasses */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (68, 184);		/* fabric */

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (68, 153);		/* food garden */

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (68, 193);		/* garden pots */

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (68, 194);		/* office supplies */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (68, 186);		/* pet supplies */

/* 69 - SPAETH HERITAGE HOUSE */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(69, 1, 'Spaeth Heritage House', 
	'135 N 13th St.', 
	NULL,
	'Philomath', 
	'OR', 
	'97330', 
	'http://www.spaethlumber.com/main/home/main.aspx', 
	'(541)307-0349', 
	NULL)
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(69, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL)
	;
	

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (69, 24);		/* furniture */

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (69, 193);		/* garden pots */


/* 70 - BELLVUE COMPUTERS */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(70, 2, 'Bellevue Computers', 
	'1865 NW 9th St.', 
	NULL, 
	'Corvallis', 
	'OR', 
	NULL, 
	'http://www.bellevuepc.com/', 
	'(541)757-3487', 
	'Repair computers and laptops')
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(70, 
	'09:00:00', '18:00:00', 
	'09:00:00', '18:00:00', 
	'09:00:00', '18:00:00', 
	'09:00:00', '18:00:00', 
	'09:00:00', '18:00:00', 
	'10:00:00', '17:00:00', 
	NULL, NULL)
	;
	
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (70, 5);		/* computers */

/* 71 - BOOK BINDING */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(71, 2, 'Book Binding', 
	'108 SW 3rd St.', 
	NULL, 
	'Corvallis', 
	'OR', 
	'97333', 
	'http://www.cornerstoneassociates.com/bj-bookbinding-about-us.html', 
	'(541)5757-9861', 
	'Rebind and Restore books')
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(71, 
	'09:00:00', '17:00:00', 
	'09:00:00', '17:00:00', 
	'09:00:00', '17:00:00', 
	'09:00:00', '17:00:00', 
	'09:00:00', '17:00:00', 
	NULL, NULL, 
	NULL, NULL)
	;
	
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (71, 3);		/* books */

/* 72 - CELL PHONE SICK BAY */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(72, 2, 'Cell Phone Sick Bay', 
	'252 Sw Madison Ave.', 
	'Suite 110', 
	'Corvallis', 
	'OR',
	'97333', 
	'http://www.cellsickbay.com/index.html',
	'(541)230-1785',
	'Repair cell phones and tablets')
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(72, 
	'10:00:00', '18:00:00', 
	'10:00:00', '18:00:00', 
	'10:00:00', '18:00:00', 
	'10:00:00', '18:00:00', 
	'10:00:00', '18:00:00', 
	'11:00:00', '16:00:00', 
	NULL, NULL)
	;
	
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (72,  1);		/* cellphones */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (72,  5);		/* computers */

/* 73 - CORVALLIS TECHNICAL*/
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(73, 2, 'Covallis Technical',
	'966 NW Circle Blvd.',
	NULL,	
	'Corvallis', 
	'OR', 
	'97730',
	'http://www.corvallistechnical.com/',
	'(541)704-7009',
	'Repair computers and laptops')
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(73, 
	'09:00:00', '17:00:00', 
	'09:00:00', '17:00:00',
	'09:00:00', '17:00:00', 
	'09:00:00', '17:00:00', 
	'09:00:00', '17:00:00', 
	NULL, NULL, 
	NULL, NULL)
	;
	
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (73,  5);		/* computers */

/* 74 - FOAM MAN */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(74, 2, 'Foam Man', 
	'2511 NW 9th St.',
	NULL,
	'Corvallis', 
	'OR', 
	'97330', 
	'http://www.thefoammancorvallis.com/', 
	'(541)754-9378',
	'Replacement foam cusions for chairs and couches, upholstery')
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(74, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL)
	;

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (74,  13);		/* upholstery furniture */

/* 75 - FOOTWISE */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(75, 2, 'Footwise', 
	'301 SW Madison Ave.',
	'#100', 
	'Corvallis', 
	'OR', 
	'97333', 	
	'http://footwise.com/',
	'(541)757-0875', 
	'Sandles')
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(75, 
	'10:00:00', '18:00:00', 
	'10:00:00', '18:00:00', 
	'10:00:00', '18:00:00', 
	'10:00:00', '18:00:00', 
	'10:00:00', '18:00:00', 
	'10:00:00', '18:00:00', 
	'11:00:00', '17:00:00')
	;

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (75,  10);		/* sandles */
	
/* 76 - FURNITURE RESTORATION CENTER */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(76, 2, 'Furniture Restoration Center', 
	'1321 Main St.',
	NULL, 
	'Philomath', 
	'OR', 
	'97370', 
	'http://restorationsupplies.com/', 
	'(541)929-6681', 
	'Restores all types of furniture and has hardware for doing it yourself')
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(76, 
	'09:00:00', '17:00:00',
	'09:00:00', '17:00:00',
	'09:00:00', '17:00:00', 
	'09:00:00', '17:00:00', 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL)
	;	
	
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (76,  6);		/* furniture */
	
/* 77 - GEEKS 'N' NERDS */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(77, 2, 'Geeks \'N\' Nerds', 
	'950 SE Gear St.',
	'Unit D', 
	'Albany',
	'OR',
	'97321',
	'http://www.computersgeeksnnerds.com/',
	'(541)753-0018',
	'Repair computers of all kinds and cell phone repair, in home repair available')
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES
	(77, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL)
	;
	
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (77,  1);		/* cell phones */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (77,  5);		/* computers */

/* 78 - OSU REPAIR FAIR */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(78, 2, 'OSU Repair Fair', 
	'Oregon State University Property Services Building',
	'644 SW 13th St.', 
	'Corvallis', 
	'OR', 
	'97333', 
	'http://fa.oregonstate.edu/surplus', 
	'(541)737-5398', 
	'Occurs twice per quarter in the evenings. Small appliances, Bicycles, Clothing, Computers (hardware and software), Electronics (small items only), Housewares (furniture, ceramics, lamps, etc.)')
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(78, 
	NULL, NULL,
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL)
	;	
	
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (78,  2);		/* small appliances */
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (78,  5);		/* computers */


/* 79 - PK FURNITURE REPAIR & REFINISHING */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(79, 2, 'PK Furniture Repair & Refinishing', 
	'5270 Corvallis-Newport Hwy.', 
	NULL, 
	'Corvallis', 
	'OR', 
	'97333', 
	'http://www.pkfurniturerefinishing.net/', 
	'(541)230-1727', 
	'Complete Restoration, Complete Refinishing, Modifications, Custom Color Matching, Furniture Stripping ,Chair Press Caning, Repairs')
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(79, 
	'10:00:00', '18:00:00', 
	'10:00:00', '18:00:00',
	'10:00:00', '18:00:00', 
	'10:00:00', '18:00:00', 
	'10:00:00', '18:00:00', 
	NULL, NULL, 
	NULL, NULL)
	;
	
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (79,  6);		/* furniture */

/* 80 - CORVALLIS POWER EQUIPMENT */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(80, 2, 'Corvallis Power Equipment', 
	'713 NE Circle Blvd.',
	NULL,
	'Corvallis',
	'OR',
	'97330',
	'https://corvallispowerequipment.stihldealer.net/',
	'(541)757-8075',
	'Lawn and garden equipment, chain saws (Sithl, Honda, Shindiawh), hand held equipement')
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(80, 
	'08:00:00', '17:00:00', 
	'08:00:00', '17:00:00', 
	'08:00:00', '17:00:00', 
	'08:00:00', '17:00:00', 
	'08:00:00', '17:00:00', 
	'08:30:00', '12:00:00', 
	NULL, NULL)
	;
	
INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (80,  8);		/* lawn power equipment */

/* 81 - ROBNETT'S */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(81, 2, 'Robnett\'s', 
	'400 SW 2nd St.',
	NULL,
	'Corvallis', 
	'OR', 
	'97333', 
	'http://ww3.truevalue.com/robnetts/Home.aspx',
	'(541)753-5531',	
	'Adjustment and sharpening')
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(81, 
	'07:30:00', '18:00:00', 
	'07:30:00', '18:00:00', 
	'07:30:00', '18:00:00', 
	'07:30:00', '18:00:00', 
	'07:30:00', '18:00:00', 
	'08:30:00', '17:30:00', 
	'10:00:00', '16:00:00')
	;

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (81,  8);		/* lawn power equipment */

/* 82 - SEDLACK */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(82, 2, 'Sedlack', 
	'225 SW 2nd St.', 
	NULL,
	'Corvallis', 
	'OR', 
	'97333', 
	'http://www.sedlaksshoes.net/',
	'(541)752-1498',
	'Full resoles, elastic and velcros, sewing and patching, leather patches, zippers, half soles and heels')
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(82, 
	'09:30:00', '18:00:00', 
	'09:30:00', '18:00:00', 
	'09:30:00', '18:00:00', 
	'09:30:00', '18:00:00', 
	'09:30:00', '18:00:00', 
	'09:30:00', '17:00:00', 
	'12:00:00', '16:00:00')
	;

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (82,  11);		/* shoes, boots */

/* 83 - SPECIALTY SEWING BY LESLIE */
INSERT INTO
	organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(83, 2, 'Specialty Sewing By Leslie', 
	'225 SW Madison Ave.',
	NULL,	
	'Corvallis', 
	'OR',
	'97333', 
	'http://www.specialtysewing.com/Leslie_Seamstress/Welcome.html',
	'(541)758-4556', 
	'Alterations and custom work')
	;

INSERT INTO
	organizationhours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
	`thu_start`, `thu_end`, `fri_start`, `fri_end`, `sat_start`, `sat_end`, `sun_start`, `sun_end`)
VALUES	
	(83, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL, 
	NULL, NULL)
	;

INSERT INTO organizationitems(`org_id`, `item_id`) VALUES (83,  4);		/* clothes */



/* ========================================================================
	PROCEDURES FOR CREATING organizationitems ENTITIES
   ======================================================================== */	

DELIMITER $$
CREATE PROCEDURE addHousehold(IN orgID INT(255))
	BEGIN
      	DECLARE num INT(255) Default 14;
    	simple_loop: LOOP
    		INSERT INTO organizationitems (`org_id`, `item_id`)
    		VALUES (orgID, num);
    		SET num = num + 1;
         	IF num > 29 THEN
        		LEAVE simple_loop;
        	END IF;
   	END LOOP simple_loop;
	END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE addBeddingBath(IN orgID INT(255))
	BEGIN
      	DECLARE num INT(255) Default 30;
    	simple_loop: LOOP
    		INSERT INTO organizationitems (`org_id`, `item_id`)
    		VALUES (orgID, num);
    		SET num = num + 1;
         	IF num > 35 THEN
        		LEAVE simple_loop;
        	END IF; 	
   	END LOOP simple_loop;
	END $$
DELIMITER;

DELIMITER $$
CREATE PROCEDURE addChildrensGoods(IN orgID INT(255))
	BEGIN
      	DECLARE num INT(255) Default 36;
    	simple_loop: LOOP
    		INSERT INTO organizationitems (`org_id`, `item_id`)
    		VALUES (orgID, num);
    		SET num = num + 1;
         	IF num > 47 THEN
        		LEAVE simple_loop;
        	END IF; 	
   	END LOOP simple_loop;
	END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE addAppliancesSmall(IN orgID INT(255))
	BEGIN
      	DECLARE num INT(255) Default 54;
    	simple_loop: LOOP
    		INSERT INTO organizationitems (`org_id`, `item_id`)
    		VALUES (orgID, num);
    		SET num = num + 1;
         	IF num > 60 THEN
        		LEAVE simple_loop;
        	END IF; 	
   	END LOOP simple_loop;
	END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE addAppliancesLarge(IN orgID INT(255))
	BEGIN
      	DECLARE num INT(255) Default 61;
    	simple_loop: LOOP
    		INSERT INTO organizationitems (`org_id`, `item_id`)
    		VALUES (orgID, num);
    		SET num = num + 1;
         	IF num > 65 THEN
        		LEAVE simple_loop;
        	END IF; 	
   	END LOOP simple_loop;
	END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE addBuildingHomeImprovement(IN orgID INT(255))
	BEGIN
      	DECLARE num INT(255) Default 66;
    	simple_loop: LOOP
    		INSERT INTO organizationitems (`org_id`, `item_id`)
    		VALUES (orgID, num);
    		SET num = num + 1;
         	IF num > 88 THEN
        		LEAVE simple_loop;
        	END IF; 	
   	END LOOP simple_loop;
	END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE addSportingEquipmentCamping(IN orgID INT(255))
	BEGIN
      	DECLARE num INT(255) Default 119;
    	simple_loop: LOOP
    		INSERT INTO organizationitems (`org_id`, `item_id`)
    		VALUES (orgID, num);
    		SET num = num + 1;
         	IF num > 137 THEN
        		LEAVE simple_loop;
        	END IF; 	
   	END LOOP simple_loop;
	END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE addGarden(IN orgID INT(255))
	BEGIN
      	DECLARE num INT(255) Default 138;
    	simple_loop: LOOP
    		INSERT INTO organizationitems (`org_id`, `item_id`)
    		VALUES (orgID, num);
    		SET num = num + 1;
         	IF num > 146 THEN
        		LEAVE simple_loop;
        	END IF; 	
   	END LOOP simple_loop;
	END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE addMedicalSupplies(IN orgID INT(255))
	BEGIN
      	DECLARE num INT(255) Default 156;
    	simple_loop: LOOP
    		INSERT INTO organizationitems (`org_id`, `item_id`)
    		VALUES (orgID, num);
    		SET num = num + 1;
         	IF num > 167 THEN
        		LEAVE simple_loop;
        	END IF; 	
   	END LOOP simple_loop;
	END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE addOfficeEquipment(IN orgID INT(255))
	BEGIN
      	DECLARE num INT(255) Default 168;
    	simple_loop: LOOP
    		INSERT INTO organizationitems (`org_id`, `item_id`)
    		VALUES (orgID, num);
    		SET num = num + 1;
         	IF num > 174 THEN
        		LEAVE simple_loop;
        	END IF; 	
   	END LOOP simple_loop;
	END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE addPackingMaterials(IN orgID INT(255))
	BEGIN
      	DECLARE num INT(255) Default 179;
    	simple_loop: LOOP
    		INSERT INTO organizationitems (`org_id`, `item_id`)
    		VALUES (orgID, num);
    		SET num = num + 1;
         	IF num > 181 THEN
        		LEAVE simple_loop;
        	END IF; 	
   	END LOOP simple_loop;
	END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE addBrownPaperShoppingBags(IN orgID INT(255))
	BEGIN
		INSERT INTO organizationitems (`org_id`, `item_id`)
		VALUES 
			(orgID, 187),
			(orgID, 192)
		;
	END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE addCDsVideoGames(IN orgID INT(255))
	BEGIN
		INSERT INTO organizationitems (`org_id`, `item_id`)
		VALUES 
			(orgID, 101),
			(orgID, 106)
		;
	END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE addWearableItems(IN orgID INT(255))
	BEGIN
      	DECLARE num INT(255) Default 89;
    	simple_loop: LOOP
    		INSERT INTO organizationitems (`org_id`, `item_id`)
    		VALUES (orgID, num);
    		SET num = num + 1;
         	IF num > 96 THEN
        		LEAVE simple_loop;
        	END IF; 	
   	END LOOP simple_loop;
	END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE addComputersMonitors1(IN orgID INT(255))
	BEGIN
		INSERT INTO organizationitems (`org_id`, `item_id`)
		VALUES 
			(orgID, 103),
			(orgID, 109)
		;
	END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE addComputersMonitors2(IN orgID INT(255))
	BEGIN
		INSERT INTO organizationitems (`org_id`, `item_id`)
		VALUES 
			(orgID, 169),
			(orgID, 172)
		;
	END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE addUseableElectronics(IN orgID INT(255))
	BEGIN
      	DECLARE num INT(255) Default 97;
    	simple_loop: LOOP
    		INSERT INTO organizationitems (`org_id`, `item_id`)
    		VALUES (orgID, num);
    		SET num = num + 1;
         	IF num > 118 THEN
        		LEAVE simple_loop;
        	END IF; 	
   	END LOOP simple_loop;
	END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE addFoodUnopened(IN orgID INT(255))
	BEGIN
		INSERT INTO organizationitems (`org_id`, `item_id`)
		VALUES 
			(orgID, 152),
			(orgID, 154),
			(orgID, 155)
		;
	END $$
DELIMITER ;



CALL addAppliancesLarge(1);
CALL addAppliancesSmall(1);
CALL addBeddingBath(1);
CALL addSportingEquipmentCamping(1);
CALL addBrownPaperShoppingBags(1);
CALL addBuildingHomeImprovement(1);
CALL addChildrensGoods(1);
CALL addFoodUnopened(1);
CALL addGarden(1);
CALL addUseableElectronics(1);
CALL addMedicalSupplies(1);
CALL addPackingMaterials(1);
CALL addAppliancesSmall(2);
CALL addBeddingBath(2);
CALL addSportingEquipmentCamping(2);
CALL addBrownPaperShoppingBags(2);
CALL addChildrensGoods(2);
CALL addWearableItems(2);
CALL addGarden(2);
CALL addUseableElectronics(2);
CALL addHousehold(2);
CALL addMedicalSupplies(2);
CALL addOfficeEquipment(2);
CALL addAppliancesSmall(3);
CALL addBeddingBath(3);
CALL addSportingEquipmentCamping(3);
CALL addBrownPaperShoppingBags(3);
CALL addChildrensGoods(3);
CALL addWearableItems(3);
CALL addGarden(3);
CALL addUseableElectronics(3);
CALL addHousehold(3);
CALL addMedicalSupplies(3);
CALL addOfficeEquipment(3);
CALL addCDsVideoGames(7);
CALL addCDsVideoGames(8);
CALL addBrownPaperShoppingBags(9);
CALL addCDsVideoGames(9);
CALL addGarden(9);
CALL addSportingEquipmentCamping(10);
CALL addBrownPaperShoppingBags(10);
CALL addCDsVideoGames(10);
CALL addAppliancesSmall(12);
CALL addFoodUnopened(12);
CALL addUseableElectronics(12);
CALL addHousehold(12);
CALL addAppliancesSmall(14);
CALL addBeddingBath(14);
CALL addSportingEquipmentCamping(14);
CALL addBrownPaperShoppingBags(14);
CALL addChildrensGoods(14);
CALL addWearableItems(14);
CALL addGarden(14);
CALL addUseableElectronics(14);
CALL addHousehold(14);
CALL addMedicalSupplies(14);
CALL addOfficeEquipment(14);
CALL addAppliancesSmall(15);
CALL addSportingEquipmentCamping(15);
CALL addBuildingHomeImprovement(15);
CALL addChildrensGoods(15);
CALL addWearableItems(15);
CALL addGarden(15);
CALL addUseableElectronics(15);
CALL addGarden(16);
CALL addMedicalSupplies(16);
CALL addBeddingBath(16);
CALL addBuildingHomeImprovement(16);
CALL addFoodUnopened(17);
CALL addBeddingBath(17);
CALL addOfficeEquipment(18);
CALL addSportingEquipmentCamping(19);
CALL addSportingEquipmentCamping(20);
CALL addMedicalSupplies(21);
CALL addBrownPaperShoppingBags(22);
CALL addChildrensGoods(22);
CALL addWearableItems(22);
CALL addAppliancesLarge(23);
CALL addAppliancesSmall(23);
CALL addBeddingBath(23);
CALL addBrownPaperShoppingBags(23);
CALL addBuildingHomeImprovement(23);
CALL addChildrensGoods(23);
CALL addWearableItems(23);
CALL addFoodUnopened(23);
CALL addGarden(23);
CALL addUseableElectronics(23);
CALL addHousehold(23);
CALL addMedicalSupplies(23);
CALL addOfficeEquipment(23);
CALL addPackingMaterials(23);
CALL addAppliancesLarge(24);
CALL addAppliancesSmall(24);
CALL addPackingMaterials(24);
CALL addBrownPaperShoppingBags(25);
CALL addFoodUnopened(25);
CALL addHousehold(26);
CALL addAppliancesLarge(27);
CALL addAppliancesSmall(27);
CALL addBeddingBath(27);
CALL addUseableElectronics(27);
CALL addHousehold(27);
CALL addAppliancesLarge(30);
CALL addAppliancesSmall(30);
CALL addBeddingBath(30);
CALL addSportingEquipmentCamping(30);
CALL addBuildingHomeImprovement(30);
CALL addChildrensGoods(30);
CALL addWearableItems(30);
CALL addGarden(30);
CALL addUseableElectronics(30);
CALL addHousehold(30);
CALL addMedicalSupplies(30);
CALL addOfficeEquipment(30);
CALL addAppliancesLarge(31);
CALL addAppliancesSmall(31);
CALL addSportingEquipmentCamping(31);
CALL addBrownPaperShoppingBags(31);
CALL addBuildingHomeImprovement(31);
CALL addGarden(31);
CALL addUseableElectronics(31);
CALL addHousehold(31);
CALL addMedicalSupplies(31);
CALL addOfficeEquipment(31);
CALL addCDsVideoGames(32);
CALL addSportingEquipmentCamping(33);
CALL addBeddingBath(34);
CALL addWearableItems(34);
CALL addGarden(34);
CALL addUseableElectronics(34);
CALL addHousehold(34);
CALL addOfficeEquipment(34);
CALL addBeddingBath(35);
CALL addSportingEquipmentCamping(35);
CALL addBuildingHomeImprovement(35);
CALL addCDsVideoGames(35);
CALL addGarden(35);
CALL addFoodUnopened(36);
CALL addAppliancesLarge(38);
CALL addAppliancesSmall(38);
CALL addBeddingBath(38);
CALL addSportingEquipmentCamping(38);
CALL addChildrensGoods(38);
CALL addWearableItems(38);
CALL addComputersMonitors2(38);
CALL addFoodUnopened(38);
CALL addGarden(38);
CALL addUseableElectronics(38);
CALL addHousehold(38);
CALL addMedicalSupplies(38);
CALL addCDsVideoGames(39);
CALL addFoodUnopened(39);
CALL addAppliancesLarge(40);
CALL addAppliancesSmall(40);
CALL addBeddingBath(40);
CALL addSportingEquipmentCamping(40);
CALL addBrownPaperShoppingBags(40);
CALL addChildrensGoods(40);
CALL addWearableItems(40);
CALL addFoodUnopened(40);
CALL addGarden(40);
CALL addUseableElectronics(40);
CALL addHousehold(40);
CALL addMedicalSupplies(40);
CALL addBrownPaperShoppingBags(41);
CALL addFoodUnopened(42);
CALL addAppliancesLarge(43);
CALL addFoodUnopened(44);
CALL addAppliancesSmall(45);
CALL addBeddingBath(45);
CALL addSportingEquipmentCamping(45);
CALL addBrownPaperShoppingBags(45);
CALL addChildrensGoods(45);
CALL addWearableItems(45);
CALL addGarden(45);
CALL addCDsVideoGames(45);
CALL addHousehold(45);
CALL addMedicalSupplies(45);
CALL addGarden(46);
CALL addPackingMaterials(47);
CALL addSportingEquipmentCamping(48);
CALL addBrownPaperShoppingBags(48);
CALL addChildrensGoods(48);
CALL addWearableItems(48);
CALL addFoodUnopened(48);
CALL addSportingEquipmentCamping(49);
CALL addComputersMonitors1(49);
CALL addComputersMonitors2(49);
CALL addMedicalSupplies(49);
CALL addGarden(50);
CALL addChildrensGoods(51);
CALL addFoodUnopened(51);
CALL addSportingEquipmentCamping(52);
CALL addCDsVideoGames(54);
CALL addBrownPaperShoppingBags(57);
CALL addWearableItems(57);
CALL addBrownPaperShoppingBags(59);
CALL addWearableItems(59);
CALL addBrownPaperShoppingBags(60);
CALL addWearableItems(60);
CALL addBrownPaperShoppingBags(61);
CALL addWearableItems(61);
CALL addCDsVideoGames(62);
CALL addMedicalSupplies(62);
CALL addFoodUnopened(63);
CALL addFoodUnopened(64);
CALL addAppliancesSmall(65);
CALL addBeddingBath(65);
CALL addBrownPaperShoppingBags(65);
CALL addCDsVideoGames(65);
CALL addChildrensGoods(65);
CALL addWearableItems(65);
CALL addFoodUnopened(65);
CALL addHousehold(65);
CALL addOfficeEquipment(65);
CALL addPackingMaterials(66);
CALL addPackingMaterials(67);
CALL addAppliancesSmall(68);
CALL addBeddingBath(68);
CALL addSportingEquipmentCamping(68);
CALL addBrownPaperShoppingBags(68);
CALL addChildrensGoods(68);
CALL addWearableItems(68);
CALL addFoodUnopened(68);
CALL addGarden(68);
CALL addUseableElectronics(68);
CALL addHousehold(68);
CALL addBuildingHomeImprovement(69);
CALL addGarden(69);
CALL addHousehold(69);
CALL addHousehold(4);
CALL addGarden(6);
CALL addWearableItems(13);



























/* ==================================================
	Automatically add an entry for Organization in organizationhours.
	NOTE: place this at the very end of the file!
====================================================*/
CREATE TRIGGER new_org_added
AFTER INSERT ON organizations
FOR EACH ROW
	INSERT INTO organizationhours (org_id)
	VALUES (NEW.id);	

/* END OF FILE: DO NOT MAKE ENTRIES BELOW */