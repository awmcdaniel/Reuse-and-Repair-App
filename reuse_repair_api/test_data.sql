DROP DATABASE IF EXISTS test_api;
CREATE DATABASE IF NOT EXISTS test_api;
USE test_api;


CREATE TABLE Users (
	id 			int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	f_name		varchar(255),
	l_name		varchar(255),
	auth_level	SMALLINT
);

CREATE TABLE ItemType (
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
	updated_at	timestamp DEFAULT CURRENT_TIMESTAMP,
	updated_by	int UNSIGNED,
	FOREIGN KEY (updated_by) REFERENCES Users (id),
	FOREIGN KEY (org_type) REFERENCES ItemType (id)
);

CREATE TABLE ItemCategories (
	id 			int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	description	varchar(255)
);

CREATE TABLE Items (
	id 			int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	name 		varchar(255) NOT NULL,
	type		int UNSIGNED,
	category	int UNSIGNED,
	created_at	datetime DEFAULT CURRENT_TIMESTAMP,
	updated_at	timestamp DEFAULT CURRENT_TIMESTAMP,
	updated_by	int UNSIGNED,
	FOREIGN KEY (updated_by) REFERENCES Users (id),
	FOREIGN KEY (type) REFERENCES ItemType (id),
	FOREIGN KEY (category) REFERENCES ItemCategories (id)
);

CREATE TABLE OrganizationItems (
	id 			int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	org_id		int UNSIGNED NOT NULL,
	item_id		int UNSIGNED NOT NULL,
	FOREIGN KEY (org_id) REFERENCES Organizations (id),
	FOREIGN KEY (item_id) REFERENCES Items (id)
);


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
	ItemType (description)
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
	Items (name, type, category)
