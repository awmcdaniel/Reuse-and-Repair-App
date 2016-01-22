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

/* Load routes function definitions */
foreach (glob("routes/*.php") as $filename) {
    require $filename;
}

/* Enable/Disable routes here */
$app->get('/api/itemcategories', $itemcategories_listAll);
$app->get('/api/itemcategory/:id', $itemcategories_listOne);
$app->post('/api/itemcategory', $itemcategories_insert);
$app->put('/api/itemcategory/:id', $itemcategories_update);
$app->delete('/api/itemcategory/:id', $itemcategories_delete);

$app->get('/api/items', $items_listAll);
$app->get('/api/item/:id', $items_listOne);
$app->post('/api/item', $items_insert);
$app->put('/api/item/:id', $items_update);
$app->delete('/api/item/:id', $items_delete);

$app->get('/api/itemtypes', $itemtypes_listAll);
$app->get('/api/itemtype/:id', $itemtypes_listOne);
$app->post('/api/itemtype', $itemtypes_insert);
$app->put('/api/itemtype/:id', $itemtypes_update);
$app->delete('/api/itemtype/:id', $itemtypes_delete);

$app->get('/api/organizationitems', $organizationItems_listAll);
$app->get('/api/organizationitem/:id', $organizationItems_listOne);
$app->post('/api/organizationitem', $organizationItems_insert);
$app->put('/api/organizationitem/:id', $organizationItems_update);
$app->delete('/api/organizationitem/:id', $organizationItems_delete);

$app->get('/api/organizations', $organizations_listAll);
$app->get('/api/organizations/:id', $organizations_listOne);
$app->post('/api/organization', $organizations_insert);
$app->put('/api/organization/:id', $organizations_update);
$app->delete('/api/organization/:id', $organizations_delete);

// route: everuthing else
$app->get('/.*', function () {
    echo "Repair and Reuse API";
});

$app->run();
