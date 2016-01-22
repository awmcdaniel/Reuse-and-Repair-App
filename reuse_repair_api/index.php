<?php

/* Require Files */
require 'Slim/Slim.php';
require 'plugins/NotORM.php';
require 'db_configuration.php';
require 'plugins/GUMP/gump.class.php';

/* Slim Setup */
\Slim\Slim::registerAutoloader();
$app  = new \Slim\Slim();
$gump = new GUMP();

/* Routes Setup */
foreach (glob("routes/*.php") as $filename) {
    require $filename;
}

$app->get('/api/itemcategories', $GET_ItemCategories);
$app->get('/api/itemcategory/:id', $GET_ItemCategoryById);
$app->post('/api/itemcategory', $POST_InsertItemCategory);
$app->put('/api/itemcategory/:id', $PUT_ItemCategory);
$app->delete('/api/itemcategory/:id', $DELETE_ItemCategoryById);

$app->get('/api/items', $items_list);
$app->get('/api/item/:id', $GET_item_by_id);
$app->post('/api/item', $POST_item);
$app->put('/api/item/:id', $UPDATE_item_by_id);
$app->delete('/api/item/:id', $DELETE_item_by_id);

$app->get('/api/itemtypes', $itemtype_list);
$app->get('/api/itemtype/:id', $itemtype_list_by_id);
$app->post('/api/itemtype', $itemtype_add);
$app->put('/api/itemtype/:id', $itemtype_update_by_id);
$app->delete('/api/itemtype/:id', $itemtype_delete);



// route: everuthing else
$app->get('/.*', function () {
    echo "Repair and Reuse API";
});

$app->run();
