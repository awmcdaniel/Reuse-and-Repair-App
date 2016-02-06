DROP DATABASE IF EXISTS test_api;
CREATE DATABASE IF NOT EXISTS test_api;
USE test_api;

CREATE TABLE Users (
	id 			int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	username		varchar(255) NOT NULL,
	password		varchar(255) NOT NULL
);

CREATE TABLE OrganizationType (
	id 			int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	description		varchar(255)
);

CREATE TABLE Organizations (
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
	FOREIGN KEY (org_type) REFERENCES OrganizationType (id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE ItemCategories (
	id 			int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	description		varchar(255)
);

CREATE TABLE Items (
	id 			int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	description 	varchar(255) NOT NULL,
	category		int UNSIGNED,
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
	FOREIGN KEY (org_id) REFERENCES Organizations (id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

/* ========================================================================
	ADD Users ENTITIES
   ======================================================================== */
INSERT INTO
	Users (`username`, `password`)
VALUES
	("TestUser", "password1"),
	("TestUser2", "password1");
	
/* ========================================================================
	ADD OrganizationType ENTITIES
   ======================================================================== */
INSERT INTO 
	OrganizationType (`id`, `description`)
VALUES 
	(1, "Reuse"),
	(2, "Repair"),
	(3, "Reuse and Repair");

/* ========================================================================
	ADD ItemCategories ENTITIES
   ======================================================================== */
INSERT INTO 
	ItemCategories(`id`, `description`)
VALUES 
	(1, "Household"),
	(2, "Bedding/Bath"),
	(3, "Children's Goods"),
	(4, "Appliances - Small"),
	(5, "Appliances - Large"),
	(6, "Building/Home Improvement"),
	(7, "Wearable Items"),
	(8, "Usable Electronics"),
	(9, "Sporting Equipment/Camping"),
	(10, "Garden"),
	(11, "Food"),
	(12, "Medical Supplies"),
	(13, "Office Equipment"),
	(14, "Packing Materials"),
	(15, "Miscellaneous"),
	(16, "Repair Items")
	;
	
/* ========================================================================
	ADD Items ENTITIES
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
	
	(53, 'Bricks',6),					/* category = Building/Home Improvement */
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
	
	(125, 'Chain saws',10),			/* category = Garden */
	(126, 'Fencing',10),
	(127, 'Garden pots',10),
	(128, 'Garden tools',10),
	(129 ,'Hand clippers',10),
	(130, 'Hoses',10),
	(131, 'Lawn furniture',10),
	(132, 'Livestock supplies',10),
	(133, 'Loppers',10),
	(134, 'Mowers',10),
	(135, 'Seeders',10),
	(136, 'Soil amendment',10),
	(137, 'Sprinklers',10),
	(138, 'Wheelbarrows',10),
	
	(139, 'Beverages',11),			/* category = Food */
	(140, 'Surplus garden produce',11),
	(141, 'Unopened canned goods',11),
	(142, 'Unopened packaged food',11),
	
	(143, 'Adult diapers',12),			/* category = Medical Supplies */	
	(144, 'Blood pressure monitors',12),
	(145, 'Canes',12),
	(146, 'Crutches',12),
	(147, 'Eye glasses',12),
	(148, 'Glucose meters',12),
	(149, 'Hearing aids',12),
	(150, 'Hospital beds',12),
	(151, 'Reach extenders',12),
	(152, 'Shower chairs',12),
	(153, 'Walkers',12),
	(154, 'Wheelchairs',12),
	
	(155, 'Calculators',13),			/* category = Office Equipment */
	(156, 'Computers',13),
	(157, 'Fax machines',13),
	(158, 'Headsets',13),
	(159, 'Monitors',13),
	(160, 'Office furniture',13),
	(161, 'Paper shredders',13),
	(162, 'Printer cartridge refilling',13),
	(163, 'Printers',13),
	(164, 'Scanners',13),
	(165, 'Telephones',13),

	(166, 'Bubble wrap',14),			/* category = Packing Materials */
	(167, 'Clean foam peanuts',14),
	(168, 'Foam sheets',14),

	(169, 'Egg cartons',15),			/* category = Miscellaneous */
	(170, 'Firewood',15),
	(171, 'Fabric',15),
	(172, 'Paper bags',15),
	(173, 'Pet supplies',15),
	(174, 'Shopping bags',15),
	(175, 'Vehicles/Parts',15),
	(176, 'Computer paper',15),
	(177, 'Reusable metal items',15),
	(178, 'Brown paper', 15),
	
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
      		DECLARE num INT(255) Default 1;
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
      		DECLARE num INT(255) Default 17;
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

DELIMITER $$  
CREATE PROCEDURE addChildrensGoods(IN orgID INT(255))
	BEGIN
      		DECLARE num INT(255) Default 23;
    	simple_loop: LOOP
    		INSERT INTO OrganizationItems (`org_id`, `item_id`)
    		VALUES (orgID, num);
    		SET num = num + 1;
         	IF num > 40 THEN
        		LEAVE simple_loop;
        	END IF; 	
   	END LOOP simple_loop;
END $$
DELIMITER ;

DELIMITER $$  
CREATE PROCEDURE addAppliancesSmall(IN orgID INT(255))
	BEGIN
      		DECLARE num INT(255) Default 41;
    	simple_loop: LOOP
    		INSERT INTO OrganizationItems (`org_id`, `item_id`)
    		VALUES (orgID, num);
    		SET num = num + 1;
         	IF num > 47 THEN
        		LEAVE simple_loop;
        	END IF; 	
   	END LOOP simple_loop;
END $$
DELIMITER ;

DELIMITER $$  
CREATE PROCEDURE addAppliancesLarge(IN orgID INT(255))
	BEGIN
      		DECLARE num INT(255) Default 48;
    	simple_loop: LOOP
    		INSERT INTO OrganizationItems (`org_id`, `item_id`)
    		VALUES (orgID, num);
    		SET num = num + 1;
         	IF num > 52 THEN
        		LEAVE simple_loop;
        	END IF; 	
   	END LOOP simple_loop;
END $$
DELIMITER ;

DELIMITER $$  
CREATE PROCEDURE addBuildingHomeImprovement(IN orgID INT(255))
	BEGIN
      		DECLARE num INT(255) Default 53;
    	simple_loop: LOOP
    		INSERT INTO OrganizationItems (`org_id`, `item_id`)
    		VALUES (orgID, num);
    		SET num = num + 1;
         	IF num > 75 THEN
        		LEAVE simple_loop;
        	END IF; 	
   	END LOOP simple_loop;
END $$
DELIMITER ;

DELIMITER $$  
CREATE PROCEDURE addWearableItems(IN orgID INT(255))
	BEGIN
      		DECLARE num INT(255) Default 76;
    	simple_loop: LOOP
    		INSERT INTO OrganizationItems (`org_id`, `item_id`)
    		VALUES (orgID, num);
    		SET num = num + 1;
         	IF num > 83 THEN
        		LEAVE simple_loop;
        	END IF; 	
   	END LOOP simple_loop;
END $$
DELIMITER ;

DELIMITER $$  
CREATE PROCEDURE addUseableElectronics(IN orgID INT(255))
	BEGIN
      		DECLARE num INT(255) Default 84;
    	simple_loop: LOOP
    		INSERT INTO OrganizationItems (`org_id`, `item_id`)
    		VALUES (orgID, num);
    		SET num = num + 1;
         	IF num > 105 THEN
        		LEAVE simple_loop;
        	END IF; 	
   	END LOOP simple_loop;
END $$
DELIMITER ;

DELIMITER $$  
CREATE PROCEDURE addSportingEquipmentCamping(IN orgID INT(255))
	BEGIN
      		DECLARE num INT(255) Default 106;
    	simple_loop: LOOP
    		INSERT INTO OrganizationItems (`org_id`, `item_id`)
    		VALUES (orgID, num);
    		SET num = num + 1;
         	IF num > 124 THEN
        		LEAVE simple_loop;
        	END IF; 	
   	END LOOP simple_loop;
END $$
DELIMITER ;

DELIMITER $$  
CREATE PROCEDURE addGarden(IN orgID INT(255))
	BEGIN
      		DECLARE num INT(255) Default 125;
    	simple_loop: LOOP
    		INSERT INTO OrganizationItems (`org_id`, `item_id`)
    		VALUES (orgID, num);
    		SET num = num + 1;
         	IF num > 138 THEN
        		LEAVE simple_loop;
        	END IF; 	
   	END LOOP simple_loop;
END $$
DELIMITER ;

DELIMITER $$  
CREATE PROCEDURE addFood(IN orgID INT(255))
	BEGIN
      		DECLARE num INT(255) Default 139;
    	simple_loop: LOOP
    		INSERT INTO OrganizationItems (`org_id`, `item_id`)
    		VALUES (orgID, num);
    		SET num = num + 1;
         	IF num > 142 THEN
        		LEAVE simple_loop;
        	END IF; 	
   	END LOOP simple_loop;
END $$
DELIMITER ;

DELIMITER $$  
CREATE PROCEDURE addMedicalSupplies(IN orgID INT(255))
	BEGIN
      		DECLARE num INT(255) Default 143;
    	simple_loop: LOOP
    		INSERT INTO OrganizationItems (`org_id`, `item_id`)
    		VALUES (orgID, num);
    		SET num = num + 1;
         	IF num > 154 THEN
        		LEAVE simple_loop;
        	END IF; 	
   	END LOOP simple_loop;
END $$
DELIMITER ;

DELIMITER $$  
CREATE PROCEDURE addOfficeEquipment(IN orgID INT(255))
	BEGIN
      		DECLARE num INT(255) Default 155;
    	simple_loop: LOOP
    		INSERT INTO OrganizationItems (`org_id`, `item_id`)
    		VALUES (orgID, num);
    		SET num = num + 1;
         	IF num > 165 THEN
        		LEAVE simple_loop;
        	END IF; 	
   	END LOOP simple_loop;
END $$
DELIMITER ;

DELIMITER $$  
CREATE PROCEDURE addPackingMaterials(IN orgID INT(255))
	BEGIN
      		DECLARE num INT(255) Default 166;
    	simple_loop: LOOP
    		INSERT INTO OrganizationItems (`org_id`, `item_id`)
    		VALUES (orgID, num);
    		SET num = num + 1;
         	IF num > 168 THEN
        		LEAVE simple_loop;
        	END IF; 	
   	END LOOP simple_loop;
END $$
DELIMITER ;
	
/* ========================================================================
	ADD REUSE Organizations ENTITIES WITH CORRESPONDING Hours AND OrganizationItems ENTITIES
   ======================================================================== */

/* 1 - ALBANY-CORVALLIS REUSEIT */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
CALL addAppliancesLarge(1);
CALL addAppliancesSmall(1);
CALL addBeddingBath(1);
CALL addSportingEquipmentCamping(1);
CALL addBuildingHomeImprovement(1);
CALL addWearableItems(1);
CALL addGarden(1);
CALL addHousehold(1);
CALL addMedicalSupplies(1);
CALL addOfficeEquipment(1);
CALL addChildrensGoods(1);
CALL addPackingMaterials(1);
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (1, 174);		/* Miscellaneous: Shopping bags */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (1, 178);		/* Miscellaneous: Brown paper */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (1, 88);			/* Useable Electronics: CDs */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (1, 93);			/* Useable Electronics: Game Consoles */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (1, 89);			/* Useable Electronics: Cell Phones */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (1, 176);		/* Miscellaneous: Computer Paper */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (1, 90);			/* Useable Electronics: Computers */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (1, 96);			/* Useable Electronics: Monitors */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (1, 169);		/* Miscellaneous: Egg Cartons */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (1, 171);		/* Miscellaneous: Fabric */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (1, 170);		/* Miscellaneous: Firewood */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (1, 141);		/* Food: Unopened Canned Goods */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (1, 142);		/* Food: Unopened Packaged Food */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (1, 173);		/* Miscellaneous: Pet Supplies */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (1, 175);		/* Miscellaneous: Vehicle Parts */


/* 2 - ARC THRIFT STORES (CORVALLIS) */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
CALL addChildrensGoods(2);
CALL addWearableItems(2);
CALL addHousehold(2);
CALL addBeddingBath(2);
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (2, 89);			/* Useable Electronics: Cell Phones */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (2, 90);			/* Useable Electronics: Computers */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (2, 96);			/* Useable Electronics: Monitors */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (2, 171);		/* Miscellaneous: Fabric */

/* 3 - ARC THRIFT STORES (Philomath) */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
CALL addChildrensGoods(3);
CALL addWearableItems(3);
CALL addHousehold(3);
CALL addBeddingBath(3);
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (3, 89);			/* Useable Electronics: Cell Phones */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (3, 90);			/* Useable Electronics: Computers */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (3, 96);			/* Useable Electronics: Monitors */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (3, 171);		/* Miscellaneous: Fabric */
	
/* 4 - BEEKMAN PLACE ANTIQUE MALL */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
CALL addHousehold(4);
	
/* 5 - BENTON COUNTY EXTENSION - 4H ACTIVITIES */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (5, 171);		/* Miscellaneous: Fabric */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (5, 38);			/* Children's Goods: School Supplies */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (5, 1);			/* Household: Arts & Crafts */

/* 6 - BENTON COUNTY MASTER GARDENS */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
CALL addGarden(6);
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (6, 3);			/* Household: Goods: Books */

/* 7 - BOOK BIN */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (7, 3);			/* Household: Books */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (7, 88);			/* Useable Electronics: CDs */

/* 8 - BROWSER'S BOOKSTORE */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (8, 3);			/* Household: Books */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (8, 88);			/* Useable Electronics: CDs */	
	
/* 9 - BOYS & GIRLS CLUB/STARS (AFTER SCHOOL PROGRAMS) */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
CALL addGarden(9);
CALL addOfficeEquipment(9);
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (9, 171);		/* Miscellaneous: Fabric */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (9, 38);			/* Children's Goods: School Supplies */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (9, 1);			/* Household: Arts & Crafts */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (9, 174);		/* Miscellaneous: Shopping bags */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (9, 178);		/* Miscellaneous: Brown paper */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (9, 88);			/* Useable Electronics: CDs */	
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (9, 176);		/* Miscellaneous: Computer Paper */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (9, 169);		/* Miscellaneous: Egg Cartons */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (9, 15);			/* Household: Toiletries */

/* 10 - BUCKINGHAM PALACE */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
CALL addSportingEquipmentCamping(10);
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (10, 1);			/* Household: Arts & Crafts */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (10, 3);			/* Household : Books */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (10, 174);		/* Miscellaneous: Shopping bags */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (10, 178);		/* Miscellaneous: Brown paper */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (10, 88);		/* Useable Electronics: CDs */	
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (10, 171);		/* Miscellaneous: Fabric */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (10, 11);		/* Household: Furniture */
	
/* 11 -  CALVARY COMMUNITY OUTREACH */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
CALL addAppliancesSmall(12);
CALL addHousehold(12);
CALL addUseableElectronics(12);
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (12, 3);			/* Household : Books */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (12, 88);		/* Useable Electronics: CDs */	
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (12, 89);		/* Useable Electronics: Cell Phones */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (12, 141);		/* Food: Unopened Canned Goods */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (12, 142);		/* Food: Unopened Packaged Food */
	
/* 13 - CAREER CLOSET FOR WOMEN */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
CALL addWearableItems(13);
	
/* 14 - CAT'S MEOW HUMANE SOCIETY THRIFT SHOP */	
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
CALL addAppliancesSmall(14);
CALL addHousehold(14);
CALL addSportingEquipmentCamping(14);
CALL addChildrensGoods(14);
CALL addWearableItems(14);
CALL addGarden(14);
CALL addUseableElectronics(14);
CALL addMedicalSupplies(14);
CALL addOfficeEquipment(14);
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (14, 1);			/* Household: Arts & Crafts */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (14, 174);		/* Miscellaneous: Shopping bags */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (14, 178);		/* Miscellaneous: Brown paper */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (14, 88);		/* Useable Electronics: CDs */	
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (14, 89);		/* Useable Electronics: Cell Phones */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (14, 171);		/* Miscellaneous: Fabric */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (14, 173);		/* Miscellaneous: Pet Supplies */
	
/* 15 - CHILDREN'S FARM HOME */	
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
CALL addAppliancesSmall(15);
CALL addSportingEquipmentCamping(15);
CALL addBuildingHomeImprovement(15);
CALL addChildrensGoods(15);
CALL addWearableItems(15);
CALL addGarden(15);
CALL addUseableElectronics(15);
CALL addOfficeEquipment(15);
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (15, 1);			/* Household: Arts & Crafts */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (15, 88);		/* Useable Electronics: CDs */	
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (15, 11);		/* Household: Furniture */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (15, 15);		/* Household: Toiletries */
	
/* 16 - CHINTIMINI WILDLIFE REHABILITATION CENTER */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
CALL addBeddingBath(16);
CALL addBuildingHomeImprovement(16);
CALL addGarden(16);
CALL addMedicalSupplies(16);
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (16, 140);		/* Food: Surplus Garden Produce */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (16, 173);		/* Miscellaneous: Pet Supplies */
	
/* 17 - COMMUNITY OUTREACH (HOMELESS SHELTER) */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (17, 141);		/* Food: Unopened Canned Goods */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (17, 142);		/* Food: Unopened Packaged Food */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (17, 15);		/* Household: Toiletries */
INSERT INTO OrganizationItems (`org_id`, `item_id`) VALUES (17, 38);		/* Children's Goods: School Supplies */

	
/* 18 - CORVALLIS ENVIRONMENTAL CENTER */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 19 - CORVALLIS BICYCLE COLLECTIVE */	
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 21 - CORVALLIS-UZHHOROD SISTER CITIES/THE TOUCH PROJECT */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 24 - FIRST ALTERNATIVE CO-OP RECYCLING CENTER  (SOUTH STORE)*/
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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

/* 25 - FIRST ALTERNATIVE CO-OP RECYCLING CENTER  (NORTH STORE)*/
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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

/* 26 - FURNITURE EXCHANGE */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 29 - GARLAND NURSERY */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 30 - GOODWILL INDUSTRIES */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 31- HABITAT FOR HUMANITY RESTORE */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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

/* 32 - HAPPY TRAILS RECORDS, TAPES, & CDS */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 34 - HOME LIFE INC (FOR DEVELOP. DISABLED) */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 35 - JACKSON STREET YOUTH SHELTER */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 36 - LINN BENTON FOOD SHARE (LARGE FOOD DONATIONS) */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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

/* 38 - LOVE INC (FOR LOW INCOME CITIZENS) */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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

/* 39 - MANO PASTEGA HOUSE (GOOD SAM PATIENT FAMILY HOUSING) */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 40 - MARY'S RIVER GLEANERS (FOR LOW INCOME CITIZENS) */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 41 - MIDWAY FARMS */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 42 - NEIGHBOR TO NEIGHBOR */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 43 - OSBORN AQUATIC CENTER */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES		
	(44, 1, 'OSU Emergency Food Pantry', 
	NULL,
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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

/* 45 - OSU FOLK CLUB THRIFT SHOP */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES		
	(45, 1, 'OSU Folk Club Thrift Shop', 
	NULL, 
	NULL,
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 46 - OSU ORGANIC GROWERS CLUB (CROP & SOIL SCIENCE DEPT.) */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES		
	(46, 1, 'OSU Organic Growers Club (Crop & Soil Science Dept)', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;
	
INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(47, 1, 
	'Pak Mail (Timberhill Shopping Ctr)', 
	NULL, 
	NULL, 
	NULL, 
	NULL,
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(48, 1, 
	'Parent Enhancement Program', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	 
/* 49 - PASTORS FOR PEACE-CARAVAN TO CUBA */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(49, 1, 'Pastors for Peace-Caravan to Cuba', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	'Contact Mike Beilstein')
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(50, 1, 
	'Philomath Community Garden', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	'Contact Chris Shonnard')
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(51, 1, 'Philomath Community Services', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 52 - PLAY IT AGAIN SPORTS */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(52, 1, 'Play It Again Sports', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(53, 1, 'Presbyterian Piecemakers', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 54 - PUBLIC LIBRARY CORVALLIS, FRIENDS OF */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(54, 1, 'Public Library Corvallis, Friends of', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 55 - QUILTS FROM CARING HANDS */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(55, 1, 'Quilts From Caring Hands', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 56 - RAPID REFILL INK */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(56, 1, 'Rapid Refill Ink', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 57 - RE-VOLVE*/
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(57, 1, 're-volve', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(58, 1, 'Schools - Public, Private, Charter', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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

/* 59 - SECOND GLANCE */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(59, 1, 'Second Glance', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(60, 1, 'The Annex', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(61, 1, 'The Alley', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(62, 1, 'Senior Center of Corvallis', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 63 -SOUTH CORVALLIS FOOD BANK */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(63, 1, 'South Corvallis Food Bank', 
	NULL,
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 64 - ST. VINCENT DE PAUL FOOD BANK */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(64, 1, 'St. Vincent de Paul Food Bank', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 65 - STONE SOUP (ST. MARY'S CHURCH */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(65, 1, 'Stone Soup  (St Mary\'s Church)', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 66 - UPS STORE (PHILOMATH) */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(66, 1, 'UPS Store (Philomath)', 
	NULL, 
	NULL, 
	NULL, 
	NULL,
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(67, 1, 'UPS Stores (Corvallis)', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL,
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(68, 1, 'Vina Moses', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 69 - SPAETH HERITAGE HOUSE */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(69, 1, 'Spaeth Heritage House', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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

/* 70 - BELLVUE COMPUTERS */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 71 - BOOK BINDING */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
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
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 72 - CELL PHONE SICK BAY */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(72, 2, 'Cell Phone Sick Bay', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 73 - CORVALLIS TECHNICAL*/
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(73, 2, 'Covallis Technical',
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 74 - FOAM MAN */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(74, 2, 'Foam Man', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 75 - FOOTWISE */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(75, 2, 'Footwise', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 76 - FURNITURE RESTORATION CENTER */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(76, 2, 'Furniture Restoration Center', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 77 - GEEKS 'N' NERDS */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(77, 2, 'Geeks \'N\' Nerds', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 78 - OSU REPAIR FAIR */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(78, 2, 'OSU Repair Fair', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 79 - P.K. FURNITURE REPAIR & REFINISHING */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(79, 2, 'P.K Furniture Repair & Refinishing', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 80 - CORVALLIS POWER EQUIPMENT */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(80, 2, 'Corvallis Power Equipment', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 81 - ROBNETT'S */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(81, 2, 'Robnett\'s', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 82 - SEDLACK */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(82, 2, 'Sedlack', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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
	
/* 83 - SPECIALTY SEWING BY LESLIE */
INSERT INTO
	Organizations (`id`, `org_type`, `name`, `street1`, `street2`, `city`, `state`, `zip`, `webpage`, `phone`, `notes`)
VALUES	
	(83, 2, 'Specialty Sewing By Leslie', 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL, 
	NULL)
	;

INSERT INTO
	OrganizationHours (`org_id` , `mon_start`, `mon_end`, `tue_start`, `tue_end`, `wed_start`, `wed_end`, 
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











