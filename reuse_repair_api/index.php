<?php

/* Require Files */
require 'Slim/Slim.php';
require 'plugins/NotORM.php';
require 'db_configuration.php';
require 'plugins/GUMP/gump.class.php';

/* Slim Setup */
\Slim\Slim::registerAutoloader();
$app = new \Slim\Slim();
$gump = new GUMP();


/* Routes Setup */

// route: main
$app->get('/', function() {
		echo "test";
	});

/* ===========================================================================
	GET: Item Types
   =========================================================================== */

$app->get('/itemtypes', function() use($app, $db) {
		$itemtypes = array();
		foreach ($db->itemtype() as $item) {
			$itemtypes[] = array(
					'id' => $item['id'],
					'description' => $item['description']
				);
		}
		$app->response()->header("Content-Type", "application/json");
		echo json_encode(["data" => $itemtypes]);
	});

$app->get('/itemtypes/:id', function($id) use($app, $db) {
		$type = $db->itemtype()->where('id', $id);
		if($data = $type->fetch()){
			$app->response()->header("Content-Type", "application/json");
			echo json_encode(array(
				'id' => $data['id'],
				'description' => $data['description']
				));
		} else {
			$app->response()->setStatus(404);
			$app->response()->header("Content-Type", "application/json");
			echo json_encode(array(
				'status' => 404,
				'message' => "Itemtypes ID=$id was not found in server"
				));
		}
	});


/* ===========================================================================
	POST: Item Types
   =========================================================================== */
$app->post('/itemtype', function() use($app, $db){
	$app->response()->header("Content-Type", "application/json");
	$description = $app->request()->post('description');

	//check if it already exist
	$type = $db->itemtype()->where('description', $description);
	if($data = $type->fetch()){
		$app->response()->setStatus(409);
		echo json_encode(array(
				'status' => 409,
				'message' => "Item with same description already exist in DB."
			));
	} else {
		//splice body and get only the description 
		$add_type = array(
				'description' => $description
			);
		$result = $db->itemtype->insert($add_type);
		echo json_encode(["status" => 200, "message" => "ItemType ($description) was successfully added"]);
	}
});



/* ===========================================================================
	GET: Items
   =========================================================================== */

$app->get('/items', function() use($app, $db) {
		$items = array();
		foreach ($db->items() as $item) {
			$items[] = array(
					'id' => $item['id'],
					'name' => $item['name'],
					'type' => $item['type'],
					'category' => $item['category'],
					//'created_at' => $item['created_at'],
					//'updated_at' => $item['updated_at']
				);
		}
		$app->response()->header("Content-Type", "application/json");
		echo json_encode(["data" => $items]);
	});


$app->get('/items/:id', function($id) use($app, $db) {
		$item = $db->items()->where('id', $id);
		if($data = $item->fetch()){
			$app->response()->header("Content-Type", "application/json");
			echo json_encode(array(
					'id' => $data['id'],
					'name' => $data['name'],
					'type' => $data['type'],
					'category' => $data['category'],
				));
		} else {
			$app->response()->setStatus(404);
			$app->response()->header("Content-Type", "application/json");
			echo json_encode(array(
				'status' => 404,
				'message' => "Items ID=$id was not found in server"
				));
		}
	});

/* ===========================================================================
	GET: ItemCategories
   =========================================================================== */

$app->get('/itemcategories', function() use($app, $db) {
		$categories = array();
		foreach ($db->itemcategories() as $item) {
			$categories[] = array(
					'id' => $item['id'],
					'description' => $item['description']
				);
		}
		$app->response()->header("Content-Type", "application/json");
		echo json_encode(["data" => $categories]);
	});

$app->get('/itemcategories/:id', function($id) use($app, $db) {
		$category = $db->itemcategories()->where('id', $id);
		if($data = $category->fetch()){
			$app->response()->header("Content-Type", "application/json");
			echo json_encode(array(
					'id' => $data['id'],
					'description' => $data['description']
				));
		} else {
			$app->response()->setStatus(404);
			$app->response()->header("Content-Type", "application/json");
			echo json_encode(array(
				'status' => 404,
				'message' => "ItemCategories ID=$id was not found in server"
				));
		}
	});








/* ===========================================================================
	RUN
   =========================================================================== */
$app->run();

?>