VALUES
	('Arts and crafts ',1,1),
	('Barbeque grills',1,1),
	('Books',1,1),
	('Canning jars',1,1),
	('Cleaning supplies',1,1),
	('Clothes hangers',1,1),
	('Cookware',1,1),
	('Cookware',1,1),
	('Dishes',1,1),
	('Fabric',1,1),
	('Food storage containers',1,1),
	('Furniture',1,1),
	('Luggage',1,1),
	('Mattresses',1,1),
	('Ornaments',1,1),
	('Toiletries',1,1),
	('Utensils',1,1),
	('Blankets',1,2),
	('Comforters',1,2),
	('Linens',1,2),
	('Sheets',1,2),
	('Small rugs',1,2),
	('Towels ',1,2),
	('Arts and crafts ',1,3),
	('Baby carriers',1,3),
	('Baby gates',1,3),
	('Bike trailers',1,3),
	('Books',1,3),
	('Child car seats',1,3),
	('Clothes',1,3),
	('Crayons',1,3),
	('Cribs',1,3),
	('Diapers ',1,3),
	('High chairs',1,3),
	('Maternity',1,3),
	('Musical instruments',1,3),
	('Nursing items',1,3),
	('Playpens',1,3),
	('School supplies',1,3),
	('Strollers',1,3),
	('Toys',1,3),
	('Blenders',1,4),
	('Dehumidifiers',1,4),
	('Fans',1,4),
	('Microwaves',1,4),
	('Space heaters',1,4),
	('Toasters',1,4),
	('Vacuum cleaners',1,4),
	('Dishwashers',1,5),
	('Freezers',1,5),
	('Refrigerators',1,5),
	('Stoves',1,5),
	('Washers/ dryers',1,5),
	('Bricks',1,6),
	('Carpet padding',1,6),
	('Carpets',1,6),
	('Ceramic tiles',1,6),
	('Doors',1,6),
	('Drywall',1,6),
	('Electrical supplies',1,6),
	('Hand tools',1,6),
	('Hardware',1,6),
	('Insulation',1,6),
	('Ladders',1,6),
	('Light fixtures',1,6),
	('Lighting ballasts',1,6),
	('Lumber',1,6),
	('Motors',1,6),
	('Paint',1,6),
	('Pipe',1,6),
	('Plumbing',1,6),
	('Power tools',1,6),
	('Reusable metal items',1,6),
	('Roofing ',1,6),
	('Vinyl',1,6),
	('Windows',1,6),
	('Belts',1,7),
	('Boots',1,7),
	('Clothes',1,7),
	('Coats',1,7),
	('Hats',1,7),
	('Rainwear',1,7),
	('Sandals',1,7),
	('Shoes',1,7),
	('Calculators',1,8),
	('Cameras',1,8),
	('Cassette players',1,8),
	('Cd players',1,8),
	('Cds',1,8),
	('Cell phones',1,8),
	('Computers ',1,8),
	('Curling irons',1,8),
	('DVD players',1,8),
	('Game consoles',1,8),
	('GPS systems',1,8),
	('Hair dryers',1,8),
	('Monitors',1,8),
	('MP3 players',1,8),
	('Printers',1,8),
	('Projectors',1,8),
	('Receivers',1,8),
	('Scanners',1,8),
	('Speakers',1,8),
	('Tablets',1,8),
	('Telephones',1,8),
	('TVs',1,8),
	('Backpacks',1,9),
	('Balls',1,9),
	('Barbells',1,9),
	('Bicycles',1,9),
	('Bike tires ',1,9),
	('Camping equipment',1,9),
	('Day packs',1,9),
	('Dumbbells',1,9),
	('Exercise equipment',1,9),
	('Golf clubs',1,9),
	('Helmets',1,9),
	('Hiking boots',1,9),
	('Skateboards',1,9),
	('Skis',1,9),
	('Small boats',1,9),
	('Snowshoes',1,9),
	('Sporting goods',1,9),
	('Tennis rackets',1,9),
	('Tents',1,9),
	('Chain saws',1,10),
	('Fencing',1,10),
	('Garden pots',1,10),
	('Garden tools',1,10),
	('Hand clippers',1,10),
	('Hoses',1,10),
	('Lawn furniture',1,10),
	('Livestock supplies',1,10),
	('Loppers',1,10),
	('Mowers',1,10),
	('Seeders',1,10),
	('Soil amendment',1,10),
	('Sprinklers',1,10),
	('Wheel barrows',1,10),
	('Beverages',1,11),
	('Surplus garden produce',1,11),
	('Unopened canned goods',1,11),
	('Unopened packaged food',1,11),
	('Adult diapers',1,12),
	('Blood pressure monitors',1,12),
	('Canes',1,12),
	('Crutches',1,12),
	('Eye glasses',1,12),
	('Glucose meters',1,12),
	('Hearing aids',1,12),
	('Hospital beds',1,12),
	('Reach extenders',1,12),
	('Shower chairs',1,12),
	('Walkers',1,12),
	('Wheelchairs',1,12),
	('Calculators',1,13),
	('Computers ',1,13),
	('Fax machines',1,13),
	('Headsets',1,13),
	('Monitors',1,13),
	('Office furniture',1,13),
	('Paper shredders',1,13),
	('Printer cartridge refilling',1,13),
	('Printers',1,13),
	('Scanners',1,13),
	('Telephones',1,13),
	('Bubble wrap',1,14),
	('Clean foam peanuts',1,14),
	('Foam sheets',1,14),
	('Egg cartons',1,15),
	('Firewood',1,15),
	('Fabric',1,15),
	('Paper bags',1,15),
	('Pet supplies',1,15),
	('Shopping  bags',1,15),
	('Vehicles/ parts',1,15),
	('Computer paper',1,15),
	('Reusable metal items',1,15),
	('Cell phones',2,16),
	('small appliances',2,16),
	('Books',2,16),
	('Cell phones',2,16),
	('Clothes',2,16),
	('Computers',2,16),
	('Furniture',2,16),
	('Lamps',2,16),
	('Lawn power equipment',2,16),
	('Outdoor Gear',2,16),
	('Sandals',2,16),
	('Shoes, boots',2,16),
	('Upholstery, car',2,16),
	('Upholstery, Furniture',2,16);



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

