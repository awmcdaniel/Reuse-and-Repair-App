<?php

/* Require Files */
require 'Slim/Slim.php';
require 'plugins/NotORM.php';
require 'db_configuration.php';

/* Slim Setup */
\Slim\Slim::registerAutoloader();
$app = new \Slim\Slim();


/* Routes Setup */

// route: main
$app->get('/', function() {
		echo "test";
	});

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

$app->get('/categories', function() use($app, $db) {
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


$app->get('/hello/:firstname/:lastname', function($first, $last) {
		echo "Hello $first $last";
	});

$app->run();

?>