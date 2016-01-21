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

// route: main
$app->get('/.*', function () {
    echo "Repair and Reuse API";
});

$app->run();
